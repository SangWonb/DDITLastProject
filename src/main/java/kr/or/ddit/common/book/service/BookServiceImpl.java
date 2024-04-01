package kr.or.ddit.common.book.service;

import java.time.Year;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.ddit.common.book.dao.BookDAOC;
import kr.or.ddit.common.book.dao.BookRecomDAOC;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.BookRecomVO;
import kr.or.ddit.vo.common.BookVO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.MemberVOWrapper;

@Service
public class BookServiceImpl implements BookService {

	@Inject
	private BookRecomDAOC bookDAO;
	
	@Inject
	private BookDAOC dao;

	@Override
	public BookRecomVO selectBookRecom(BookRecomVO bookRecom) {
	   
	   Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	   MemberVOWrapper principal = (MemberVOWrapper)authentication.getPrincipal();
	   MemberVO realUser = principal.getRealUser();
	   
	   // 나이 구하기 메서드 호출
	   String age = distinguishAge(realUser.getMemReg1(), realUser.getMemReg2());
	   
	   // BookRecomVO에 나이 설정
	   bookRecom.setAge(age);
	   
	   // bookCategory와 deptCode 설정
	   
	   bookRecom.setDeptCode(bookDAO.selectDeptName(realUser)); // 여기에 원하는 부서 코드 값으로 설정
	   
	   // 책 추천 조회
	   return bookDAO.selectBookRecom(bookRecom);
	}

	public String distinguishAge(String memReg1, String memReg2) {
	   // 출생 연도와 세대 정보 추출
	   String birYear2 = StringUtils.substring(memReg1, 0, 2);
	   String generation = StringUtils.substring(memReg2, 0, 1);
	   
	   int todayYear = Integer.parseInt(Year.now().toString());
	   
	   String birYear1 = "";
	   
	   switch (generation) {
	      case "1":
	      case "2":
	         birYear1 = "19";
	         break;
	      case "3":
	      case "4":
	         birYear1 = "20";
	         break;
	   }
	   
	   // 출생 연도 계산
	   int birYear = Integer.parseInt(birYear1 + birYear2);
	   int age1 = todayYear-birYear;
	   String age2 = StringUtils.substring(Integer.toString(age1),0,1);
	   
	   // 나이 그룹 설정
		String ageGroup = "";
		switch(age2) {
		case "1":
		case "2":
		case "3":
		case "4":
		case "5":
		case "6":
			ageGroup = age2;
			break;
		default :
			ageGroup = "6";
			break;
		}
	   
	   return ageGroup;
	}

	@Override
	public List<BookVO> retrieveBookList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectBookList(paging);
	}

	@Override
	public BookVO retrieveBook(String bookCode) {
		BookVO book = dao.selectBook(bookCode);
		if(book==null)
			throw new PKNotFoundException(String.format("%s 에 해당하는 도서가 없습니다.", bookCode));
		return book;
	}
	
}
