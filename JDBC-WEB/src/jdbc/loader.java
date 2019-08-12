package jdbc;

import java.util.StringTokenizer;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

public class loader extends HttpServlet {
					//서블릿커컨피그는 정해져있음 오버라이딩
	public void init(ServletConfig config) throws ServletException {

		String drivers = config.getInitParameter("jdbcdriver");

		StringTokenizer st = new StringTokenizer(drivers, ",");
		while (st.hasMoreTokens()) {
			String driver = st.nextToken();

			// 데이터베이스 드라이버 로드
			try {
				Class.forName(driver);

				System.out.println("데이터베이스 드라이버 로드 성공 : " + driver);

			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}
}
