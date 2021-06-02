package at.fhj.ima.lazyrecipes.converter

import at.fhj.ima.lazyrecipes.entity.Country
import at.fhj.ima.lazyrecipes.repository.CountryRepository
import org.springframework.stereotype.Component
import org.springframework.core.convert.converter.Converter

@Component
class StringToCountryConverter(val countryRepository: CountryRepository) : Converter<String, Country?> {
    override fun convert(source: String): Country? {
        if (source.isNullOrBlank()) {
            return null
        }
        return countryRepository.getOne(Integer.parseInt(source));
    }
}