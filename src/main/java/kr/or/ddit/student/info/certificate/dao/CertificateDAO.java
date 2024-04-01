package kr.or.ddit.student.info.certificate.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.info.CertificateGnoVO;
import kr.or.ddit.vo.info.CertificateRecVO;
import kr.or.ddit.vo.info.CertificateVO;
import kr.or.ddit.vo.user.ProfessorVO;
import kr.or.ddit.vo.user.StudentVO;

@Mapper
public interface CertificateDAO {
	/**
	 * 증명서목록조회
	 * @return
	 */
	public List<CertificateVO> selectCrtfList();
	
	/**
	 * 증명서신청 넣기
	 * @param newRec
	 * @return
	 */
	public int insertCrtfRec(CertificateRecVO newRec);
	
	/**
	 * 사용자 학번을 기준으로 인증서 발급 목록 조회
	 * @param memNo
	 * @return
	 */
	public List<CertificateRecVO> selectCertifiRecList(String memNo);
	
	/**
	 * 증명서양식에 넣는 데이터 조회
	 * @param smemNo
	 * @return
	 */
	public List<StudentVO> selectRecord(String smemNo);
	
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
	public List<CertificateGnoVO> selectGno(CertificateGnoVO cerVo);
}
