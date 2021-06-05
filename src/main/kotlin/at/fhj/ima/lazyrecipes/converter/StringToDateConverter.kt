package at.fhj.ima.lazyrecipes.converter

import org.springframework.core.convert.converter.Converter
import org.springframework.stereotype.Component
import java.time.LocalDate
import java.time.format.DateTimeFormatter


@Component
class StringToDateConverter: Converter<String?,LocalDate> {
    override fun convert(source: String): LocalDate? {
      if (source.isNullOrBlank()) {
          return null
      }
        return LocalDate.parse(source, DateTimeFormatter.ISO_LOCAL_DATE)
    }
}