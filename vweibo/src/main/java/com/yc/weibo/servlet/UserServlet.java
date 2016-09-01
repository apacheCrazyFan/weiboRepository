package com.yc.weibo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.yc.weibo.bean.UserTag;
import com.yc.weibo.biz.UserTagBiz;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


public class UserServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private UserTagBiz biz;
	private PrintWriter out;

	@SuppressWarnings("resource")
	public void init(){
		ApplicationContext app = new ClassPathXmlApplicationContext("spring.xml");
		biz = (UserTagBiz) app.getBean("userTagBiz");
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operation = request.getParameter("op");
		System.out.println(operation);
		if(operation.equals("findAllUserTags")){
			findAllUserTags(request,response);
		}else if(operation.equals("delUserTag")){
			delUserTag(request,response);
		}else if(operation.equals("addUserTag")){
			addUserTag(request,response);
		}else if(operation.equals("updateUserTag")){
			updateUserTag(request,response);
		}
	}

	/**
	 * 更新用户定义的标签的操作
	 * @param request
	 * @param response
	 */
	private void updateUserTag(HttpServletRequest request, HttpServletResponse response) {
		String UTid = request.getParameter("tid");
		String UTname = request.getParameter("tname");
		try {
			out = response.getWriter();
			if(biz.updateUserTag(Integer.valueOf(UTid),UTname)){
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

	/**
	 * 添加用户标签的操作
	 * @param request
	 * @param response
	 */
	private void addUserTag(HttpServletRequest request, HttpServletResponse response) {
		String UTname = request.getParameter("tname");
		try {
			out = response.getWriter();
			if(biz.addUserTag(UTname)){
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

	/***
	 * 删除用户自定义标签
	 * @param request
	 * @param response
	 */
	private void delUserTag(HttpServletRequest request, HttpServletResponse response) {
		try {
			String tids = request.getParameter("tids");
			out = response.getWriter();

			if(biz.delUserTag(tids)){
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

	/**
	 *刚开始查询所有的用户自定义标签 
	 * @param request
	 * @param response
	 */
	private void findAllUserTags(HttpServletRequest request, HttpServletResponse response) {
		try {
			out = response.getWriter();
			List<UserTag> tags = biz.findAllUserTags();

			if(tags != null){

				JSONArray json=JSONArray.fromObject(tags);//将集合数据变成一个json集合
				JSONObject jb=new JSONObject();
				jb.put("rows", json);
				jb.put("total",tags.size());
				out.println(jb);
				out.flush();
				out.close();
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
