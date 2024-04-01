package kr.or.ddit.student.info.tuition.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.student.info.tuition.dao.TuitionDAOS;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.vo.info.EnrollInvoiceVO;

@Service
public class TuitionServiceImplS implements TuitionServiceS {
	
	@Inject
	TuitionDAOS dao;

	@Override
	public List<EnrollInvoiceVO> retrieveEnrollInvoiceList(String memNo, String deptCode) {
		return dao.selectEnrollInvoiceList(memNo, deptCode);
	}

	@Override
	public EnrollInvoiceVO retrieveEnrollInvoice(String enrlNo) {
		EnrollInvoiceVO enroll = dao.selectEnrollInvoice(enrlNo);
		if(enroll == null) {
			throw new PKNotFoundException(enroll+"등록금 내역이 존재하지 않음");
		}
		return enroll;
	}
	
	@Override
	public EnrollInvoiceVO retrieveBill(String enrlNo) {
		EnrollInvoiceVO bill = dao.selectBill(enrlNo);
		if(bill == null) {
			throw new PKNotFoundException(bill+"등록금 내역이 존재하지 않음");
		}
		return bill;
	}
}