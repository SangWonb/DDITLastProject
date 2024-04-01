package kr.or.ddit.member.dao;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.user.ManagerVO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.MemberVOWrapper;
import kr.or.ddit.vo.user.ProfessorVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository("userDetailService")
public class MemberDAOImpl implements UserDetailsService{

	@Inject
	private MemberDAO dao;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		MemberVO member = dao.selectMemberByUsername(username);
		if(member == null) {
			throw new UsernameNotFoundException(String.format("%s 사용자 없음.", username));
		}
		
		return new MemberVOWrapper(member); //어뎁터 사용해서 UserDetails로 내보내기
	}

}
