package kr.or.ddit.manager.com.memberregistrate.service;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.inject.Inject;
import javax.transaction.Transactional;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.exception.UncheckedException;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;

import kr.or.ddit.manager.com.memberregistrate.dao.MemberRegistrateDAO;
import kr.or.ddit.utils.file.service.FTPFileService;
import kr.or.ddit.vo.user.ManagerVO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.ProfessorVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberRegistrateServiceImpl implements MemberRegistrateSerivce {

	@Inject
	MemberRegistrateDAO dao;
	@Inject
	FTPFileService fService;
	
	@Override
	@Transactional
	public MemberVO createManager(MultipartFile excelFile) throws IOException {
		String extension = FilenameUtils.getExtension(excelFile.getOriginalFilename());
		
		if (!extension.equals("xlsx") && !extension.equals("xls")) {
	         throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "엑셀파일을(xls, xlsx) 업로드 해주세요.");
	    }
		
		Workbook workbook = null;
       if (extension.equals("xlsx")) {
         workbook = new XSSFWorkbook(excelFile.getInputStream());
       } else if (extension.equals("xls")) {
         workbook = new HSSFWorkbook(excelFile.getInputStream());
       }
       Sheet worksheet = workbook.getSheetAt(0);
		
       int totalCnt = worksheet.getPhysicalNumberOfRows() - 3;
       
       for (int i = 3; i < worksheet.getPhysicalNumberOfRows(); i++) { 

           Row row = worksheet.getRow(i);
           
           ManagerVO manager = new ManagerVO();
           MemberVO member = new MemberVO();
           
           String memName = Optional
                   .ofNullable(row.getCell(1))
                   .map(Cell::getStringCellValue)
                   .orElse(null);

           String memEmail = Optional
                   .ofNullable(row.getCell(2))
                   .map(Cell::getStringCellValue)
                   .orElse(null);

           String memReg1 = Optional
                   .ofNullable(row.getCell(3))
                   .map(Cell::getStringCellValue)
                   .orElse(null);

           String memReg2 = Optional
                   .ofNullable(row.getCell(4))
                   .map(Cell::getStringCellValue)
                   .orElse(null);
           
           String memBank = Optional
                   .ofNullable(row.getCell(5))
                   .map(Cell::getStringCellValue)
                   .orElse(null);
           
           String memDepo = Optional
        		   .ofNullable(row.getCell(6))
        		   .map(Cell::getStringCellValue)
        		   .orElse(null);
           
           String memBanknum = Optional
        		   .ofNullable(row.getCell(7))
        		   .map(Cell::getStringCellValue)
        		   .orElse(null);
           
           try {
        	   
			    String year = String.valueOf(LocalDate.now().getYear());
			    String basicData = year + "99";
			   	String percent = basicData + "%";
			    String mmemNo = dao.selectMmemNo(basicData, percent);
			       
			    String gfno = fService.selecStringGFNO();
				member.setGfNo(gfno);
					
				member.setMemNo(mmemNo);
			   	member.setMemName(memName);
			   	member.setMemPass(memReg1);
			   	member.setMemEmail(memEmail);
			   	member.setMemReg1(memReg1);
			   	member.setMemReg2(memReg2);
			   	member.setMemBank(memBank);
			   	member.setMemDepo(memDepo);
			   	member.setMemBanknum(memBanknum);
			   
			   	manager.setMmemNo(mmemNo);

			   	if(dao.insertMember(member) < 1) {
			   		return member;
			   	}
			   	if(dao.insertMemRoles(mmemNo, "ROLE_M") < 1) {
			   		dao.deleteMember(mmemNo);
			   		return member;
			   	}
			   	if(dao.insertManager(manager) < 1) {
			   		dao.deleteMemRole(mmemNo);
			   		dao.deleteMember(mmemNo);
			   		return member;
			   	}
			   	
			   	fService.makeGFNOFolder(gfno);
			   	
           } catch (Exception e) {
        	   throw new UncheckedException(e);
           }
       }
		
		return null;
	}

	@Override
	public MemberVO createStudent(MultipartFile excelFile) throws IOException {
		String extension = FilenameUtils.getExtension(excelFile.getOriginalFilename());
		
		if (!extension.equals("xlsx") && !extension.equals("xls")) {
	         throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "엑셀파일을(xls, xlsx) 업로드 해주세요.");
	    }
		
		Workbook workbook = null;
       if (extension.equals("xlsx")) {
         workbook = new XSSFWorkbook(excelFile.getInputStream());
       } else if (extension.equals("xls")) {
         workbook = new HSSFWorkbook(excelFile.getInputStream());
       }
       Sheet worksheet = workbook.getSheetAt(0);
		
       int totalCnt = worksheet.getPhysicalNumberOfRows() - 3;
       
       for (int i = 3; i < worksheet.getPhysicalNumberOfRows(); i++) { 

           Row row = worksheet.getRow(i);
           
           StudentVO student = new StudentVO();
           MemberVO member = new MemberVO();
           
           String memName = Optional
                   .ofNullable(row.getCell(1))
                   .map(Cell::getStringCellValue)
                   .orElse(null);

           String memEmail = Optional
                   .ofNullable(row.getCell(2))
                   .map(Cell::getStringCellValue)
                   .orElse(null);

           String memReg1 = Optional
                   .ofNullable(row.getCell(3))
                   .map(Cell::getStringCellValue)
                   .orElse(null);
           
           String memReg2 = Optional
                   .ofNullable(row.getCell(4))
                   .map(Cell::getStringCellValue)
                   .orElse(null);
           
           String memBank = Optional
                   .ofNullable(row.getCell(5))
                   .map(Cell::getStringCellValue)
                   .orElse(null);
           
           String memDepo = Optional
        		   .ofNullable(row.getCell(6))
        		   .map(Cell::getStringCellValue)
        		   .orElse(null);
           
           String memBanknum = Optional
        		   .ofNullable(row.getCell(7))
        		   .map(Cell::getStringCellValue)
        		   .orElse(null);
           
           String deptCode = Optional
        		   .ofNullable(row.getCell(8))
        		   .map(Cell::getStringCellValue)
        		   .orElse(null);
           
           String stuJoinyear = Optional
                   .ofNullable(row.getCell(9))
                   .map(Cell::getStringCellValue)
                   .orElse(null);
           
           String stuEnrollno = Optional
        		   .ofNullable(row.getCell(10))
        		   .map(Cell::getStringCellValue)
        		   .orElse(null);
           
           try {
	           String basicData = stuJoinyear + deptCode.substring(1);
	           String percent = basicData + "%";
	           
	           String smemNo = dao.selectSmemNo(basicData,percent);
	           
	           String gfNo = fService.selecStringGFNO();
	           member.setGfNo(gfNo);
	           
	           member.setMemNo(smemNo);
	           member.setMemName(memName);
	           member.setMemPass(memReg1);
	           member.setMemEmail(memEmail);
	           member.setMemReg1(memReg1);
	           member.setMemReg2(memReg2);
	           member.setMemBank(memBank);
	           member.setMemBanknum(memBanknum);
	           member.setMemDepo(memDepo);
	           
	           student.setSmemNo(smemNo);
	           student.setDeptCode(deptCode);
	           student.setStuJoinyear(stuJoinyear);
	           student.setStuEnrollno(stuEnrollno);
	           
	           if(dao.insertMember(member) < 1) {
	        	   return member;
	           }
	           if(dao.insertMemRoles(smemNo, "ROLE_S") < 1) {
			   		dao.deleteMember(smemNo);
			   		return member;
			   }
	           if(dao.insertStudent(student) < 1) {
	        	   dao.deleteMemRole(smemNo);
	        	   dao.deleteMember(smemNo);
	        	   return member;
	           }
	           
	           fService.makeGFNOFolder(gfNo);
	           
           }catch (Exception e) {
        	   throw new UncheckedException(e);
           }
       }
		
		return null;
	}

	@Override
	public MemberVO createProfessor(MultipartFile excelFile) throws IOException {
		String extension = FilenameUtils.getExtension(excelFile.getOriginalFilename());
		
		if (!extension.equals("xlsx") && !extension.equals("xls")) {
	         throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "엑셀파일을(xls, xlsx) 업로드 해주세요.");
	    }
		
		Workbook workbook = null;
       if (extension.equals("xlsx")) {
         workbook = new XSSFWorkbook(excelFile.getInputStream());
       } else if (extension.equals("xls")) {
         workbook = new HSSFWorkbook(excelFile.getInputStream());
       }
       Sheet worksheet = workbook.getSheetAt(0);
		
       int totalCnt = worksheet.getPhysicalNumberOfRows() - 3;
       
       for (int i = 3; i < worksheet.getPhysicalNumberOfRows(); i++) { 

           Row row = worksheet.getRow(i);
           
           ProfessorVO professor = new ProfessorVO();
           MemberVO member = new MemberVO();
           
           String memName = Optional
                   .ofNullable(row.getCell(1))
                   .map(Cell::getStringCellValue)
                   .orElse(null);

           String memEmail = Optional
                   .ofNullable(row.getCell(2))
                   .map(Cell::getStringCellValue)
                   .orElse(null);

           String memReg1 = Optional
                   .ofNullable(row.getCell(3))
                   .map(Cell::getStringCellValue)
                   .orElse(null);

           String memReg2 = Optional
                   .ofNullable(row.getCell(4))
                   .map(Cell::getStringCellValue)
                   .orElse(null);
           
           String memBank = Optional
                   .ofNullable(row.getCell(5))
                   .map(Cell::getStringCellValue)
                   .orElse(null);
           
           String memDepo = Optional
        		   .ofNullable(row.getCell(6))
        		   .map(Cell::getStringCellValue)
        		   .orElse(null);
           
           String memBanknum = Optional
        		   .ofNullable(row.getCell(7))
        		   .map(Cell::getStringCellValue)
        		   .orElse(null);
           
           String deptCode = Optional
        		   .ofNullable(row.getCell(8))
        		   .map(Cell::getStringCellValue)
        		   .orElse(null);
           
           String startDate = Optional
        		   .ofNullable(row.getCell(9))
        		   .map(Cell::getStringCellValue)
        		   .orElse(null);
           
           String pmemPosition = Optional
        		   .ofNullable(row.getCell(10))
        		   .map(Cell::getStringCellValue)
        		   .orElse(null);
           
           String pmemResp = Optional
        		   .ofNullable(row.getCell(11))
        		   .map(Cell::getStringCellValue)
        		   .orElse(null);
           
           String pmemTa = Optional
        		   .ofNullable(row.getCell(12))
        		   .map(Cell::getStringCellValue)
        		   .orElse(null);
           
           try {
	           int year = Integer.parseInt(startDate.substring(0,4));
	           int month = Integer.parseInt(startDate.substring(5,7));
	           int day = Integer.parseInt(startDate.substring(8,10));
	           
	           String basicData = String.valueOf(year) + deptCode.substring(1) + "5";
	           String percent = basicData + "%";
	           
	           String pmemNo = dao.selectPmemNo(basicData, percent);
	           
	           String gfNo = fService.selecStringGFNO();
	           
	           member.setGfNo(gfNo);
	           member.setMemNo(pmemNo);
	           member.setMemName(memName);
	           member.setMemPass(memReg1);
	           member.setMemEmail(memEmail);
	           member.setMemReg1(memReg1);
	           member.setMemReg2(memReg2);
	           member.setMemBank(memBank);
	           member.setMemDepo(memDepo);
	           member.setMemBanknum(memBanknum);
	           
	           professor.setPmemNo(pmemNo);
	           professor.setDeptCode(deptCode);
	           LocalDate starDateData = LocalDate.of(year, month, day);
	           professor.setStartDate(starDateData);
	           
	           professor.setPmemPosition(pmemPosition);
	           professor.setPmemResp(pmemResp);
	           professor.setPmemTa(pmemTa);
	           
	           if(dao.insertMember(member) < 1) {
	        	   return member;
	           }
	           
	           if(pmemResp != null && pmemResp.equals("학장")) {
	        	   if(dao.insertMemRoles(pmemNo, "ROLE_H") < 1) {
	        		   dao.deleteMember(pmemNo);
	        		   return member;
	        	   }
	           }else if(pmemResp != null && pmemResp.equals("학과장")) {
	        	   if(dao.insertMemRoles(pmemNo, "ROLE_D") < 1) {
	        		   dao.deleteMember(pmemNo);
	        		   return member;
	        	   }
	           }
	           
	           if(dao.insertMemRoles(pmemNo, "ROLE_P") < 1) {
        		   dao.deleteMember(pmemNo);
        		   return member;
        	   }
	           
	           if(dao.insertProfessor(professor) < 1) {
	        	   dao.deleteMemRole(pmemNo);
	        	   dao.deleteMember(pmemNo);
	        	   return member;
	           }
	           
	           fService.makeGFNOFolder(gfNo);
	           
           }catch (Exception e) {
        	   throw new UncheckedException(e);
           }
       }
		
		return null;
	}

}
