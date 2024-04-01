package kr.or.ddit.manager.stu.criteria.attendancecriteria.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.info.AttendCriteriaVO;

@Mapper
public interface AttendCriteriaDAO {
	
	public int updateAttendCriteria(AttendCriteriaVO atc);
	
	public List<AttendCriteriaVO> selectAttendCriteria();
	
	//출결
	public int selectAttendance();
	
	//조퇴
	public int selectLeave();
	
	//지각
	public int selectLate();
	
	//결석
	public int selectAbsent();
	
	//F 한도
	public int selectF();
	
}
