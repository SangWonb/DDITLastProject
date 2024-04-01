package kr.or.ddit.student.careerup.employment.coverletter.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.careerup.employment.coverletter.dao.CoverLetterDetailDAO;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.careerup.CoverLetterDetailVO;
import kr.or.ddit.vo.careerup.CoverLetterVO;
import kr.or.ddit.vo.user.StudentVO;

@Service
public class CoverLetterDetailServiceImpl implements CoverLetterDetailService{

	@Inject 
	private CoverLetterDetailDAO dao;
	
	@Override
	public List<CoverLetterVO> selectList(String smemNo) {
		List<CoverLetterVO> ttt = dao.selectList(smemNo);
		return ttt;
	}

	@Override
	public List<CoverLetterDetailVO> selectDetail(String clNo) {
		List<CoverLetterDetailVO> coverList = dao.selectDetail(clNo);
		if(coverList==null)
			throw new PKNotFoundException(String.format("%s 에 해당하는 자기소개서 없음.", clNo));
		return coverList;
	}

	@Override
	public ServiceResult insertCoverResult(CoverLetterDetailVO cldNo) {
		
		String cover = dao.selectCover();
		cldNo.setClNo(cover);
		String smemNo = cldNo.getSmemNo();
		
		CoverLetterVO cl = new CoverLetterVO();
		cl.setClNo(cover);
		cl.setSmemNo(smemNo);
		
		try {
			if(dao.insertCover(cl) < 1) return ServiceResult.FAIL;
			return dao.insertCoverLetter(cldNo) > 0 ? ServiceResult.OK:ServiceResult.FAIL;

	    } catch (Exception e) {
	        e.printStackTrace(); 
	        return ServiceResult.FAIL;
	    }
	}
	
	//--------------------------
	@Override
	public ServiceResult insertCoverResult(CoverLetterDetailVO[] formDataArray, StudentVO stu) {
		
		String cover = dao.selectCover();
		CoverLetterVO cl = new CoverLetterVO();
		cl.setClNo(cover);
		cl.setSmemNo(stu.getSmemNo());
		 
		if(dao.insertCover(cl) < 1) return ServiceResult.FAIL;
		 
		int cnt = 0;
		try {
			 for (CoverLetterDetailVO formData : formDataArray) {
				 formData.setSmemNo(stu.getSmemNo());
				 formData.setClNo(cover);
				 String smemNo = formData.getSmemNo();
				 
				 cnt += dao.insertCoverLetter(formData);
					 
			 }
			 return cnt == formDataArray.length ? ServiceResult.OK:ServiceResult.FAIL;
		} catch (Exception e) {
			e.printStackTrace(); 
			return ServiceResult.FAIL;
		}

	}

	@Override
	public ServiceResult updateCoverLetter(CoverLetterDetailVO cldNo) {
		int result = dao.updateCoverLetter(cldNo);
		return result>0?ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult deleteCoverLetter(String clNo) {
		int result = dao.deleteCoverLetter(clNo);
		return result>0?ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult deleteCover(String clNo) {
		int result = dao.deleteCover(clNo);
		return result>0?ServiceResult.OK : ServiceResult.FAIL;
	}

}
