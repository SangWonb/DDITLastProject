package kr.or.ddit.manager.com.book.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.manager.com.book.dao.BookDAO;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.BookVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BookServiceImplM implements BookService {
	
	private final BookDAO dao;

	@Override
	public ServiceResult createBook(BookVO book) {
		ServiceResult result = dao.insertBook(book) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public List<BookVO> retrieveBookList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectBookList(paging);
	}

	@Override
	public BookVO retrieveBook(String bookCode) {
		BookVO book = dao.selectBook(bookCode);
		if(book==null)
			throw new PKNotFoundException(String.format("%s 에 해당하는 도서 없음.", bookCode));
		return book;
	}

	@Override
	public ServiceResult modifyBook(BookVO book) {
		ServiceResult result = dao.updateBook(book) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}
	
	@Override
	public ServiceResult removeBook(BookVO delData) {
	    ServiceResult result = null;
	    
	    try {
	        int rowsAffected = dao.deleteBook(delData.getBookCode());
	        if (rowsAffected > 0) {
	            result = ServiceResult.OK;
	        } else {
	            result = ServiceResult.FAIL;
	        }
	    } catch (Exception e) {
	        result = ServiceResult.FAIL;
	        e.printStackTrace();
	    }
	    return result;
	}
	
}
