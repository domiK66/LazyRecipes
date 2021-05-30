package at.fhj.ima.lazyrecipes.security

import at.fhj.ima.lazyrecipes.repository.UserRepository
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.security.core.userdetails.UsernameNotFoundException
import org.springframework.stereotype.Service


@Service
class UserDetailsService(val userRepository: UserRepository) : UserDetailsService {
    override fun loadUserByUsername(username: String): UserDetails {
        val user = userRepository.findByUsername(username) ?: throw UsernameNotFoundException(username)
        return UserPrincipal(user)
    }
}