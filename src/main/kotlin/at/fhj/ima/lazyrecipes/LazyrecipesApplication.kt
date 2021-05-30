package at.fhj.ima.lazyrecipes

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.context.annotation.Bean
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.security.crypto.password.PasswordEncoder

@SpringBootApplication
@EnableGlobalMethodSecurity(securedEnabled = true)
class LazyrecipesApplication {
	@Bean
	fun passwordEncoder(): PasswordEncoder {
		return BCryptPasswordEncoder();
	}
}

fun main(args: Array<String>) {
	runApplication<LazyrecipesApplication>(*args)
}
