package at.fhj.ima.lazyrecipes.service

import at.fhj.ima.lazyrecipes.entity.File
import at.fhj.ima.lazyrecipes.repository.FileRepository
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import org.springframework.web.multipart.MultipartFile
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.Paths
import java.nio.file.StandardOpenOption

@Service
class FileService(val fileRepository: FileRepository) {
    fun save(file: File): File {
        return fileRepository.save(file)
    }

    @Transactional
    fun createFile(dto: MultipartFile): File {
        val file = convertMultipartFileToFile(dto)
        this.save(file)
        val path = this.retrievePath(file.id!!).toAbsolutePath()
        if (!Files.exists(path)) {
            Files.createFile(path)
        }
        Files.write(path, dto.bytes, StandardOpenOption.WRITE)
        return file
    }

    fun convertMultipartFileToFile(dto: MultipartFile): File {
        return File(contentType = dto.contentType, size = dto.size, originalFileName = dto.originalFilename)
    }

    fun retrievePath(id: Int): Path {
        return Paths.get("files/$id")
    }

    fun findById(id: Int): File {
        return fileRepository.findById(id).get()
    }

    fun delete(id: Int) {
        fileRepository.delete(findById(id))
    }

}