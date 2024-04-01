package kr.or.ddit.common.book.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.BookVO;

@Mapper
public interface BookDAOC {
	
	/**
	 * totalRecord/totalPage 를 결정하기 위한 쿼리
	 * @param paging
	 * @return
	 */
	public int selectTotalRecord(PaginationInfo paging);
	
	/**
	 * 도서 전체 목록조회
	 * @return
	 */
	public List<BookVO> selectBookList(PaginationInfo paging);
	
	/**
	 * 도서 상세조회
	 * @param bookCode
	 * @return
	 */
	public BookVO selectBook(String bookCode);
	
}