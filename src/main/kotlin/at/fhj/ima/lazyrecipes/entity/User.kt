package at.fhj.ima.lazyrecipes.entity

import javax.persistence.*
import javax.validation.constraints.NotEmpty
import javax.validation.constraints.NotNull
import javax.validation.constraints.Size


@Entity
class User(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,

    @Column(nullable = false, unique = true)
    @field:NotNull
    @field:NotEmpty
    @field:Size(min = 2, max = 15)
    var username: String,

    var password: String,

    @Enumerated(EnumType.STRING)
    var role: UserRole,





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