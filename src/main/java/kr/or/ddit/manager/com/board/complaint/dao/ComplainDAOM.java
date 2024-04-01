package kr.or.ddit.manager.com.board.complaint.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.cyber.ComplaintVO;

@Mapper
public interface ComplainDAOM {
	public int insertComplainM(ComplaintVO complain);
	
	public int selectTotalRecord(PaginationInfo paging);
	
	public List<ComplaintVO> selectComplainMList(PaginationInfo paging);
	
	public ComplaintVO selectBook(String cptNo);
	
	public int updateBook(ComplaintVO complain);
	
	public int deleteBook(String cptNo);
}
