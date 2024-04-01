package kr.or.ddit.common.portlet.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.portlet.dao.PortletDAOC;
import kr.or.ddit.vo.common.PortletVO;

@Service
public class PortletSaveServiceImpl implements PortletSaveService {
	
	@Inject
	PortletDAOC dao;
	

	
	
	@Override
	public void createPortlet(PortletVO[] por) {
		
		
		for(int i=0; i<por.length; i++) {
			dao.insertPortlet(por[i]);
		}
	}

}
