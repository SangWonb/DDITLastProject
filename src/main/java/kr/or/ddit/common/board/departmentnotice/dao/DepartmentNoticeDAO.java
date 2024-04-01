package kr.or.ddit.common.board.departmentnotice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.CommunityVO;

@Mapper
public interface DepartmentNoticeDAO extends AbstractCommonMapper<CommunityVO, String>{
	public int selectTotalRecordDept(String deptCode);
//	public List<CommunityVO> selectDepartmentNoticeList(Map<String, Object> paramMap);
	public List<CommunityVO> selectDepartmentNoticeList(PaginationInfo paging);
	public int updateCount(String cmntCode);
}
