package kr.or.ddit.common.menu.restaurantreview.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("common/menu/restaurantReivew")
public class RestaurantReviewRetrieveControllerC {
	
	//식당 목록
	@GetMapping
	public String restaurantReviewList() {
		return "common/menu/restaurantreview/restaurantReviewList";
	}
	
	//식당 상세조회 - 식당 리뷰 
	@GetMapping("{restaurantEnrollno}")
	public String restaurantReviewView(@PathVariable String restaurantEnrollno) {
		return "common/menu/restaurantreview/restaurantReviewView";
	}

}
