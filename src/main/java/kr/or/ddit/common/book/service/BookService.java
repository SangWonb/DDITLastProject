package kr.or.ddit.common.book.service;

import java.util.List;

import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.BookRecomVO;
import kr.or.ddit.vo.common.BookVO;

public interface BookService {
	
	//추번버튼 클릭 후 조회
	public BookRecomVO selectBookRecom(BookRecomVO bookRecom);
	
	/**
	 * 페이징과 상세 검색 도서 목록 조회
	 * @param paging
	 * @return
	 */
	public List<BookVO> retrieveBookList(PaginationInfo paging);
	
	/**
	 * 도서 상세 조회
	 * @param bookCode
	 * @return
	 */
	public BookVO retrieveBook(String bookCode);
	
}
