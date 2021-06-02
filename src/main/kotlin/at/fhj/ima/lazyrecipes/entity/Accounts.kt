package at.fhj.ima.lazyrecipes.entity

import javax.persistence.*
import javax.validation.constraints.NotNull

@Entity
//@Table(uniqueConstraints = [UniqueConstraint(name = "ssn_OK", columnNames  = ["ssn"])])
class Accounts (
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,

    var firstName:String? = null,
    var lastName:String? = null,
    var username:String? = null,
    var city:String? = null,
    @ManyToOne
    @field:NotNull
    var country: Country?=null,
    var zip:String? = null,
    //TODO:Password and Validation
    var password: String? = null,
    var terms: Boolean? =null

        ):Comparable<Accounts> {
    override fun compareTo(other:Accounts): Int {
        return compareValues(username, other.username)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as Accounts
        if (username != other.username) return false
        return true
    }

    override fun hashCode(): Int {
        return username.hashCode()
    }
}