<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inscription</title>
</head>
<body>


<h2 aligne="center">Inscrivez-Vous</h2>
<hr>
<form action="LoginController" method="get">
	
	
<h3>Nom :</h3>	<input type="text" name="nom"><br />
<h3>Prenom :</h3>	<input type="text" name="prenom"><br />
<h3>Adresse :</h3>	<input type="text" name="adresse"><br />
<h3>Email :</h3>	<input type="email" name="email">
<small>Format: xxxx@xxxx.xx</small><br />
<h3>Code Postal :</h3>	<input type="text" name="codepostal"><br />
<h3>ville :</h3>	<input type="text" name="ville"><br />
<h3>tel :</h3>	<input type="tel" name="tel" pattern="[0-9]{10}">
<small>Format: 0666666666</small><br />
<h3>Mot De Passe :</h3>	<input type="password" name="motdepasse"><p></p>
	<input type="submit" name="valider" value="Inscription">
	
</form>


</body>
</html>