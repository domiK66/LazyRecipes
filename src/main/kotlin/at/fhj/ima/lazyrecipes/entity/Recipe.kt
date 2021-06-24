package at.fhj.ima.lazyrecipes.entity

import java.io.Serializable
import java.time.LocalDate
import javax.persistence.*
import javax.validation.constraints.NotEmpty
import javax.validation.constraints.NotNull
import javax.validation.constraints.Size

@Entity
class Recipe (
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,

    @field:NotNull
    @field:NotEmpty
    @field:Size(min = 2, max = 240)
    var title: String? = null,

    @field:NotNull
    @field:NotEmpty
    @field:Size(min = 2, max = 1024)
    var subtitle: String? = null,

    @field:NotNull
    @field:NotEmpty
    @field:Size(min = 2, max = 1024)
    var ingredients: String? = "- ",

    @ManyToOne
    @field:NotNull
    var category: Category? = null,

    @field:NotNull
    var prepTime: Int? = null,

    @field:NotNull
    var portions: Int? = null,

    @field:NotNull
    @field:NotEmpty
    @field:Size(min = 2, max = 2048)
    var steps: String? = "- ",

    var date: LocalDate? = LocalDate.now(),

    @ManyToOne
    @field:NotNull
    var user: User? = null,

    var ratingAVG: Float? = null,

    var likes: Int? = null,

    @ManyToMany(fetch = FetchType.EAGER)
    var files: List<File>? = null




): Comparable<Recipe>, Serializable {
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