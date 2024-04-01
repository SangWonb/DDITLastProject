package kr.or.ddit.professor.info.lecture.lectureappl.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.cyber.LecOpenListVO;
import kr.or.ddit.vo.cyber.SubjectVO;

public interface LectureOpenServiceP {
	public LecOpenListVO retrieveRecord(String memNo);

	// 신청 CRUD
	public List<LecOpenListVO> retrieveLectureApplList(String memNo);
	public LecOpenListVO retrieveLectureAppl(String lolAppno);
	public ServiceResult inserstLectureAppl(LecOpenListVO vo);
	public ServiceResult modifyLectureAppl(LecOpenListVO vo);
	public ServiceResult removeLectureAppl(String lolAppno);
	
	// 승인 조회,수정
	public List<LecOpenListVO> retrieveLectureDecisionList(String deptCode);
	public ServiceResult modifyLectureDecision(LecOpenListVO vo);
	public ServiceResult modifyLolCode(LecOpenListVO vo);
	
	// 강의계획서 조회 -> 여기서 하는게 필요한 데이터들을 모두 가져올 수 있을 것 같아서
	public LecOpenListVO retrieveLecturePlan(String lpCode);
}
