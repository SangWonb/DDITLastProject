package kr.or.ddit.manager.stats.cotest.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.manager.stats.cotest.dao.CotestStaDAO;
import kr.or.ddit.vo.careerup.CotestQuestionVO;
import kr.or.ddit.vo.careerup.CotestResultVO;

@Service
public class CotestStaServiceImpl implements CotestStaService {

	@Inject
	private CotestStaDAO dao;
	
	@Override
	public List<CotestResultVO> retrieveDeptAvg() {
		return dao.selectDeptAvg();
	}

	@Override
	public List<CotestResultVO> retrieveColAvg() {
		return dao.selectColAvg();
	}

	@Override
	public CotestResultVO retrieveHruAvg() {
		return dao.selectHruAvg();
	}
	
	@Override
	public List<CotestQuestionVO> retrieveCate() {
		return dao.selectCate();
	}

}
