package kr.or.ddit.common.book.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.common.book.service.BookService;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.vo.common.BookVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/common/book/")
public class BookList {
    
	@Inject
	private BookService service;
	
	@ModelAttribute("book")
    public BookVO book() {
    	return new BookVO();
    }
	
    @GetMapping("bookAiList")
    public String BookAiList() {
        return "common/book/bookAiList";
    }
    
    @GetMapping("bookList")
    public String bookAllList(Model model) {
    	return "common/book/bookList";
    }
    
    @GetMapping(value = "jsonbookList", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Model BookListData(
    	@RequestParam Map<String, Object> detailCondition
    	, @RequestParam(name="page", required = false, defaultValue = "1") int currentPage
        , Model model
    ){
    	PaginationInfo paging = new PaginationInfo(5,3);
    	paging.setCurrentPage(currentPage);
    	paging.setDetailCondition(detailCondition);
    	
        log.info("detailCondition : {}", detailCondition);    
    	List<BookVO> bookList = service.retrieveBookList(paging);
    	log.info("bookList : {}", bookList);
    	PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#searchForm");	
    	String pagingHTML = renderer.renderPagination(paging);
    	
        model.addAttribute("bookList",bookList);
        model.addAttribute("pagingHTML",pagingHTML);
        model.addAttribute("condition",detailCondition);
        log.info("model : {}", model);
        log.info("bookList : {}", bookList);
        
    	return model;
    }
    
    @GetMapping("bookView/{bookCode}")
    public String bookDetail(@PathVariable String bookCode, Model model){
    	
    	BookVO book = service.retrieveBook(bookCode);
    	model.addAttribute("book",book);
    	return "common/book/bookView";
    }
    
}