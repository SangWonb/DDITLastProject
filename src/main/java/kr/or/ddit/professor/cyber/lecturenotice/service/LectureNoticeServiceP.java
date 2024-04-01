package kr.or.ddit.professor.cyber.lecturenotice.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.cyber.LectureAnnouncementVO;

public interface LectureNoticeServiceP {

	
	public List<LectureAnnouncementVO> retrieveNoticeList(PaginationInfo paging,String lecCode, String memName);
	public int countBoard();
	public ServiceResult createNotice(LectureAnnouncementVO notice);
	public LectureAnnouncementVO retreievela(String lecaanNo);
	public ServiceResult modifyNotice(LectureAnnouncementVO la);
	public void removeNotice(String lecannNo);
}
