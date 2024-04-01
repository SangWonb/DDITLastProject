package kr.or.ddit.common.service;

import java.util.List;

import kr.or.ddit.vo.common.PortletVO;
import kr.or.ddit.vo.user.MemberVO;

public interface PortletServiceC {

	public MemberVO retreiveMember(String memNo);
	
	public List<PortletVO> selectPortletList(String memNo);
	
	public void removeMember(String memNo);
	
	
}
