package at.fhj.ima.lazyrecipes.entity

import javax.persistence.*

@Entity
class Rating(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,
    @ManyToOne
    var user: User? = null,
    @ManyToOne
    var recipe: Recipe? = null,
    var value: Float? = null

    ): Comparable<Rating> {

    override fun compareTo(other: Rating): Int {
        return compareValues(id, other.id)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as Rating
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }


}