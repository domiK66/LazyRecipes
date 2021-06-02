package at.fhj.ima.lazyrecipes.repository

import at.fhj.ima.lazyrecipes.entity.Country
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface CountryRepository: JpaRepository<Country, Int> {
}