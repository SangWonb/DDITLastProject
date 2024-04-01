package kr.or.ddit.student.careerup.mentoring.mentoringmentee.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.exception.UncheckedException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.careerup.mentoring.mentoringmentee.dao.MenteeApplDAOS;
import kr.or.ddit.student.careerup.mentoring.mentoringmentee.dao.SeniorCoworkerDAOS;
import kr.or.ddit.student.careerup.mentoring.mentoringmentee.dao.StudentForSenior;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.utils.file.service.FTPFileService;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.careerup.MenteeVO;
import kr.or.ddit.vo.careerup.SeniorCoworkerVO;
import kr.or.ddit.vo.info.AcademicRecordChangeVO;
import kr.or.ddit.vo.user.StudentVO;

@Service
public class MenteeServiceImpl implements MenteeServiceS {
	
	@Inject
	MenteeApplDAOS dao1;
	
	@Inject
	SeniorCoworkerDAOS dao2;
	
	@Inject
	StudentForSenior dao3;
	
	@Inject
	private FTPFileService fService;

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
	public List<MenteeVO> retrieveMenteeApplList(String memNo) {
		return dao1.selectMenteeList(memNo);
	}

	@Override
	public MenteeVO retrieveMentorAppl(String menteeNo) {
		MenteeVO appl = dao1.select(menteeNo);
		if(appl == null) {
			throw new PKNotFoundException(menteeNo+"신청내역이 존재하지 않음");
		}
		return appl;
	}

	@Override
	public ServiceResult modifyAppl(MenteeVO mentoringAppl) {
		ServiceResult result = null;
		result = dao1.update(mentoringAppl) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public ServiceResult deleteMentoring(String menteeNo) {
		ServiceResult result = null;
		result = dao1.delete(menteeNo) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public List<SeniorCoworkerVO> retrieveMentorList(PaginationInfo paging) {
		int totalRecord = dao2.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao2.selectList(paging);
	}

	@Override
	public SeniorCoworkerVO retrieveMentor(String srNo) {
		SeniorCoworkerVO mentor = dao2.select(srNo);
		if(mentor == null) {
			throw new PKNotFoundException(srNo+"멘토가 존재하지 않음");
		}
		return mentor;
	}

	@Override
	public ServiceResult applMentoring(MenteeVO vo) {
		ServiceResult result = null;
		result = dao1.insert(vo) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public MenteeVO retrieveRecord(String menteeNo) {
		MenteeVO record = dao1.selectRecord(menteeNo);
		return record;
	}

	@Override
	@Transactional
	public ServiceResult createMentor(StudentVO vo) {
		
		try {
			//gfNo 폴더 생성 + DB 저장
			String gfNo = fService.selecStringGFNO();
			vo.setGfNo(gfNo);
			fService.makeGFNOFolder(gfNo);
			
			if(dao3.updateMentor(vo) > 0) {
				if (vo.getStuFiles().length > 0 && vo.getStuFiles()[0].getSize() > 0)
					fService.sendFiles(vo.getGfNo(), vo.getStuFiles());
				return ServiceResult.OK;
			}else {
				return ServiceResult.FAIL;
			}
		}catch (Exception e) {
			throw new UncheckedException(e);
		}
	}

//	@Override
//	public ServiceResult applMentoring(String menteeNo, String srNo) {
//		ServiceResult result = null;
//		result = dao1.insert(menteeNo) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
//		return result;
//	}
}