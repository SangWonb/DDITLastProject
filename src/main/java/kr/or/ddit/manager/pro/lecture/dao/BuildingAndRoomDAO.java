package kr.or.ddit.manager.pro.lecture.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.whole.BuildingVO;

@Mapper
public interface BuildingAndRoomDAO {
	public List<BuildingVO> selectBuildingNoList(); 
	public List<BuildingVO> selectRoomNoList(); 
}
