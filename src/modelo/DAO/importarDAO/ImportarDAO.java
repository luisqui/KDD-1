package modelo.DAO.importarDAO;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import modelo.conexion.conexion;

public class ImportarDAO {
	private conexion conn;	
	
	
	public ImportarDAO(conexion oConexion){
		conn = oConexion;
		
	}
	
	public boolean executeQuery(String query){
		PreparedStatement pst = null;
				
		try {
			pst = conn.getConnection().prepareStatement(query);
			int result = pst.executeUpdate();
						
		} catch (SQLException ex) {
			ex.printStackTrace();			
			return false;
			
		} finally {
			try {
				if (pst != null) {
					pst.close();
				}
				
			} catch (SQLException ex) {
				System.out.println("Error SQL:" + ex);
				
			}
		}
		return true;
	}
	
}
