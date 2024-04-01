package kr.or.ddit.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.user.MemberVO;

@Mapper
public interface MemberDAO {
	
	public MemberVO selectMemberByUsername(String username);
	
	public List<MemberVO> selectMemberList();
	
	public MemberVO findMember(@Param("findInfo") Map<String, String> findInfo);

	public MemberVO findMemberPW(@Param("findInfo") Map<String, String> findInfo);
	
	public int pwReset(MemberVO member);
}
