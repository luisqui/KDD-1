package modelo.modelamiento;

import java.util.ArrayList;

import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import java.io.BufferedReader;
import java.io.FileReader;

public class Modelamiento {
	
	
	
	public ArrayList<String> generarNombres(){
		ArrayList<String> dir = new ArrayList<String>();
		dir.add("DimAccount");
		dir.add("DimCurrency");
		dir.add("DimSalesTerritory");
		dir.add("DimGeography");
		dir.add("DimCustomer");
		dir.add("DimDate");
		dir.add("DimDepartmentGroup");
		dir.add("DimEmployee");		
		dir.add("DimOrganization");
		dir.add("DimProductCategory");	
		dir.add("DimProductSubcategory");
		dir.add("DimProduct");			
		dir.add("DimPromotion");
		dir.add("DimReseller");
		dir.add("DimSalesReason");		
		dir.add("DimScenario");
		dir.add("FactAdditionalInternationalProductDescription");
		dir.add("FactCallCenter");
		dir.add("FactCurrencyRate");
		dir.add("FactFinance");
		dir.add("FactInternetSales");
		dir.add("FactInternetSalesReason");
		dir.add("FactProductInventory");
		dir.add("FactResellerSales");
		dir.add("FactSalesQuota");
		dir.add("FactSurveyResponse");
		dir.add("NewFactCurrencyRate");
		dir.add("ProspectiveBuyer");
		
		return dir;
	}
	
	public ArrayList<String> generarRutaImportar(){
		ArrayList<String> dir = generarNombres();
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
