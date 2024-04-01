package kr.or.ddit.manager.pro.lecture.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.cyber.LecOpenListVO;

public interface LectureDecisionServiceM {
	public List<LecOpenListVO> retrieveLectureDecisionList();
	public LecOpenListVO retrieveLectureAppl(String lolAppno);
	public ServiceResult modifyLectureDecision(LecOpenListVO vo);
}
