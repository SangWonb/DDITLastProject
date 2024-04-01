package kr.or.ddit.manager.com.board.departmentnotice.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.exception.UncheckedException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.manager.com.board.departmentnotice.dao.DepartmentNoticeDAOM;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.utils.file.service.FTPFileService;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.CommunityVO;

@Service
public class DepartmentServiceImplM implements DepartmentServiceM {

	@Inject
	DepartmentNoticeDAOM dao;
	@Inject
	private FTPFileService fService;
	
	@Override
	public List<CommunityVO> retrieveDepartmentNoticeList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectList(paging);
	}

	@Override
	public CommunityVO retrieveDepartmentNotice(String cmntCode) {
		CommunityVO notice = dao.select(cmntCode);
		if(notice == null) {
			throw new PKNotFoundException(cmntCode+"공지사항이 존재하지 않음");
		}
		return notice;
	}

	@Override
	@Transactional
	public ServiceResult modifyDepartmentNotice(CommunityVO notice) {
		
		try {
			if(dao.update(notice) > 0) {
					fService.deleteGoupFile(notice.getGfNo());
				if (notice.getCoFiles()[0].getSize() > 0)
					fService.sendFiles(notice.getGfNo(), notice.getCoFiles());
				return ServiceResult.OK;
			}else {
				return ServiceResult.FAIL;
			}
		} catch (Exception e) {
			throw new UncheckedException(e);
		}
	}

	@Override
	@Transactional
	public ServiceResult createDepartmentNotice(CommunityVO notice) {
		try {
			//gfNo 폴더 생성 + DB 저장
			String gfNo = fService.selecStringGFNO();
			notice.setGfNo(gfNo);
			fService.makeGFNOFolder(gfNo);
			
			if(dao.insert(notice) > 0) {
				if (notice.getCoFiles().length > 0 && notice.getCoFiles()[0].getSize() > 0)
					fService.sendFiles(notice.getGfNo(), notice.getCoFiles());
				return ServiceResult.OK;
			}else {
				return ServiceResult.FAIL;
			}
		}catch (Exception e) {
			throw new UncheckedException(e);
		}
	}

	@Override
	@Transactional
	public ServiceResult removeDepartmentNotice(String cmntCode) {
		try {
			CommunityVO notice = dao.select(cmntCode);
			String gfNo = notice.getGfNo();
			
			if(dao.delete(cmntCode) > 0) {
				if(fService.deleteGoupFile(gfNo) == ServiceResult.OK) {
					if(fService.deleteFolder(gfNo)) {
						return ServiceResult.OK;
					}
				}
				return ServiceResult.FAIL;
			}
		}catch (Exception e) {
			throw new UncheckedException(e);
		}
		return ServiceResult.FAIL;
	}
}
