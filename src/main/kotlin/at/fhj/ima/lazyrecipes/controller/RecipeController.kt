package at.fhj.ima.lazyrecipes.controller

import at.fhj.ima.lazyrecipes.entity.Recipe
import at.fhj.ima.lazyrecipes.repository.CategoryRepository
import at.fhj.ima.lazyrecipes.repository.RecipeRepository
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import java.time.LocalDate

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
        model["category"] = categoryRepository.findAll()
        return "editRecipe"
    }
    @RequestMapping("/changeRecipe", method = [RequestMethod.POST])
    fun changeRecipe(@ModelAttribute recipe: Recipe): String {
        /*if (bindingResult.hasErrors()) {
            return populateEditEmployeeView(model)
        }*/
        recipeRepository.save(recipe)
        return "redirect:/editRecipe?id=" + recipe.id
    }
}