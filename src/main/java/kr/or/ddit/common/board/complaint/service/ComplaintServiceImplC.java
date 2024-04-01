package kr.or.ddit.common.board.complaint.service;

import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;

import org.apache.commons.lang3.exception.UncheckedException;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import kr.or.ddit.common.board.complaint.dao.ComplaintDAOC;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.file.service.FTPFileService;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.CommunityVO;
import kr.or.ddit.vo.cyber.ComplaintVO;

@Service
public class ComplaintServiceImplC implements ComplaintServiceC {

		@Inject
		ComplaintDAOC dao;
		
		@Inject
		private FTPFileService serviceF; // 파일 서비스 호출
		
	@Override
	public List<CommunityVO> selectList(PaginationInfo paging) {
		int totalRecord =  dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectList(paging);
	}
	@Override
	@Transactional
	public ServiceResult createComplaint(CommunityVO com) {
		try {
			// 폴더 생성(DB저장)
			String gfNo = serviceF.selecStringGFNO();
			com.setGfNo(gfNo);
			serviceF.makeGFNOFolder(gfNo);
			
	         if(dao.insertCP(com) > 0) {
	            if (com.getCoFiles() != null && com.getCoFiles().length > 0 && com.getCoFiles()[0].getSize() > 0)
	               serviceF.sendFiles(com.getGfNo(),com.getCoFiles());
	            return ServiceResult.OK;
	         }else {
	            return ServiceResult.FAIL;
	         }
	      } catch (Exception e) {
	         throw new UncheckedException(e);
	      }
	}
	
	@Override
	public CommunityVO retrieveOne(String cmntCode) {
		dao.updateCount(cmntCode);
		
		return dao.select(cmntCode);
	}
	
	@Override
	@Transactional
	public ServiceResult modifyComplaint(CommunityVO com) {
		try {
			if(dao.updateCommunity(com) > 0) {
				serviceF.deleteGoupFile(com.getGfNo());
				if (com.getCoFiles()[0].getSize() > 0)
					serviceF.sendFiles(com.getGfNo(), com.getCoFiles());
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
	public ServiceResult removeComplaint(String cmntCode) {
		try {
			CommunityVO data = dao.select(cmntCode);
			String gfNo = data.getGfNo();
			
			if(dao.deleteCommunity(cmntCode) > 0) {
				if(serviceF.deleteGoupFile(gfNo) == ServiceResult.OK) {
					if(serviceF.deleteFolder(gfNo)) {
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
	@Override
	public int countBoard() {
		return 0;
	}
	}


