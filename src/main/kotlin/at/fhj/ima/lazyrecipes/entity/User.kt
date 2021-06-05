package at.fhj.ima.lazyrecipes.entity

import java.time.LocalDate
import javax.persistence.*
import javax.validation.constraints.NotEmpty
import javax.validation.constraints.NotNull
import javax.validation.constraints.Past
import javax.validation.constraints.Size

enum class UserRole {
    ROLE_USER,
    ROLE_ADMIN
}
@Entity
class User(

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,

    @Column(nullable = false, unique = true)
    @field:NotNull
    @field:NotEmpty
    @field:Size(min = 2, max = 15)
    var username: String? = null,

    //TODO:Password and Validation
    var password: String? = null,

    @Enumerated(EnumType.STRING)
    var role: UserRole=UserRole.ROLE_USER,
    @field:Size(min = 2, max = 240)
    var firstName:String? = null,
    @field:Size(min = 2, max = 240)
    var lastName:String? = null,
    @field:Size(min = 2, max = 240)
    var city:String? = null,
    @ManyToOne
    @field:NotNull
    var country: Country?=null,
    @field:Size(min = 2, max = 6)
    var zip:String? = null,
    //@field:NotNull
    //var terms: Boolean? =null,
    @field:Past
    var birthdate: LocalDate? = null




) : Comparable<User> {
    override fun compareTo(other: User): Int {
        return compareValues(id, other.id)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as User
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }
    fun getUser(): String? {
        return username
    }

    fun setUser(): String? {
        return username
    }
}