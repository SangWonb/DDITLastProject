package kr.or.ddit.vo.user;

import static org.junit.jupiter.api.Assertions.*;

import java.util.Arrays;

import org.junit.jupiter.api.Test;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

class MemberVOWrapperTest {

	@Test
	public void testConstructorWithNullArgument() {
		// Given
		MemberVO nullMemberVO = null;

		// When
		new MemberVOWrapper(nullMemberVO);

		// Then
		// IllegalArgumentException should be thrown
	}

	@Test
	public void testConstructorWithValidArgument() {
		// Given
		MemberVO memberVO = new MemberVO();
		memberVO.setMemNo("testId");
		memberVO.setMemPass("testPass");
		memberVO.setMemRoles(Arrays.asList("ROLE_S"));

		// When
		MemberVOWrapper memberVOWrapper = new MemberVOWrapper(memberVO);

		// Then
		assertEquals("testId", memberVOWrapper.getUsername());
		assertEquals("testPass", memberVOWrapper.getPassword());
		assertEquals(1, memberVOWrapper.getAuthorities().size());
		assertEquals(new SimpleGrantedAuthority("ROLE_S"), memberVOWrapper.getAuthorities().iterator().next());
		assertEquals(memberVO, memberVOWrapper.getRealUser());
	}

}
