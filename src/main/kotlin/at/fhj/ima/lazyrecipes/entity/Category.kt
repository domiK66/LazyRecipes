package at.fhj.ima.lazyrecipes.entity

import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id

@Entity
class Category (
    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    var id: Int? = null,
    var name: String? = null

): Comparable<Category> {

    override fun compareTo(other: Category): Int {
        return compareValues(id, other.id)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as Category
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }

}