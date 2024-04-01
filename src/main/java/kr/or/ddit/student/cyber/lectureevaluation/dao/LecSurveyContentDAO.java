package kr.or.ddit.student.cyber.lectureevaluation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.cyber.LecSurveyContentVO;

@Mapper
public interface LecSurveyContentDAO {
	
	public List<LecSurveyContentVO> selectLSCList();
	
}
