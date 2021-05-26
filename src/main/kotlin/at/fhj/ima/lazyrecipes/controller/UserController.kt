package at.fhj.ima.lazyrecipes.controller

import at.fhj.ima.lazyrecipes.entity.User
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import java.time.LocalDate

@Controller
class UserController {
    @RequestMapping("/registerUser",method = [RequestMethod.GET])
    fun registerUser(model: Model, @RequestParam(required = false)id: Int?):String{
        val newUser = User()
        newUser.dayOfBirth = LocalDate.now()
        model["user"] = newUser
        return "registerUser"
    }
}