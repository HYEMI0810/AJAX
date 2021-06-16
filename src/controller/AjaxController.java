package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.ajax")
public class AjaxController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String requestURI = request.getRequestURI();
		String ctxPath = request.getContextPath();
		String cmd = requestURI.substring(ctxPath.length());
		System.out.println(cmd);
		
		if(cmd.contentEquals("/exam01.ajax")) {
			System.out.println("요청확인함");
			
		}else if(cmd.contentEquals("/exam02.ajax")) {
			String param1 = request.getParameter("param1");
			String param2 = request.getParameter("param2");
			System.out.println(param1 + " : " + param2);
			
		}else if(cmd.contentEquals("/exam03.ajax")) {
			System.out.println("3번 실행됨");
			response.getWriter().append("반환값");
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
