package kr.or.ddit.student.cyber.exam.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.cyber.exam.dao.ExamDAOS;
import kr.or.ddit.vo.cyber.LecTestVO;
import kr.or.ddit.vo.cyber.RegistrationVO;
import kr.or.ddit.vo.cyber.TestGradeVO;
import kr.or.ddit.vo.cyber.TestQuestionVO;
import kr.or.ddit.vo.user.MemberVO;

@Service
public class ExamServiceImpl implements ExamService{

	@Inject
	private ExamDAOS dao;

	@Override
	public List<LecTestVO> retrieveExam(String lecCode) {
		return dao.selectExam(lecCode);
	}

	@Override
	public List<TestQuestionVO> retrieveQ(String ltCode) {
		return dao.selectQ(ltCode);
	}

	@Override
	public LecTestVO retrieveExamDetail(String ltCode) {
		return dao.selectExamDetail(ltCode);
	}

	@Override
	public List<String> retrieveA(String ltCode) {
		return dao.selectA(ltCode);
	}

	@Override
	public List<String> retrieveS(String ltCode) {
		return dao.selectS(ltCode);
	}

	@Override
	public String retrieveLHcode(RegistrationVO rInfo) {
		return dao.selectLHcode(rInfo);
	} 

	@Override
	public ServiceResult addNewGrade(TestGradeVO newInfo) {
		return dao.insertNewGrade(newInfo)>0?ServiceResult.OK : ServiceResult.FAIL;
	}

	
}
