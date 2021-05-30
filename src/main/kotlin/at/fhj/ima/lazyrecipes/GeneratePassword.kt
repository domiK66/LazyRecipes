package at.fhj.ima.lazyrecipes

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder

fun main() {
    print(BCryptPasswordEncoder().encode("user"));
}