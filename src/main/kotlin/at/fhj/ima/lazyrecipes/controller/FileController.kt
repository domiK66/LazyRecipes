package at.fhj.ima.lazyrecipes.controller

import at.fhj.ima.lazyrecipes.entity.File
import at.fhj.ima.lazyrecipes.service.FileService
import org.springframework.core.io.FileSystemResource
import org.springframework.http.MediaType
import org.springframework.http.ResponseEntity
import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.*
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.servlet.ModelAndView
import javax.servlet.http.HttpServletRequest


@Controller
class FileController(val fileService: FileService) {

    @RequestMapping("/file/{id}", method = [RequestMethod.GET])
    fun downloadFile(@PathVariable("id") id: Int): ResponseEntity<Any> {

        // Add security if necessary

        val file = fileService.findById(id)
        val path = fileService.retrievePath(id)
        val fileSystemResource = FileSystemResource(path)
        return ResponseEntity.ok()
            .header("Content-Disposition", "attachment; filename=" + file.originalFileName)
            .contentType(MediaType.parseMediaType(file.contentType!!))
            .body(fileSystemResource)
    }

    @RequestMapping("/file", method = [RequestMethod.POST])
    @ResponseBody
    fun uploadFile(@RequestParam("file") file: MultipartFile): File {
        return fileService.createFile(file)
    }

    @RequestMapping("/file/{id}", method = [RequestMethod.POST])
    fun deleteFile(@PathVariable("id") id: Int, request: HttpServletRequest): String {
        fileService.delete(id)
        val referer = request.getHeader("Referer")
        return "redirect:$referer"
    }
}