package kr.or.ddit.student.info.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.student.info.dao.InfoMainDAO;
import kr.or.ddit.vo.common.CalendarVO;

@Service
public class InfoMainServiceImpl implements InfoMainService {

	@Inject
	private InfoMainDAO dao;
	
	@Override
	public List<CalendarVO> retrieveAList() {
		return dao.selectAList();
	}

}
