<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<img src="${detail.photo }" width="170px" height="100px"/>
	<h3>Reference :</h3> <input type="text" value="${detail.codeArticle }">
	<h3>designation :</h3> <input type="text" value="${detail.designation }">
	<h3>prix :</h3> <input type="text" value="${detail.prix }">

</body>
</html>