package kr.or.ddit.professor.cyber.lecturematerial.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.cyber.LectureDataVO;

public interface LectureDataServiceP {

	public List<LectureDataVO> retrieveLectureDataList(PaginationInfo paging, String lecCode);
	public LectureDataVO retrieveLectureData(String lecDatano);
	public ServiceResult createLectureData(LectureDataVO vo);
	public ServiceResult modifyLectureData(LectureDataVO vo);
	public ServiceResult removeLectureData(String lecDatano);
}
