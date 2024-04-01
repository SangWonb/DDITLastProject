package kr.or.ddit.professor.cyber.syllabus.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.cyber.LecturePlanVO;

public interface SyllabusServiceP {
	
	/**
	 * 강의계획서 등록
	 * @param syllabus
	 * @return
	 */
	public ServiceResult createSyllabus(LecturePlanVO syllabus);
	
	/**
	 * 강의계획서 수정
	 * @param syllabus
	 * @return
	 */
	public ServiceResult modifySyllabus(LecturePlanVO syllabus);
	
	/**
	 * 강의계획서 상세 조회
	 * @param lpCd
	 * @return
	 */
	public LecturePlanVO retrieveSyllabus(String lecCode);
	
	/**
	 * 강의계획서 전체 조회
	 * @param paging
	 * @return
	 */
	public List<LecturePlanVO> retrieveSyllabusList(PaginationInfo paging);
}
