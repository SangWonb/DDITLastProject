package kr.or.ddit.common.menu.restaurant.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.RestaurantRecomVO;
import kr.or.ddit.vo.common.RestaurantReviewVO;
import kr.or.ddit.vo.common.RestaurantVO;

public interface RestaurantService {
	
	//식당 목록조회 + 신청 승인
	public List<RestaurantVO> retrieveRestaurantList(PaginationInfo paging);
	
	//식당 단건조회 + 식당 리뷰 목록
	public RestaurantVO retrieveRestaurant(String appNo);
	
	//식당 신청 + 등록
	/**
	 * @param rest
	 * @return FAIL / OK
	 */
	public ServiceResult createRestaurant(RestaurantVO rest);
	
	//식당 리뷰 작성 + 등록
	public ServiceResult createRestaurantReview(RestaurantReviewVO restRv);
	
	//식당 추천 입력 후 조회
	public RestaurantRecomVO restaurantRecom(RestaurantRecomVO resRecom);
	
}
