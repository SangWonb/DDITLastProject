package kr.or.ddit.common.board.departmentnotice.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.board.departmentnotice.dao.DepartmentNoticeDAO;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.CommunityVO;

@Service
public class DepartmentNoticeServiceImpl implements DepartmentNoticeService {

	@Inject
	DepartmentNoticeDAO dao;
	
//	@Override
//	public List<CommunityVO> retrieveDepartmentNoticeList(Map<String, Object> paramMap
//		) {
//		int totalRecord = dao.selectTotalRecordDept(paramMap.get("deptCode").toString());
//		PaginationInfo paging = (PaginationInfo) paramMap.get("page");
//		paging.setTotalRecord(totalRecord);
//		return dao.selectDepartmentNoticeList(paramMap);
//	}
	@Override
	public List<CommunityVO> retrieveDepartmentNoticeList(PaginationInfo paging, String deptCode
			) {
		int totalRecord = dao.selectTotalRecordDept(deptCode);
//		PaginationInfo paging = (PaginationInfo) paramMap.get("page");
		paging.setTotalRecord(totalRecord);
		
		paging.getSimpleCondition();
		return dao.selectDepartmentNoticeList(paging);
	}

	@Override
	public CommunityVO retrieveDepartmentNotice(String cmntCode) {
		CommunityVO notice = dao.select(cmntCode);
		dao.updateCount(cmntCode);
		if(notice == null) {
			throw new PKNotFoundException(cmntCode+"공지사항이 존재하지 않음");
		}
		return notice;
	}
}