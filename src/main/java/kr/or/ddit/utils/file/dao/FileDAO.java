package kr.or.ddit.utils.file.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.whole.FileVO;

@Mapper
public interface FileDAO {
	
	public String selectGFNO();
	public int insertFile(FileVO file);
	
	public List<FileVO> selectFiles(String gfNo);
	public int deleteFile(String fileNo);
	public int deleteFiles(String gfNo);
	public int deleteFolder(String gfNo);
	
	public FileVO selectFile(String fileNo);
	
	public int insertGroupFile(String gfNo);

}
