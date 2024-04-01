package kr.or.ddit.student.careerup.test.cotest.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.careerup.CotestQuestionVO;
import kr.or.ddit.vo.careerup.CotestResultVO;
import kr.or.ddit.vo.careerup.CotestTextVO;

public interface CotestService {

	public List<CotestQuestionVO> retrieveQ();
	public List<CotestTextVO> retrieveT();
	public List<CotestResultVO> retrieveResultList(String memNo);
	public CotestResultVO retrieveResult(String memNo);
	public ServiceResult addResult(CotestResultVO newResult);
	public CotestResultVO retrieveAvg();
	public CotestResultVO retrieveDeptAvg(String deptCode);
	public CotestResultVO retrieveMyAvg(String memNo);
	public List<CotestQuestionVO> retrieveCate();
}
