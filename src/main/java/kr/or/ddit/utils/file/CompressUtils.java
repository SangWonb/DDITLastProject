package kr.or.ddit.utils.file;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.FileVisitResult;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;

import org.apache.commons.compress.archivers.ArchiveEntry;
import org.apache.commons.compress.archivers.zip.ZipArchiveOutputStream;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import lombok.extern.slf4j.Slf4j;

/**
 * @see
 * <a href="https://commons.apache.org/proper/commons-compress/examples.html">Commons-compress 예제</a>
 */
@Slf4j
public class CompressUtils {
	
	private CompressUtils() {
		throw new IllegalStateException("Utility class");
	}
	
	/**
	 * 대상 파일들을 zip 압축하고, 출력 스트림을 통해 기록함.
	 * @param files
	 * @param os
	 * @throws IOException 
	 */
	public static long compress(File[] files, OutputStream os) throws IOException {
		try(
			ZipArchiveOutputStream zaos = new ZipArchiveOutputStream(os);
		){
			for(File file : files) {
				
				ArchiveEntry archiveEntry = zaos.createArchiveEntry(file, file.getName());
				
				zaos.putArchiveEntry(archiveEntry);
				FileUtils.copyFile(file, zaos);
				
				zaos.closeArchiveEntry();				
			}
			zaos.finish();
			return zaos.getBytesWritten();
		}
	}
	
	
	/**
	 * 폴더의 하위 구조를 압축하고, 출력스트림으로 기록함.
	 * @param dir
	 * @param os
	 * @return
	 * @throws IOException
	 */
	public static long compressFolder(File dir, OutputStream os) throws IOException {
		Path base = dir.toPath();
		try(
			ZipArchiveOutputStream zaos = new ZipArchiveOutputStream(os);
		){
			Files.walkFileTree(base, new SimpleFileVisitor<Path>() {
				@Override
				public FileVisitResult preVisitDirectory(Path dir, BasicFileAttributes attrs) throws IOException {
					if(! base.equals(dir) ) {
						
						String entryName = base.relativize(dir).toString();
						ArchiveEntry archiveEntry = zaos.createArchiveEntry(dir, entryName);
						zaos.putArchiveEntry(archiveEntry);
						zaos.closeArchiveEntry();
						
						log.info("압축 대상 폴더에 상대적인 경로(entry name) : {}", entryName);
					}
					return super.preVisitDirectory(dir, attrs);
				}
				
				@Override
				public FileVisitResult visitFile(Path file, BasicFileAttributes attrs) throws IOException {
					String entryName = base.relativize(file).toString();
					ArchiveEntry archiveEntry = zaos.createArchiveEntry(file, entryName);
					zaos.putArchiveEntry(archiveEntry);
					Files.copy(file, zaos);
					zaos.closeArchiveEntry();
					log.info("현재 압축 파일의 entry name : {}", entryName);
					return super.visitFile(file, attrs);
				}
			});			
			zaos.finish();
			return zaos.getBytesWritten();
		}
	}
	
	/**
	 * 대상 파일들을 zip 압축하고, 특정 파일명으로 다운로드 처리함.
	 * @param files 압축 대상 파일
	 * @param name 다운로드 파일명
	 * @return
	 * @throws IOException
	 */
	public static ResponseEntity<StreamingResponseBody> compressAndGenerateResponseEntity(File[] files, String name) throws IOException {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		long written = compress(files, baos);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.setContentLength(written);
		headers.setContentDisposition(
				ContentDisposition.attachment()
								.filename(name, StandardCharsets.UTF_8)
								.build()
		);
		return ResponseEntity.ok()
				.headers(headers)
				.body(new StreamingResponseBody() {
					@Override
					public void writeTo(OutputStream outputStream) throws IOException {
						IOUtils.copy(new ByteArrayResource(baos.toByteArray()).getInputStream(), outputStream);
					}
				});
	}
	
	/**
	 * 폴더를 압축하고, 해당 폴더명으로 다운로드 처리함.  
	 * @param dir
	 * @return
	 * @throws Exception
	 */
	public static ResponseEntity<StreamingResponseBody> compressAndGenerateResponseEntity(File dir) throws Exception{
		String name = dir.getName()+".zip";
		return compressAndGenerateResponseEntity(dir, name);
	}
	
	/**
	 * 폴더를 압축하고, 특정 파일명으로 다운로드 처리함.
	 * @param dir
	 * @param name
	 * @return
	 * @throws Exception
	 */
	public static ResponseEntity<StreamingResponseBody> compressAndGenerateResponseEntity(File dir, String name) throws Exception{
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		long written = compressFolder(dir, baos);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.setContentLength(written);
		headers.setContentDisposition(
				ContentDisposition.attachment()
								.filename(name, StandardCharsets.UTF_8)
								.build()
		);
		return ResponseEntity.ok()
				.headers(headers)
				.body(new StreamingResponseBody() {
					@Override
					public void writeTo(OutputStream outputStream) throws IOException {
						IOUtils.copy(new ByteArrayResource(baos.toByteArray()).getInputStream(), outputStream);
					}
				});
	}
}
