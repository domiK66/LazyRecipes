package at.fhj.ima.lazyrecipes.repository

import at.fhj.ima.lazyrecipes.entity.Recipe
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface RecipeRepository: JpaRepository<Recipe, Int> {
}