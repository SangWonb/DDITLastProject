package kr.or.ddit.student.careerup.test.cotest.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.careerup.test.cotest.dao.CotestDAO;
import kr.or.ddit.vo.careerup.CotestQuestionVO;
import kr.or.ddit.vo.careerup.CotestResultVO;
import kr.or.ddit.vo.careerup.CotestTextVO;

@Service
public class CotestServiceImpl implements CotestService {

	@Inject
	private CotestDAO dao;
	
	@Override
	public List<CotestQuestionVO> retrieveQ() {
		return dao.selectQ();
	}

	@Override
	public List<CotestTextVO> retrieveT() {
		return dao.selectT();
	}

	@Override
	public List<CotestResultVO> retrieveResultList(String memNo) {
		return dao.selectResultList(memNo);
	}

	@Override
	public CotestResultVO retrieveResult(String memNo) {
		return dao.selectResult(memNo);
	}

	@Override
	public ServiceResult addResult(CotestResultVO newResult) {
		return dao.insertResult(newResult)>0?ServiceResult.OK:ServiceResult.FAIL;
	}

	@Override
	public CotestResultVO retrieveAvg() {
		return dao.selectAvg();
	}

	@Override
	public CotestResultVO retrieveDeptAvg(String deptCode) {
		return dao.selectDeptAvg(deptCode);
	}

	@Override
	public CotestResultVO retrieveMyAvg(String memNo) {
		return dao.selesctMyAvg(memNo);
	}

	@Override
	public List<CotestQuestionVO> retrieveCate() {
		return dao.selectCate();
	}



}
