<%@page import="java.util.Objects"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">


<title>Lista de usuários</title>

</head>

<body>

	<%
	String nomeUsuario = (String) session.getAttribute("nomeUsuario");
	out.println(nomeUsuario);

	if (Objects.isNull(nomeUsuario))
		
		
		response.sendRedirect("index.jsp");
	%>

	<a href="logout.jsp">Sair</a>

</body>
</html>