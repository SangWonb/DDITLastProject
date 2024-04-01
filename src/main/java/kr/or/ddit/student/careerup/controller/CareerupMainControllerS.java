package kr.or.ddit.student.careerup.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Base64;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.utils.file.service.FTPFileService;

@Controller
@RequestMapping("/student/careerup/careerupMain")
public class CareerupMainControllerS {
	
	@Inject
	FTPFileService fService;

	@GetMapping
	public String careerupMain() {
		return "tiles:student/careerup/careerupMain";
	}
}
