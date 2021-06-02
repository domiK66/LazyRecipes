package at.fhj.ima.lazyrecipes.entity

import javax.persistence.*

@Entity
class Favourite (
    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    var id: Int? = null,
    @ManyToOne
    var user: User? = null,
    @ManyToOne
    var recipe: Recipe? = null,
    var checkboxBool: Boolean? = false,
    

): Comparable<Favourite> {

    override fun compareTo(other: Favourite): Int {
        return compareValues(id, other.id)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as Favourite
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }

}