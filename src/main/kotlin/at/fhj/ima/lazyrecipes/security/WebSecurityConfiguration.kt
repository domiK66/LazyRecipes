package at.fhj.ima.lazyrecipes.security


import at.fhj.ima.lazyrecipes.security.UserDetailsService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.context.annotation.Configuration
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter

@Configuration
@EnableWebSecurity
class WebSecurityConfiguration : WebSecurityConfigurerAdapter() {

    @Autowired
    private lateinit var userDetailsService: UserDetailsService;

    override fun configure(http: HttpSecurity) {
        http
            .authorizeRequests()
            // anonymous urls
            .antMatchers("/editRecipe").authenticated()
            .antMatchers("/myRecipes").authenticated()
            .antMatchers("/accountSettings").authenticated()
            .antMatchers("/deleteAccount").authenticated()
            .antMatchers("/changeAccountSettings").authenticated()
            // permit all
            .anyRequest().permitAll()
            .and()
            .formLogin()
            .and()
            .logout()
            .logoutSuccessUrl("/")
            .and()
            .rememberMe().key("uniqueAndSecret").userDetailsService(userDetailsService);
    }
}