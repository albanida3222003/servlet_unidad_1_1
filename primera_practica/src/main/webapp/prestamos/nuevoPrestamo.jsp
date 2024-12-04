<%@page import="com.unu.beans.Cliente"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insertar prestamo</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body data-bs-theme="dark">

<% String url = "http://localhost:8081/PrimeraPracticaPOOII/"; %>
<% Cliente cliente = null;
   HttpSession sesion = request.getSession();
   if(request.getAttribute("cliente") != null){
	   cliente = (Cliente)request.getAttribute("cliente");
   }else{
	   cliente = new Cliente();
   }
%>
<% int idcliente = cliente.getIdcliente(); %>
<% String datosCliente = cliente.getNombres() + " " + cliente.getApellidos() ; %>

<div class="container">
	<%@ include file ="/cabecera.jsp"%>
	<br>
	<h3> Nuevo préstamo </h3>
	<p class="fs-4"> Cliente: <%= datosCliente %> </p>
	<div class="form-group">
	<form role="form" action="<%=url%>PrestamosController" method="POST">
		<input type="hidden" name="operacion" value="insertar"> <p></p>
		<input type="hidden" name="idcliente" value="<%=idcliente%>"> <p></p>
		<input type="text" name="fechaPrestamo" placeholder="Fecha de préstamo: yyyy-mm-dd" class="form-control"> <p></p>
		<input type="number" name="monto" placeholder="Monto (S/.): 3400" class="form-control"> <p></p>
		<input type="number" name="interes" placeholder="Interes (%): 20" class="form-control"> <p></p>
		<input type="number" name="nroCuotas" placeholder="Nro. cuotas: 18" class="form-control"> <p></p>
		<br>
		<input type="submit" value="Guardar" class="btn btn-success">
		<a href="<%=url%>PrestamosController?operacion=listar&idcliente=<%=idcliente%>" class="btn btn-success"> Volver </a>
	</form>
	</div>
</div>

</body>
</html>