package kr.or.ddit.common.board.freeboard.service;

import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;

import org.apache.commons.lang3.exception.UncheckedException;
import org.springframework.stereotype.Service;

import kr.or.ddit.common.board.freeboard.dao.FreeBoardDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.file.service.FTPFileService;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.CommunityVO;
import kr.or.ddit.vo.cyber.LectureDataVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FreeBoardServiceImpl implements FreeBoardService{

	@Inject
	private FreeBoardDAO dao;
	
	@Inject
	private FTPFileService serviceF; // 파일 서비스 호출

	@Override
	public List<CommunityVO> retrieveFbList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectList(paging);
	}


	@Override
	public CommunityVO retrieveFb(String cmntCode) {
		dao.updateCount(cmntCode);
		log.info("서비스:{}"  ,cmntCode);
		return dao.select(cmntCode);
	}

	@Override
	@Transactional
	public ServiceResult createFb(CommunityVO newFb) {
		try {
			// 폴더 생성(DB저장)
			String gfNo = serviceF.selecStringGFNO();
			newFb.setGfNo(gfNo);
			serviceF.makeGFNOFolder(gfNo);
			
	         if(dao.insertFB(newFb) > 0) {
	            if (newFb.getCoFiles() != null && newFb.getCoFiles().length > 0 && newFb.getCoFiles()[0].getSize() > 0)
	               serviceF.sendFiles(newFb.getGfNo(),newFb.getCoFiles());
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
	public ServiceResult modifyFb(CommunityVO vo) {
		try {
			if(dao.updateCommunity(vo) > 0) {
				serviceF.deleteGoupFile(vo.getGfNo());
				if (vo.getCoFiles()[0].getSize() > 0)
					serviceF.sendFiles(vo.getGfNo(), vo.getCoFiles());
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
	public ServiceResult removeFb(String cmntCode) {
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
	public ServiceResult createCm(CommunityVO newCm) {
		return dao.insertComment(newCm)>0?ServiceResult.OK : ServiceResult.FAIL;
	}


	@Override
	public int countBoard() {
		// TODO Auto-generated method stub
		return 0;
	}


}
