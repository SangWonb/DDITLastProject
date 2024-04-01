package kr.or.ddit.manager.stu.studentinfo.service;

import java.util.List;

import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.info.AcademicRecordChangeVO;
import kr.or.ddit.vo.info.CounselVO;
import kr.or.ddit.vo.info.EnrollInvoiceVO;
import kr.or.ddit.vo.info.EnrollRecordVO;
import kr.or.ddit.vo.info.ScholashipRecVO;
import kr.or.ddit.vo.user.MemberVO;

public interface StudentListService {

	public List<MemberVO> retrieveStudentList(PaginationInfo paging);
	public List<CounselVO> retrieveCounsList(String memNo);
	public List<ScholashipRecVO> retrieveScholaList(String memNo);
	public List<EnrollInvoiceVO> retrieveEnrollList(String memNo);
	public MemberVO retrieveDetail(String memNo);
	public List<AcademicRecordChangeVO> retrieveAcademicList(String memNo);
}
