package at.fhj.ima.lazyrecipes.repository

import at.fhj.ima.lazyrecipes.entity.Rating
import at.fhj.ima.lazyrecipes.entity.Recipe
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.stereotype.Repository

@Repository
interface RatingRepository : JpaRepository<Rating, Int> {
    @Query("FROM Rating WHERE user.id = :userId AND recipe.id = :recipeId")
    fun findByUserIdAndRecipeId(userId: Int?, recipeId: Int?): Rating?

    @Query("SELECT AVG(value) FROM Rating WHERE recipe.id = :recipeId")
    fun getAverageRating(recipeId: Int?): Float?
}