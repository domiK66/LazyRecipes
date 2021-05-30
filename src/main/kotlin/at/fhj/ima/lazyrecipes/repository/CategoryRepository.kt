package at.fhj.ima.lazyrecipes.repository

import at.fhj.ima.lazyrecipes.entity.Category
import at.fhj.ima.lazyrecipes.entity.Recipe
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository

@Repository
interface CategoryRepository : JpaRepository<Category, Int> {
    @Query("FROM Category WHERE name = :name")
    fun findByName(@Param("name") name: String?): Category?
}