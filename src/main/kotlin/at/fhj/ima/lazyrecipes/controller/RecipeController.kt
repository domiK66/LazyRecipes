package at.fhj.ima.lazyrecipes.controller

import at.fhj.ima.lazyrecipes.controller.advice.CurrentUserControllerAdvice
import at.fhj.ima.lazyrecipes.entity.Recipe
import at.fhj.ima.lazyrecipes.entity.User
import at.fhj.ima.lazyrecipes.repository.CategoryRepository
import at.fhj.ima.lazyrecipes.repository.RecipeRepository
import at.fhj.ima.lazyrecipes.repository.UserRepository
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
import java.time.LocalDate
import javax.validation.Valid


@Controller
class RecipeController(val recipeRepository: RecipeRepository, val categoryRepository: CategoryRepository, val userRepository: UserRepository) {

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

    fun populateEditRecipeView(model: Model): String {
        model["category"] = categoryRepository.findAll()
        model["user"] = userRepository.findAll()
        return "editRecipe"
    }

    @RequestMapping("/changeRecipe", method = [RequestMethod.POST])
    fun changeRecipe(@ModelAttribute @Valid recipe: Recipe, bindingResult: BindingResult, model: Model): String {
        if (bindingResult.hasErrors()) {
            return populateEditRecipeView(model)
        }
        recipeRepository.save(recipe)
        return "redirect:/editRecipe?id=" + recipe.id
    }

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

    @RequestMapping("/deleteAdminRecipe", method = [RequestMethod.GET])
    fun deleteAdminRecipe(model: Model, @RequestParam id: Int): String {
        val recipe = recipeRepository.findById(id).get()
        recipeRepository.delete(recipe);
        model["message"] = "Recipe with title ${recipe.title} and id ${recipe.id} deleted."
        return listAdminRecipes(model)
    }

    // index.jsp
    @RequestMapping("/", method = [RequestMethod.GET])
    fun listRecipes(model: Model): String {
        model["recipe"] = recipeRepository.findAll()
        model["category"] = recipeRepository.findAll()
        model["user"] = userRepository.findAll()
        return "index"
    }

    // admin.jsp
    @RequestMapping("/admin", method = [RequestMethod.GET])
    @Secured("ROLE_ADMIN")
    fun listAdminRecipes(model: Model): String {
        model["recipe"] = recipeRepository.findAll()
        model["category"] = recipeRepository.findAll()
        return "admin"
    }

    // recipeView.jsp
    @RequestMapping("/recipeView", method = [RequestMethod.GET])
    fun viewRecipe(model: Model, @RequestParam(required = false) id: Int?): String {
        if (id != null) {
            val recipe = recipeRepository.findById(id).get()
            model["recipe"] = recipe
            model["category"] = recipeRepository.findAll()
            model["user"] = userRepository.findAll()
        }
        return "recipeView"
    }

    @RequestMapping("/signUp", method = [RequestMethod.GET])
    fun showSignUp(model: Model): String {
        return "signUp"
    }

    /*
    @RequestMapping("/login", method = [RequestMethod.GET])
    fun showLogin(model: Model): String {
        return "login"
    }
    */


    /* tbd
    @RequestMapping("/saveRating", method = [RequestMethod.POST])
    fun saveRating(model: Model, rating: Rating, recipe: Recipe): String {
        ratingRepository.save(rating)
        return "index"
    }
    */

    //Category View JSP
    @RequestMapping("/category/{name}", method = [RequestMethod.GET])
    fun getCategoryView(@PathVariable("name") name: String?, model: Model): String {
        val category  = categoryRepository.findByName(name) ?: throw ResponseStatusException(HttpStatus.NOT_FOUND)
        model["category"] = category
        model["recipe"] = recipeRepository.findAll()
        return "categoryView"
    }

    /*
    @Controller
    class HomePageController {
        @RequestMapping("", method = [RequestMethod.GET])
        fun homePage(): String {
            return "redirect:index"
        }

    }
    */

    // myRecipes.jsp
    @RequestMapping("/myRecipes", method = [RequestMethod.GET])
    fun viewMyRecipes(model: Model): String {
        val username = SecurityContextHolder.getContext().authentication.name
        val userId = userRepository.findByUsername(username)?.id
        model["recipe"] = recipeRepository.findByUserId(userId)
        return "myRecipes"
    }

    //account settings
    @RequestMapping("/accountSettings", method = [RequestMethod.GET])
    fun viewAccountSettings(model: Model): String {
        val currentUsername = SecurityContextHolder.getContext().authentication.name
        val user = userRepository.findByUsername(currentUsername)
        if (user != null) {
            model["user"] = user
        }
        return "accountSettings"
    }


    @RequestMapping("/changeAccountSettings", method = [RequestMethod.POST])
    fun changeAccountSettings(@ModelAttribute @Valid user: User, bindingResult: BindingResult, model: Model): String {
        if (bindingResult.hasErrors()) {
            return "accountSettings"
        }
        userRepository.save(user)
        model["message"] = "Successfully changed Username, please log in again"
        // TODO: krausler fragen :)
        return "accountSettings"
    }

    @RequestMapping("/deleteAccount", method = [RequestMethod.GET])
    fun deleteAccount(model: Model): String {
        val currentUsername = SecurityContextHolder.getContext().authentication.name
        val user = userRepository.findByUsername(currentUsername)
        val recipes = recipeRepository.findByUserId(user?.id)
        if (user != null) {
            userRepository.delete(user)
            // delete all recipes of the user as well
            recipes.forEach { recipeRepository.delete(it) }
            SecurityContextHolder.clearContext()
        }
        model["message"] = "Successfully delete account!"
        return listRecipes(model)
    }

}


