package kr.or.ddit.professor.cyber.task.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.vo.cyber.TaskSubmitVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/conf/*-context.xml")
class TaskSubmitDAOTest {
	
	@Inject
	TaskSubmitDAO dao;
	
	
	@Test
	void testSelectTaskSubmitList() {
		
		List<TaskSubmitVO> taskSubmitList = dao.selectTaskSubmitList("TA0000016");
		
		for(TaskSubmitVO tasksubmit :taskSubmitList)
			log.info("===={}",tasksubmit);
		
	}
	

	@Test
	void testSelectTaskSubmit() {
		fail("Not yet implemented");
	}

	@Test
	void testInsertTaskSubmit() {
		fail("Not yet implemented");
	}

	@Test
	void testTaskEvaluation() {
		fail("Not yet implemented");
	}

	@Test
	void testTaskSubmit() {
		fail("Not yet implemented");
	}

}
