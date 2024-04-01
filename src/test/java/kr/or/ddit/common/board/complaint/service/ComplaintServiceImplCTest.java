package kr.or.ddit.common.board.complaint.service;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;

import kr.or.ddit.AbstractRootContextTest;
import kr.or.ddit.common.board.complaint.dao.ComplaintDAOC;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.cyber.ComplaintVO;

class ComplaintServiceImplCTest extends AbstractRootContextTest{
	
	@Inject
	ComplaintDAOC dao;
	
	@Test
	void test() {
		PaginationInfo paging = new PaginationInfo();
//		List<ComplaintVO> a = dao.selectList(paging);
//		assertNotNull(a);
	}

}
