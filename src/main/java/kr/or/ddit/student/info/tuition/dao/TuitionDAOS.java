package kr.or.ddit.student.info.tuition.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.info.EnrollInvoiceVO;

@Mapper
public interface TuitionDAOS {
	public List<EnrollInvoiceVO> selectEnrollInvoiceList
						(@Param("memNo") String memNo, @Param("deptCode")String deptCode);
	public EnrollInvoiceVO selectEnrollInvoice(String enrlNo);
	public EnrollInvoiceVO selectBill(String enrlNo);
}
