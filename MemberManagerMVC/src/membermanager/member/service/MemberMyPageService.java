package membermanager.member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileUploadException;

public class MemberMyPageService implements MemberService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) throws FileUploadException {
		// TODO Auto-generated method stub
		return "/WEB-INF/view/member/mypage.jsp";
	}

}
