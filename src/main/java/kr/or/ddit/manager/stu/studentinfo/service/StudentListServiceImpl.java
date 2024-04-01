package kr.or.ddit.manager.stu.studentinfo.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.manager.stu.studentinfo.dao.StudentListDAO;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.info.AcademicRecordChangeVO;
import kr.or.ddit.vo.info.CounselVO;
import kr.or.ddit.vo.info.EnrollInvoiceVO;
import kr.or.ddit.vo.info.EnrollRecordVO;
import kr.or.ddit.vo.info.ScholashipRecVO;
import kr.or.ddit.vo.user.MemberVO;

@Service
public class StudentListServiceImpl implements StudentListService{

	@Inject
	StudentListDAO dao;
	
	@Override
	public List<MemberVO> retrieveStudentList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectList(paging);
	}

	@Override
	public List<CounselVO> retrieveCounsList(String memNo) {
		return dao.counsList(memNo);
	}

	@Override
	public List<ScholashipRecVO> retrieveScholaList(String memNo) {
	    return dao.scholaList(memNo);
	}

	@Override
	public List<EnrollInvoiceVO> retrieveEnrollList(String memNo) {
		return dao.enrollList(memNo);
	}

	@Override
	public MemberVO retrieveDetail(String memNo) {
		return dao.selectDetail(memNo);
	}

	@Override
	public List<AcademicRecordChangeVO> retrieveAcademicList(String memNo) {
	     return  dao.academicList(memNo);
	   
	}

}
