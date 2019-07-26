package membermanager.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileUploadException;

public class MemberLogoutService implements MemberService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) throws FileUploadException {
		request.getSession(false).invalidate();
		
		return "/WEB-INF/view/member/logout.jsp";
	}

}
