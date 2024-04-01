package kr.or.ddit.student.careerup.mentoring.mentoringmentee.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.careerup.MenteeVO;
import kr.or.ddit.vo.careerup.SeniorCoworkerVO;
import kr.or.ddit.vo.user.StudentVO;

public interface MenteeServiceS {
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
	public List<MenteeVO> retrieveMenteeApplList(String memNo);
	
	public MenteeVO retrieveMentorAppl(String menteeNo);
	public MenteeVO retrieveRecord(String menteeNo);
	
	public ServiceResult modifyAppl(MenteeVO mentee);
	public ServiceResult deleteMentoring(String menteeNo);
	public ServiceResult createMentor(StudentVO vo);
	
	/**
	 * 3
	 * 멘토 목록 조회
	 * @param srNo
	 * @return
	 */
	public List<SeniorCoworkerVO> retrieveMentorList(PaginationInfo paging);
	
	public SeniorCoworkerVO retrieveMentor(String srNo);
	
	public ServiceResult applMentoring(MenteeVO mentee);
}
