package kr.or.ddit.common.book.popularbook.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.common.BookRentalVO;

@Mapper
public interface PopularBookDAOC {
	//추천목록조회
	public List<BookRentalVO> selectPopBook();
}
