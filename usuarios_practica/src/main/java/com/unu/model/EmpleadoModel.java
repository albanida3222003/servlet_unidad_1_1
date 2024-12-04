package com.unu.model;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.unu.beans.Empleado;

public class EmpleadoModel extends Conexion {
	private CallableStatement cs;
	private ResultSet rs;

	public List<Empleado> listarEmpleado() {
		List<Empleado> empleado = null;
		try {
			String sql = "call sp_listar();";
			empleado = new ArrayList<Empleado>();
			this.openConnection();
			cs = conexion.prepareCall(sql);
			rs = cs.executeQuery();
			while (rs.next()) {
				Empleado em = new Empleado();
				em.setId(rs.getInt("id"));
				em.setNombre(rs.getString("nombre"));
				em.setApellido(rs.getString("apellido"));
				em.setEdad(rs.getInt("edad"));
				empleado.add(em);
			}
			this.closeConnection();
		} catch (Exception e) {
			System.out.println("listarEmpleado() " + e.getMessage());
		}
		return empleado;
	}

	public List<Empleado> listarBusqueda(String nom) {
		List<Empleado> empleado = null;
		try {
			String sql = "call sp_buscar(?);";
			empleado = new ArrayList<Empleado>();
			this.openConnection();
			cs = conexion.prepareCall(sql);
			cs.setString(1, nom);
			rs = cs.executeQuery();
			while (rs.next()) {
				Empleado em = new Empleado();
				em.setId(rs.getInt("id"));
				em.setNombre(rs.getString("nombre"));
				em.setApellido(rs.getString("apellido"));
				em.setEdad(rs.getInt("edad"));
				empleado.add(em);
			}
			this.closeConnection();
		} catch (Exception e) {
			System.out.println("listarBusqueda() " + e.getMessage());
		}
		return empleado;
	}
}
