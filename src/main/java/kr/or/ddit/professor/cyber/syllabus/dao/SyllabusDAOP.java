package kr.or.ddit.professor.cyber.syllabus.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.cyber.LecturePlanVO;

@Mapper
public interface SyllabusDAOP extends AbstractCommonMapper<LecturePlanVO, String> {

}
