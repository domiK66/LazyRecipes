package at.fhj.ima.lazyrecipes.repository

import at.fhj.ima.lazyrecipes.entity.Rating
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface RatingRepository : JpaRepository<Rating, Int> {

}