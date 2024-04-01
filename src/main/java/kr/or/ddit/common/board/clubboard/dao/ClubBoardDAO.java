package kr.or.ddit.common.board.clubboard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.common.ClubEnrollVO;
import kr.or.ddit.vo.common.ClubRecomVO;
import kr.or.ddit.vo.common.ClubVO;

@Mapper
public interface ClubBoardDAO extends AbstractCommonMapper<ClubVO, String>{

	/**
	 * @return 1순위,2순위,3순위 포함한 LIST 
	 */
	public ClubRecomVO selectClubRecom(ClubRecomVO newRecom);
	/**
	 * 승인 완료된 클럽의 개설번호 생성.
	 * @return
	 */
	public String selectClubNo();
	/**
	 * 조회수 업데이트
	 * @return
	 */
	public int updateClubViews();
}
