package kr.or.ddit.professor.cyber.lecturematerial.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.cyber.LectureDataVO;

@Mapper
public interface LectureDataDAOP{
	public int selectTotalRecord(@Param("paging")PaginationInfo paging, @Param("lecCode") String lecCode);
	public List<LectureDataVO> selectLectureDataList(@Param("paging") PaginationInfo paging, @Param("lecCode") String lecCode);
	public LectureDataVO selectLectureData(String lecDatano);
	public int insertLectureData(LectureDataVO vo);
	public int updateLectureData(LectureDataVO vo);
	public int deleteLectureData(String lecDatano);
}
