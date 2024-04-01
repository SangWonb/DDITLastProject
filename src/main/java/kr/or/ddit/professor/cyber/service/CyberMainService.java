package kr.or.ddit.professor.cyber.service;


import java.util.List;
import java.util.Map;

import kr.or.ddit.professor.cyber.dao.CyberMainDAOP;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.cyber.LecOpenListVO;
import kr.or.ddit.vo.cyber.LectureVO;

public interface CyberMainService {
	
	/**
	 * 시간표 (교수용)
	 * @return
	 */
	public List<LecOpenListVO> retrieveLOLList();
	/**
	 * 10101210 >> 몇시사작 ~ 몇시간 몇분 수업인지
	 * @param ltvo
	 * @return
	 */
	public Map<String, Integer> timeChange(String ltvo);
	/**
	 * 강의 목록 (교수용)
	 * @param pmemNo
	 * @param paging
	 * @return
	 */
	public List<LectureVO> retrieveLectureListP(String pmemNo,PaginationInfo paging); 
	/**
	 * 시간표 (학생용)
	 * @return
	 */
	public List<LecOpenListVO> retrieveLOLListS();
	/**
	 * 강의 목록 (교수용)
	 * @param smemNo
	 * @param paging
	 * @return
	 */
	public List<LectureVO> retrieveLectureListS(String smemNo,PaginationInfo paging); 
}
