package kr.or.ddit.manager.stu.criteria.graduationcriteria.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.manager.stu.criteria.graduationcriteria.dao.DepartmentCriteriaDAOM;
import kr.or.ddit.manager.stu.criteria.graduationcriteria.dao.EnglishDAO;
import kr.or.ddit.manager.stu.criteria.graduationcriteria.dao.GraduationCriteriaDAOM;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.cyber.DepartmentVO;
import kr.or.ddit.vo.info.EnglishVO;
import kr.or.ddit.vo.info.GraduationCriteriaVO;

@Service
public class GraduationCriteriaServiceImpl implements GraduationCriteriaService {
	
	@Inject
	GraduationCriteriaDAOM dao;
	
	@Inject
	EnglishDAO daoE;
	
	@Inject
	DepartmentCriteriaDAOM daoD;

	@Override
	public List<GraduationCriteriaVO> retrieveGraduationCriteriaList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectList(paging);
	}
	
	@Override
	public GraduationCriteriaVO retrieveGraduationCriteria(String grcrCode) {
		GraduationCriteriaVO detail = dao.select(grcrCode);
		if(detail == null) {
			throw new PKNotFoundException(grcrCode+"졸업요건 기준이 존재하지 않음");
		}
		return detail;
	}

	@Override
	public ServiceResult modifyGraduationCriteria(GraduationCriteriaVO vo) {
		ServiceResult result = null;
		result = dao.update(vo) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		
		DepartmentVO deVO = new DepartmentVO();
		deVO.setDeptCode(vo.getDeptCode());
		deVO.setDeptThesis(vo.getDeptThesis());
		deVO.setDeptTest(vo.getDeptTest());
		
		deVO.setDeptMrc(vo.getDeptMrc());
		deVO.setDeptMoc(vo.getDeptMoc());
		deVO.setDeptCrc(vo.getDeptCrc());
		deVO.setDeptCoc(vo.getDeptCoc());
		daoD.update(deVO);
		return result;
	}

	@Override
	public ServiceResult createGraduationCriteria(GraduationCriteriaVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ServiceResult removeGraduationCriteria(String grcrCode) {
		// TODO Auto-generated method stub
		return null;
	}

}
