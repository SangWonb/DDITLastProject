package kr.or.ddit.student.cyber.exam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.cyber.LecTestVO;
import kr.or.ddit.vo.cyber.RegistrationVO;
import kr.or.ddit.vo.cyber.TestGradeVO;
import kr.or.ddit.vo.cyber.TestQuestionVO;
import kr.or.ddit.vo.user.MemberVO;

@Mapper
public interface ExamDAOS {
	//얼굴인식 활용 임시샘플
	public List<LecTestVO> selectExam(String lecCode);
	public LecTestVO selectExamDetail(String ltCode);
	public List<TestQuestionVO> selectQ(String ltCode);
	public List<String> selectA(String ltCode);
	public List<String> selectS(String ltCode);
	public String selectLHcode(RegistrationVO rInfo);
	public int insertNewGrade(TestGradeVO newInfo);
	
}
