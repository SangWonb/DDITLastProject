package kr.or.ddit.manager.com.book.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.BookVO;

/**
 * 도서등록(교직원)
 */
public interface BookService {

	/**
	 * 도서 등록
	 * @param book
	 * @return OK, FAIL
	 */
	public ServiceResult createBook(BookVO book);
	
	/**
	 * 페이징과 상제 검색 서비스를 지원하는 도서 목록 조회
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
	
	/**
	 * 도서 수정
	 * @param book
	 * @return
	 */
	public ServiceResult modifyBook(BookVO book); 
	
	/**
	 * 도서 삭제
	 * @param book
	 * @return
	 */
	public ServiceResult removeBook(BookVO delData); 

}
