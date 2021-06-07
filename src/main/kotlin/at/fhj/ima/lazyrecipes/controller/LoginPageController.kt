package at.fhj.ima.lazyrecipes.controller

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod

@Controller
class LoginPageController {

    @RequestMapping("/login", method = [RequestMethod.GET])
    fun login(): String {
        return "login";
    }

}
