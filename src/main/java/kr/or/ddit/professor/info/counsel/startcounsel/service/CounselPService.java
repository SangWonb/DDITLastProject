package kr.or.ddit.professor.info.counsel.startcounsel.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.info.CounselVO;
import kr.or.ddit.vo.user.StudentVO;

public interface CounselPService {
	
	/**
	 * @param pmemNo 교수번호로 상담 예정 또는 상담 완료인 상담목록 가져오기
	 * @return 
	 */
	public List<CounselVO> retrieveCounselList(String pmemNo);
	/**
	 * @param 상담상태를 상담완료로 바꾸기 위함.
	 * @return
	 */
	public ServiceResult modCounselDetail(String counsNo);
	
	/**
	 * @param memNo 상담을 신청한 학생의 정보를 확인하기 위함.
	 * @return
	 */
	public StudentVO retrieveStudent(String memNo);
	
	/**
	 * @param content 상담 일지 내용을 저장, 수정 하는 버튼
	 * @return
	 */
	public ServiceResult modCounselJournal(CounselVO content);
	
	/**
	 * @param couns 상담 총 건수와 대기 건수 조회 
	 * @return
	 */
	public CounselVO retrieveCount(CounselVO couns);
	
	
}
