package kr.or.ddit.professor.cyber.lecturematerial.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.exception.UncheckedException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.cyber.lecturematerial.dao.LectureDataDAOP;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.utils.file.service.FTPFileService;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.cyber.LectureDataVO;

@Service
public class LectureDataServiceImplP implements LectureDataServiceP {

	@Inject
	LectureDataDAOP dao;
	@Inject
	private FTPFileService fService;
	
	@Override
	public List<LectureDataVO> retrieveLectureDataList(PaginationInfo paging, String lecCode) {
		int totalRecord = dao.selectTotalRecord(paging,lecCode);
		paging.setTotalRecord(totalRecord);
		return dao.selectLectureDataList(paging,lecCode);
	}

	@Override
	public LectureDataVO retrieveLectureData(String lecDatano) {
		LectureDataVO data = dao.selectLectureData(lecDatano);
		if(data == null) {
			throw new PKNotFoundException(data+"강의자료가 존재하지 않음");
		}
		return data;
	}

	@Override
	@Transactional
	public ServiceResult createLectureData(LectureDataVO vo) {
		try {
			//gfNo 폴더 생성 + DB 저장
			String gfNo = fService.selecStringGFNO();
			vo.setGfNo(gfNo);
			fService.makeGFNOFolder(gfNo);
			
			if(dao.insertLectureData(vo) > 0) {
				if (vo.getDaFiles().length > 0 && vo.getDaFiles()[0].getSize() > 0)
					fService.sendFiles(vo.getGfNo(), vo.getDaFiles());
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
	public ServiceResult modifyLectureData(LectureDataVO vo) {
		try {
			if(dao.updateLectureData(vo) > 0) {
					fService.deleteGoupFile(vo.getGfNo());
				if (vo.getDaFiles()[0].getSize() > 0)
					fService.sendFiles(vo.getGfNo(), vo.getDaFiles());
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
	public ServiceResult removeLectureData(String lecDatano) {
		try {
			LectureDataVO data = dao.selectLectureData(lecDatano);
			String gfNo = data.getGfNo();
			
			if(dao.deleteLectureData(lecDatano) > 0) {
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
