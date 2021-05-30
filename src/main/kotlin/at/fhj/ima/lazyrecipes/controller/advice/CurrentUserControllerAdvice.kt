package at.fhj.ima.lazyrecipes.controller.advice

import at.fhj.ima.lazyrecipes.repository.UserRepository
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.ControllerAdvice
import org.springframework.web.bind.annotation.ModelAttribute

//returns the current user instance and can be accessed from everywhere
/*
@ControllerAdvice
class CurrentUserControllerAdvice(val userRepository: UserRepository) {

    @ModelAttribute
    fun addCurrentUser(model: Model) {

        val auth = SecurityContextHolder.getContext().authentication
        val username = auth.name

        val currentUser = userRepository.findByUsername(username)
        model.addAttribute("currentUser", currentUser)
    }
}
*/
