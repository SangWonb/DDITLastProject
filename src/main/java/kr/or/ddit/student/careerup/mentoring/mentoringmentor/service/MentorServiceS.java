package kr.or.ddit.student.careerup.mentoring.mentoringmentor.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.careerup.MenteeVO;

public interface MentorServiceS {
	/**
	 * 1
	 * 멘토링 진행상황
	 * @param menteeNo
	 * @return
	 */
	public List<MenteeVO> retrieveMentoringList(PaginationInfo paging);
	
	public MenteeVO retrieveMentoring(String menteeNo);
	
	
	/**
	 * 2
	 * 멘토링 신청 목록 조회
	 * @param menteeNo
	 * @return
	 */
	public List<MenteeVO> retrieveMentorDecisionList(String smemNo);
	
	public MenteeVO retrieveMentorDecision(String menteeNo);
	
	public MenteeVO retrieveRecord(String menteeNo);
	
	public ServiceResult modifyAppl(MenteeVO mentee);
	
	public List<MenteeVO> selectStatus();
	
}
