package kr.or.ddit.common.menu.restaurant.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.common.RestaurantReviewVO;

@Mapper
public interface RestaurantReviewDAOC {
	
	//식당리뷰작성 + 등록
	public int insertRestaurantReview(RestaurantReviewVO restRv);

}
