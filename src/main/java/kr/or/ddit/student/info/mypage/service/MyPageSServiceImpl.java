package kr.or.ddit.student.info.mypage.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.info.mypage.dao.MyPageSDAO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.StudentVO;

@Service
public class MyPageSServiceImpl implements MyPageSService{

	@Inject
	MyPageSDAO dao;


	@Override
	public ServiceResult modifyMyInfo(MemberVO modInfo) {
		return dao.update(modInfo)>0? ServiceResult.OK : ServiceResult.FAIL;
	}


	@Override
	public StudentVO retrieveMyInfo(String memNo) {
		return dao.selectMyInfo(memNo);
	}

}
