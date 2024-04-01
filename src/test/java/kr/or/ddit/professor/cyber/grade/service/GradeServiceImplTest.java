package kr.or.ddit.professor.cyber.grade.service;

import static org.junit.jupiter.api.Assertions.*;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/conf/*-context.xml")
class GradeServiceImplTest {
	
	@Inject
	GradeService service;
	
	@Test
	void testRetrieveGradeList() {
		fail("Not yet implemented");
	}

	@Test
	void testModifyGradeList() {
		service.modifyGradeList("LEC002");
	}

	@Test
	void testModifyGrade() {
		fail("Not yet implemented");
	}

	@Test
	void testRetrieveGetScores() {
		fail("Not yet implemented");
	}

	@Test
	void testRetrieveLecturePlan() {
		fail("Not yet implemented");
	}

}
