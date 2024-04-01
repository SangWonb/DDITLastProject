package kr.or.ddit.manager.stats.book.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.manager.stats.book.dao.BookStatsDAO;
import kr.or.ddit.vo.common.BookRentalVO;

@Service
public class BookStatsServiceImpl implements BookStatsService {
    
    @Inject
    private BookStatsDAO dao;

    @Override
    public List<BookRentalVO> getMonthlyBookStats() {
        return dao.selectMonthlyBookStats();
    }

    @Override
    public List<BookRentalVO> getLastYearBookStats() {
        return dao.selectLastYearBookStats();
    }

    @Override
    public List<BookRentalVO> getMostPopularBooksLastMonth() {
        return dao.selectMostPopularBooksLastMonth();
    }

    @Override
    public List<BookRentalVO> getMostPopularCategoryLastMonth() {
        return dao.selectMostPopularCategoryLastMonth();
    }
}