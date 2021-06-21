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
import java.time.LocalDate
import javax.validation.Valid


@Controller
class HomePageController(
     val recipeRepository: RecipeRepository,
     val categoryRepository: CategoryRepository,
     val userRepository: UserRepository,
) {
    // index.jsp
    @RequestMapping("","/", "/index" , method = [RequestMethod.GET])
    fun homePage(model: Model): String {
        model["recipe"] = recipeRepository.findAll()
        model["category"] = categoryRepository.findAll()
        model["user"] = userRepository.findAll()
        return "index"
    }
}
