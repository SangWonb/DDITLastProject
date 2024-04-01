package kr.or.ddit.manager.pro.lecture.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.manager.pro.lecture.dao.LectureDecisionDAOM;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.vo.cyber.LecOpenListVO;
import kr.or.ddit.vo.cyber.LecturePlanVO;
import kr.or.ddit.vo.cyber.LectureTimeVO;
import kr.or.ddit.vo.cyber.LectureVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LectureDecisionServiceImplM implements LectureDecisionServiceM {
	
	@Inject
	LectureDecisionDAOM dao;

	@Override
	public List<LecOpenListVO> retrieveLectureDecisionList() {
		return dao.selectLectureDecisionList();
	}

	@Override
	public LecOpenListVO retrieveLectureAppl(String lolAppno) {
		LecOpenListVO appl = dao.selectLectureAppl(lolAppno);
		if(appl == null) {
			throw new PKNotFoundException(lolAppno+"신청내역이 존재하지 않음");
		}
		return appl;
	}

	@Override
	public ServiceResult modifyLectureDecision(LecOpenListVO vo) {
		ServiceResult result = null;
		result = dao.lectureDecisionUpdate(vo) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		if(vo.getAppStatus().equals("STA06")) {
			dao.insertLolAppno(vo);
			result = ServiceResult.OK;
			if(result == ServiceResult.OK) {
				LectureVO newRecord = new LectureVO();
				log.info("\n\n\n ---> {}\n\n\n\n",vo.getLolCode());
				newRecord.setLolCode(vo.getLolCode());
				newRecord.setBuildingNo(vo.getBuildingNo());
				newRecord.setLecTime(vo.getLecTime());
				newRecord.setRoomNo(vo.getRoomNo());
				dao.insertNewLecture(newRecord);
				
				LecturePlanVO newLP = new LecturePlanVO();
				newLP.setLolAppno(vo.getLolAppno());
				newLP.setLolCode(vo.getLolCode());
				dao.updateLecturePlan(newLP);
				
				LectureTimeVO newT = new LectureTimeVO();
				newT.setLolCode(vo.getLolCode());
				newT.setLtDay(vo.getLtDay());
				newT.setLtTime(vo.getLtTime());
				dao.insertLectureTime(newT);
			}
		} else {
			result = ServiceResult.FAIL;
		}
		return result;
	}
}
