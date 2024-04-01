package kr.or.ddit.utils.file;

import java.io.File;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView {
	
	

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		File downloadFile =  (File) model.get("downloadFile");
		
		// response header setting
		
		response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
		response.setContentLengthLong(downloadFile.length());
		response.setHeader(HttpHeaders.CONTENT_DISPOSITION, String.format("attatchment;filename=\"%s\"", downloadFile.getName()));
		try(
			OutputStream os = response.getOutputStream();	
		){
			FileUtils.copyFile(downloadFile, os);
		}
	}

}
