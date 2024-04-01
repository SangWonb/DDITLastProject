package kr.or.ddit.utils.file.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.inject.Named;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPFile;
import org.apache.commons.pool2.ObjectPool;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.file.dao.FileDAO;
import kr.or.ddit.vo.whole.FileVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class FTPFileServiceImpl implements FTPFileService {
	
	@Inject
	private FileDAO dao;
	
	@Inject
	@Named("ftpClientPool")
	private ObjectPool<FTPClient> ftpClientPool;
	
	@Value("#{appInfo.tempFolder}")
	private File tempFolder; /* D:/lcmsdirs/ */
	
	private static final String PREFIX = "FTP_";
	
	@PostConstruct
	public void init() {
		if(!tempFolder.exists())
			tempFolder.mkdirs();
	}
	
	public String selecStringGFNO() {
		return dao.selectGFNO();
	}
	
	/**
	 * 조회
	 */
	@Override
	public List<FileVO> selectFileList(String gfNo){
		return dao.selectFiles(gfNo);
	};
	
	
	/**
	 * 업로드(낱개)
	 */
	@Override
	@Transactional(rollbackFor = {Exception.class})
	public String sendFile(String gfNo, MultipartFile file) throws Exception {
		if(file==null) throw new IllegalArgumentException("file 이 널임.");
		if(file==null || file.isEmpty())  throw new IllegalArgumentException("empty 파일임.");
		if(gfNo==null || gfNo.isEmpty()) throw new IllegalArgumentException("gfNo가 정해지지 않음.");
		
		FileVO fvo = new FileVO(file);
		
		if(fvo.getFileSize() > 100 * 1024 * 1024) {
			//파일이 100MB보다 큰 경우
			return "BIG";
		}
		
		fvo.setGfNo(gfNo);
		dao.insertFile(fvo);
		
		FTPClient ftpClient = ftpClientPool.borrowObject();
		try {
			String path =  "/" + gfNo;
			FTPFile ftpFile = ftpClient.mlistFile(path);
			
			if(ftpFile == null || !ftpFile.isDirectory())
				throw new IOException(String.format("%s 에 저장할 수 없음.", path));
			else
				ftpClient.changeWorkingDirectory(path);
			
			ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
			return ftpClient.storeFile(fvo.getFileSave(), file.getInputStream()) ? gfNo:null;
		}finally {
			ftpClient.changeWorkingDirectory("/");
			ftpClientPool.returnObject(ftpClient);
		}
	}
	
	/**
	 * 업로드(여러개)
	 */
	@Override
	@Transactional(rollbackFor = {Exception.class})
	public String sendFiles(String gfNo, MultipartFile[] files) throws Exception {
		if(files==null) throw new IllegalArgumentException("files 이 널임.");
		if(files==null)  throw new IllegalArgumentException("empty 파일임.");
		if(gfNo==null || gfNo.isEmpty()) throw new IllegalArgumentException("gfNo가 정해지지 않음.");
		
		for(MultipartFile file : files) {
			FileVO fvo = new FileVO(file);
			if(fvo.getFileSize() > 100 * 1024 * 1024) {
				//파일이 100MB보다 큰 경우
				return "BIG";
			}
		}
		
		for(MultipartFile file : files) {
			if(file==null) throw new IllegalArgumentException("file 이 널임.");
			FileVO fvo = new FileVO(file);
			fvo.setGfNo(gfNo);
			dao.insertFile(fvo);			

			FTPClient ftpClient = ftpClientPool.borrowObject();
			try {
				String path = "/" + gfNo;
				FTPFile ftpFile = ftpClient.mlistFile(path);
				
				if(ftpFile == null || !ftpFile.isDirectory())
					throw new IOException(String.format("%s 에 저장할 수 없음.", path));
				else
					ftpClient.changeWorkingDirectory(path);
				
				ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
				if(!ftpClient.storeFile(fvo.getFileSave(), file.getInputStream())) return null;
			}finally {
				ftpClient.changeWorkingDirectory("/");
				ftpClientPool.returnObject(ftpClient);
			}
		}
		return gfNo;
		
	}

	/**
	 * 다운로드 (단건)
	 */
	@Override
	public File receiveFile(String fileNo) throws Exception {
		if(fileNo==null) throw new IllegalArgumentException("fileNo 가 널임.");
		
		FileVO selectFile = dao.selectFile(fileNo);
		if(selectFile == null)  throw new IllegalArgumentException("selectFile 가 널임.");
		
		FTPClient ftpClient = ftpClientPool.borrowObject();
		try {
			String path = pathMaker(selectFile.getGfNo(), selectFile.getFileSave());
			FTPFile ftpFile = ftpClient.mlistFile(path);
			FileVO fvo = dao.selectFile(fileNo);
			
			if(ftpFile==null) {
				throw new IOException(String.format("%s 파일이 없음.", path));
			}else {
				File tempDir = Files.createTempDirectory(tempFolder.toPath(), PREFIX).toFile();
				ftpFile.setName(fvo.getFileNm());
				return saveToTempFolder(path, ftpFile, ftpClient, tempDir);
			}
			
		}finally {
			ftpClientPool.returnObject(ftpClient);
		}
	}
	
	/**
	 * 다운로드 (ZIP)
	 */
	@Override
	public File receiveFiles(String[] fileNos) throws Exception {
		
		if(fileNos==null) throw new IllegalArgumentException("fileNos 가 널임.");
		String[] paths = pathsMaker(fileNos);
		
		FTPClient ftpClient = ftpClientPool.borrowObject();
		
		try {
			File tempDir = Files.createTempDirectory(tempFolder.toPath(), PREFIX).toFile();
			
			for(int i=0; i<paths.length; i++) {
				FTPFile ftpFile = ftpClient.mlistFile(paths[i]);
				FileVO fvo = dao.selectFile(fileNos[i]);
				
				if(ftpFile==null) {
					throw new IOException(String.format("%s 파일이 없음.", paths[i]));
				}else {
					ftpFile.setName(fvo.getFileNm());
					saveToTempFolder(paths[i], ftpFile, ftpClient, tempDir);
				}
			}
			
			return tempDir;
		}finally {
			ftpClientPool.returnObject(ftpClient);
		}
	}
	
	/**
	 * 팝업을 위한 메서드
	 */
	@Override
	public File[] filesForPopup(String gfNo) throws Exception {
	/*	List<FileVO> selectFileList = selectFileList(gfNo);
		String fileNo = "";
		String[] fileNoss = null;
		fileNoss.
		for(String[] fileNoss : selectFileList) {
//			fileNo = fileNoss.getFileNo();
			File receiveFile = receiveFiles(fileNoss);
		}
//		for(File fileNos : fileNo) {
//			receiveFiles(fileNos);
//		}*/
		File[] a = null;
		return a;
	}
	

	public String pathMaker(String gfNo, String saveName) {
		String path = "/" + gfNo + "/" + saveName;
		return path;
	}
	
	public String[] pathsMaker(String[] fileNos) {
		String[] paths = new String[fileNos.length];
		for(int i=0; i<fileNos.length; i++) {
			FileVO selectFile = dao.selectFile(fileNos[i]);
			paths[i] = "/" + selectFile.getGfNo() + "/" + selectFile.getFileSave();
		}
		return paths;
	}
	
	/**
	 * 재귀 호출 형태로 단건 파일을 임시 폴더에 저장하거나 특정 디렉토리 계층구조상의 전체 파일 구조를 임시 폴더에 저장함.
	 * @param path 저장할 대상
	 * @param ftpFile FTP 서버상의 저장 대상에 대한 meta data
	 * @param ftpClient
	 * @param parent 저장할 폴더.
	 * @return
	 * @throws Exception
	 */
	@Transactional(rollbackFor = {Exception.class})
	private File saveToTempFolder(String path, FTPFile ftpFile, FTPClient ftpClient, File parent) throws Exception{
		File newFile = new File(parent, ftpFile.getName());
		newFile.getParentFile().mkdirs();
		
		if(ftpFile.isDirectory()){
			newFile.mkdirs();
			FTPFile[] files = ftpClient.mlistDir(path);
			
			for(FTPFile curFile : files) {
				String curPath = String.format("%s/%s", path, curFile.getName());
				saveToTempFolder(curPath, curFile, ftpClient, newFile);
			}
			
		}else if(ftpFile.isFile()) {
			if(newFile.createNewFile()) {
				try(
					FileOutputStream fos = new FileOutputStream(newFile);	
				){
					ftpClient.retrieveFile(path, fos);			
				}
			}
		}else {
			return null;
		}
		return newFile;
	}

	
	
	/**
	 * 진짜 있는지 확인(여러건)
	 */
	@Override
	public boolean checkExists(String[] fileNos) throws Exception {
		
		String[] keyPaths = pathsMaker(fileNos);
		
		try {
			for(String path : keyPaths) {
				traversing(path);
			}
			return true;
		}catch (IOException e) {
			log.error(e.getMessage(), e);
			return false;
		}
	}
	
	/**
	 * 진짜 있는지 확인(한건)
	 */
	@Override
	public boolean checkExist(String fileNo) throws Exception {
		
		String[] keyPathArr = new String[] {fileNo};
		String[] keyPaths = pathsMaker(keyPathArr);
		
		try {
			for(String path : keyPaths) {
				traversing(path);
			}
			return true;
		}catch (IOException e) {
			log.error(e.getMessage(), e);
			return false;
		}
	}

	/**
	 * 탐색
	 */
	@Override
	public List<FTPFile> traversing(String path) throws Exception {
		if(path==null||path.isEmpty()) throw new IllegalArgumentException("path 가 비어있음.");
		
		FTPClient ftpClient = ftpClientPool.borrowObject();
		try {
			FTPFile file = ftpClient.mlistFile(path);
			
			if(file==null || !file.isValid() || file.isSymbolicLink() || file.isUnknown()) {
				throw new IOException(String.format("%s 는 탐색 대상이 아님.", path));
				
			}else if(file.isDirectory()) {
				FTPFile[] listFiles = ftpClient.mlistDir(path);
				Stream.of(listFiles)
						.forEach(f->log.info("수신 파일 : {}", f));
				return Arrays.asList(listFiles);
			}else{
				return Collections.singletonList(file);
			}
			
		}finally {
			ftpClientPool.returnObject(ftpClient);
		}
	}

	@Override
	@Transactional(rollbackFor = {Exception.class})
	public ServiceResult deleteFile(String fileNo) throws Exception {
		FileVO selectFile = dao.selectFile(fileNo);
		String path = pathMaker(selectFile.getGfNo(), selectFile.getFileSave());
		FTPClient ftpClient = ftpClientPool.borrowObject();
		try {
			if(ftpClient.deleteFile(path)) {
				return dao.deleteFile(fileNo) > 0 ? ServiceResult.OK:ServiceResult.FAIL;
			}else {
				return ServiceResult.FAIL;
			}
		}finally {
			ftpClient.changeWorkingDirectory("/");
			ftpClientPool.returnObject(ftpClient);
		}
	}

	@Override
	@Transactional(rollbackFor = {Exception.class})
	public ServiceResult deleteFiles(String[] fileNos) throws Exception {
		FTPClient ftpClient = ftpClientPool.borrowObject();
		try {
			for(String fileNo:fileNos) {
				
				FileVO selectFile = dao.selectFile(fileNo);
				String path = pathMaker(selectFile.getGfNo(), selectFile.getFileSave());
				
				if(ftpClient.deleteFile(path)) {
					if(!(dao.deleteFile(fileNo) > 0 )) 
						return ServiceResult.FAIL;
				}else {
					return ServiceResult.FAIL;
				}
			}
			return ServiceResult.OK;
			
		}finally {
			ftpClient.changeWorkingDirectory("/");
			ftpClientPool.returnObject(ftpClient);
		}
	}

	@Override
	@Transactional(rollbackFor = {Exception.class})
	public ServiceResult deleteGoupFile(String gfNo) throws Exception {
		
		List<FileVO> fileList = dao.selectFiles(gfNo);
		
		String[] fileNos = new String[fileList.size()];
		int index = 0;
		for(FileVO fvo : fileList) {
			fileNos[index++] = fvo.getFileNo();
		}
		
		return deleteFiles(fileNos);
	}

	@Override
	@Transactional(rollbackFor = {Exception.class})
	public boolean makeGFNOFolder(String gfNo) throws Exception {
		FTPClient ftpClient = ftpClientPool.borrowObject();
		try {
			if(dao.insertGroupFile(gfNo) > 0) {
				return ftpClient.makeDirectory(gfNo);			
			}else {
				return false;
			}
		}finally {
			ftpClient.changeWorkingDirectory("/");
			ftpClientPool.returnObject(ftpClient);
		}	
	}

	@Override
	@Transactional(rollbackFor = {Exception.class})
	public boolean deleteFolder(String gfNo) throws Exception {
		FTPClient ftpClient = ftpClientPool.borrowObject();
		try {
			if (dao.deleteFolder(gfNo) > 0) {
				return ftpClient.removeDirectory(gfNo);
			} else {
				return false;
			}			
		}finally {
			ftpClient.changeWorkingDirectory("/");
			ftpClientPool.returnObject(ftpClient);
		}
	}
}
