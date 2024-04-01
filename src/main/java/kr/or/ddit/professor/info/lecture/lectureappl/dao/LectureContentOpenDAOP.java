package kr.or.ddit.professor.info.lecture.lectureappl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.cyber.LectureContentVO;

@Mapper
public interface LectureContentOpenDAOP extends AbstractCommonMapper<LectureContentVO, String>{
	public List<LectureContentVO> selectListContent(String lpCode);
}
