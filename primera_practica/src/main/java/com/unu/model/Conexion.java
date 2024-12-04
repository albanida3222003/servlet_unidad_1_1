package com.unu.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

	private String url = "jdbc:mysql://localhost:3306/primerapracticapooii";
	private String usuario = "root";
	private String contrasena = "123456";
	protected Connection conexion;

	public void openConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conexion = DriverManager.getConnection(url, usuario, contrasena);
			System.out.println("Conexion exitosa a la base de datos");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	public void closeConnection() {
		try {
			if (conexion != null && !conexion.isClosed()) {
				conexion.close();
				System.out.println("Conexion cerrada");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}