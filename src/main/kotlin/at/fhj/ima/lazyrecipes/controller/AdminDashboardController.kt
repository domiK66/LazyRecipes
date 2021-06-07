package at.fhj.ima.lazyrecipes.controller

import at.fhj.ima.lazyrecipes.repository.CategoryRepository
import at.fhj.ima.lazyrecipes.repository.RecipeRepository
import at.fhj.ima.lazyrecipes.repository.UserRepository
import org.springframework.security.access.annotation.Secured
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam

@Controller
class AdminDashboardController(
    val recipeRepository: RecipeRepository,
) {
    @RequestMapping("/deleteAdminRecipe", method = [RequestMethod.GET])
    fun deleteAdminRecipe(model: Model, @RequestParam id: Int): String {
        val recipe = recipeRepository.findById(id).get()
        recipeRepository.delete(recipe);
        model["message"] = "Recipe with title ${recipe.title} and id ${recipe.id} deleted."
        return listAdminRecipes(model)
    }



    // admin.jsp
    @RequestMapping("/admin", method = [RequestMethod.GET])
    @Secured("ROLE_ADMIN")
    fun listAdminRecipes(model: Model): String {
        model["recipe"] = recipeRepository.findAll()
        model["category"] = recipeRepository.findAll()
        return "admin"
    }

}