package kr.or.ddit.manager.com.restaurant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("manager/com/restaurantAppl")
public class RestaurantApplRetrieveControllerM {
	
	@GetMapping
	public String restaurantApplList() {
		return "manager/com/restaurant/restaurantApplList";
	}
	
	@GetMapping("{restaurantEnrollno}")
	public String restaurantApplView(@PathVariable String restaurantEnrollno) {
		return "manager/com/restaurant/restaurantApplView";
	}
	
	
}
