<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>identification</title>
</head>
<body>

	<h2 align="center">Identifiez-vous</h2>
	<hr>
	<form action="LoginController" method="get">
	
	<h3>Email :</h3>	<input type="email" name="email"><br />
	<h3>Mot de Passe :</h3>	<input type="password" name="motdepasse"><br />
	<p></p>
	<input type="submit" name="valider" value="Identifier">
	
	</form>


</body>
</html>