package kr.or.ddit.student.cyber.exam.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.cyber.LecTestVO;
import kr.or.ddit.vo.cyber.RegistrationVO;
import kr.or.ddit.vo.cyber.TestGradeVO;
import kr.or.ddit.vo.cyber.TestQuestionVO;

public interface ExamService {
	public List<LecTestVO> retrieveExam(String lecCode);
	public LecTestVO retrieveExamDetail(String ltCode);
	public List<TestQuestionVO> retrieveQ(String ltCode);
	public List<String> retrieveA(String ltCode);
	public List<String> retrieveS(String ltCode);
	public String retrieveLHcode(RegistrationVO rInfo);
	public ServiceResult addNewGrade(TestGradeVO newInfo);
}
