package at.fhj.ima.lazyrecipes.repository

import at.fhj.ima.lazyrecipes.entity.Accounts
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface AccountRepository : JpaRepository<Accounts, Int> {
}