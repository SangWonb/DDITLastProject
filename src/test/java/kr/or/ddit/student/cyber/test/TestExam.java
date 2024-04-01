package kr.or.ddit.student.cyber.test;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import lombok.extern.slf4j.Slf4j;

@Slf4j
class TestExam {


	@Test
	void test() {
		int b = 10;
		double c = 2.0;

		log.info("결과=>{}",b/c);
	}

}
