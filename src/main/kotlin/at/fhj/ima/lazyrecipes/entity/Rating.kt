package at.fhj.ima.lazyrecipes.entity

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id

@Entity
class Rating (
    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    var id: Int? = null,
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