package kr.or.ddit.professor.cyber.service;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.ddit.professor.cyber.dao.CyberMainDAOP;
import kr.or.ddit.student.cyber.dao.CyberMainDAOS;
import kr.or.ddit.student.info.signupclasses.vo.SignUpVO;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.cyber.LecOpenListVO;
import kr.or.ddit.vo.cyber.LectureTimeVO;
import kr.or.ddit.vo.cyber.LectureVO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.MemberVOWrapper;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class CyberMainServiceImpl implements CyberMainService {
	
	@Inject
	private CyberMainDAOP cmDao;
	@Inject
	private CyberMainDAOS cmDaoS;
	
	@Override
	public List<LecOpenListVO> retrieveLOLList() {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		MemberVOWrapper principal = (MemberVOWrapper)authentication.getPrincipal();
		MemberVO realUser = principal.getRealUser();
		SignUpVO signUp = settingSemesterAndYear(new SignUpVO());
		return cmDao.selectLOLListP(realUser.getMemNo(),signUp);
	}
	
	@Override
	public List<LecOpenListVO> retrieveLOLListS() {
		SignUpVO signUp = settingSemesterAndYear(new SignUpVO());
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		MemberVOWrapper principal = (MemberVOWrapper)authentication.getPrincipal();
		MemberVO realUser = principal.getRealUser();
		
		return cmDaoS.selectLOLListS(realUser.getMemNo(),signUp);
	}

	//10101210 >> 몇시사작 ~ 몇시간 몇분 수업인지
	//rowspan 설정
	@Override
	public Map<String, Integer> timeChange(String ltvo) {
		// 1시간 = 30*2 = 2칸
		// 30분 = 1칸
		
		// 시작 index
		// 수업 시간
		
		int startH = Integer.parseInt(StringUtils.substring(ltvo, 0, 2)); 
		int startM = Integer.parseInt(StringUtils.substring(ltvo, 2, 4)); 
		int endH = Integer.parseInt(StringUtils.substring(ltvo, 4, 6)); 
		int endM = Integer.parseInt(StringUtils.substring(ltvo, 6, 8)); 
		
		int start = ((startH - 9) * 2) + (startM/30) + 1;
		
		int seH = 0;
		int seM = 0;
		if(startM < endM) {
			seH = ((endH - startH) * 2);
			seM = (endM-startM)/30;
		}else {
			seH = ((endH - startH -1) * 2);
			seM = ((60 - startM) + endM)/30;
		}
		
		int timeNum = seH + seM;
		
		Map<String, Integer> timeInfo = new HashMap<String, Integer>();
		timeInfo.put("start", start);
		timeInfo.put("timeNum", timeNum);
		
		return timeInfo;
	}

	@Override
	public List<LectureVO> retrieveLectureListP(String pmemNo, PaginationInfo paging) {
		SignUpVO signUp = settingSemesterAndYear(new SignUpVO());
		
		int totalRecord = cmDao.selectTotalRecord(pmemNo,signUp);
		paging.setTotalRecord(totalRecord);
		return cmDao.selectLectureListP(pmemNo, paging,signUp);
		
	}

	@Override
	public List<LectureVO> retrieveLectureListS(String smemNo, PaginationInfo paging) {
		SignUpVO signUp = settingSemesterAndYear(new SignUpVO());
		
		int totalRecord = cmDaoS.selectTotalRecord(smemNo,signUp);
		paging.setTotalRecord(totalRecord);
		return cmDaoS.selectLectureListS(smemNo, paging,signUp);
	}
	
	/**
	 * 오늘날의 년도와 학기를 계산해서 넣어줌
	 * @param signUp
	 * @return
	 */
	public SignUpVO settingSemesterAndYear(SignUpVO signUp) {
		
		int year = LocalDate.now().getYear();
		int month = LocalDate.now().getMonthValue();
		String currentSemester = null;
		switch (month) {
		case 1:case 2:case 3:case 4:case 5:case 6:
			currentSemester = "1학기";
			break;
		default:
			currentSemester = "2학기";
			break;
		}
		signUp.setYear(year);
		signUp.setSemester(currentSemester);
		
		return signUp;
	}
	
}
