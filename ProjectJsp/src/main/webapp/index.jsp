<%@page import="config.Connect"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Objects"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
 <meta charset="ISO-8859-1">
 
 <link href="includes/css/login.css" rel="stylesheet">
 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
 <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
 <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

 <title>Login</title>

</head>

<body>

	<div id="login">
		<div class="container">
			<div id="login-row"
				class="row justify-content-center align-items-center">
				<div id="login-column" class="col-md-6">
					<div class="login-box col-md-12">
						<form id="login-form" class="form" action="" method="post">
						
							<h3 class="text-center text-info">Login</h3>
							
							<div class="form-group">
								<label for="username" class="text-info">Usuario:</label><br>
								<input type="text" name="usuarioForm" id="usuarioForm" class="form-control">
							</div>
							
							<div class="form-group">
								<label for="password" class="text-info">Senha:</label><br>
								<input type="text" name="senhaForm" id="senhaForm" class="form-control">
							</div>
							
							<div class="form-group">
							
								<label for="remember-me" class="text-info">
								<span>Lembrar-me</span>
								<span><input id="remember-me" name="remember-me"type="checkbox"></span>
								</label><br> 
								
								<input type="submit" name="submit" class="btn btn-info btn-md" value="Logar">
								
							</div>
							
							<div id="register-link" class="text-right">
								<a href="#" class="text-info">Cadastre-se</a>
							</div>					
						</form>
					</div>
				</div>
			</div>
			
			<p align="center" class="text-light mt-2">
				<%
				ResultSet rs = null;
				String usuario = "";
				String senha = "";
				String nomeUsuario = "";						
				String user = "";
				String pass = "";
				int i = 0;

				//Request : obter o valor do parametro espeficado no name do input.
				if (request.getParameter("usuarioForm") != null && !request.getParameter("usuarioForm").isEmpty()
						&& request.getParameter("senhaForm") != null && !request.getParameter("senhaForm").isEmpty()) {

					usuario = request.getParameter("usuarioForm");
					senha = request.getParameter("senhaForm");

				} else {
					usuario = "xxxx";
					out.println("É necessário o preenchimento dos campos usuario e senha");
				};

				try {				
					rs = Connect.declaracaoQuery().executeQuery("SELECT * FROM usuarios WHERE usuario = '" + usuario + "' and senha = '" + senha + "' ");
					
					while (rs.next()) {
				       nomeUsuario = rs.getString(2);
					   user = rs.getString(3);
					   pass = rs.getString(4);
					   i = rs.getRow();
					}
					
					out.print(i);

					if (i > 0) {
						session.setAttribute("nomeUsuario", nomeUsuario);
						response.sendRedirect("usuarios.jsp");
					} else
						out.print("Dados incorretos");

				} catch (Exception e) {
					out.println(e.getCause());
				}
				%>
			</p>
		</div>
	</div>

</body>

</html>