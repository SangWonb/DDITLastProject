package kr.or.ddit.manager.stats.cotest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.careerup.CotestQuestionVO;
import kr.or.ddit.vo.careerup.CotestResultVO;


@Mapper
public interface CotestStaDAO {

	public List<CotestResultVO> selectDeptAvg();
	public List<CotestResultVO> selectColAvg();
	public CotestResultVO selectHruAvg();
	public List<CotestQuestionVO> selectCate();
	
}
