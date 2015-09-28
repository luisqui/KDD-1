package modelo.conexion;

import java.sql.*;

public class conexion {
	// DATOS PARA LA CONEXION
	private String bd = "AdventureWorksDW20142";
	private String login = "postgres";
	private String password = "123";
	private String url = "jdbc:postgresql://localhost:5432/AdventureWorksDW20142";
	protected Connection conn = null;
	
	public conexion() {
		try {
			// obtener el driver de postgres
			Class.forName("org.postgresql.Driver");
			// obtener la conexión
			conn = DriverManager.getConnection(url, login, password);
			if (conn != null) {
				System.out.println("la base de datos " + bd	+ " conecto exitosamente");
			}
		} catch (SQLException e) {
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}
	}

	public void desconectar() {
		conn = null;
		System.out.println("La conexion a la  base de datos " + bd + " a terminado.");
	}
	
	public Connection getConnection(){
		  return conn;
	}

}