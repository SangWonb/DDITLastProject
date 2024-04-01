package kr.or.ddit.manager.stats.book.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.common.BookRentalVO;

@Mapper
public interface BookStatsDAO {
    // 월별 도서 대여 통계 조회
    public List<BookRentalVO> selectMonthlyBookStats();

    // 전년도 도서 대여 통계 조회
    public List<BookRentalVO> selectLastYearBookStats();

    // 지난달 가장 인기 있는 도서 조회
    public List<BookRentalVO> selectMostPopularBooksLastMonth();

    // 지난달 가장 인기 있는 분야 조회
    public List<BookRentalVO> selectMostPopularCategoryLastMonth();
}