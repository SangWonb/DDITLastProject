package kr.or.ddit.manager.com.book.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.manager.com.book.service.BookService;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.common.BookVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/manager/com/book/")
public class BookRegistrationController {
    
    @Inject
    private BookService service;
    
    @ModelAttribute("book")
    public BookVO book() {
    	return new BookVO();
    }
    
    @GetMapping("bookList")
    public String bookListUI(Model model) {
        model.addAttribute("contentTitle", "도서등록목록");
        return "tiles:manager/com/book/bookList";
    }
    
    @GetMapping(value = "jsonbookList", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Model bookListData(
        @RequestParam(name="page", required = false, defaultValue = "1") int currentPage
        , Model model
    ){
        PaginationInfo paging = new PaginationInfo(5,3);
        paging.setCurrentPage(currentPage);
        log.info("paging : {}", paging);                   
        log.info("currentPage : {}", currentPage);                   
        List<BookVO> bookList = service.retrieveBookList(paging);
        log.info("bookList : {}", bookList);                   
        PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#searchForm"); 
        String pagingHTML = renderer.renderPagination(paging);
        
        model.addAttribute("bookList", bookList);
        model.addAttribute("pagingHTML", pagingHTML);
        return model;
    }
    
    @GetMapping("bookView/{bookCode}")
    public String bookDetail(@PathVariable String bookCode, Model model) {
    	
        BookVO book = service.retrieveBook(bookCode); 
        model.addAttribute("book", book);
        return "manager/com/book/bookView";
        
    }

    @PostMapping("/bookList") // 해당 URL에 대한 POST 요청 처리
    public String insertBook(
            @Validated(value = {InsertGroup.class}) // InsertGroup 및 기본 그룹을 사용하여 유효성 검사 수행
            @ModelAttribute("book") BookVO book
            , BindingResult errors
            , Model model
    ) {
        String logicalViewName = null;
        if (!errors.hasErrors() || (errors.hasFieldErrors("bookCode") && book.getBookCode() == null)) { // bookCode가 null이 아닌 경우에만 @NotBlank 유효성 검사 수행
            ServiceResult result = service.createBook(book);
            String message = null;
            switch (result) {
                case OK:
                    logicalViewName = "redirect:/manager/com/book/bookList";
                    break;
                default:
                    logicalViewName = "redirect:/manager/com/book/bookList";
                    break;
            }
            model.addAttribute("message", message);
        } else {
            logicalViewName = "redirect:/manager/com/book/bookList";
        }
        return logicalViewName;
    }

    @PostMapping("deleteBook")
    public String deleteBook(@RequestParam String bookCode) {
        BookVO delData = new BookVO();
        log.info("bookCode : {}",bookCode);
        delData.setBookCode(bookCode);
        ServiceResult result = service.removeBook(delData);
        String logicalViewName = null;
        switch (result) {
            case OK:
                logicalViewName = "redirect:/manager/com/book/bookList";
                break;
            case FAIL:
                logicalViewName = "redirect:/manager/com/book/bookList";
                break;
            default:
                break;
        }
        return logicalViewName;
    }
    
    @PostMapping("updateBook")
    public String updateBoook(
    	@Validated(UpdateGroup.class) @ModelAttribute("book") BookVO book
    	, BindingResult errors
    	, Model model
    	, RedirectAttributes redirectAttributes
    ){
    	String logicalViewName = null;
    	if(!errors.hasErrors()) {
    		ServiceResult result = service.modifyBook(book);
    		switch (result) {
    		case OK:
                logicalViewName = "redirect:/manager/com/book/bookList";
                break;
            case FAIL:
                logicalViewName = "redirect:/manager/com/book/bookList";
                break;
            default:
                break;
    			
    		}
    	}
    	return logicalViewName;
    }
    
}