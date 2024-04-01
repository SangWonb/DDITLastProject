package kr.or.ddit.student.careerup.mentoring.mentoringmentee.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.careerup.MenteeVO;

@Mapper
public interface MenteeApplDAOS extends AbstractCommonMapper<MenteeVO, String> {
	public MenteeVO selectRecord(String menteeNo);
	public List<MenteeVO> selectMenteeList(String memNo);
}
