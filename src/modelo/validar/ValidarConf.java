package modelo.validar;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.io.FileOutputStream;
import java.io.OutputStream;


public class ValidarConf {
	private boolean creado;
	private boolean importado;
	
	
	public void leerConfig(){
		Properties propiedades = new Properties();
	    InputStream entrada = null;

	    try {

	        entrada = new FileInputStream("Resources/config.properties");

	        // cargamos el archivo de propiedades
	        propiedades.load(entrada);

	        // obtenemos las propiedades
	        setCreado(propiedades.getProperty("creado"));
	        setImportado(propiedades.getProperty("importado"));	

	    } catch (IOException ex) {
	        ex.printStackTrace();
	    } finally {
	        if (entrada != null) {
	            try {
	                entrada.close();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	}
	
	
	public void escribirConfig(){
		Properties propiedades = new Properties();
	    OutputStream salida = null;

	    try {
	        salida = new FileOutputStream("Resources/config.properties");

	        // asignamos los valores a las propiedades
	        propiedades.setProperty("creado", String.valueOf(isCreado()));
	        propiedades.setProperty("importado", String.valueOf(isImportado()));

	        // guardamos el archivo de propiedades en la carpeta de aplicación
	        propiedades.store(salida, null);

	    } catch (IOException io) {
	        io.printStackTrace();
	    } finally {
	        if (salida != null) {
	            try {
	                salida.close();
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	    }
	}


	public boolean isCreado() {
		return creado;
	}


	public void setCreado(String creado) {
		if(creado.equals("false")){
			this.creado = false;
		}else{
			this.creado = true;
		}
		
	}


	public boolean isImportado() {
		return importado;
	}


	public void setImportado(String importado) {
		if(importado.equals("false")){
			this.importado = false;
		}else{
			this.importado = true;
		}
	}
	
	
	
	
}
