package at.fhj.ima.lazyrecipes.entity

import java.io.Serializable
import java.time.LocalDate

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id

@Entity
class Recipee (
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,
    var title: String? = null,
    var subtitle: String? = null,
    var category: String? = null,
    var date: LocalDate? = null,

    //var user: String? = null,

    var prepTime: Int? = null,
    var portion: Int? = null,

    var steps: String? =null,
    var ingredients: String? = null,

    //var rating: Float? = null
    //var image: String? = null


): Comparable<Recipee>, Serializable{
    override fun compareTo(other: Recipee): Int {
        return compareValues(id, other.id)
    }
    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as Recipee
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return super.hashCode()
    }
}