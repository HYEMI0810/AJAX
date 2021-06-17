package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import DTO.PersonDTO;

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
			//Integer.parseInt(null); //fail발생시킴
			
		}else if(cmd.contentEquals("/exam04.ajax")) {
			System.out.println("4번예제실행");
			//response.getWriter().append("1001 Tom HelloWorld");
			//response.getWriter().append("{\"id\":\"1001\",\"name\":\"Tom\",\"message\":\"Hello Ajax\"}");
			JsonObject obj = new JsonObject();
			obj.addProperty("id", 1001);
			obj.addProperty("name", "Tom");
			obj.addProperty("message", "Hello Ajax");
			
			response.getWriter().append(obj.toString());
			
		}else if(cmd.contentEquals("/exam05.ajax")) {
			System.out.println("5번예제실행");
			//response.getWriter().append("[\"apple\",\"orange\"]");
			JsonArray arr = new JsonArray();
			arr.add("Apple");
			arr.add("Orange");
			response.getWriter().append(arr.toString());
			
		}else if(cmd.contentEquals("/exam06.ajax")) {
			System.out.println("6번예제실행");
			
			JsonObject obj1 = new JsonObject();
			obj1.addProperty("id", 1001);
			obj1.addProperty("name", "Tom");
			obj1.addProperty("message", "Hello Ajax");
			
			JsonObject obj2 = new JsonObject();
			obj2.addProperty("id", 1002);
			obj2.addProperty("name", "Jane");
			obj2.addProperty("message", "Hello JQuery");
			
			JsonArray arr = new JsonArray();
			arr.add(obj1);
			arr.add(obj2);
			
			System.out.println(arr.toString());
			response.getWriter().append(arr.toString());
			
		}else if(cmd.contentEquals("/exam07.ajax")) {
			Gson g = new Gson();
			
			List<PersonDTO>list = new ArrayList<>();
			list.add(new PersonDTO(1001,"Tom","Message"));
			list.add(new PersonDTO(1002,"Jane","Hello JQuery"));

			String result = g.toJson(list);
			System.out.println(result);
			response.getWriter().append(result);
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
