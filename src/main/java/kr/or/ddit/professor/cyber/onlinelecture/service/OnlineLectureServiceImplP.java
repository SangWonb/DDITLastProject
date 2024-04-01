package kr.or.ddit.professor.cyber.onlinelecture.service;

import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;

import org.apache.commons.lang3.exception.UncheckedException;
import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.cyber.lecturenotice.dao.LectureNoticeDAOP;
import kr.or.ddit.professor.cyber.onlinelecture.dao.OnlineLectureDAOP;
import kr.or.ddit.utils.file.service.FTPFileService;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.cyber.LectureOnlineVO;
import kr.or.ddit.vo.cyber.LectureVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OnlineLectureServiceImplP implements OnlineLectureServiceP {

	@Inject
	OnlineLectureDAOP dao;

	@Inject
	private FTPFileService serviceF; // 파일 서비스 호출

	@Override
	public List<LectureOnlineVO> retrieveLectureList(PaginationInfo paging, String memName, String lecCode) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectListLecture(paging, memName, lecCode);
	}

	@Override
	public LectureOnlineVO retreieveLecture(String lecoCode) {

		return dao.select(lecoCode);
	}

	@Override
	public ServiceResult modifyLecture(LectureOnlineVO lec) {
		try {
			if(dao.update(lec) > 0) {
				if (lec.getLecFiles() != null && lec.getLecFiles().length > 0 && lec.getLecFiles()[0].getSize() > 0)
					serviceF.deleteGoupFile(lec.getGfNo());
				
				if (lec.getLecFiles()[0].getSize() > 0)
					serviceF.sendFiles(lec.getGfNo(), lec.getLecFiles());
				return ServiceResult.OK;
			}else {
				return ServiceResult.FAIL;
			}
		} catch (Exception e) {
			throw new UncheckedException(e);
		}
	}

	@Override
	public void removeLecture(String lecoCode) {
		dao.delete(lecoCode);
	}

	@Override
	@Transactional
	public ServiceResult createLecture(LectureOnlineVO lec) {
		try {
			// 폴더 생성(DB저장)
			String gfNo = serviceF.selecStringGFNO();
			lec.setGfNo(gfNo);
			serviceF.makeGFNOFolder(gfNo);

			if (dao.insertLecture(lec) > 0) {
				if (lec.getLecFiles() != null && lec.getLecFiles().length > 0 && lec.getLecFiles()[0].getSize() > 0)
					serviceF.sendFiles(lec.getGfNo(), lec.getLecFiles());
				return ServiceResult.OK;
			} else {
				return ServiceResult.FAIL;
			}
		} catch (Exception e) {
			throw new UncheckedException(e);
		}
		
	
	}

	@Override
	public ServiceResult modifyLectureFile(LectureOnlineVO lec) {
		try {
	        int updateResult = dao.updateFile(lec);
	        if (updateResult > 0) {
	            if (lec.getLecFiles() != null && lec.getLecFiles().length > 0 && lec.getLecFiles()[0].getSize() > 0) {
	                // 파일이 새로 업로드되었을 경우, 기존 파일 삭제 후 새로운 파일 업로드
	                serviceF.deleteGoupFile(lec.getGfNo());
	                serviceF.sendFiles(lec.getGfNo(), lec.getLecFiles());
	            }
	            return ServiceResult.OK;
	        } else {
	            return ServiceResult.FAIL;
	        }
	    } catch (Exception e) {
	        throw new UncheckedException(e);
	    }
	}
	
}
