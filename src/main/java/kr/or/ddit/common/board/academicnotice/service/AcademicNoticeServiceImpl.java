package kr.or.ddit.common.board.academicnotice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.board.academicnotice.dao.AcademicNoticeDAO;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.CommunityVO;

@Service
public class AcademicNoticeServiceImpl implements AcademicNoticeService {

	@Inject
	AcademicNoticeDAO dao;
	
	@Override
	public List<CommunityVO> retrieveAcademicNoticeList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectList(paging);
	}

	@Override
	public CommunityVO retrieveAcademicNotice(String cmntCode) {
		dao.updateCount(cmntCode);
		CommunityVO notice = dao.select(cmntCode);
		if(notice == null) {
			throw new PKNotFoundException(cmntCode+"공지사항이 존재하지 않음");
		}
		return notice;
	}
}
