package kr.or.ddit.manager.com.memberregistrate.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.user.ManagerVO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.ProfessorVO;
import kr.or.ddit.vo.user.StudentVO;

@Mapper
public interface MemberRegistrateDAO {
	
	public int insertMemRoles(@Param("memNo") String memNo, @Param("role") String role);
	
	public int insertMember(MemberVO member);
	
	public int insertManager(ManagerVO manager);
	
	public int insertStudent(StudentVO student);
	
	public int insertProfessor(ProfessorVO professor);
	
	public String selectSmemNo(@Param("basicData") String basicData, @Param("percent") String percent);
	
	public String selectPmemNo(@Param("basicData") String basicData, @Param("percent") String percent);
	
	public String selectMmemNo(@Param("basicData") String basicData, @Param("percent") String percent);
	
	public int deleteMember(String memNo);
	
	public int deleteMemRole(String memNo);
}
