package kr.or.ddit.common.board.academicnotice.dao;

import static org.junit.jupiter.api.Assertions.*;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;

import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.CommunityVO;

class AcademicNoticeDAOTest {
	
	@Inject
	AcademicNoticeDAO dao;

	@Test
	void testInsert() {
		fail("Not yet implemented");
	}

	
	
	
	@Test
	void testSelect() {
//		CommunityVO board = dao.select("1","1");
//		assertNotNull(board);
	}

	@Test
	void testSelectTotalRecord() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectList() {
		PaginationInfo paging = new PaginationInfo();
		CommunityVO board = (CommunityVO) dao.selectList(paging);
		assertNotNull(board);
	}

	@Test
	void testUpdate() {
		fail("Not yet implemented");
	}

	@Test
	void testDelete() {
		fail("Not yet implemented");
	}

}
