package at.fhj.ima.lazyrecipes.controller

import at.fhj.ima.lazyrecipes.entity.User
import at.fhj.ima.lazyrecipes.repository.CountryRepository
import at.fhj.ima.lazyrecipes.repository.RecipeRepository
import at.fhj.ima.lazyrecipes.repository.UserRepository
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.security.crypto.password.PasswordEncoder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam

@Controller
class TermOfUseController(
    val userRepository: UserRepository,
    val countryRepository: CountryRepository,
    val recipeRepository: RecipeRepository,
    val passwordEncoder: PasswordEncoder
) {
    @RequestMapping("/termsOfUse", method = [RequestMethod.GET])
    fun viewTermsOfUse(model: Model, @RequestParam(required = false) id: Int?): String {
        return "termsOfUse"
    }

    @RequestMapping("/privacyPolicy", method = [RequestMethod.GET])
    fun viewPrivacyPolicy(model: Model, @RequestParam(required = false) id: Int?): String {
        return "privacyPolicy"
    }
}