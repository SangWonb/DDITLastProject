package kr.or.ddit.utils.abMapper;

import java.util.List;

import kr.or.ddit.utils.paging.PaginationInfo;

public interface AbstractCommonMapper<T, P> {
	public int insert(T vo);
	public T select(P pk);
	public int selectTotalRecord(PaginationInfo paging);
	public int selectTodayRecord();
	public List<T> selectList(PaginationInfo paging);
	public int update(T target);
	public int delete(P pk);
}
