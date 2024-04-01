package kr.or.ddit.student.info.mypage.service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.StudentVO;

public interface MyPageSService {

	/**
	 * @param memberVO
	 * @return 수정상태에 따라 ok,fail 
	 */
	public ServiceResult modifyMyInfo(MemberVO memberVO);
	
	/**
	 * @param memNo
	 * @return 나의 정보 조회(학적+개인정보+사진)
	 */
	public StudentVO retrieveMyInfo(String memNo);
	
	}
