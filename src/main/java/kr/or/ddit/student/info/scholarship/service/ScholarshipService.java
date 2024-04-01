package kr.or.ddit.student.info.scholarship.service;

import java.util.List;

import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.info.ScholashipRecVO;

public interface ScholarshipService {
	public List<ScholashipRecVO> retrieveScholashipRecList(String memNo);
}
