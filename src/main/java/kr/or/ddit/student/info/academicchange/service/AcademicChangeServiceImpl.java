package kr.or.ddit.student.info.academicchange.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.info.academicchange.dao.AcademicChangeDAO;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.CommunityVO;
import kr.or.ddit.vo.info.AcademicClassificationVO;
import kr.or.ddit.vo.info.AcademicRecordChangeVO;

@Service
public class AcademicChangeServiceImpl implements AcademicChangeService{

	@Inject
	AcademicChangeDAO dao;
	
	@Override
	public List<AcademicRecordChangeVO> retrieveAcaRecordList(String memNo) {
		List<AcademicRecordChangeVO> record = dao.selectList(memNo);
		return record;
	}

	@Override
	public AcademicRecordChangeVO retrieveRecord(String arcNo) {
		AcademicRecordChangeVO record = dao.selectRecord(arcNo);
		return record;
	}

	@Override
	public ServiceResult createRecord(AcademicRecordChangeVO newRecord) {
		int result =dao.insertOne(newRecord);
		if(result>0) {
			return ServiceResult.OK;
		}else {
            return ServiceResult.FAIL; // 삽입이 실패한 경우
        }
	}

	@Override
	public ServiceResult modifyRecord(AcademicRecordChangeVO newRecord) {
		ServiceResult result = null;
		result = dao.updateOne(newRecord) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public ServiceResult removeRecord(String arcNo) {
		ServiceResult result = null;
		result = dao.deleteOne(arcNo)> 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public List<AcademicClassificationVO> retrieveAcademicType() {
		List<AcademicClassificationVO> acaType=dao.selectType();
		return acaType;
	}

}
