package at.fhj.ima.lazyrecipes.controller


import at.fhj.ima.lazyrecipes.entity.User
import at.fhj.ima.lazyrecipes.repository.RecipeRepository
import at.fhj.ima.lazyrecipes.repository.UserRepository

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam

import javax.validation.Valid

@Controller
class UserController(
    val userRepository: UserRepository,
    val recipeRepository: RecipeRepository,
    val passwordEncoder: PasswordEncoder
) {

    @RequestMapping("/signUp", method = [RequestMethod.GET])
    fun registerUserForm(model: Model, @RequestParam(required = false) id: Int?): String {
        if (id != null) {
            val user = userRepository.findById(id).get()
            model["user"] = user
        } else {
            val newUser = User()
            model["user"] = newUser
        }
        return "signUp"
    }

    @RequestMapping("/changeUser", method = [RequestMethod.POST])
    fun createUser(@ModelAttribute @Valid user: User, bindingResult: BindingResult, model: Model): String {
        if (bindingResult.hasErrors()) {
            if (bindingResult.hasFieldErrors("isPw")) {
                bindingResult.rejectValue("confirmPw", "confirmPw.doesntmatch", "password doesn't match")
                bindingResult.rejectValue("password", "confirmPw.doesntmatch", "password doesn't match")
            }
            if (bindingResult.hasFieldErrors("emailcorrect")) {
                bindingResult.rejectValue("email", "email.doesntmatch", "Please enter a valid email")
            }
            return "signUp"
        }
        try {
            // TODO: Save only once 2
            user.password = passwordEncoder.encode(user.password)
            user.confirmPw = passwordEncoder.encode(user.password)
            userRepository.save(user)
        } catch (dive: DataIntegrityViolationException) {
            if (dive.message.orEmpty().contains("constraint [username_UK]")) {
                bindingResult.rejectValue("username", "username.alreadyInUse", "username already in use.");

                user.password = null
                return "signUp"
            } else {
                throw dive;
            }
        }
        return submitComplete()
    }

    @RequestMapping("submitComplete", method = [RequestMethod.GET])
    fun submitComplete(): String {
        return "submitComplete"
    }
}