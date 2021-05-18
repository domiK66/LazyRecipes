package at.fhj.ima.lazyrecipes.entity

import java.io.Serializable
import java.time.LocalDate
import javax.persistence.*

@Entity
class Recipe (
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,
    var title: String? = null,
    var subtitle: String? = null,
    var ingredients: String? = null,

    @ManyToOne
    var category: Category? = null,

    var prepTime: Int? = null,
    var portions: Int? = null,
    var steps: String? =null,

    var date: LocalDate? = LocalDate.now(),

    //var user: String? = null,






    //var rating: Float? = null
    //var image: String? = null


): Comparable<Recipe>, Serializable{
    override fun compareTo(other: Recipe): Int {
        return compareValues(id, other.id)
    }
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as Recipe
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return super.hashCode()
    }
}