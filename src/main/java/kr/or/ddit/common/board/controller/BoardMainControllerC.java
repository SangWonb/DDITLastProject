package kr.or.ddit.common.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common/board/boardMain")
public class BoardMainControllerC {

	@GetMapping
	public String boardMain() {
		return "tiles:common/board/boardMain";
	}
}
