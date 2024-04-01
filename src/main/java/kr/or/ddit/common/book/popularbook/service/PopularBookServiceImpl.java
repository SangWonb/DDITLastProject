package kr.or.ddit.common.book.popularbook.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.book.popularbook.dao.PopularBookDAOC;
import kr.or.ddit.vo.common.BookRentalVO;

@Service
public class PopularBookServiceImpl implements PopularBookService{
	
	@Inject
	PopularBookDAOC dao;
	
	public List<BookRentalVO> retrievePopBook() {
		
		return dao.selectPopBook();
		
	}
}
