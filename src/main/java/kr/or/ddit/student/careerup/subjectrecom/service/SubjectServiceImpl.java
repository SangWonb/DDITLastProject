package kr.or.ddit.student.careerup.subjectrecom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.student.careerup.subjectrecom.dao.SubjectRecomDAOS;
import kr.or.ddit.vo.careerup.SeniorCoworkerVO;
import kr.or.ddit.vo.careerup.SubjectRecomVO;
import kr.or.ddit.vo.cyber.SubjectVO;

@Service
public class SubjectServiceImpl implements SubjectRecomService {

	@Inject
	SubjectRecomDAOS dao;
	
	@Override
	public List<SeniorCoworkerVO> selectList() {
	    return dao.selectList(null);
	}
	@Override
	public SubjectRecomVO select(SubjectRecomVO condition) {
        
        return dao.recom(condition);
	}
		
	}


