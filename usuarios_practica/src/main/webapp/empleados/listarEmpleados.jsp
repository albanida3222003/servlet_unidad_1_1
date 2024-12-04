<%@page import="com.unu.beans.Empleado"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>listar</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script>
	function verPrestamos(id) {
		if (confirm("¿Desea ver los préstamos del cliente?") == true) {
			location.href = "EmpleadoController?operacion=listar&idcliente="
					+ id;
		}
	}
	function modificarCliente(id) {
		if (confirm("¿Desea modificar el cliente?") == true) {
			location.href = "EmpleadoController?operacion=editar&idcliente="
					+ id;
		}
	}
	function eliminarCliente(id) {
		if (confirm("¿Desea eliminar el cliente?") == true) {
			location.href = "EmpleadoController?operacion=eliminar&idcliente="
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
	<%
	String url = "http://localhost:8081/usuarios_practica/";
	%>
	<%
	List<Empleado> empleado = (List<Empleado>) request.getAttribute("empleado");
	%>
	<div class="container">
		<br>
		<div class="row">
			<div class="col">
				<a href="<%=url%>EmpleadoController?operacion=listar"
					class="btn btn-success""> Listar </a>
			</div>
			<div class="col">
				<form role="form" action="<%=url%>EmpleadoController" method="POST">
					<input type="hidden" name="operacion" value="listar"> <input
						type="search" class="form-control" name="nombreEmpleado" value=""
						placeholder="Ingrese el nombre del empleado..."> <input
						type="submit" class="btn btn-success" value="Buscar">
				</form>
			</div>
		</div>
		<br>
		<p></p>
		<table id="tabla" class="table table-bordered">
			<thead>
				<tr>
					<th>Id</th>
					<th>Nombres</th>
					<th>Apellidos</th>
					<th>Edad</th>
					<th>Operaciones</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (empleado != null) {
					for (Empleado em : empleado) {
				%>
				<tr>
					<td><%=em.getId()%></td>
					<td><%=em.getNombre()%></td>
					<td><%=em.getApellido()%></td>
					<td><%=em.getEdad()%></td>
					<td>
						<a href="javascript:modificar(<%=em.getId()%>)" class="btn btn-warning"> Editar </a> 
						<a href="javascript:eliminar(<%=em.getId()%>)" class="btn btn-danger"> Eliminar </a> 
						<a href="javascript:documentos(<%=em.getId()%>)" class="btn btn-info"> Documentos </a></td>
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