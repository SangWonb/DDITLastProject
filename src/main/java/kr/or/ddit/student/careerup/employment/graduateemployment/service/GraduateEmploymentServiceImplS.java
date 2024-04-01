package kr.or.ddit.student.careerup.employment.graduateemployment.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.student.careerup.employment.graduateemployment.dao.GraduateEmploymentDAOS;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.careerup.SeniorCoworkerVO;

@Service
public class GraduateEmploymentServiceImplS implements GraduateEmploymentServiceS {
	
	@Inject
	GraduateEmploymentDAOS dao;
	
	@Override
	public List<SeniorCoworkerVO> retrieveGraduateEmploymentList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectList(paging);
	}

	@Override
	public SeniorCoworkerVO retrieveGraduateEmployment(String srNo) {
		SeniorCoworkerVO mentor = dao.select(srNo);
		if(mentor == null) {
			throw new PKNotFoundException(srNo+"선배취업처가 존재하지 않음");
		}
		return mentor;
	}
}
