package membermanager.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileUploadException;

public interface MemberService {
	
	String getViewName(HttpServletRequest request, HttpServletResponse response) throws FileUploadException;

}
