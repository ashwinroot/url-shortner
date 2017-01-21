<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import="com.ashwin.server.*"%>
<%@ page language="java" import="java.util.*" errorPage="" %>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lengthen</title>
</head>
<body>
<center><a href ="shorten.jsp" class="btn btn-primary">shorten</a><h3>lengthen url</h3></center>
 <form  ACTION="lengthen.jsp" METHOD=POST>
    <center>
            <input id="email" name="email">
    </center>
</form>
    <br><%
	String email=request.getParameter("email");
	UrlShortner url = UrlShortner.getInstance();
	if(email!=null)
	{
	 String responseShort= url.lengthen(email);
	 if(responseShort == null)
		 out.print("<div class='alert-danger alert-dismissible'><h4><center> Not lengthened. No such url found in the database. </center></h4></div>");
	 else
	 	 out.print("<div class='alert-success alert-dismissible'><h4><center> Successfully lenghtened<strong> " + responseShort +"</strong></center> </h4> </div>");
	}
%><br>
    
    <%@include file="view.jsp" %> 
</body>
</html>