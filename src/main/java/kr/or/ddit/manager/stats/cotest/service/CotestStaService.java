package kr.or.ddit.manager.stats.cotest.service;

import java.util.List;

import kr.or.ddit.vo.careerup.CotestQuestionVO;
import kr.or.ddit.vo.careerup.CotestResultVO;

public interface CotestStaService {
	
	public List<CotestResultVO> retrieveDeptAvg();
	public List<CotestResultVO> retrieveColAvg();
	public CotestResultVO retrieveHruAvg();
	public List<CotestQuestionVO> retrieveCate();

}
