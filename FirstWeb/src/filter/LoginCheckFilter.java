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
	//필터가 웹컨테이너에서 삭제 될 떼 호출 ->필터를 사용하기위한 오버라이딩 없을경우 추상클래됌->현재는 dofilter만 사용
	public void destroy() {
	
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		//request를 httpservletRequest타입으로 형변환 해준다
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response; 
		//HttpSession이 존재하면 현재 HttpSession을 반환하고 존재하지 않으면 새로이 생성하지 않고 그냥 null을 반환합니다
		HttpSession session = req.getSession(false);
		boolean loginChk=false;
		//세션이 존재하면서 로그인이포가 널이 아니면 로그인 체크를 트루로 해서 필터를 통과
		if(session!=null &&session.getAttribute("LoginInfo")!=null) {
			loginChk=true;
		//로그인체크가 트루면 실행->
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
	//필터를 초기활 할 때 호추 ㄹ
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
