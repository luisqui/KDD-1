package modelo.DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import modelo.VO.Pregunta1VO;
import modelo.VO.Pregunta2VO;
import modelo.VO.Pregunta4VO;
import modelo.conexion.conexion;

public class ReportesDAO {
	private conexion conn;	
	
	public ReportesDAO(conexion oConexion){
		conn = oConexion;		
	}
	
	public ArrayList<Pregunta1VO> pregunta1(String query, int fInicial, int fFinal){
		Pregunta1VO oPre;
		ArrayList<Pregunta1VO> listPre = new ArrayList<Pregunta1VO>();
		PreparedStatement pst = null;
		
		try {
			pst = conn.getConnection().prepareStatement(query);				
			
			pst.setInt(1, fInicial);			
			pst.setInt(2, fFinal);
		
			ResultSet resultadosConsulta = pst.executeQuery();

			while(resultadosConsulta.next()){
				oPre = new Pregunta1VO();
				oPre.setNombrePromocion(resultadosConsulta.getString("nombre"));
				oPre.setCantidadPromocion(resultadosConsulta.getInt("count"));
				listPre.add(oPre);
			}
		}catch (Exception e){
		    	e.printStackTrace();
		}finally {
			try {
				if (pst != null) {
					pst.close();
				}
				
			} catch (SQLException ex) {
				System.out.println("Error SQL:" + ex);
				
			}
		}
		return listPre;
	}
	
	
	public ArrayList<Pregunta2VO> pregunta2(String query, int fInicial, int fFinal, String nombreProducto){
		Pregunta2VO oPre;
		ArrayList<Pregunta2VO> listPre = new ArrayList<Pregunta2VO>();
		PreparedStatement pst = null;
		
		try {
			pst = conn.getConnection().prepareStatement(query);				
			
			pst.setInt(1, fInicial);			
			pst.setInt(2, fFinal);
			pst.setString(3, nombreProducto);
			
			ResultSet resultadosConsulta = pst.executeQuery();

			while(resultadosConsulta.next()){
				oPre = new Pregunta2VO();
				oPre.setNombreProducto(resultadosConsulta.getString("nombre"));
				oPre.setCantidadVentas(resultadosConsulta.getInt("ventas"));
				listPre.add(oPre);
			}
		}catch (Exception e){
		    	e.printStackTrace();
		}finally {
			try {
				if (pst != null) {
					pst.close();
				}
				
			} catch (SQLException ex) {
				System.out.println("Error SQL:" + ex);
				
			}
		}
		return listPre;
	}
	
	public void pregunta3(String query){
		
	}
	
	public  ArrayList<Pregunta4VO> pregunta4(String query, int fInicial, int fFinal){
		Pregunta4VO oPre;
		ArrayList<Pregunta4VO> listPre = new ArrayList<Pregunta4VO>();
		PreparedStatement pst = null;
		
		try {
			pst = conn.getConnection().prepareStatement(query);				
			
			pst.setInt(1, fInicial);			
			pst.setInt(2, fFinal);
		
			ResultSet resultadosConsulta = pst.executeQuery();

			while(resultadosConsulta.next()){
				oPre = new Pregunta4VO();
				oPre.setNombrePromocion(resultadosConsulta.getString("promocion"));
				oPre.setCantidadVentas(resultadosConsulta.getInt("count"));
				listPre.add(oPre);
			}
		}catch (Exception e){
		    	e.printStackTrace();
		}finally {
			try {
				if (pst != null) {
					pst.close();
				}
				
			} catch (SQLException ex) {
				System.out.println("Error SQL:" + ex);
				
			}
		}
		return listPre;
	}
}
