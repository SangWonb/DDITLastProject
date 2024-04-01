package kr.or.ddit.student.careerup.mentoring.mentoringmentor.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.careerup.mentoring.dao.MentoringChatDAOS;
import kr.or.ddit.student.careerup.mentoring.mentoringmentor.dao.MentorDecisionDAOS;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.careerup.MenteeVO;
import kr.or.ddit.vo.careerup.MentoringProgramVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MentorServiceImplS implements MentorServiceS {
	
	@Inject
	MentorDecisionDAOS dao;
	
	@Inject
	MentoringChatDAOS chatDao;

	@Override
	public List<MenteeVO> retrieveMentoringList(PaginationInfo paging) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MenteeVO retrieveMentoring(String menteeNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MenteeVO retrieveRecord(String menteeNo) {
		MenteeVO record = dao.selectRecord(menteeNo);
		return record;
	}

	@Override
	public List<MenteeVO> retrieveMentorDecisionList(String smemNo) {
		return dao.selectDecisionList(smemNo);
	}

	@Override
	public MenteeVO retrieveMentorDecision(String menteeNo) {
		MenteeVO decision = dao.select(menteeNo);
		if(decision == null) {
			throw new PKNotFoundException(menteeNo+"신청내역이 존재하지 않음");
		}
		return decision;
	}

	@Override
	public ServiceResult modifyAppl(MenteeVO mentee) {
		ServiceResult result = null;
		result = dao.update(mentee) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		String statusCode = mentee.getStatusCode();
		if(statusCode.equals(statusCode)) {
			MenteeVO selectStatus = dao.selectStatus(mentee.getMenteeNo());
			String memNo = selectStatus.getMemNo();
			String menteeNo = selectStatus.getMenteeNo();
			String srNo = selectStatus.getSrNo();
			MentoringProgramVO vo = new MentoringProgramVO();
			vo.setMenteeNo(menteeNo);
			vo.setSrNo(srNo);
			vo.setMemNo(memNo);
			chatDao.insertChatId(vo);
		}
		return result;
	}

	@Override
	public List<MenteeVO> selectStatus() {
		// TODO Auto-generated method stub
		return null;
	}

//	@Override
//	public List<MenteeVO> selectStatus() {
//		List<MenteeVO> selectStatus = dao.selectStatus();
//		for( MenteeVO i
//	nsertStatus :selectStatus) {
//			chatDao.insertChatId(insertStatus);
//		}
//		return selectStatus;
//	}
}