package kr.or.ddit.professor.info.lecture.lectureappl.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.cyber.LecOpenListVO;
import kr.or.ddit.vo.cyber.LecturePlanVO;

@Mapper
public interface LecturePlanOpenDAOP extends AbstractCommonMapper<LecturePlanVO, String>{

}
