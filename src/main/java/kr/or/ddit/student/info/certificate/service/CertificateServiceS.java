package kr.or.ddit.student.info.certificate.service;

import java.util.List;


import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.info.CertificateGnoVO;
import kr.or.ddit.vo.info.CertificateRecVO;
import kr.or.ddit.vo.info.CertificateVO;
import kr.or.ddit.vo.user.ProfessorVO;
import kr.or.ddit.vo.user.StudentVO;

public interface CertificateServiceS {
	public List<CertificateVO> selectCrtfList();
	/**
	 * @param newRec 
	 * 증명서 발급 신청하기를 누르고 결제했을 떄 작동하는 메소드
	 * crtf_recno은 기준에 맞춰 xml에서 셀렉트 키로 생성.
	 */
	public ServiceResult insertCrtfRec(CertificateRecVO newRec);
	
	/**
	 * 증명서양식에 넣는 데이터 조회
	 * @param smemNo
	 * @return
	 */
	public List<StudentVO> selectRecord(String smemNo);
	
	/**
	 * 사용자 학번을 기준으로 인증서 발급 목록 조회
	 * @param memNo
	 * @return
	 */
	public List<CertificateRecVO> selectCertifiRecList(String memNo);
	
	/**
	 * 증명서발급번호
	 * @param newGno
	 * @return
	 */
	public ServiceResult insertCrtfGno(String recNo);
	
	/**
	 * 인쇄매수, 잔여매수 업데이트
	 * @param recNoCnt
	 * @return
	 */
	public ServiceResult updateCrtfRec(String recNoCnt);
	
	/**
	 * 발급번호 조회(증명서양식에 넣기)
	 * @param crtfRecno
	 * @return
	 */
	public List<CertificateGnoVO> selectGno(CertificateGnoVO cerVo);
}
