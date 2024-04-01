package kr.or.ddit.student.cyber.onlinelecture.service;

import java.util.List;

import javax.inject.Inject;
import javax.transaction.Transactional;

import org.apache.commons.lang3.exception.UncheckedException;
import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.cyber.lecturenotice.dao.LectureNoticeDAOP;
import kr.or.ddit.professor.cyber.onlinelecture.dao.OnlineLectureDAOP;
import kr.or.ddit.student.cyber.onlinelecture.dao.OnlineLectureDAOS;
import kr.or.ddit.utils.file.service.FTPFileService;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.cyber.AttendVO;
import kr.or.ddit.vo.cyber.LectureOnlineVO;
import kr.or.ddit.vo.cyber.LectureVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class OnlineLectureServiceImplS implements OnlineLectureServiceS {

	@Inject
	OnlineLectureDAOS dao;

//	@Inject
//	private FTPFileService serviceF; // 파일 서비스 호출

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
	public ServiceResult createLecture(AttendVO lec) {
		
		return dao.insertAttend(lec)>0?ServiceResult.OK:ServiceResult.FAIL;
	}
	
	
	
}
