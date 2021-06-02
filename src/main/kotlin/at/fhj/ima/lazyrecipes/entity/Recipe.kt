package at.fhj.ima.lazyrecipes.entity

import java.io.Serializable
import java.time.LocalDate
import javax.persistence.*
import javax.validation.constraints.NotBlank
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
    @field:Size(min = 2, max = 240)
    var subtitle: String? = null,

    @field:NotNull
    @field:NotEmpty
    @field:Size(min = 2, max = 240)
    var ingredients: String? = null,

    @ManyToOne
    @field:NotNull
    var category: Category? = null,

    @field:NotNull
    var prepTime: Int? = null,

    @field:NotNull
    var portions: Int? = null,

    @field:NotNull
    @field:NotEmpty
    @field:Size(min = 2, max = 240)
    var steps: String? = null,

    var date: LocalDate? = LocalDate.now(),

    @ManyToOne
    @field:NotNull
    var user: User? = null,


    /*
    var ratingAVG: Float? = null
            // getter
            get() = rating.fold(0){ acc, rating -> acc + rating} / rating.size

            // setter
            set(value) {
        field = value
    }
    */
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