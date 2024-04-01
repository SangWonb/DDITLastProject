package kr.or.ddit.common.menu.restaurant.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("common/menu/restaurantRecom")
public class RestaurantRecomC {
	
	@GetMapping
	public String restaurantRecom() {
		return "common/menu/restaurant/restaurantRecom";
	}

}
