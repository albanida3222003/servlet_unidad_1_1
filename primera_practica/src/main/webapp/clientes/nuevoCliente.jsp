<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insertar cliente</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script>
	function validarFormulario() {
		const nombres = document.getElementById('nombres').value.trim();
		const apellidos = document.getElementById('apellidos').value.trim();
		if (nombres === '') {
			alert('Ingrese el nombre del cliente');
			document.getElementById('nombres').focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body data-bs-theme="dark">

	<%
	String url = "http://localhost:8081/PrimeraPracticaPOOII/";
	%>

	<div class="container">
		<%@ include file="/cabecera.jsp"%>
		<%
		if (request.getAttribute("respuesta") != null) {
			boolean res = (boolean) request.getAttribute("respuesta");
			if (res) {
				List<String> listaError = (List<String>) request.getAttribute("listaError");
				for (String error : listaError) {
					%>
					<span><%=error%></span> <br>
					<%
				}
			}
		}
		%>
		<br>
		<h3>Nuevo cliente</h3>
		<div class="form-group">
			<form role="form" action="<%=url%>ClientesController" method="POST">
				<input type="hidden" name="operacion" value="insertar">
				<p></p>
				<input type="text" name="nombres" placeholder="Nombres: Ana María"
					class="form-control">
				<p></p>
				<input type="text" name="apellidos"
					placeholder="Apellidos: Alcachofa Fernández" class="form-control">
				<p></p>
				<input type="number" name="dni" placeholder="DNI: 04923473"
					class="form-control">
				<p></p>
				<input type="text" name="fechaNacimiento"
					placeholder="Fecha de nacimiento: yyyy-mm-dd" class="form-control">
				<p></p>
				<input type="text" name="direccion"
					placeholder="Dirección: Jr. Los Andes 234" class="form-control">
				<p></p>
				<br> <input type="submit" value="Guardar"
					class="btn btn-success"> <a
					href="<%=url%>ClientesController?operacion=listar"
					class="btn btn-success"> Volver </a>
			</form>
		</div>
	</div>

</body>
</html>