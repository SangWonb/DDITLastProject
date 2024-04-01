package kr.or.ddit.student.info.graduationdiagnosis.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.student.info.graduationdiagnosis.dao.GraduationDAO;
import kr.or.ddit.vo.cyber.DepartmentVO;
import kr.or.ddit.vo.user.StudentVO;

@Service
public class GraduationServiceImplS implements GraduationServiceS{

	@Inject
	private GraduationDAO dao;

	@Override
	public DepartmentVO selectGradList(String memNo) {
		return dao.selectGradList(memNo);
	}
	
	@Override
	public StudentVO selectStuGradList(String memNo) {
		return dao.selectStuGradList(memNo);
	}

}
