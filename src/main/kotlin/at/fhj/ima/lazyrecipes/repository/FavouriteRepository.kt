package at.fhj.ima.lazyrecipes.repository
import at.fhj.ima.lazyrecipes.entity.Favourite
import at.fhj.ima.lazyrecipes.entity.Rating
import at.fhj.ima.lazyrecipes.entity.Recipe
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.stereotype.Repository

@Repository
interface FavouriteRepository : JpaRepository<Favourite, Int> {

    //find recipes of current user
    @Query("FROM Favourite WHERE user.id = :userId")
    fun findFavouritesByUserId(userId: Int?): List<Favourite>

    @Query("FROM Favourite WHERE user.id = :userId AND recipe.id = :recipeId")
    fun findByUserIdAndRecipeId(userId: Int?, recipeId: Int?): Favourite?

}


