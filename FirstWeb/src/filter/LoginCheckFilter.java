package filter;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginCheckFilter
 */
@WebFilter("/mypage/*")
public class LoginCheckFilter implements Filter {

    /**
     * Default constructor. 
     */
	//필터를 사용하기위한 오버라이딩 없을경우 추상클래됌->현재는 dofilter만 사용
	public LoginCheckFilter() {

    }

	/**
	 * @see Filter#destroy()
	 */
	//필터를 사용하기위한 오버라이딩 없을경우 추상클래됌->현재는 dofilter만 사용
	public void destroy() {
	
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response; 
		
		HttpSession session = req.getSession(false);
		boolean loginChk=false;
		
		if(session!=null &&session.getAttribute("LoginInfo")!=null) {
			loginChk=true;
		}if(loginChk) {
			chain.doFilter(request, response);
		}else {
			resp.sendRedirect(req.getContextPath()+"/session/member/loginForm.jsp");
			//RequestDispatcher dispatcher=request.getRequestDispatcher("/session/member/loginForm.jsp");
	    	//dispatcher.forward(request, response);
					
		
		}

		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
