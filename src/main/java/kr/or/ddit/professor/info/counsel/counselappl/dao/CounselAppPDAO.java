package kr.or.ddit.professor.info.counsel.counselappl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.info.CounselVO;

@Mapper
public interface CounselAppPDAO extends AbstractCommonMapper<CounselVO, String>{
	
	public String selectCounsNo(String memNo);
	public int selectWaitingCount(String pmemNo);
	public List<CounselVO> selectCounselList(String pmemNo);

}
