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

<h2 align="center">Catalogue</h2>
<hr>

<h3>Choisissez le genere :


<form method="get" action="/CategorieController">
<select name="select">
	<option value="Jazz" >Jazz</option>
	<option value="rap" >Rap</option> 
	
</select>
<input type="submit" value="Go!">

</form>




 </h3> 
		<sql:setDataSource
		var="myDS"
		driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/db_micro_prj"
		user="root" password=""
		
		
		/>
		
		<sql:query var="listes_articles" dataSource="${myDS}">
		
		SELECT * FROM articles;
		</sql:query>
		
		
		<div align="center">
		<table border="1" cellpadding="5">
		<caption><h2>list of articles</h2></caption>
		<tr>
		
			<th>Reference</th>
			<th>designation</th>
			<th>prix</th>
			<th>photo</th>
			<th></th>
		
		</tr>
		<c:forEach var="article" items="${listes_articles.rows}" >
	<tr>
		<td><a href="ArticleController?codeArticle=${article.codeArticle }">	<c:out value="${article.codeArticle }"></c:out></a></td>
		<td>	<c:out value="${article.designation }"></c:out></td>
		<td>	<c:out value="${article.prix }"></c:out></td>
		
		<td><img src="${article.photo }" alt="image jazz" width="170px" height="100px" /></td>
		<td><a href="">ajouter au panier</a></td>
	</tr>
		</c:forEach>
	
		</table>
	
		</div>
		
		



</body>
</html>