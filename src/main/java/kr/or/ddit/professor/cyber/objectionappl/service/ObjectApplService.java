package kr.or.ddit.professor.cyber.objectionappl.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.cyber.ComplaintVO;

public interface ObjectApplService {
	
	/**
	 * 교수 이의신청 목록 조회 
	 * @param lecCode
	 * @param paging
	 * @return
	 */
	public List<ComplaintVO> retrieveComListP(String lecCode, PaginationInfo paging);
	/**
	 * 학생 이의신청 목록 조회
	 * @param lecCode
	 * @param smemNo
	 * @return
	 */
	public List<ComplaintVO> retrieveComListS(String lecCode, String smemNo);
	/**
	 * 이의신청 상세조회
	 * @param com
	 * @return
	 */
	public ComplaintVO retrieveCom(String cptNo);
	/**
	 * 이의신청 신청(학생)
	 * @param com
	 * @return
	 */
	public ServiceResult createCom(ComplaintVO com);
	/**
	 * 이의신청 수정(교수) 승인/반려
	 * @param com
	 * @return
	 */
	public ServiceResult modifyCom(ComplaintVO com);
	/**
	 * 이의신청 삭제(학생)
	 * @param com
	 * @return
	 */
	public ServiceResult removeCom(String cptNo);
	
	/**
	 * 강의평가 기간 여부 확인
	 * @return
	 */
	public boolean objectApplSeason();
	
}
