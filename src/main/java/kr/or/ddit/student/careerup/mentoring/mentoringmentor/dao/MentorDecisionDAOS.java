package kr.or.ddit.student.careerup.mentoring.mentoringmentor.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.careerup.MenteeVO;

@Mapper
public interface MentorDecisionDAOS extends AbstractCommonMapper<MenteeVO, String> {
	public MenteeVO selectRecord(String menteeNo);
	public List<MenteeVO> selectDecisionList(String smemNo);
	public MenteeVO selectStatus(String menteeNo);
}
