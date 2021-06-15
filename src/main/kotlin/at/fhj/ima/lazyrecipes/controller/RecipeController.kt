package at.fhj.ima.lazyrecipes.controller

import at.fhj.ima.lazyrecipes.controller.UserController
import at.fhj.ima.lazyrecipes.controller.advice.CurrentUserControllerAdvice
import at.fhj.ima.lazyrecipes.entity.Favourite
import at.fhj.ima.lazyrecipes.entity.Rating
import at.fhj.ima.lazyrecipes.entity.Recipe
import at.fhj.ima.lazyrecipes.entity.User
import at.fhj.ima.lazyrecipes.repository.*
import org.springframework.http.HttpStatus
import org.springframework.security.access.annotation.Secured
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.*
import org.springframework.web.server.ResponseStatusException
import org.springframework.web.servlet.mvc.support.RedirectAttributes
import java.time.LocalDate
import javax.validation.Valid


@Controller
class RecipeController(
    val recipeRepository: RecipeRepository,
    val categoryRepository: CategoryRepository,
    val userRepository: UserRepository,
    val favouriteRepository: FavouriteRepository,
    val ratingRepository: RatingRepository
) {
    fun listRecipes(model: Model): String {
        model["recipe"] = recipeRepository.findAll()
        model["category"] = recipeRepository.findAll()
        model["user"] = userRepository.findAll()
        return "index"
    }


    // BEGIN RECIPE FORM
    fun populateEditRecipeView(model: Model): String {
        model["category"] = categoryRepository.findAll()
        model["user"] = userRepository.findAll()
        return "editRecipe"
    }
    @RequestMapping("/editRecipe", method = [RequestMethod.GET])
    fun editRecipe(model: Model, @RequestParam(required = false) id: Int?): String {
        if (id != null) {
            val recipe = recipeRepository.findById(id).get()
            model["recipe"] = recipe
        } else {
            val newRecipe = Recipe()
            newRecipe.date = LocalDate.now()
            model["recipe"] = newRecipe
        }
        return populateEditRecipeView(model)
    }
    @RequestMapping("/changeRecipe", method = [RequestMethod.POST])
    fun changeRecipe(@ModelAttribute @Valid recipe: Recipe, bindingResult: BindingResult, model: Model): String {
        if (bindingResult.hasErrors()) {
            return populateEditRecipeView(model)
        }
        recipeRepository.save(recipe)
        return "redirect:/editRecipe?id=" + recipe.id
    }
    // END RECIPE FORM

    // BEGIN recipeView.jsp
    @RequestMapping("/recipeView", method = [RequestMethod.GET])
    fun viewRecipe(model: Model, @RequestParam(required = false) id: Int?): String {
        if (id != null) {
            val recipe = recipeRepository.findById(id).get()
            model["recipe"] = recipe
            model["category"] = recipeRepository.findAll()
            model["user"] = userRepository.findAll()
        }
        val username = SecurityContextHolder.getContext().authentication.name
        val userId = userRepository.findByUsername(username)?.id

        val savedRating = ratingRepository.findByUserIdAndRecipeId(userId,id)
        val isFavourite = favouriteRepository.findByUserIdAndRecipeId(userId,id)

        model["rating"] = savedRating != null
        model["favourite"] = isFavourite != null
        return "recipeView"
    }

    // RATING
    @RequestMapping("/rateRecipe", method = [RequestMethod.POST])
    fun rateRecipe(
        @RequestParam(required = false) value: Float,
        @RequestParam(required = false) id: Int,
        model: Model
    ): String {
        val username = SecurityContextHolder.getContext().authentication.name
        val user = userRepository.findByUsername(username)
        val recipe = recipeRepository.findById(id).get()
        val rating = Rating(user = user, recipe = recipe, value = value)
        val userId = userRepository.findByUsername(username)?.id
        val savedRating = ratingRepository.findByUserIdAndRecipeId(userId,id)
        if (savedRating != null) {
            ratingRepository.delete(savedRating)
        }

        ratingRepository.save(rating)

        recipe.ratingAVG = ratingRepository.getAverageRating(id)
        recipeRepository.save(recipe)

        return "redirect:/recipeView?id=" + id
    }

    // FAVOURITES
    @RequestMapping("/viewFavourites", method = [RequestMethod.GET])
    fun viewFavourites(model: Model): String {
        val username = SecurityContextHolder.getContext().authentication.name
        val userId = userRepository.findByUsername(username)?.id
        model["favourite1"] = favouriteRepository.findFavouritesByUserId(userId) != null
        model["favourite"] = favouriteRepository.findFavouritesByUserId(userId)
        return "favourites"
    }
    @RequestMapping("/saveToFavourites", method = [RequestMethod.POST])
    fun saveToFavourites(
        @RequestParam(required = false) id: Int,
        redirectAttributes: RedirectAttributes,
        model: Model
    ): String {
        val username = SecurityContextHolder.getContext().authentication.name
        val user = userRepository.findByUsername(username)
        val recipe = recipeRepository.findById(id).get()
        val favourite = Favourite(user = user, recipe = recipe)
        favouriteRepository.save(favourite)
        val message = "Recipe ${recipe.title} added to favourites."
        redirectAttributes.addFlashAttribute("message", message)
        return "redirect:/recipeView?id=" + id
    }
    @RequestMapping("/deleteFromFavourites", method = [RequestMethod.POST])
    fun deleteFromFavourites(
        @RequestParam(required = false) id: Int,
        model: Model
    ): String {
        val username = SecurityContextHolder.getContext().authentication.name
        val userId = userRepository.findByUsername(username)?.id
        val favourite = favouriteRepository.findByUserIdAndRecipeId(userId,id)
        val recipe = recipeRepository.findById(id).get()
        if (favourite != null) {
            favouriteRepository.delete(favourite)
        }
        model["errorMessage"] = "Recipe ${recipe.title} removed from favourites."
        return viewRecipe(model, id)
    }


    // END recipeView.jsp










    @RequestMapping("/searchRecipe", method = [RequestMethod.GET])
    fun searchRecipes(model: Model, @RequestParam(required = false) search: String? = null): String {
        model["recipe"] = recipeRepository.findBySearchText(search)
        return "searchRecipe"
    }

    @RequestMapping("/deleteRecipe", method = [RequestMethod.GET])
    fun deleteRecipe(model: Model, @RequestParam id: Int): String {
        val recipe = recipeRepository.findById(id).get()
        recipeRepository.delete(recipe);
        model["message"] = "Recipe ${recipe.title} deleted."
        return listRecipes(model)
    }



    //Category View JSP
    @RequestMapping("/category/{name}", method = [RequestMethod.GET])
    fun getCategoryView(@PathVariable("name") name: String?, model: Model): String {
        val category  = categoryRepository.findByName(name) ?: throw ResponseStatusException(HttpStatus.NOT_FOUND)
        model["category"] = category
        model["recipe"] = recipeRepository.findAll()
        return "categoryView"
    }



    // myRecipes.jsp
    @RequestMapping("/myRecipes", method = [RequestMethod.GET])
    fun viewMyRecipes(model: Model): String {
        val username = SecurityContextHolder.getContext().authentication.name
        val userId = userRepository.findByUsername(username)?.id
        model["recipe"] = recipeRepository.findByUserId(userId)
        return "myRecipes"
    }

}