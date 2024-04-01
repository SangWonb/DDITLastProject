package kr.or.ddit.common.menu.restaurant.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.time.LocalDate;
import java.time.Month;
import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;
import org.mybatis.spring.batch.MyBatisPagingItemReader;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.RestaurantVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/conf/*-context.xml")
class RestaurantDAOCTest {
	
	@Inject
	RestaurantDAOC dao;
	
	@Test
	void testSelectRestaurantList() {
		PaginationInfo paging = new PaginationInfo(10,5);
		paging.setCurrentPage(1);
		List<RestaurantVO> list = dao.selectRestaurantList(paging);
		log.info("\n\n\n{}\n\n\n",list);
	}

	@Test
	void testSelectTotalRecord() {
		PaginationInfo paging = new PaginationInfo(10,5);
		paging.setCurrentPage(1);
		int cnt = dao.selectTotalRecord(paging);
		log.info("\n\n\n{}\n\n\n",cnt);
	}

	@Test
	void testSelectRestaurant() {
		RestaurantVO vo = dao.selectRestaurant("RES00001");
		log.info("\n\n\n{}\n\n\n",vo);
	}

	@Test
	void testInsertRestaurant() {
		RestaurantVO vo = new RestaurantVO();
		vo.setResCode("K");
		vo.setResName("집가고싶다");
		vo.setResLocation("원신흥동 123-4");
		vo.setResTel("042-4959-6487");
		
		int cnt = dao.insertRestaurant(vo);
		
		log.info("\n\n\n{}\n\n\n",cnt);
	}
	
	@Test
	void testToday() {
		
		int year = LocalDate.now().getYear();
		log.info("{}",year);
		
		int month = LocalDate.now().getMonthValue();
		log.info("{}",month);
		
	}

}
