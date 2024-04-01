package kr.or.ddit.manager.stu.mentor.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.careerup.SeniorCoworkerVO;
import kr.or.ddit.vo.user.StudentVO;

public interface MentorApplListServiceM {
	public List<StudentVO> retrieveApplList();
	public StudentVO retrieveAppl(String smemNo);
	
	public ServiceResult insertAppl(SeniorCoworkerVO vo);
	public ServiceResult createMentor(SeniorCoworkerVO vo);
	
//	public ServiceResult updateAppl(StudentVO vo);
	public ServiceResult modifyAppl(String smemNo);
	public ServiceResult modifyApplDel(String smemNo);
}
