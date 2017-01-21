<%@page import="com.ashwin.server.UrlShortner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import="com.ashwin.server.*"%>
<%@ page language="java" import="java.util.*" errorPage="" %> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View</title>
</head>
<body>
  <%
  UrlShortner u = UrlShortner.getInstance();
  %>

  <table class="table table-hover">
 	<%
 	Set set= u.UrlMap.entrySet();
	Iterator i = set.iterator();
	while(i.hasNext())
	{
		Map.Entry me = (Map.Entry) i.next();
		out.print("<a href='"+me.getValue()+"'><tr><td> /" + me.getKey()+"</td> </a> " + "<td> "+me.getValue()+"</td></tr>");
	}
	
 	%>
 	
	
  </table>
</body>
</html>