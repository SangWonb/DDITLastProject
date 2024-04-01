package kr.or.ddit.common.menu.restaurantreview.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("common/menu/restaurantReviewInsert")
public class RestaurantReviewInsertControllerC {
	
	@GetMapping
	public String restaurantReviewInsert() {
		return "common/menu/restaurantreview/restaurantReviewForm";
	}

}
