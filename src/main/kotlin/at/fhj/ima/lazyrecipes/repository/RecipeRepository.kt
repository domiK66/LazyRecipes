package at.fhj.ima.lazyrecipes.repository

import at.fhj.ima.lazyrecipes.entity.Recipe
import at.fhj.ima.lazyrecipes.entity.User
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository

@Repository
interface RecipeRepository: JpaRepository<Recipe, Int> {

    @Query("FROM Recipe WHERE CONCAT(LOWER(title), ' ') LIKE CONCAT('%', COALESCE(:search, ''), '%') ")
    fun findBySearchText(@Param("search") search: String?): List<Recipe>

    //find recipes of current user
    @Query("FROM Recipe WHERE user.id = :userId")
    fun findByUserId(userId: Int?): List<Recipe>


}