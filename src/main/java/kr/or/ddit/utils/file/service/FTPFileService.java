package kr.or.ddit.utils.file.service;

import java.io.File;
import java.util.List;

import org.apache.commons.net.ftp.FTPFile;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.whole.FileVO;

public interface FTPFileService {
	
	/**
	 * FTP 서버상의 특정 디렉토리에 대한 탐색
	 * @param path 탐색 위치
	 * @return
	 * @throws Exception
	 */
	public List<FTPFile> traversing(String path) throws Exception;
	
	/**
	 * DB상에서 해당 파일 조회
	 * @param gfNo
	 * @return
	 */
	public List<FileVO> selectFileList(String gfNo);
	
	/**
	 * FTP 서버로의 파일 전송
	 * @param path 저장 위치
	 * @param file 전송할 파일
	 * @return ## 성공시 저장한 gfNo 반환함. // 실패시 null 반환 // "BIG"반환 >> 100MB가 넘어감 
	 * @throws Exception
	 */
	public String sendFile(String gfNo, MultipartFile file) throws Exception;
	
	/**
	 * FTP 서버로의 파일 전송 (여러개)
	 * @param gfNo
	 * @param files
	 * @return ## 저장한 gfNo 반환함. // 실패시 null 반환 // "BIG"반환 >> 100MB가 넘어감 
	 * @throws Exception
	 */
	public String sendFiles(String gfNo, MultipartFile[] files) throws Exception;
	
	/**
	 * FTP 서버로부터 파일/폴더 수신
	 * @param gfNo
	 * @param fileNo
	 * @return 해당 파일/폴더가 저장된 임시 폴더
	 * @throws Exception
	 * 
	 */
	public File receiveFile(String fileNo) throws Exception;
	/**
	 * FTP 서버로부터 여러개의 파일/폴더 수신
	 * @param path
	 * @return
	 * @throws Exception
	 */
	public File receiveFiles(String[] fileNo) throws Exception;
	
	public boolean checkExists(String[] keyPaths) throws Exception;
	public boolean checkExist(String keyPath) throws Exception;
	
	/**
	 * 지금 쓸 수 있는 gfNo 알려줌
	 * @return
	 */
	public String selecStringGFNO();
	
	/**
	 * 해당 폴더 만듦 + (DB, 실제
	 * )
	 * @param gfNo
	 * @return
	 * @throws Exception 
	 */
	public boolean makeGFNOFolder(String gfNo) throws Exception;
	
	/**
	 * 단건 삭제 (DB)  + 실제 파일
	 * @param fileNo
	 * @return
	 * @throws Exception 
	 */
	public ServiceResult deleteFile(String fileNo) throws Exception;
	/**
	 * 여러건 삭제 (DB) + 실제 파일
	 * @param fileNos
	 * @return
	 * @throws Exception 
	 */
	public ServiceResult deleteFiles(String[] fileNos) throws Exception;
	/**
	 * gf 단위로 파일만 삭제 폴더 아님 삭제 (DB)  + 실제 파일
	 * @param gfNo
	 * @return
	 * @throws Exception 
	 */
	public ServiceResult deleteGoupFile(String gfNo) throws Exception;
	
	/**
	 * gfNo 폴더 삭제 (DB) + 실제 파일
	 * @param gfNo
	 * @return
	 * @throws Exception 
	 */
	public boolean deleteFolder(String gfNo) throws Exception;

	/**
	 * 팝업을 위한 메서드
	 */
	public File[] filesForPopup(String gfNo) throws Exception;
	
}
