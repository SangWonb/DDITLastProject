package kr.or.ddit.common.menu.restaurant.service;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;
import java.time.Year;

import org.apache.commons.lang3.StringUtils;
import org.junit.jupiter.api.Test;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import lombok.extern.slf4j.Slf4j;

@Slf4j
class RestaurantServiceImplTest {

	@Test
	void testDistinguishSex() {
		String substring = StringUtils.substring("4658593", 0, 1);
		log.info(substring);
		
		log.info(Integer.parseInt(substring)%2==0 ? "여자" : "남자");
		
		
		
	}

	@Test
	void testDistinguishAge() {
		
		String birYear2 = StringUtils.substring("400108", 0, 2);
		String generation = StringUtils.substring("2658593", 0, 1);
		
		int todayYear = Integer.parseInt(Year.now().toString());
		
		String birYear1 = "";
		
		switch (generation) {
		case "1":
		case "2":
			birYear1 = "19";
			break;
		case "3":
		case "4":
			birYear1 = "20";
			break;
		}
		
		int birYear = Integer.parseInt(birYear1 + birYear2);
		
		log.info("{}",todayYear);
		log.info("{}",birYear);
		log.info("{}",todayYear-birYear);
		
		int age1 = todayYear-birYear;
		String age2 = StringUtils.substring(Integer.toString(age1),0,1);
		String ageGroup = "";
		switch(age2) {
		
		case "1":
		case "2":
		case "3":
		case "4":
		case "5":
		case "6":
			ageGroup = age2;
			break;
		default :
			ageGroup = "6";
			break;
		}
		
		log.info(ageGroup);
		
		
	}

}
