package kr.or.ddit.student.info.mypage.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.StudentVO;

@Mapper
public interface MyPageSDAO extends AbstractCommonMapper<MemberVO, String> {

	public StudentVO selectMyInfo(String memNo);
}
