package kr.or.ddit.student.info.tuition.service;

import java.util.List;

import kr.or.ddit.vo.info.EnrollInvoiceVO;

public interface TuitionServiceS {
	public List<EnrollInvoiceVO> retrieveEnrollInvoiceList(String memNo, String deptCode);
	public EnrollInvoiceVO retrieveEnrollInvoice(String enrlNo);
	EnrollInvoiceVO retrieveBill(String enrlNo);
}
