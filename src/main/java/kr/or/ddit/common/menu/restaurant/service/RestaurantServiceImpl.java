package kr.or.ddit.common.menu.restaurant.service;

import java.time.Year;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.ddit.common.menu.restaurant.dao.RestaurantDAOC;
import kr.or.ddit.common.menu.restaurant.dao.RestaurantRecomDAOC;
import kr.or.ddit.common.menu.restaurant.dao.RestaurantReviewDAOC;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.RestaurantRecomVO;
import kr.or.ddit.vo.common.RestaurantReviewVO;
import kr.or.ddit.vo.common.RestaurantVO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.MemberVOWrapper;

@Service
public class RestaurantServiceImpl implements RestaurantService {
	
	@Inject
	private RestaurantDAOC resDao;
	@Inject
	private RestaurantReviewDAOC rvDao;
	@Inject
	private RestaurantRecomDAOC rcDao;
	
	@Override
	public List<RestaurantVO> retrieveRestaurantList(PaginationInfo paging) {
		
		int totalRecord = resDao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return resDao.selectRestaurantList(paging);
		
	}

	@Override
	public RestaurantVO retrieveRestaurant(String appNo) {
		
		return resDao.selectRestaurant(appNo);
	
	}

	@Override
	public ServiceResult createRestaurant(RestaurantVO rest) {
		
		return resDao.insertRestaurant(rest) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	
	}

	@Override
	public ServiceResult createRestaurantReview(RestaurantReviewVO restRv) {
		
		ServiceResult result = rvDao.insertRestaurantReview(restRv) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		
		if(result == ServiceResult.OK) {
			if(restRv.getReviewPrefer().equals("L")) resDao.restaurantLike(restRv.getResAppno());
			if(restRv.getReviewPrefer().equals("H")) resDao.restaurantHate(restRv.getResAppno());
		}
		
		return result;

	}

	@Override
	public RestaurantRecomVO restaurantRecom(RestaurantRecomVO resRecom) {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		MemberVOWrapper principal = (MemberVOWrapper)authentication.getPrincipal();
		MemberVO realUser = principal.getRealUser();
		
		String age = distinguishAge(realUser.getMemReg1(), realUser.getMemReg2());
		String sex = distinguishSex(realUser.getMemReg2());
		
		resRecom.setResAge(age);
		resRecom.setResSex(sex);
		
		return rcDao.selectRestaurantRecom(resRecom);
	}

	public String distinguishSex(String memReg2) {
		String substring = StringUtils.substring(memReg2, 0, 1);
		return Integer.parseInt(substring)%2==0 ? "여자" : "남자";
	}

	public String distinguishAge(String memReg1, String memReg2) {
		
		String birYear2 = StringUtils.substring(memReg1, 0, 2);
		String generation = StringUtils.substring(memReg2, 0, 1);
		
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
		
		return ageGroup;
	}

}
