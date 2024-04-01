package kr.or.ddit.utils.abMapper;

import java.util.List;

import kr.or.ddit.utils.paging.PaginationInfo;


public interface AbstractCommonMapper3<T, P, Z> {
	public int insert(T newData);
	public T select(P pk1, Z pk2);
	public int selectTotalRecord(PaginationInfo paging);
	public List<T> selectList(PaginationInfo paging);
	public int update(T target);
	public int delete(P pk1, Z pk2);
}
