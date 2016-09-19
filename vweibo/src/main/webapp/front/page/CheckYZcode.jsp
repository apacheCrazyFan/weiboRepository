<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String rand = (String)session.getAttribute("rand");
	String yzm=request.getParameter("yzm");
	System.out.println(rand+"----"+yzm);
	if(yzm.equalsIgnoreCase(rand)){
		out.print(0);
	}else{
		out.print(1);
	}
%>