package kr.or.ddit.manager.stu.criteria.attendancecriteria.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.info.AttendCriteriaVO;

public interface AttendCriteriaService {
	
	/**
	 * 출결 기준 등록 조회
	 * @return
	 */
	public List<AttendCriteriaVO> retrieveAttendCriteria();
	
	/**
	 * 출결 기준 등록 수정
	 * @param atc
	 * @return
	 */
	public ServiceResult modifyAttendCriteria(List<AttendCriteriaVO> atcList);
}
