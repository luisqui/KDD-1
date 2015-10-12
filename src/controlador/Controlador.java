package controlador;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import modelo.DAO.importarDAO.ImportarDAO;
import modelo.conexion.conexion;
import modelo.modelamiento.Modelamiento;
import modelo.validar.ValidarConf;
import vista.ImportarDatosView;

public class Controlador implements ActionListener {
	private ImportarDatosView oImportarDatosView;
	private conexion oConexion;
	private ImportarDAO oImportarDAO;
	private Modelamiento oModelamiento;
	private ValidarConf oValidarConfig;
	
	public Controlador(){
		oImportarDatosView = new ImportarDatosView();
		oImportarDatosView.getBtnCrearTablas().addActionListener(this);
		oImportarDatosView.getBtnImportarDatos().addActionListener(this);
		
		oModelamiento = new Modelamiento();
		
		oValidarConfig = new ValidarConf();
		
		oValidarConfig.leerConfig();
	}


	@Override
	public void actionPerformed(ActionEvent e) {
		
		
		if(e.getSource() == oImportarDatosView.getBtnCrearTablas()){//Evento para crear Tablas
			
			if(!oValidarConfig.isCreado()){ //Verifica que las tablas no esten creadas
				crearTablas();								
			}else{
				JOptionPane.showMessageDialog(null, "Las tablas ya han sido creadas.");
			}
		}
		
///************************************************************************************************************		
		else if(e.getSource() == oImportarDatosView.getBtnImportarDatos()){//Evento para importar datos
			
			if(oValidarConfig.isCreado()){ //Verifica que el DW este creado para importar
				
				if(!oValidarConfig.isImportado()){//Verifica que el DW no este importado
					importarDatos();					
				}else{
					JOptionPane.showMessageDialog(null, "Los datos ya han sido importados.");
				}
			}else{
				JOptionPane.showMessageDialog(null, "Aun no existen tablas para importar los datos.");
			}
		}
	}
	
	
    private void importarDatos() {
        
        new Thread(new Runnable(){
            @Override
            public void run() {
            	habilitarOpciones(false);
            	oConexion = new conexion();
				oImportarDAO = new ImportarDAO(oConexion);
				
				ArrayList<String> listaMsg = oModelamiento.generarNombres();
				ArrayList<String> listaImportar = oModelamiento.generarRutaImportar(listaMsg);				
				for(int i=0; i<listaImportar.size(); i++){
					String tabla = listaMsg.get(i);
					oImportarDatosView.setTextAreaConsole("Importando: "+tabla+"...");												
					oImportarDAO.executeQuery(listaImportar.get(i));
				}
				oImportarDatosView.setTextAreaConsole("Operación completada.");
				oValidarConfig.setImportado("true");
				oValidarConfig.escribirConfig();
				habilitarOpciones(true);
            }}).start();
    }
    
    
    private void crearTablas(){
    	 new Thread(new Runnable(){
             @Override
             public void run() {
            	habilitarOpciones(false);
            	oConexion = new conexion();
 				oImportarDAO = new ImportarDAO(oConexion);
 				
 				String queryCrearTablas = oModelamiento.queryCrearTablas();
 				oImportarDatosView.setTextAreaConsole("Creando Tablas.");
 				oImportarDAO.executeQuery(queryCrearTablas);
 				oImportarDatosView.setTextAreaConsole("Operación completada.");
 				oValidarConfig.setCreado("true");
 				oValidarConfig.escribirConfig(); 
 				habilitarOpciones(true);
             }}).start();
    }
    
    private void habilitarOpciones(boolean opcion){
    	oImportarDatosView.getBtnCrearTablas().setEnabled(opcion);
    	oImportarDatosView.getBtnImportarDatos().setEnabled(opcion);
    }
	
	
	
}
