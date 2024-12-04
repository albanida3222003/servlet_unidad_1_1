package com.unu.controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.unu.model.EmpleadoModel;

public class EmpleadoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EmpleadoModel model = new EmpleadoModel();

	public EmpleadoController() {
		super();
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try {
			if (request.getParameter("operacion") == null) {
				listar(request, response);
				return;
			}
			String operacion = request.getParameter("operacion");
			switch (operacion) {
			case "listar":
				listar(request, response);
				System.out.println("listar");
				break;
			case "modificar":
				//listar(request, response);
				System.out.println("modificar");
				break;
			case "editar":
				//listar(request, response);
				System.out.println("editar");
				break;
			case "eliminar":
				//listar(request, response);
				System.out.println("eliminar");
				break;
			}
		} catch (Exception e) {
			System.out.println("processRequest() " + e.getMessage());
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	protected void listar(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String nomEmpleado = request.getParameter("nombreEmpleado");

			if (nomEmpleado == null || nomEmpleado.equalsIgnoreCase("")) {
				request.setAttribute("empleado", model.listarEmpleado());
			} else {
				request.setAttribute("empleado", model.listarBusqueda(nomEmpleado));
			}

			request.getRequestDispatcher("/empleados/listarEmpleados.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.println("listar() " + e.getMessage());
		}
	}
}
