package kr.or.ddit.manager.com.popup.mainpopup.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.common.PopupVO;

@Mapper
public interface MainPopupDAOM extends AbstractCommonMapper<PopupVO, String>{
	public List<PopupVO> selectPopupList();
}
