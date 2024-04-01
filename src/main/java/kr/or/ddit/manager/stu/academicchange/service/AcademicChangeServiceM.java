package kr.or.ddit.manager.stu.academicchange.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.info.AcademicRecordChangeVO;

public interface AcademicChangeServiceM {
	public List<AcademicRecordChangeVO> retrieveAcaRecordList();
	public AcademicRecordChangeVO retrieveRecord(String arcNo);
	public ServiceResult modifyRecord(AcademicRecordChangeVO vo);
}
