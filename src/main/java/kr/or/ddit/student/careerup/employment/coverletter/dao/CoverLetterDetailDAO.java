package kr.or.ddit.student.careerup.employment.coverletter.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.careerup.CoverLetterDetailVO;
import kr.or.ddit.vo.careerup.CoverLetterVO;

@Mapper
public interface CoverLetterDetailDAO {
	
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
	 * 등록하기전 자기소개서 키 생성
	 * @param 
	 * @return
	 */
	public String selectCover();
	
	/**
	 * 자기소개서 등록
	 * @param cldNo
	 * @return
	 */
	public int insertCover(CoverLetterVO clNo);
	
	/**
	 * 자기소개서 상세등록
	 * @param cldNo
	 * @return
	 */
	public int insertCoverLetter(CoverLetterDetailVO cldNo);
	
	/**
	 * 자기소개서 수정
	 * @param cldNo
	 * @return
	 */
	public int updateCoverLetter(CoverLetterDetailVO cldNo);
	
	/**
	 * 자기소개서 상세 삭제
	 * @param clNo
	 * @return
	 */
	public int deleteCoverLetter(String clNo);
	
	/**
	 * 자기소개서 삭제
	 * @param clNo
	 * @return
	 */
	public int deleteCover(String clNo);
	
}
