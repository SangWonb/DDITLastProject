package kr.or.ddit.manager.stu.criteria.attendancecriteria.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.manager.stu.criteria.attendancecriteria.dao.AttendCriteriaDAO;
import kr.or.ddit.vo.info.AttendCriteriaVO;

@Service
public class AttendCriteriaServiceImpl implements AttendCriteriaService {
	
	@Inject
	AttendCriteriaDAO dao;
	
	@Override
	public List<AttendCriteriaVO> retrieveAttendCriteria() {
		return dao.selectAttendCriteria();
	}

	@Override
	public ServiceResult modifyAttendCriteria(List<AttendCriteriaVO> atcList) {
		
		for(AttendCriteriaVO atc:atcList) {
			if(dao.updateAttendCriteria(atc) < 1)return ServiceResult.FAIL;
		}
		return ServiceResult.OK;
	}

}
