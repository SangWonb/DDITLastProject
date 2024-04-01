package kr.or.ddit.professor.info.counsel.startcounsel.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.info.CounselVO;
import kr.or.ddit.vo.user.StudentVO;

@Mapper
public interface CounselPDAO extends AbstractCommonMapper<CounselVO, String> {
	
	public List<CounselVO> selectCounsList(String pmemNo);
	public int updateCounsel(String counsNo);
	public StudentVO selectStudent(String counsNo);
	public CounselVO selectCount(CounselVO couns);

	
}
