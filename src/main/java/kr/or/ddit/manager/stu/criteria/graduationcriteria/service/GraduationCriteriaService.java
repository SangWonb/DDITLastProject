package kr.or.ddit.manager.stu.criteria.graduationcriteria.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.info.GraduationCriteriaVO;

public interface GraduationCriteriaService {
	
	public GraduationCriteriaVO retrieveGraduationCriteria(String grcrCode);

	public List<GraduationCriteriaVO> retrieveGraduationCriteriaList(PaginationInfo paging);
	
	public ServiceResult modifyGraduationCriteria(GraduationCriteriaVO vo);
	
	public ServiceResult createGraduationCriteria(GraduationCriteriaVO vo);
	
	public ServiceResult removeGraduationCriteria(String grcrCode);
}
