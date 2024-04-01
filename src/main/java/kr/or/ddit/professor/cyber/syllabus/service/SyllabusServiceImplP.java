package kr.or.ddit.professor.cyber.syllabus.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.cyber.syllabus.dao.SyllabusDAOP;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.cyber.LecturePlanVO;

@Service
public class SyllabusServiceImplP implements SyllabusServiceP {
	
	@Inject
	SyllabusDAOP dao;

	@Override
	public ServiceResult createSyllabus(LecturePlanVO syllabus) {
		ServiceResult result = null;
		result = dao.insert(syllabus) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public ServiceResult modifySyllabus(LecturePlanVO syllabus) {
		ServiceResult result = null;
		result = dao.update(syllabus) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public LecturePlanVO retrieveSyllabus(String lecCode) {
		LecturePlanVO syllabus = dao.select(lecCode);
		if(syllabus == null) {
			throw new PKNotFoundException(lecCode+"강의계획서가 존재하지 않음");
		}
		return syllabus;
	}

	@Override
	public List<LecturePlanVO> retrieveSyllabusList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectList(paging);
	}
}
