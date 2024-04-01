package kr.or.ddit.professor.cyber.onlinelecture.service;

import java.util.List;

import javax.inject.Inject;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.cyber.LectureOnlineVO;
import kr.or.ddit.vo.cyber.LectureVO;

public interface OnlineLectureServiceP {

	public List<LectureOnlineVO> retrieveLectureList(PaginationInfo paging, String memName, String lecCode);
	public ServiceResult createLecture(LectureOnlineVO lec);
	public LectureOnlineVO retreieveLecture(String lecoCode);
	public ServiceResult modifyLecture(LectureOnlineVO lec);
	public ServiceResult modifyLectureFile(LectureOnlineVO lec);
	public void removeLecture(String lecoCode);
}
