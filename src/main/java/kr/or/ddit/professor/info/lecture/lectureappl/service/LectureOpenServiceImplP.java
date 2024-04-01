package kr.or.ddit.professor.info.lecture.lectureappl.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.info.lecture.lectureappl.dao.LectureContentOpenDAOP;
import kr.or.ddit.professor.info.lecture.lectureappl.dao.LectureOpenDAOP;
import kr.or.ddit.professor.info.lecture.lectureappl.dao.LecturePlanOpenDAOP;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.vo.cyber.LecOpenListVO;
import kr.or.ddit.vo.cyber.LectureContentVO;
import kr.or.ddit.vo.cyber.LecturePlanVO;

@Service
public class LectureOpenServiceImplP implements LectureOpenServiceP {
	
	@Inject
	LectureOpenDAOP dao;
	@Inject
	LecturePlanOpenDAOP plan;
	@Inject
	LectureContentOpenDAOP content;

	@Override
	public LecOpenListVO retrieveRecord(String memNo) {
		LecOpenListVO record = dao.selectRecord(memNo);
		return record;
	}

	@Override
	public List<LecOpenListVO> retrieveLectureApplList(String memNo) {
		return dao.selectLectureApplList(memNo);
	}

	@Override
	public LecOpenListVO retrieveLectureAppl(String lolAppno) {
		// 강의개설
		LecOpenListVO appl = dao.selectLectureAppl(lolAppno);
		if(appl == null) {
			throw new PKNotFoundException(lolAppno+"신청내역이 존재하지 않음");
		}
		return appl;
	}

	@Override
	public ServiceResult inserstLectureAppl(LecOpenListVO vo) {
		ServiceResult result = null;
		//개설신청
		if( dao.lectureApplInserst(vo) > 0 ) {
			LecturePlanVO planVO = vo.getLecturePlan();
			planVO.setLolAppno(vo.getLolAppno());
			
			if(plan.insert(planVO) > 0 ) {
				String id = planVO.getLpCode();
				// 반복문 - 강의 주차별 내용
				int cnt = 0;
				for (LectureContentVO contentVO : vo.getLecturePlan().getLectureContent()) {
					contentVO.setLpCode(id);
					cnt += content.insert(contentVO);
				}
				result = cnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
			}
		}
		return result;
	}

	@Override
	public ServiceResult modifyLectureAppl(LecOpenListVO vo) {
		ServiceResult result = null;
		if( dao.lectureApplUpdate(vo) > 0 ) {
			LecturePlanVO planVO = vo.getLecturePlan();
			planVO.setLolAppno(vo.getLolAppno());
			
			
			if(plan.update(planVO) > 0 ) {
				LecturePlanVO select = plan.select(vo.getLolAppno());
				String lpCode = select.getLpCode();
//				String id = planVO.getLpCode();
				// 반복문 - 강의 주차별 내용
				int cnt = 0;
				content.delete(lpCode);
				for (LectureContentVO contentVO : vo.getLecturePlan().getLectureContent()) {
					contentVO.setLpCode(lpCode);
					cnt += content.insert(contentVO);
				}
				result = cnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
			}
		}
		return result;
	}

	@Override
	public ServiceResult removeLectureAppl(String lolAppno) {
//		result = dao.lectureApplDelete(lolAppno) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
//		// 강의 계획서
//		result = plan.delete(lolAppno) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
//		// 강의 주차별 내용
//		result = content.delete(lolAppno) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		
		ServiceResult result = null;
		if( dao.lectureApplDelete(lolAppno) > 0 ) {
			
			LecturePlanVO select = plan.select(lolAppno);
			String lpCode = select.getLpCode();
			if (plan.delete(lolAppno) > 0) {
	            // 강의 주차별 내용 삭제
	            int cnt = content.delete(lpCode);
	            result = cnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	        }
		}
		return result;
	}

	@Override
	public List<LecOpenListVO> retrieveLectureDecisionList(String deptCode) {
		return dao.selectLectureDecisionList(deptCode);
	}

	@Override
	public ServiceResult modifyLectureDecision(LecOpenListVO vo) {
		ServiceResult result = null;
		result = dao.lectureDecisionUpdate(vo) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public ServiceResult modifyLolCode(LecOpenListVO vo) {
		if(vo.getStatus().containsValue("STA06")) {
			String lolCode = dao.selectLolAppNo();
			vo.setSubCode(lolCode);
		}
		return dao.updateLolAppNo(vo) >0?ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public LecOpenListVO retrieveLecturePlan(String lpCode) {
		LecOpenListVO appl = dao.selectLecturePlan(lpCode);
		if(appl == null) {
			throw new PKNotFoundException(lpCode+"강의계획서가 존재하지 않음");
		}
		return appl;
	}
}