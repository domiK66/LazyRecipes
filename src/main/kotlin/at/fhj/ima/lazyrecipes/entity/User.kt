package at.fhj.ima.lazyrecipes.entity

import javax.persistence.*
import javax.validation.constraints.*


@Entity
@Table(uniqueConstraints = [UniqueConstraint(name = "username_UK", columnNames = ["username"])])
class User(

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,

    @Column(nullable = false)
    @field:Size(min = 2, max = 15)
    var username: String? = null,

    @field:NotNull
    @field:NotEmpty
    var password: String? = null,

    @Enumerated(EnumType.STRING)
    var role: UserRole = UserRole.ROLE_USER,

    @field:Size(min = 2, max = 240)
    var firstName:String? = null,

    @field:Size(min = 2, max = 240)
    var lastName:String? = null,

    @field:NotNull
    @field:NotEmpty
    var email: String? = null,

    var confirmPw: String? = null,

    @field:AssertTrue(message="Please re-enter the password")
    var isPw: Boolean = password == confirmPw,

    @field:AssertTrue(message="Please re-enter the email-address")
    var emailcorrect: Boolean = isCorrectEmail(email),

    @field:AssertTrue(message = "Please make sure to accept our Terms of Use and the Privacy Policy!")
    var acceptTerms: Boolean = false,

    @ManyToMany
    var files: List<File>? = null




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

fun isCorrectEmail(email: String?): Boolean {
    val pattern = "[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+\\.[a-zA-Z.]{2,18}".toRegex()
    if (pattern.matches(email.toString()))
        return true
    return false
}