	package kr.or.ddit.student.cyber.lecturenotice.service;
	
	import java.util.List;
	
	import javax.inject.Inject;
	import javax.transaction.Transactional;
	
	import org.apache.commons.lang3.exception.UncheckedException;
	import org.springframework.stereotype.Service;
	
	import kr.or.ddit.enumpkg.ServiceResult;
	import kr.or.ddit.professor.cyber.lecturenotice.dao.LectureNoticeDAOP;
	import kr.or.ddit.utils.file.service.FTPFileService;
	import kr.or.ddit.utils.paging.PaginationInfo;
	import kr.or.ddit.vo.cyber.LectureAnnouncementVO;
	
	@Service
	public class LectureNoticeServiceImplS implements LectureNoticeServiceS {
	
		@Inject
		LectureNoticeDAOP dao;
		
		@Inject
		private FTPFileService serviceF; // 파일 서비스 호출
		
		
		@Override
		public List<LectureAnnouncementVO> retrieveNoticeList(PaginationInfo paging,String lecCode, String memName) {
			int totalRecord = dao.selectTotalRecord(paging);
			paging.setTotalRecord(totalRecord);
			return dao.selectListAnnoun(paging, lecCode,memName);
		}
		
		@Override
		public int countBoard() {
			return dao.selectTodayRecord();
		}
		
//		@Override
//		@Transactional
//		public ServiceResult createNotice(LectureAnnouncementVO notice) {
////			try {
////				String gfNo = serviceF.selecStringGFNO();
////				notice.setGfNo(gfNo);
////		         if(dao.insertNotice(notice) > 0) {
////		            if (notice.getLaFiles() != null && notice.getLaFiles().length > 0 && notice.getLaFiles()[0].getSize() > 0)
////		               serviceF.sendFiles(notice.getGfNo(),notice.getLaFiles());
////		            
////		            if (notice.getLaFiles()[0].getSize() > 0)
////		               serviceF.sendFiles(notice.getGfNo(), notice.getLaFiles());
////		            return ServiceResult.OK;
////		         }else {
////		            return ServiceResult.FAIL;
////		         }
////		      } catch (Exception e) {
////		         throw new UncheckedException(e);
////		      }
//			
//			return dao.insertNotice(notice)>0?ServiceResult.OK:ServiceResult.FAIL;
//			
			
			
//		}
	
		@Override
		public LectureAnnouncementVO retreievela(String lecaanNo) {
			return dao.select(lecaanNo);
		}
		
//		@Override
//		public ServiceResult modifyNotice(LectureAnnouncementVO la) {
//			ServiceResult result = dao.update(la) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
//			if (result == ServiceResult.OK) {
//
//			}
//			return result;
//		
//		}
		
//		@Override
//		public void removeNotice(String lecannNo) {
//
//			dao.delete(lecannNo);
//		}
	}
