package kr.or.ddit.manager.stu.scholarship.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.manager.stu.scholarship.dao.ScholarshipDAOM;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.info.ScholashipVO;

@Service
public class ScholarshipServiceImplM implements ScholarshipServiceM {
	
	@Inject
	ScholarshipDAOM dao;

	@Override
	public List<ScholashipVO> retrieveScholarshipNoticeList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectList(paging);
	}
	@Override
	public ScholashipVO retrieveScholarshipNotice(String scholCode) {
		ScholashipVO vo = dao.select(scholCode);
		if(vo == null) {
			throw new PKNotFoundException(scholCode+"장학금이 존재하지 않음");
		}
		return vo;
	}

	@Override
	public ServiceResult modifyScholarshipNotice(ScholashipVO vo) {
		ServiceResult result = null;
		result = dao.update(vo) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public ServiceResult createScholarshipNotice(ScholashipVO vo) {
		ServiceResult result = null;
		result = dao.insert(vo) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public ServiceResult removeScholarshipNotice(String scholCode) {
		ServiceResult result = null;
		result = dao.delete(scholCode) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}
}