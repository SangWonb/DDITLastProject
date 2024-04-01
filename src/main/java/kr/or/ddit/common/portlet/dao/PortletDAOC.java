package kr.or.ddit.common.portlet.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.common.PortletVO;

@Mapper
public interface PortletDAOC {

	public void insertPortlet(PortletVO por);
	
}
