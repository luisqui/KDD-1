package modelo.modelamiento;

import java.util.ArrayList;

import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import java.io.BufferedReader;
import java.io.FileReader;

public class Modelamiento {
	
	
	
	public ArrayList<String> generarNombres(){
		ArrayList<String> dir = new ArrayList<String>();

		
		String cadena;
        String query="";
        FileReader f = null;
        BufferedReader b = null;
        try{
	        f = new FileReader("Resources/NameTables.txt");
	        b = new BufferedReader(f);
	        while((cadena = b.readLine())!=null) {
	        	cadena = cadena.replaceAll("\\s","");
	        	dir.add(cadena);
	        }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
        	try{                    
                if( f != null ){   
                   f.close();  
                   b.close();
                }                  
             }catch (Exception e2){ 
                e2.printStackTrace();
             }      
        }
        
        return dir;	
	}
	
		
	public ArrayList<String> generarRutaImportar(ArrayList<String> dir){
		
		ArrayList<String> listaImportar = new ArrayList<String>();		
		String strImport;
		
		String ruta = buscarDir();
		if(ruta != null){
			for(int i=0; i<dir.size(); i++){
				strImport = "COPY \""+dir.get(i)+"\" FROM '"+ruta+"\\"+dir.get(i)+".txt'"+"using delimiters '|' NULL AS ''";	
				listaImportar.add(strImport);
			}
		}else{
			JOptionPane.showMessageDialog(null, "No se a seleccionado una ruta valida.");
		}
		
		return listaImportar;
	}
	
	
	private String buscarDir(){
		JFileChooser chooser = new JFileChooser();
	    chooser.setCurrentDirectory(new java.io.File("."));
	    chooser.setDialogTitle("Buscar");
	    chooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
	    chooser.setAcceptAllFileFilterUsed(false);
	    String ruta;

	    if (chooser.showOpenDialog(null) == JFileChooser.APPROVE_OPTION) {
	      //System.out.println("getCurrentDirectory(): " + chooser.getCurrentDirectory());	      
	      ruta = chooser.getSelectedFile().toString();
	      ruta.replace("\\", "\\\\");	      
	      return ruta;
	    	
	    } else {
	      //System.out.println("No Selection ");
	    	return null;
	    }	    
	    
	  }
	
	
	public String queryCrearTablas(){
        String cadena;
        String query="";
        FileReader f = null;
        BufferedReader b = null;
        try{
	        f = new FileReader("Resources/BackupNew.sql");
	        b = new BufferedReader(f);
	        while((cadena = b.readLine())!=null) {	            
	        	query += "\n"+ cadena;
	        }
        }catch(Exception e){
            e.printStackTrace();
        }finally{
        	try{                    
                if( f != null ){   
                   f.close();  
                   b.close();
                }                  
             }catch (Exception e2){ 
                e2.printStackTrace();
             }      
        }
        
        return query;		
    }
	
	
}
