package at.fhj.ima.lazyrecipes.controller

import at.fhj.ima.lazyrecipes.entity.User
import at.fhj.ima.lazyrecipes.entity.UserRole
import at.fhj.ima.lazyrecipes.repository.RecipeRepository
import at.fhj.ima.lazyrecipes.repository.UserRepository
import org.springframework.http.HttpStatus
import org.springframework.security.access.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.server.ResponseStatusException
import javax.validation.Valid

@Controller
class AccountSettingsController(
    val userRepository: UserRepository,
    val recipeRepository: RecipeRepository,
    val passwordEncoder: PasswordEncoder
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
            if (bindingResult.hasFieldErrors("isPw")) {
                bindingResult.rejectValue("confirmPw", "confirmPw.doesntmatch", "password doesn't match")
                bindingResult.rejectValue("password", "confirmPw.doesntmatch", "password doesn't match")
            }
            if (bindingResult.hasFieldErrors("emailcorrect")) {
                bindingResult.rejectValue("email", "email.doesntmatch", "Please enter a valid email")
            }
            return "accountSettings"
        }
        val currentUsername = SecurityContextHolder.getContext().authentication.name
        val userDB = userRepository.findByUsername(currentUsername)
        if (user.password != userDB?.password) user.password = passwordEncoder.encode(user.password)
        if (user.password != userDB?.password) user.confirmPw = passwordEncoder.encode(user.password)
        val cacheUsername = userDB?.username
        userRepository.save(user)
        model["message"] = "Successfully saved changes made to profile"
        if (user.username != cacheUsername) {
            SecurityContextHolder.clearContext()
            return "redirect:/login"
        }
        else { return "accountSettings" }
    }
    @RequestMapping("/deleteAccount", method = [RequestMethod.POST])
    fun deleteAccount(model: Model): String {
        val currentUsername = SecurityContextHolder.getContext().authentication.name
        val user = userRepository.findByUsername(currentUsername)
        val recipes = recipeRepository.findByUserId(user?.id)
        if (user == null || user?.role == UserRole.ROLE_ADMIN) {
            throw ResponseStatusException(HttpStatus.NOT_FOUND)
        } else {
            userRepository.delete(user)
            // delete all recipes of the user as well
            recipes.forEach { recipeRepository.delete(it) }
            SecurityContextHolder.clearContext()
            model["message"] = "Successfully delete account!"
        }
        return "redirect:/index"
    }
}