package kr.or.ddit.manager.com.popup.mainpopup.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.exception.UncheckedException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.manager.com.popup.mainpopup.dao.MainPopupDAOM;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.utils.file.service.FTPFileService;
import kr.or.ddit.vo.common.PopupVO;

@Service
public class MainPopupServiceImplM implements MainPopupServiceM {

	@Inject
	MainPopupDAOM dao;
	@Inject
	private FTPFileService fService;
	
	@Override
	public List<PopupVO> retrievePopupList() {
		return dao.selectPopupList();
	}
	
	@Override
	public PopupVO retrievePopup(String popupCode) {
		PopupVO popup = dao.select(popupCode);
		if(popup == null) {
			throw new PKNotFoundException(popupCode+"팝업이 존재하지 않음");
		}
		return popup;
	}

	@Override
	@Transactional
	public ServiceResult modifyPopup(PopupVO vo) {
		try {
			if(dao.update(vo) > 0) {
				if (vo.getPopFiles()[0].getSize() > 0)
					fService.sendFiles(vo.getGfNo(), vo.getPopFiles());
				return ServiceResult.OK;
			}else {
				return ServiceResult.FAIL;
			}
		} catch (Exception e) {
			throw new UncheckedException(e);
		}
	}

	@Override
	@Transactional
	public ServiceResult createPopup(PopupVO vo) {
		try {
			String gfNo = "00_POPUP";
			vo.setGfNo(gfNo);
			
			if(dao.insert(vo) > 0) {
				if (vo.getPopFiles().length > 0 && vo.getPopFiles()[0].getSize() > 0)
					fService.sendFiles(vo.getGfNo(), vo.getPopFiles());
				return ServiceResult.OK;
			}else {
				return ServiceResult.FAIL;
			}
		}catch (Exception e) {
			throw new UncheckedException(e);
		}
	}

	@Override
	@Transactional
	public ServiceResult removePopup(String popupCode) {
		try {
			if(dao.delete(popupCode) > 0) {
				return ServiceResult.FAIL;
			}
		}catch (Exception e) {
			throw new UncheckedException(e);
		}
		return ServiceResult.FAIL;
	}
}
