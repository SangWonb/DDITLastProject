package kr.or.ddit.student.info.academicchange.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.CommunityVO;
import kr.or.ddit.vo.info.AcademicClassificationVO;
import kr.or.ddit.vo.info.AcademicRecordChangeVO;

public interface AcademicChangeService {

	public List<AcademicRecordChangeVO> retrieveAcaRecordList(String memNo);
	public AcademicRecordChangeVO retrieveRecord(String arcNo);
	public List<AcademicClassificationVO> retrieveAcademicType();
	public ServiceResult createRecord(AcademicRecordChangeVO newRecord);
	public ServiceResult modifyRecord(AcademicRecordChangeVO newRecord);
	public ServiceResult removeRecord(String arcNo);
}
