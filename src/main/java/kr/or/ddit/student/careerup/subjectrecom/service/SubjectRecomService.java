package kr.or.ddit.student.careerup.subjectrecom.service;

import java.util.List;

import kr.or.ddit.vo.careerup.SeniorCoworkerVO;
import kr.or.ddit.vo.careerup.SubjectRecomVO;
import kr.or.ddit.vo.cyber.SubjectVO;

public interface SubjectRecomService {

	public List<SeniorCoworkerVO> selectList();
	
	public SubjectRecomVO select(SubjectRecomVO condition);
	
}
