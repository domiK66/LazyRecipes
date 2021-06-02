package at.fhj.ima.lazyrecipes.controller.advice

import at.fhj.ima.lazyrecipes.entity.Accounts
import at.fhj.ima.lazyrecipes.repository.AccountRepository
import at.fhj.ima.lazyrecipes.repository.CountryRepository
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam

@Controller
class AccountController(val accountRepository: AccountRepository, val countryRepository: CountryRepository) {
    @RequestMapping("/signUp",method = [RequestMethod.GET])
    fun editUser(model: Model, @RequestParam(required = false) id: Int?): String{
        if (id != null) {
            val example = Accounts(id = id)
            val account= accountRepository.findById(id).get()
            model["account"] = account
        }else {
            val newAccount = Accounts()

            model["account"] =  newAccount
        }
        model["country"] = countryRepository.findAll()
        return "signUp"
    }



   /*private fun countryView(model: Model): String {
        model["location"] = locationRepository.findAll()
        return "signUp"
    }*/

}