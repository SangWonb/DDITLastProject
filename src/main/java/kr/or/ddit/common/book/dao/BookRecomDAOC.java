package kr.or.ddit.common.book.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.common.BookRecomVO;
import kr.or.ddit.vo.user.MemberVO;

@Mapper
public interface BookRecomDAOC {
	//추천목록조회
	public BookRecomVO selectBookRecom(BookRecomVO bookRecom);

	public String selectDeptName(MemberVO realUser);
}
