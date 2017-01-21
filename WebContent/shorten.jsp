<%@page import="com.ashwin.server.UrlShortner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import="com.ashwin.server.*"%>
<%@ page language="java" import="java.util.*" errorPage="" %> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shorten Url</title>
</head>

<body>
<center><h3>shorten url</h3><a href ="lengthen.jsp" class="btn btn-primary">lengthen</a></center>
<form  ACTION="shorten.jsp" METHOD=POST>
    <center>
            <input id="email" name="email">
    </center>
</form>
    <br><%
	String email=request.getParameter("email");
	UrlShortner url = UrlShortner.getInstance();
	if(email!=null)
	{
	 String responseShort= url.shorten(email);
	 out.print("<div class='alert-success'><h4><center> Successfully shortened " + responseShort +" </center></h4> </div>");
	}
%><br>
    
    <%@include file="view.jsp" %> 
</body>
</html>