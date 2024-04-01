package kr.or.ddit.manager.stu.academicchange.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.manager.stu.academicchange.dao.AcademicChangeDAOM;
import kr.or.ddit.manager.stu.academicchange.dao.StudentRecordDAOM;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.vo.info.AcademicRecordChangeVO;
import kr.or.ddit.vo.user.StudentVO;

@Service
public class AcademicChangeServiceImplM implements AcademicChangeServiceM {
	
	@Inject
	AcademicChangeDAOM dao;
	
	@Inject
	StudentRecordDAOM daoS;

	@Override
	public List<AcademicRecordChangeVO> retrieveAcaRecordList() {
		return dao.selectAcaRecordList();
	}

	@Override
	public AcademicRecordChangeVO retrieveRecord(String arcNo) {
		AcademicRecordChangeVO record = dao.select(arcNo);
		if(record == null) {
			throw new PKNotFoundException(record+"학적변동신청이 존재하지 않음");
		}
		return record;
	}

	@Override
	public ServiceResult modifyRecord(AcademicRecordChangeVO vo) {
		ServiceResult result = null;
		result = dao.update(vo) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		if(vo.getArcState().equals("STA06")) {
			StudentVO student = new StudentVO();
			student.setSmemNo(vo.getMemNo());
			student.setStuRecord(vo.getAcCode());
			daoS.updateRecord(student);
		}
		return result;
	}
}
