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
			
			if(!oValidarConfig.isCreado()){
				
				oConexion = new conexion();
				oImportarDAO = new ImportarDAO(oConexion);
				
				String queryCrearTablas = oModelamiento.queryCrearTablas();
				oImportarDatosView.setTextAreaConsole("Creando Tablas.");
				oImportarDAO.executeQuery(queryCrearTablas);
				oImportarDatosView.setTextAreaConsole("Operación completada.");
				oValidarConfig.setCreado("true");
				oValidarConfig.escribirConfig();
				
			}else{
				JOptionPane.showMessageDialog(null, "Las tablas ya han sido creadas.");
			}
		}
		
///************************************************************************************************************		
		else if(e.getSource() == oImportarDatosView.getBtnImportarDatos()){//Evento para importar datos
			
			if(oValidarConfig.isCreado()){ //Verifica que el DW este creado para importar
				
				if(!oValidarConfig.isImportado()){
					oConexion = new conexion();
					oImportarDAO = new ImportarDAO(oConexion);
					
					ArrayList<String> listaImportar = oModelamiento.generarRutaImportar();
					ArrayList<String> listaMsg = oModelamiento.generarNombres();
					for(int i=0; i<listaImportar.size(); i++){
						//System.out.println("Importando: "+listaMsg.get(i)+"...");
						oImportarDatosView.setTextAreaConsole("Importando: "+listaMsg.get(i)+"...");				
						oImportarDAO.executeQuery(listaImportar.get(i));
					}
					oImportarDatosView.setTextAreaConsole("Operación completada.");
					oValidarConfig.setImportado("true");
					oValidarConfig.escribirConfig();
				}else{
					JOptionPane.showMessageDialog(null, "Los datos ya han sido importados.");
				}
			}else{
				JOptionPane.showMessageDialog(null, "Aun no existen tablas para importar los datos.");
			}
		}
	}
	
}
