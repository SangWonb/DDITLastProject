package kr.or.ddit.student.info.counsel.startcounsel.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.info.CounselVO;

@Mapper
public interface CounselSDAO extends AbstractCommonMapper<CounselVO, String>{

	public List<CounselVO> selectCounselList(String memNo);
	public CounselVO selectCounsel(String counsNo);
	public int selectTotal(String memNo);
	public int selectWaiting(String memNo);
	
}
