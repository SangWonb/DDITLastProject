package kr.or.ddit;

import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;
import org.springframework.transaction.annotation.Transactional;

@Transactional // 테스트에서 커밋된 데이터가 다시 롤백됨 -- 반드시 필요한 어노테이션
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/conf/*-context.xml")
public abstract class AbstractRootContextTest {

}
	