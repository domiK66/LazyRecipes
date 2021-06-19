package at.fhj.ima.lazyrecipes.controller

import at.fhj.ima.lazyrecipes.entity.User
import at.fhj.ima.lazyrecipes.repository.RecipeRepository
import at.fhj.ima.lazyrecipes.repository.UserRepository
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import javax.validation.Valid

@Controller
class AccountSettingsController(
    val userRepository: UserRepository,
    val recipeRepository: RecipeRepository
) {

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
        return "index"
    }
}