package kr.or.ddit.student.careerup.test.cotest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.careerup.CotestQuestionVO;
import kr.or.ddit.vo.careerup.CotestResultVO;
import kr.or.ddit.vo.careerup.CotestTextVO;

@Mapper
public interface CotestDAO {
	
	public List<CotestQuestionVO> selectQ();
	public List<CotestTextVO> selectT();
	public List<CotestResultVO> selectResultList(String memNo);
	public CotestResultVO selectResult(String memNo);
	public int insertResult(CotestResultVO newResult);
	public CotestResultVO selectAvg();
	public CotestResultVO selectDeptAvg(String deptCode);
	public CotestResultVO selesctMyAvg(String memNo);
	public List<CotestQuestionVO> selectCate();

}
