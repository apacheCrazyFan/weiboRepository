package com.yc.weibo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.yc.weibo.biz.AdminBiz;



public class AdminServlet extends HttpServlet{
	private static final long serialVersionUID = -8736402111577844390L;
	@Autowired
	private AdminBiz adminBiz;

	private PrintWriter out;

	public void init(){
		ApplicationContext app = new ClassPathXmlApplicationContext("spring.xml");
		adminBiz = (AdminBiz) app.getBean("adminBiz");
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operation = request.getParameter("op");
		if(operation.equals("adminLogin")){
			adminLogin(request,response);
		}
	}
	private void adminLogin(HttpServletRequest request, HttpServletResponse response) {
		try {
			out = response.getWriter();
			String aname=request.getParameter("aname");
			String apwd=request.getParameter("apwd");

			boolean is_have = adminBiz.adminLogin(Arrays.asList((Object)aname,apwd));
			if(is_have){
				out.println(1);
				out.flush();
				out.close();
			}else{
				out.println(-1);
				out.flush();
				out.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
