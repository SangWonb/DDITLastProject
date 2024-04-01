package kr.or.ddit.professor.info.certificate.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.info.CertificateGnoPVO;
import kr.or.ddit.vo.info.CertificateGnoVO;
import kr.or.ddit.vo.info.CertificatePVO;
import kr.or.ddit.vo.info.CertificateRecPVO;
import kr.or.ddit.vo.info.CertificateVO;
import kr.or.ddit.vo.user.ProfessorVO;

@Mapper
public interface CertificateDAOP {
	/**
	 * 증명서목록조회
	 * @return
	 */
	public List<CertificatePVO> selectCrtfList();
	
	/**
	 * 증명서신청 넣기
	 * @param newRec
	 * @return
	 */
	public int insertCrtfRec(CertificateRecPVO newRec);
	
	/**
	 * 사용자 학번을 기준으로 인증서 발급 목록 조회
	 * @param memNo
	 * @return
	 */
	public List<CertificateRecPVO> selectCertifiRecList(String memNo);
	
	/**
	 * 증명서양식에 넣는 데이터 조회(재직증명서)
	 * @param pmemNo
	 * @return
	 */
	public ProfessorVO selectRecord(String pmemNo);
	
	/**
	 * 증명서발급번호
	 * @param newGno
	 * @return
	 */
	public int insertCrtfGno(String recNo);
	
	/**
	 * 인쇄매수,잔여매수 업데이트
	 * @param recNo
	 * @return
	 */
	public int updateCrtfRec(String recNoCnt);
	
	/**
	 * 발급번호 조회(증명서양식에 넣기)
	 * @param crtfRecno
	 * @return
	 */
	public List<CertificateGnoPVO> selectGno(CertificateGnoPVO cerVo);
}
