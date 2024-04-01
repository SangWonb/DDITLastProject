package kr.or.ddit.common.board.departmentnotice.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;

import kr.or.ddit.AbstractRootContextTest;
import kr.or.ddit.common.board.departmentnotice.service.DepartmentNoticeService;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.SearchCondition;
import kr.or.ddit.vo.common.CommunityVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
class DepartmentNoticeDAOTest extends AbstractRootContextTest{

	@Inject
	DepartmentNoticeDAO dao;
	
	@Inject
	DepartmentNoticeService service;
	
	@Test
	void testSelectTotalRecordDept() {
		CommunityVO select = dao.select("DN000001");
		log.info("나야 : {}",select);
	}

	@Test
	void testSelectDepartmentNoticeList() {
		PaginationInfo paging = new PaginationInfo();
		paging.setCurrentPage(1);
		paging.setDeptCode("D01");
		SearchCondition simCondition = new SearchCondition("cmntTitle", "간");
		paging.setSimpleCondition(simCondition);
		List<CommunityVO> select = service.retrieveDepartmentNoticeList(paging,"D01");
		log.info("나야 : {}",select);
	}

	@Test
	void testUpdateCount() {
		fail("Not yet implemented");
	}

}
