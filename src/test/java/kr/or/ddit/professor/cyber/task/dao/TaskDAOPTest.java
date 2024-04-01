package kr.or.ddit.professor.cyber.task.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.vo.cyber.TaskVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/conf/*-context.xml")
class TaskDAOPTest {
	
	@Inject
	TaskDAO dao;

	@Test
	void testSelectTaskList() {
		List<TaskVO> selectTaskList = dao.selectTaskList("LEC004", "ST03");
		for(TaskVO t :selectTaskList) {
			log.info("\n\n\n=== 과제 목록 ===\n{}\n\n\n",t);			
		}
	}
	
	@Test
	void testSelectTask() {
		TaskVO selectTask = dao.selectTask("TA0000016");
		log.info("\n\n\n=== 과제 ===\n{}\n\n\n",selectTask);			
	}

	@Test
	void testUpdateTask() {
		fail("Not yet implemented");
	}

	@Test
	void testDeleteTask() {
		fail("Not yet implemented");
	}

	@Test
	void testInsertTask() {
		fail("Not yet implemented");
	}

	@Test
	void testUploadTask() {
		fail("Not yet implemented");
	}

}
