package kr.or.ddit.student.info.graduationdiagnosis.service;

import kr.or.ddit.vo.cyber.DepartmentVO;
import kr.or.ddit.vo.user.StudentVO;

public interface GraduationServiceS {
	
	/**
	 * 졸업자가진단 기준학점조회
	 * @param memNo
	 * @return
	 */
	public DepartmentVO selectGradList(String memNo);
	
	/**
	 * 졸업자가진단 이수학점조회
	 * @return
	 */
	public StudentVO selectStuGradList(String memNo);
	
}
