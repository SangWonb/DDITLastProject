package kr.or.ddit.manager.com.restaurant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("manager/com/restaurant")
public class RestaurantRetrieveControllerM {
	
	@GetMapping
	public String restaurantList() {
		return "tiles:manager/com/restaurant/restaurantList";
	}
	
	@GetMapping("{restaurantEnrollno}")
	public String restaurantView(@PathVariable String restaurantEnrollno) {
		return "manager/com/restaurant/restaurantView";
	}
	
	
}
