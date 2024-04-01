package kr.or.ddit.common.menu.restaurant.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.RestaurantVO;


/**
 * 식당관리
 *
 */
@Mapper
public interface RestaurantDAOC {
	
	//목록조회 + 신청에서 승인된것만
	public List<RestaurantVO> selectRestaurantList(PaginationInfo paging);
	
	//총페이지수
	public int selectTotalRecord(PaginationInfo paging);
	
	//단건조회 + 리뷰 목록
	public RestaurantVO selectRestaurant(String appNo);
	
	//식당신청 + 등록
	public int insertRestaurant(RestaurantVO rest);
	
	//식당의 좋아요수 증가
	public int restaurantLike(String appNo);
	
	//식당의 싫어요수 증가
	public int restaurantHate(String appNo);

}
