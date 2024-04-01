package kr.or.ddit.professor.cyber.teamproject.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.commons.io.monitor.FileAlterationListener;
import org.apache.commons.lang3.exception.UncheckedException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mchange.v2.management.OperationKey;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.cyber.task.vo.ProgressStatusVO;
import kr.or.ddit.professor.cyber.teamproject.dao.TeamDAO;
import kr.or.ddit.professor.cyber.teamproject.dao.TeamProjectDAO;
import kr.or.ddit.utils.file.service.FTPFileService;
import kr.or.ddit.vo.cyber.TeamMemberVO;
import kr.or.ddit.vo.cyber.TeamProjectVO;
import kr.or.ddit.vo.cyber.TeamVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TeamProjectServiceImpl implements TeamProjectService {
	
	@Inject
	private TeamDAO tDao;
	@Inject
	private TeamProjectDAO tpDao;
	@Inject
	private FTPFileService fService;
	
	@Override
	public List<TeamProjectVO> retrieveTeamProjectList(String lecCode, String tpStatus) {
		
		List<TeamProjectVO> teamProjectList = tpDao.selectTeamProjectList(lecCode, tpStatus);
		
		if(teamProjectList != null) {
			for(TeamProjectVO tp : teamProjectList) {
				tp.setProgressStatus(progressStatusCalculation(tp));
				tp.setTpDate(StringToDateFormat(tp.getTpDate()));
			}
		}
		
		return teamProjectList;
	}

	@Override
	public List<TeamProjectVO> retrieveTeamProjectListS(String lecCode, String tpStatus, String smemNo) {
		
		List<TeamProjectVO> teamProjectListS = tpDao.selectTeamProjectListS(lecCode, tpStatus, smemNo);
		
		if(teamProjectListS != null) {
			for(TeamProjectVO tp : teamProjectListS) {
				tp.setTpDate(StringToDateFormat(tp.getTpDate()));
			}
		}
		
		return teamProjectListS;
	}

	@Override
	public TeamProjectVO retrieveTeamProject(String tpNo) {
		TeamProjectVO tp = tpDao.selectTeamProject(tpNo);
		tp.setFileList(fService.selectFileList(tp.getGfNo()));
		tp.setTpDate(StringToDateFormat(tp.getTpDate()));
		return tp;
	}

	@Override
	public List<StudentVO> retrieveAllStudent(String lecCode) {
		return tpDao.selectAllStudent(lecCode);
	}

	@Override
	@Transactional
	public ServiceResult modifyTeamProject(TeamProjectVO teamProject) {
		// + 팀 + 팀원 수정 (삭제후 재등록)
		String tpNo = teamProject.getTpNo();
		try {
			teamProject.setTpDate(DataFormatToString(teamProject.getTpDate()));
			if(tpDao.updateTeamProject(teamProject) > 0) {
				if(teamProject.getDeleteFiles() != null)
					fService.deleteFiles(teamProject.getDeleteFiles());
				if(teamProject.getTeamProjectFiles()[0].getSize() > 0)
					fService.sendFiles(teamProject.getGfNo(), teamProject.getTeamProjectFiles());
				
				//기존 팀 + 팀원 내용 삭제
				List<TeamVO> oldTeamList = tDao.selectTeamList(teamProject.getTpNo());
				for(TeamVO ot : oldTeamList) {
					// 팀원 삭제
					if(tDao.deleteTeamMember(ot.getTeamNo()) < 1) return ServiceResult.FAIL;
				}
				// 팀 삭제
				if(tDao.deleteTeam(teamProject.getTpNo()) < 1) return ServiceResult.FAIL;
				
				//팀 저장
				List<TeamVO> teamList = teamProject.getTeamList();
				if(teamList.size() < 1 || teamList.get(0) == null) 
					return ServiceResult.FAIL; 
				for(TeamVO t : teamList) {
					String teamNo = tDao.maxTeamNo();
					t.setTpNo(tpNo);
					t.setTeamNo(teamNo);
					//팀 저장
					if(tDao.insertTeam(t) < 1) return ServiceResult.FAIL;
					//팀원 저장
					List<TeamMemberVO> teamMemberList = t.getTeamMemberList();
					for(TeamMemberVO tm : teamMemberList) {
						tm.setTeamNo(teamNo);
						if(tDao.insertTeamMember(t.getTeamNo(), tm.getSmemNo()) < 1) return ServiceResult.FAIL;
					}
				}
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
	public ServiceResult removeTeamProject(String tpNo) {
		// + 팀 + 팀원 삭제
		try {
			TeamProjectVO teamProject = tpDao.selectTeamProject(tpNo);
			String gfNo = teamProject.getGfNo();
			
			if(tpDao.deleteTeamProject(tpNo) > 0) {
				if(fService.deleteGoupFile(gfNo) == ServiceResult.OK) {
					if(fService.deleteFolder(gfNo)) {
						
						//기존 팀 + 팀원 내용 삭제
						List<TeamVO> oldTeamList = tDao.selectTeamList(teamProject.getTpNo());
						for(TeamVO ot : oldTeamList) {
							// 팀원 삭제
							if(tDao.deleteTeamMember(ot.getTeamNo()) < 1) return ServiceResult.FAIL;
						}
						// 팀 삭제
						if(tDao.deleteTeam(teamProject.getTpNo()) < 1) return ServiceResult.FAIL;
						
						return ServiceResult.OK;
					}
				}
				return ServiceResult.FAIL;
			}
		}catch (Exception e) {
			throw new UncheckedException(e);
		}
		return ServiceResult.FAIL;
	}

	@Override
	@Transactional
	public ServiceResult createTeamProject(TeamProjectVO teamProject) {
		
		try {
			//gfNo 폴더 생성 + DB 저장
			String gfno = fService.selecStringGFNO();
			teamProject.setGfNo(gfno);
			fService.makeGFNOFolder(gfno);
			
			String tpNo = tpDao.MaxTpNo();
			teamProject.setTpDate(DataFormatToString(teamProject.getTpDate()));
			teamProject.setTpNo(tpNo);
			if(tpDao.insertTeamProject(teamProject) > 0) {
				if(teamProject.getTeamProjectFiles().length > 1 || teamProject.getTeamProjectFiles()[0].getSize() > 1) {
					fService.sendFiles(teamProject.getGfNo(), teamProject.getTeamProjectFiles());
				}
				
					//팀 + 팀원 저장
					List<TeamVO> teamList = teamProject.getTeamList();
					if(teamList.size() < 1 || teamList.get(0) == null) 
						return ServiceResult.FAIL; 
					for(TeamVO t : teamList) {
						//팀 저장
						String teamNo = tDao.maxTeamNo();
						t.setTpNo(tpNo);
						t.setTeamNo(teamNo);
						if(tDao.insertTeam(t) < 1) return ServiceResult.FAIL;
						//팀원 저장
						List<TeamMemberVO> teamMemberList = t.getTeamMemberList();
						for(TeamMemberVO tm : teamMemberList) {
							tm.setTeamNo(teamNo);
							if(tDao.insertTeamMember(t.getTeamNo(), tm.getSmemNo()) < 1) return ServiceResult.FAIL;
						}
					}
				
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
	public ServiceResult changeTPStatus(String tpNo, String tpStatus) {
		
		try {
			//임시저장 >> 업로드 하는 상황
			if(tpStatus.equals("ST02")) {
				ServiceResult result = tpDao.changeTeamProjectStatus(tpNo, tpStatus) > 0 ? ServiceResult.OK:ServiceResult.FAIL;
				if(result == ServiceResult.OK) {
					
					 List<TeamVO> teamList = tDao.selectTeamList(tpNo);
					 
					 for(TeamVO t : teamList) {
						 String gfno = fService.selecStringGFNO();
						 t.setGfNo(gfno);
						 if(!fService.makeGFNOFolder(gfno)) return ServiceResult.FAIL;
						 tDao.uploadAddGfNoTeam(t.getTeamNo(), gfno);
					 }
					 return ServiceResult.OK;
				}
				return ServiceResult.FAIL;
			}
		}catch (Exception e) {
			throw new UncheckedException(e);
		}
		return tpDao.changeTeamProjectStatus(tpNo, tpStatus) > 0 ? ServiceResult.OK:ServiceResult.FAIL;
	}

	@Override
	public List<TeamVO> retrieveTeamList(String tpNo) {
		return tDao.selectTeamList(tpNo);
	}

	@Override
	public TeamVO retrieveTeam(String teamNo) {
		TeamVO team = tDao.selectTeam(teamNo);
		team.setFileList(fService.selectFileList(team.getGfNo()));
		return team;
	}

	@Override
	@Transactional
	public ServiceResult teamProjectSubmit(TeamVO team) {

		try {
			if(tDao.teamProjectSubmit(team.getTeamNo(), team.getSubmitStatus()) > 0) {
				if(team.getSubmitStatus().equals("제출")) {
					
					if(team.getDeleteFiles() != null && team.getDeleteFiles()[0].length() > 0)
						fService.deleteFiles(team.getDeleteFiles());
					
					if(team.getTeamFiles() != null && team.getTeamFiles()[0].getSize() > 0)
						fService.sendFiles(team.getGfNo(), team.getTeamFiles());
					
					return ServiceResult.OK;
				}else {
					return ServiceResult.OK;
				}
			}else {
				return ServiceResult.FAIL;
			}
		}catch (Exception e) {
			throw new UncheckedException(e);
		}
	}
	
	/**
	 * 완료률 구해주는 메서드
	 * @param tp
	 * @return
	 */
	public ProgressStatusVO progressStatusCalculation(TeamProjectVO tp) {
		int allTeamCount = tpDao.selectAllTeamCount(tp.getTpNo());
		int completion = tpDao.selectCompletion(tp.getTpNo());
		
		ProgressStatusVO proVO = new ProgressStatusVO(completion,allTeamCount);
		
		return proVO;
	}
	
	/**
	 * 240530 > 24/05/30 
	 * @param stringDate
	 * @return
	 */
	public String StringToDateFormat (String stringDate) {
		
		String yy = stringDate.substring(0,2);
		String mm = stringDate.substring(2,4);
		String dd = stringDate.substring(4,6);
		
		String ymd = yy + "/" + mm + "/" + dd;
		return ymd;
	}
	
	/**
	 * 2024-05-30 > 240530
	 * @param DataFormat
	 * @return
	 */
	public String DataFormatToString (String DataFormat) {
		String one = DataFormat.replace("-", "");
		String two = one.substring(2);
		return two;
	}

	@Override
	public ServiceResult teamEvaluation(TeamVO team) {
		return tDao.teamEvalution(team) > 0 ? ServiceResult.OK:ServiceResult.FAIL;
	}

}
