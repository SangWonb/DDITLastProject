package kr.or.ddit.manager.com.popup.mainpopup.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.common.PopupVO;

public interface MainPopupServiceM {
	public PopupVO retrievePopup(String popupCode);

	public List<PopupVO> retrievePopupList();
	
	public ServiceResult modifyPopup(PopupVO vo);
	
	public ServiceResult createPopup(PopupVO vo);
	
	public ServiceResult removePopup(String popupCode);
}
