package kr.or.ddit.manager.stats.book.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.manager.stats.book.service.BookStatsService;
import kr.or.ddit.vo.common.BookRentalVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/manager/state/book/")
public class BookStatsController {
    
    @Inject
    private BookStatsService service;
    
    @GetMapping("bookStats")
    public String bookStatsUI(Model model) {
        // 월별 도서 통계 조회
    	List<BookRentalVO> monthlyStats = service.getMonthlyBookStats();
        model.addAttribute("monthlyStats", monthlyStats);
        
        // 작년 도서 통계 조회
        List<BookRentalVO> lastYearStats = service.getLastYearBookStats();
        model.addAttribute("lastYearStats", lastYearStats);
        
        // 지난 달 가장 인기 있는 도서 조회
        List<BookRentalVO> mostPopularBooksLastMonth = service.getMostPopularBooksLastMonth();
        model.addAttribute("mostPopularBooksLastMonth", mostPopularBooksLastMonth);
        
        // 지난 달 가장 인기 있는 도서 카테고리 조회
        List<BookRentalVO> mostPopularCategoryLastMonth = service.getMostPopularCategoryLastMonth();
        model.addAttribute("mostPopularCategoryLastMonth", mostPopularCategoryLastMonth);
        
        model.addAttribute("contentTitle", "도서통계조회");
        return "tiles:manager/state/book/bookStats";
    }
}
