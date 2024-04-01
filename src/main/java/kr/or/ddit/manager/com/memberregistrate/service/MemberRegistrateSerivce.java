package kr.or.ddit.manager.com.memberregistrate.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.user.ManagerVO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.ProfessorVO;
import kr.or.ddit.vo.user.StudentVO;

public interface MemberRegistrateSerivce {
	
	/**
	 * 교직원 등록
	 * @param excelFile
	 * @return
	 * @throws IOException 
	 */
	public MemberVO createManager(MultipartFile excelFile) throws IOException;
	/**
	 * 학생 등록
	 * @param excelFile
	 * @return
	 * @throws IOException 
	 */
	public MemberVO createStudent(MultipartFile excelFile) throws IOException;
	/**
	 * 교수 등록
	 * @param excelFile
	 * @return
	 * @throws IOException 
	 */
	public MemberVO createProfessor(MultipartFile excelFile) throws IOException;
	
}
