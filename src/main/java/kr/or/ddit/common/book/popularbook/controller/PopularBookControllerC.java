package kr.or.ddit.common.book.popularbook.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.common.book.popularbook.service.PopularBookService;
import kr.or.ddit.vo.common.BookRentalVO;

@Controller
@RequestMapping("/common/book/popularbook/")
public class PopularBookControllerC {
	
	@Inject
	private PopularBookService service;
	
	@GetMapping("popBook")
    public String PopBook(
    	Model model	
    ) {
		List<BookRentalVO> popBook = service.retrievePopBook();
    	
    	model.addAttribute("popBook",popBook);
    	
    	return "tiles:common/book/popularbook/popBook";
    }
	
}
