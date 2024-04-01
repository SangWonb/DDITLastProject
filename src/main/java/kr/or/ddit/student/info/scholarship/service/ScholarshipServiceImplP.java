package kr.or.ddit.student.info.scholarship.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.student.info.scholarship.dao.ScholarshipDAO;
import kr.or.ddit.vo.info.ScholashipRecVO;

@Service
public class ScholarshipServiceImplP implements ScholarshipService{
   
   @Inject
   ScholarshipDAO dao;
   
   @Override
   public List<ScholashipRecVO> retrieveScholashipRecList(String memNo) {
      return dao.scholashipRecList(memNo);
   }
}