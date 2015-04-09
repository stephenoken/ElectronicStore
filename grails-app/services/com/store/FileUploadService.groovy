package com.store

import org.codehaus.groovy.grails.web.context.ServletContextHolder;
import org.springframework.web.multipart.MultipartFile;

import grails.transaction.Transactional

@Transactional
class FileUploadService {
	
	def String uploadFile(MultipartFile file, String name, String desitnationDirectory){
			def servletContext  = ServletContextHolder.servletContext
			def storagePath  = servletContext.getRealPath(desitnationDirectory)
			
			//Create storage path directory if it does not exit
			def storagePathDirectory = new File(storagePath)
			if(!storagePathDirectory.exists()){
				println "CREATING DIRECTORY ${storagePath}"
				if(storagePathDirectory.mkdirs()){
					println "SUCCESS"
				}else{
					println "FAILED"
				}
			}
			
			//Store file 
			if(!file.isEmpty()){
				file.transferTo(new File("${storagePath}/${name}"))
				println "Saved file: ${storagePath}/${name}"
				return "${storagePath}/${name}"
			}else{
				println "File ${file.inspect()} was empty!"
				return null
			}
	}
    def serviceMethod() {

    }
}
