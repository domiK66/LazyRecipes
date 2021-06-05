package at.fhj.ima.lazyrecipes.controller



import at.fhj.ima.lazyrecipes.entity.User
import at.fhj.ima.lazyrecipes.entity.UserRole
import at.fhj.ima.lazyrecipes.repository.CountryRepository
import at.fhj.ima.lazyrecipes.repository.UserRepository
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder
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
class UserController(val userRepository: UserRepository, val countryRepository: CountryRepository) {

    @RequestMapping("/signUp", method = [RequestMethod.GET])
    fun editUser(model: Model, @RequestParam(required = false) id: Int?): String {
        if (id != null) {
           val user = userRepository.findById(id).get()
            model["user"] = user
        } else {
            val newUser = User()
            newUser.birthdate = LocalDate.now()
            model["user"] = newUser
        }
        return populateUserView(model)
    }

    /*@RequestMapping("/singUp",method = [RequestMethod.POST])
    fun changeUser(@ModelAttribute user: User): String{
        userRepository.save(user);
        return "redirect:/signUp?id="+user.id
    }*/


    @RequestMapping("/changeUser", method = [RequestMethod.POST])
   // @Secured("ROLE_USER") //TODO: only own user profile
    fun changeUser(@ModelAttribute("user") @Valid user: User, bindingResult: BindingResult, model: Model): String {
        if (bindingResult.hasErrors()) {
           return populateUserView(model)
        }
        try {
            userRepository.save(user)
        } catch (dive: DataIntegrityViolationException) {
            if (dive.message.orEmpty().contains("constraint [username_OK]")) {
                bindingResult.rejectValue("id", "id.alreadyInUse", "id already in use.");
                return populateUserView(model)
            } else {
                throw dive;
            }
        }
        userRepository.save(user)
        return "redirect:/signUp?id="+user.id
    }



   private fun populateUserView(model: Model): String {
        model["country"] = countryRepository.findAll()
        return "signUp"
    }

}