package kr.or.ddit.student.careerup.mentoring.mentoringmentor.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * 동적으로 반려 사유를 생성
 * @author PC-11
 */
@Mapper
public interface RejectSelectBox {
	public List<Map<String, Object>> selectRejectList();
	public List<Map<String, Object>> selectSubbjectRejectList();
	public List<Map<String, Object>> selectAcademicChangeRejectList();
}
