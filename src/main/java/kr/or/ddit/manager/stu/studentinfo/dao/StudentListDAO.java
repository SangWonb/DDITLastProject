package kr.or.ddit.manager.stu.studentinfo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.info.AcademicRecordChangeVO;
import kr.or.ddit.vo.info.CounselVO;
import kr.or.ddit.vo.info.EnrollInvoiceVO;
import kr.or.ddit.vo.info.EnrollRecordVO;
import kr.or.ddit.vo.info.ScholashipRecVO;
import kr.or.ddit.vo.user.MemberVO;

@Mapper
public interface StudentListDAO extends AbstractCommonMapper<MemberVO, String> {
	
	public List<CounselVO> counsList(String memNo);
	public List<ScholashipRecVO> scholaList(String memNo);
	public List<EnrollInvoiceVO> enrollList(String memNo);
	public MemberVO selectDetail(String memNo);
	public List<AcademicRecordChangeVO> academicList(String memNo);

}
