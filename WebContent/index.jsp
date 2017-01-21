<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import="com.ashwin.server.*"%>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> Testing Assignment </title>
</head>
<body>
  <% UrlShortner url = UrlShortner.getInstance();
  url.shorten("www.ashwinsankar.com");
  url.shorten("www.google.com");
  url.shorten("www.gmail.com");
  url.printMap();
  %>

       	<div class="col-md-4">
            <a href ="view.jsp" class="btn btn-primary">view</a>
            <a href ="shorten.jsp" class="btn btn-primary">shorten</a>
            <a href ="lengthen.jsp" class="btn btn-primary">lengthen</a>
       </div>
            
     
  
</body>
</html>