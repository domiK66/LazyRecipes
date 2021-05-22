package at.fhj.ima.lazyrecipes.controller

import at.fhj.ima.lazyrecipes.entity.Recipe
import at.fhj.ima.lazyrecipes.repository.CategoryRepository
import at.fhj.ima.lazyrecipes.repository.RecipeRepository
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import java.time.LocalDate
import javax.validation.Valid

@Controller
class RecipeController(val recipeRepository: RecipeRepository, val categoryRepository: CategoryRepository) {

    @RequestMapping("/editRecipe", method = [RequestMethod.GET])
    fun editRecipee(model: Model, @RequestParam(required = false) id: Int?): String {
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
        return "editRecipe"
    }

    @RequestMapping("/changeRecipe", method = [RequestMethod.POST])
    fun changeRecipe(@ModelAttribute @Valid recipe: Recipe,
                     bindingResult: BindingResult, model: Model): String {
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
    fun deleteEmployee(model: Model, @RequestParam id: Int): String {
        val recipe = recipeRepository.findById(id).get()
        recipeRepository.delete(recipe);
        return "index"
    }


}


