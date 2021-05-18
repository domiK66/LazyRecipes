package at.fhj.ima.lazyrecipes.repository

import at.fhj.ima.lazyrecipes.entity.Category
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface CategoryRepository : JpaRepository<Category, Int> {

}