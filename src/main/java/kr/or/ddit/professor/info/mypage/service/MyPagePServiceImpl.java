package kr.or.ddit.professor.info.mypage.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.info.mypage.dao.MyPagePDAO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.ProfessorVO;

@Service
public class MyPagePServiceImpl implements MyPagePService{

	@Inject
	MyPagePDAO dao;
	
	@Override
	public ServiceResult modifyMyInfo(MemberVO modInfo) {
		return dao.update(modInfo)>0? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ProfessorVO retrieveMyInfo(String memNo) {
		return dao.selectMyInfo(memNo);
	}

}
