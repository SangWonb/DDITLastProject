package kr.or.ddit.student.careerup.mentoring.server.model;

import java.util.Set;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @Class Name : UsersMessage.java
 * @Description : 사용자 리스트를 담는 VO
 */
public class UsersMessage implements Message {
	/**
	 * 연결되어있는 사용자들
	 */
	private Set<String> users = null;

	public UsersMessage(Set<String> users) {
		this.users = users;
	}

	public Set<String> getUsers() {
		return users;
	}

	public void setUsers(Set<String> users) {
		this.users = users;
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.DEFAULT_STYLE);
	}
}
