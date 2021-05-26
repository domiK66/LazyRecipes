package at.fhj.ima.lazyrecipes.entity

import java.time.LocalDate
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import javax.validation.constraints.NotEmpty
import javax.validation.constraints.NotNull
import javax.validation.constraints.Past
import javax.validation.constraints.Size
import javax.xml.crypto.Data

@Entity
class User(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id:Int? = null,

    @field:NotNull
    @field:NotEmpty
    @field:Size(min = 2, max = 240)
    var firstName:String? = null,

    @field:NotNull
    @field:NotEmpty
    var lastName:String? = null,

    @field:Past
    var dayOfBirth: LocalDate? = null,

    @field:NotNull
    @field:NotEmpty
    var nickname:String? =null,

    @field:NotNull
    @field:NotEmpty
    var mail: String? = null,

    @field:NotNull
    @field:NotEmpty
    var password:String? = null





):Comparable<User>{
    override fun compareTo(other: User): Int {
        return compareValues(id,other.id)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other ) return true
        if (javaClass != other?.javaClass) return false
      other as User
        if (id !=other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }
}
