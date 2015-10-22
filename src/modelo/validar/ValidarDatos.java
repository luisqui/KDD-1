package modelo.validar;

import java.util.ArrayList;

import javax.swing.JOptionPane;

public class ValidarDatos {
	
	public boolean isNumero(String numero){
		try{
			Integer.parseInt(numero);
		}catch(Exception e){
			JOptionPane.showMessageDialog(null, "El valor debe ser numerico. Pero recibe "+numero);
			return false;
		}
		return true;
	}
	
	public boolean isNull(String str){
		if ( str==null||str.trim().equals("") ){
			JOptionPane.showMessageDialog(null, "Todos los campos son obligatorios");
			return true;
		}
		return false;
	}
	
	
	public boolean isNumero(ArrayList<String> str){
		for(String actual : str){
			if(!isNumero(actual)){
				return false;
			}
		}
		return true;
	}
	
	public boolean isNull(ArrayList<String> str){
		for(String actual : str){
			if(!isNull(actual)){
				return false;
			}
		}
		return true;
	}
	
}
