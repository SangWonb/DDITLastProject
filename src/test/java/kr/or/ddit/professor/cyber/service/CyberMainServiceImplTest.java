package kr.or.ddit.professor.cyber.service;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.junit.jupiter.api.Test;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.professor.cyber.dao.CyberMainDAOP;
import kr.or.ddit.vo.cyber.LecOpenListVO;
import kr.or.ddit.vo.cyber.LectureTimeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/conf/*-context.xml")
class CyberMainServiceImplTest {
	
	@Inject
	private CyberMainDAOP cmDao;
	
	
	@Test
	void testMakeTimeTable() {
		String[] selectColor = {"Aquamarine","BlanchedAlmond","BurlyWood","CadetBlue","Coral","DarkCyan","DeepPink","Fuchsia","Khaki","LightCyan","Orange","Plum"};
		String[][] color = new String[54][6];
		String[][] tdName = new String[54][6];
		int[][] rowSpan = new int[54][6];
		
		// 초기값
		for (int[] row : rowSpan) {
		    Arrays.fill(row, 1);
		}
		
//		List<LecOpenListVO> retrieveLOLList = cmDao.selectLOLListP("201104511");
//		for(LecOpenListVO lolvo : retrieveLOLList) {
//			log.info(lolvo.getLolName());
//			List<LectureTimeVO> lectureTimeList = lolvo.getLectureTimeList();
//			for(LectureTimeVO ltvo : lectureTimeList) {
//				log.info("\n{}\n",ltvo);
			}
		}
		
//	}
	
//	@Test
//	void test() {
//		String ltvo = "10001230";
//		
//		int startH = Integer.parseInt(StringUtils.substring(ltvo, 0, 2)); 
//		int startM = Integer.parseInt(StringUtils.substring(ltvo, 2, 4)); 
//		int endH = Integer.parseInt(StringUtils.substring(ltvo, 4, 6)); 
//		int endM = Integer.parseInt(StringUtils.substring(ltvo, 6, 8)); 
//		
//		int start = ((startH - 9) * 2) + (startM/30) + 1;
//		
//		int seH = 0;
//		int seM = 0;
//		if(startM < endM) {
//			seH = ((endH - startH) * 2);
//			seM = (endM-startM)/30;
//		}else {
//			seH = ((endH - startH -1) * 2);
//			seM = ((60 - startM) + endM)/30;
//		}
//		
//		int timeNum = seH + seM;
//		
//		log.info("start : {}",start);
//		log.info("timeNum : {}",timeNum);
//	    
//		
//	}
//	
//	@Test
//	void test2() {
//		
//		int[][] rowSpan = new int[54][6];
//		String[][] tdName = new String[54][6];
//		
//		// 초기값
//		for (int[] row : rowSpan) {
//		    Arrays.fill(row, 1);
//		}
//		int timeCnt = 9;
//		for (int i = 0; i < rowSpan.length; i++) {
//			if(i%6 == 0) {
//		    	rowSpan[i][0] = 6;
//		    	tdName[i][0] = String.valueOf(timeCnt++);
//		    }else {
//		    	rowSpan[i][0] = 0;
//		    }
//		}
//		
//		
//		for(int i=0; i<54; i++) {
//			for(int j=0; j<6; j++) {
//				
//				System.out.printf("%s",tdName[i][j]);
//				
//			}
//			System.out.printf("\n");
//			
//			
//		}
//		
//	}
	
	
//}
