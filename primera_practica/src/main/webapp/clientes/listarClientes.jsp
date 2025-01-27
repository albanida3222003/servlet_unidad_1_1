<%@page import="com.unu.beans.Cliente"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listar clientes</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">


<script>
	function verPrestamos(id) {
		if (confirm("¿Desea ver los préstamos del cliente?") == true) {
			location.href = "PrestamosController?operacion=listar&idcliente="
					+ id;
		}
	}
	function modificarCliente(id) {
		if (confirm("¿Desea modificar el cliente?") == true) {
			location.href = "ClientesController?operacion=editar&idcliente="
					+ id;
		}
	}
	function eliminarCliente(id) {
		if (confirm("¿Desea eliminar el cliente?") == true) {
			location.href = "ClientesController?operacion=eliminar&idcliente="
					+ id;
		}
	}
</script>

<style>
.col form {
	display: flex;
	justify-content: space-between;
	align-items: center;
	gap: 20px;
}
</style>

</head>
<body data-bs-theme="dark">

	<%@ include file ="/cabecera.jsp"%>
	<%
	String url = "http://localhost:8081/PrimeraPracticaPOOII/";
	%>
	<%
	List<Cliente> clientes = (List<Cliente>) request.getAttribute("clientes");
	%>
	
	<div class="container">
		<br>
		<div class="row">
			<div class="col">
				<a href="<%=url%>ClientesController?operacion=nuevo"
					class="btn btn-success""> Nuevo cliente </a>
			</div>
			<div class="col">
				<form role="form" action="<%=url%>ClientesController" method="POST">
					<input type="hidden" name="operacion" value="listar"> <input
						type="search" class="form-control" name="nomCliente" value=""
						placeholder="Ingrese el nombre del cliente..."> <input
						type="submit" class="btn btn-success" value="Buscar">
				</form>
			</div>
		</div>
		<br>
		<p></p>
		<table id="tabla" class="table table-bordered">
			<thead>
				<tr>
					<th>Id cliente</th>
					<th>Nombres</th>
					<th>Apellidos</th>
					<th>DNI</th>
					<th>F. Nacimiento</th>
					<th>Direccion</th>
					<th>Operaciones</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (clientes != null) {
					for (Cliente cliente : clientes) {
				%>
				<tr>
					<td><%=cliente.getIdcliente()%></td>
					<td><%=cliente.getNombres()%></td>
					<td><%=cliente.getApellidos()%></td>
					<td><%=cliente.getDni()%></td>
					<td><%=cliente.getFechaNacimiento()%></td>
					<td><%=cliente.getDireccion()%></td>
					<td><a
						href="javascript:modificarCliente(<%=cliente.getIdcliente()%>)"
						class="btn btn-warning"> Editar </a> <a
						href="javascript:eliminarCliente(<%=cliente.getIdcliente()%>)"
						class="btn btn-danger"> Eliminar </a> <a
						href="javascript:verPrestamos(<%=cliente.getIdcliente()%>)"
						class="btn btn-info"> Prestamos </a></td>
				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>
	</div>

</body>
</html>