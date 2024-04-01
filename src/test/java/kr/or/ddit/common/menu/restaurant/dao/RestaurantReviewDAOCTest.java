package kr.or.ddit.common.menu.restaurant.dao;

import static org.junit.jupiter.api.Assertions.*;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.vo.common.RestaurantReviewVO;
import lombok.extern.slf4j.Slf4j;

@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/conf/*-context.xml")
@Slf4j
class RestaurantReviewDAOCTest {
	
	@Inject
	RestaurantReviewDAOC dao;
	
	@Test
	void testInsertRestaurantReview() {
		RestaurantReviewVO vo = new RestaurantReviewVO();
		vo.setResAppno("RES00012");
		vo.setMemNo("201099001");
		vo.setReviewPrefer("L");
		vo.setReviewReply("나쁘지 않네");
		
		int cnt = dao.insertRestaurantReview(vo);
		
		log.info("\n\n\n{}\n\n\n",cnt);
	}

}
