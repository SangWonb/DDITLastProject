package kr.or.ddit.manager.stats.book.service;

import java.util.List;

import kr.or.ddit.vo.common.BookRentalVO;

public interface BookStatsService {
    
    // 월별 도서 대여 통계 조회
	public List<BookRentalVO> getMonthlyBookStats();
	
	// 전년도 도서 대여 통계 조회
	public List<BookRentalVO> getLastYearBookStats();
	
	// 지난달 가장 인기 있는 도서 조회
	public List<BookRentalVO> getMostPopularBooksLastMonth();
	
	// 지난달 가장 인기 있는 분야 조회
	public List<BookRentalVO> getMostPopularCategoryLastMonth();
}
