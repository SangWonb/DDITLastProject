package kr.or.ddit.common.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.common.PortletVO;
import kr.or.ddit.vo.user.MemberVO;

@Mapper
public interface PortletDAOCC {

	public MemberVO selectMember(String memNo);
	
	public List<PortletVO> selectListP(String memNo);
	
	public void delete(String memNo);
	
}
