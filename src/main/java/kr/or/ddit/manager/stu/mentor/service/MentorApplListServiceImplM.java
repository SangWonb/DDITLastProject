package kr.or.ddit.manager.stu.mentor.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.exception.UncheckedException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.manager.stu.mentor.dao.MentorApplListDAOM;
import kr.or.ddit.student.careerup.mentoring.mentoringmentee.dao.SeniorCoworkerDAOS;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.utils.file.service.FTPFileService;
import kr.or.ddit.vo.careerup.SeniorCoworkerVO;
import kr.or.ddit.vo.common.CommunityVO;
import kr.or.ddit.vo.user.StudentVO;

@Service
public class MentorApplListServiceImplM implements MentorApplListServiceM {
	
	@Inject
	MentorApplListDAOM dao;
	
	@Inject
	SeniorCoworkerDAOS daoS;
	
	@Inject
	private FTPFileService fService;

	@Override
	public List<StudentVO> retrieveApplList() {
		return dao.selectMetorApplList();
	}

	@Override
	@Transactional
	public ServiceResult insertAppl(SeniorCoworkerVO vo) {
		try {
			// gfNo 폴더 생성 + DB 저장
			String gfNo = fService.selecStringGFNO();
			vo.setGfNo(gfNo);
			fService.makeGFNOFolder(gfNo);

			if (dao.insertMentorAppl(vo) > 0) {
				if (vo.getStuFiles().length > 0 && vo.getStuFiles()[0].getSize() > 0)
					fService.sendFiles(vo.getGfNo(), vo.getStuFiles());
				return ServiceResult.OK;
			} else {
				return ServiceResult.FAIL;
			}
		} catch (Exception e) {
			throw new UncheckedException(e);
		}

	}

	@Override
	public StudentVO retrieveAppl(String smemNo) {
		StudentVO appl = dao.selectMetorAppl(smemNo);
		if(appl == null) {
			throw new PKNotFoundException(appl+"신청내역이 존재하지 않음");
		}
		return appl;
	}

	@Override
	public ServiceResult createMentor(SeniorCoworkerVO vo) {
		int cnt = daoS.insert(vo);
		dao.updateAppl(vo.getSmemNo());
		ServiceResult result = cnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}
	
	@Override
	public ServiceResult modifyAppl(String smemNo) {
		int cnt = dao.updateAppl(smemNo);
		ServiceResult result = cnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public ServiceResult modifyApplDel(String smemNo) {
		int cnt = dao.updateApplDel(smemNo);
		ServiceResult result = cnt > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}
}