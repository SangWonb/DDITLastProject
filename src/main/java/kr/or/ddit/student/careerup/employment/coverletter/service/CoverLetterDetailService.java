package kr.or.ddit.student.careerup.employment.coverletter.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.careerup.CoverLetterDetailVO;
import kr.or.ddit.vo.careerup.CoverLetterVO;
import kr.or.ddit.vo.user.StudentVO;

public interface CoverLetterDetailService {

	/**
	 * 자기소개서 조회
	 * @return
	 */
	public List<CoverLetterVO> selectList(String smemNo);
	
	/**
	 * 자기소개서 상세조회
	 * @param cldNo
	 * @return
	 */
	public List<CoverLetterDetailVO> selectDetail(String clNo);

	/**
	 * 자기소개서 등록
	 * @param cldNo
	 * @return
	 */
	public ServiceResult insertCoverResult(CoverLetterDetailVO cldNo);
	
	/**
	 * 자기소개서 상세등록
	 * @param formDataArray
	 * @param stu
	 * @return
	 */
	public ServiceResult insertCoverResult(CoverLetterDetailVO[] formDataArray, StudentVO stu);

	/**
	 * 자기소개서 수정
	 * @param cldNo
	 * @return
	 */
	public ServiceResult updateCoverLetter(CoverLetterDetailVO cldNo);
	
	/**
	 * 자기소개서 상세 삭제
	 * @param cldNo
	 * @return
	 */
	public ServiceResult deleteCoverLetter(String clNo);
	
	/**
	 * 자기소개서 삭제
	 * @param clNo
	 * @return
	 */
	public ServiceResult deleteCover(String clNo);

}
