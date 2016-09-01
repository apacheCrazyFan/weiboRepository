<%@page import="java.net.URLDecoder"%>
<%@page import="java.io.*"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.File,java.awt.image.BufferedImage"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="sun.misc.BASE64Decoder,javax.imageio.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	try{
		String data=request.getParameter("datas");
		BASE64Decoder decoder = new BASE64Decoder();
		
		byte[] decoderBytes = decoder.decodeBuffer(data.toString());  
		
		System.out.println(decoderBytes);
		
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpg");
		
		ByteArrayInputStream in = new ByteArrayInputStream(decoderBytes);
		BufferedImage buffImg = ImageIO.read(in);
		ServletOutputStream sos = response.getOutputStream();
		ImageIO.write(buffImg, "jpg", sos);
		sos.flush();
		sos.close();
	}catch (IOException e){
	    e.printStackTrace();
	}
%>