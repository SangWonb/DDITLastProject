package kr.or.ddit.student.cyber.onlinelecture.service;

import java.util.List;

import javax.inject.Inject;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.cyber.AttendVO;
import kr.or.ddit.vo.cyber.LectureOnlineVO;
import kr.or.ddit.vo.cyber.LectureVO;

public interface OnlineLectureServiceS {

	public List<LectureOnlineVO> retrieveLectureList(PaginationInfo paging, String memName, String lecCode);
	public ServiceResult createLecture(AttendVO lec);
	public LectureOnlineVO retreieveLecture(String lecoCode);
}
