package kr.or.ddit.common.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.dao.PortletDAOCC;
import kr.or.ddit.vo.common.PortletVO;
import kr.or.ddit.vo.user.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PortletServiceImplC implements PortletServiceC {
	
	@Inject
	PortletDAOCC dao;
	
 @Override
public MemberVO retreiveMember(String memNo) {
	 
	 
	return dao.selectMember(memNo); 
}
 
 
 @Override
public List<PortletVO> selectPortletList(String memNo) {
	return dao.selectListP(memNo);
}
 
 @Override
public void removeMember(String memNo) {
	 log.info("삭제 서비스{}",memNo);
	 dao.delete(memNo);
}
}
