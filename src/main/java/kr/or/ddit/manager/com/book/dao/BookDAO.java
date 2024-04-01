package kr.or.ddit.manager.com.book.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.BookVO;

/**
 * 도서등록(교직원)
 */
@Mapper
public interface BookDAO {
	
	/**
	 * 등록 신규 등록
	 * @param book
	 * @return 등록 성공시 > 0
	 */
	public int insertBook(BookVO book);
	/**
	 * totalRecord/totalPage 를 결정하기 위한 쿼리
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);
	/**
	 * 페이징 처리 결과 데이터 목록 조회
	 * @param paging
	 * @return
	 */
	public List<BookVO> selectBookList(PaginationInfo paging);
	
	/**
	 * 도서 상세 조회, 책제목과 저자를 조회
	 * @param bookCode
	 * @return
	 */
	public BookVO selectBook(String bookCode);
	
	/**
	 * 도서 수정
	 * @param book
	 * @return
	 */
	public int updateBook(BookVO book);
	
	/**
	 * 도서 삭제
	 * @param book
	 * @return
	 */
	public int deleteBook(String bookCode);
}
