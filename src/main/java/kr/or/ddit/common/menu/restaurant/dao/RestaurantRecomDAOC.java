package kr.or.ddit.common.menu.restaurant.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.common.RestaurantRecomVO;

@Mapper
public interface RestaurantRecomDAOC {
	
	//조회 >> 추천
	public RestaurantRecomVO selectRestaurantRecom(RestaurantRecomVO resRecom);
}
