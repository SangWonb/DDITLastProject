package kr.or.ddit.professor.info.mypage.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.ProfessorVO;

@Mapper
public interface MyPagePDAO extends AbstractCommonMapper<MemberVO,String> {

	public ProfessorVO selectMyInfo(String memNo);
}
