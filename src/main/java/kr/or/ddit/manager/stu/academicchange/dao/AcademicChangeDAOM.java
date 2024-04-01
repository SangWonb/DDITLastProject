package kr.or.ddit.manager.stu.academicchange.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.info.AcademicRecordChangeVO;

@Mapper
public interface AcademicChangeDAOM extends AbstractCommonMapper<AcademicRecordChangeVO, String>{
	public List<AcademicRecordChangeVO> selectAcaRecordList();
}
