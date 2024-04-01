package kr.or.ddit.member.login.dao;

import static org.junit.jupiter.api.Assertions.*;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/conf/*-context.xml")
class NewStudentIDDAOTest {
	
	@Inject
	NewStudentIDDAO dao;
	
	@Test
	void test() {
		
		StudentVO stu = new StudentVO();
		stu.setMemReg1("980203");
		stu.setStuEnrollno("2023030001");
		
		StudentVO student = dao.select(stu);
		log.info("\n\n\n\n\n\n==student==\n{}\n\n\n\n\n\n",student);
		
		
	}

}
