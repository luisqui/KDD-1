package controlador;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;

import modelo.DAO.ReportesDAO;
import modelo.VO.Pregunta1VO;
import modelo.VO.Pregunta2VO;
import modelo.VO.Pregunta4VO;
import modelo.conexion.conexion;
import modelo.modelamiento.Modelamiento;
import modelo.validar.ValidarDatos;
import vista.ReportesView;
import vista.preguntas.*;

public class ControladorReportes extends ValidarDatos implements ActionListener{
	private ArrayList<String> listaProductos;
	private ReportesView oReportesView;
	private ReportesDAO oReportesDAO;
	private Modelamiento oModelo;
	private Seleccion oSeleccion0;
	private Pregunta1 oPregunta1;
	private Pregunta2 oPregunta2;
	private Pregunta3 oPregunta3;
	private Pregunta4 oPregunta4;
	
	public ControladorReportes(){
		oReportesView = new ReportesView();		
		oReportesView.getSelectPregunta().addActionListener(this);
		oReportesView.getBtnConsultar().addActionListener(this);
		oReportesView.getBtnSalir().addActionListener(this);
		
		oModelo = new Modelamiento();
		oReportesDAO = new ReportesDAO(new conexion());
		String query = oModelo.cargarQuery("Resources/SentenciasSQL/productos.sql");
		listaProductos = oReportesDAO.productos(query);	
	}

	
	
	@Override
	public void actionPerformed(ActionEvent e) {
		
		if(e.getSource() == oReportesView.getSelectPregunta()){//Al cambiar de pregunta
			int seleccion = oReportesView.getSelectPregunta().getSelectedIndex();
			instanciarPregunta(seleccion);
		}
		
		else if(e.getSource() == oReportesView.getBtnConsultar()){//al presionar boton consultar
			int seleccion = oReportesView.getSelectPregunta().getSelectedIndex();
			generarReporte(seleccion);
		}
		else if(e.getSource() == oReportesView.getBtnSalir()){//al presionar boton salir
			oReportesView.dispose();
		}
	}
	
	
	
	//Metodo que instancia una ventana segun la pregunta que se haya seleccionado
	private void instanciarPregunta(int seleccion){
		switch (seleccion) {
		case 0:
			oSeleccion0 = new Seleccion();
			oReportesView.cambiarPregunta(oSeleccion0);
			break;
		case 1:
			oPregunta1 = new Pregunta1();
			oReportesView.cambiarPregunta(oPregunta1);
			break;
		case 2:					
			oPregunta2 = new Pregunta2(listaProductos);
			oReportesView.cambiarPregunta(oPregunta2);					
			break;
		case 3:
			oPregunta3 = new Pregunta3();
			oReportesView.cambiarPregunta(oPregunta3);
			break;
		case 4:
			oPregunta4 = new Pregunta4();
			oReportesView.cambiarPregunta(oPregunta4);
			break;
		case 5:
			
			break;
		case 6:
			
			break;
		case 7:
			
			break;
		case 8:
			
			break;
		case 9:
			
			break;
		case 10:
			
			break;
		case 11:
			
			break;
		case 12:
			
			break;
		case 13:
			
			break;
		case 14:
			
			break;
		case 15:
			
			break;
		case 16:
			
			break;
		case 17:
			
			break;			
		}
	}
	
	
	//Metodo que genera el reporte segun la pregunta que se haya seleccionado
	private void generarReporte(int seleccion){
		String query;
		ArrayList<String> datosValidar = new ArrayList<String>();
		boolean numero = false;
		boolean nullStr = false;
		
		switch (seleccion) {
		
		case 1:
			datosValidar.add(oPregunta1.getTxtAFinal());
			datosValidar.add(oPregunta1.getTxtAInicial());
			datosValidar.add(oPregunta1.getTxtDFinal());
			datosValidar.add(oPregunta1.getTxtDInicial());
			datosValidar.add(oPregunta1.getTxtMFinal());
			datosValidar.add(oPregunta1.getTxtMInicial());
			if(isNumero(datosValidar)){
				query = oModelo.cargarQuery("Resources/SentenciasSQL/Pregunta1.sql");
				int fechaInicial = oModelo.ordenarFecha(oPregunta1.getTxtAInicial(),oPregunta1.getTxtMInicial(),oPregunta1.getTxtDInicial());
				int fechaFinal = oModelo.ordenarFecha(oPregunta1.getTxtAFinal(),oPregunta1.getTxtMFinal(),oPregunta1.getTxtDFinal());
				ArrayList<Pregunta1VO> oListaPre1 = oReportesDAO.pregunta1(query, fechaInicial,fechaFinal);	
				System.out.println("Registros preg1: "+oListaPre1.size());
			}
			break;
			
		case 2:					
			nullStr = isNull(oPregunta2.getTxtNombrePro());			
			datosValidar.add(oPregunta2.getTxtAFinal());
			datosValidar.add(oPregunta2.getTxtAInicial());
			datosValidar.add(oPregunta2.getTxtDFinal());
			datosValidar.add(oPregunta2.getTxtDInicial());
			datosValidar.add(oPregunta2.getTxtMFinal());
			datosValidar.add(oPregunta2.getTxtMInicial());
			numero = isNumero(datosValidar);			
			
			if(numero && !nullStr){
				query = oModelo.cargarQuery("Resources/SentenciasSQL/Pregunta2-1.sql");
				int fechaInicial = oModelo.ordenarFecha(oPregunta2.getTxtAInicial(),oPregunta2.getTxtMInicial(),oPregunta2.getTxtDInicial());
				int fechaFinal = oModelo.ordenarFecha(oPregunta2.getTxtAFinal(),oPregunta2.getTxtMFinal(),oPregunta2.getTxtDFinal());
				String nombreProducto = oPregunta2.getTxtNombrePro(); 
				ArrayList<Pregunta2VO> oListaPre2Con = oReportesDAO.pregunta2(query,fechaInicial,fechaFinal,nombreProducto);
				query = oModelo.cargarQuery("Resources/SentenciasSQL/Pregunta2-2.sql");
				ArrayList<Pregunta2VO> oListaPre2Sin = oReportesDAO.pregunta2(query,fechaInicial,fechaFinal,nombreProducto);
				System.out.println("Registros preg2 con: "+oListaPre2Con.size());
				System.out.println("Registros preg2 sin: "+oListaPre2Sin.size());
			}
			break;
			
		case 3:
			query = oModelo.cargarQuery("Resources/SentenciasSQL/Pregunta2-1.sql");
			oReportesDAO.pregunta3(query);
			break;
			
		case 4:
			datosValidar.add(oPregunta4.getTxtAFinal());
			datosValidar.add(oPregunta4.getTxtAInicial());
			datosValidar.add(oPregunta4.getTxtDFinal());
			datosValidar.add(oPregunta4.getTxtDInicial());
			datosValidar.add(oPregunta4.getTxtMFinal());
			datosValidar.add(oPregunta4.getTxtMInicial());
			if(isNumero(datosValidar)){
				query = oModelo.cargarQuery("Resources/SentenciasSQL/Pregunta4.sql");
				int fechaInicial = oModelo.ordenarFecha(oPregunta1.getTxtAInicial(),oPregunta1.getTxtMInicial(),oPregunta1.getTxtDInicial());
				int fechaFinal = oModelo.ordenarFecha(oPregunta1.getTxtAFinal(),oPregunta1.getTxtMFinal(),oPregunta1.getTxtDFinal());
				ArrayList<Pregunta4VO> oListaPre4 = oReportesDAO.pregunta4(query,fechaInicial, fechaFinal);
				System.out.println("Registros preg4: "+oListaPre4.size());
			}
			break;
		case 5:
			
			break;
		case 6:
			
			break;
		case 7:
			
			break;
		case 8:
			
			break;
		case 9:
			
			break;
		case 10:
			
			break;
		case 11:
			
			break;
		case 12:
			
			break;
		case 13:
			
			break;
		case 14:
			
			break;
		case 15:
			
			break;
		case 16:
			
			break;
		case 17:
			
			break;			
		}
	}	
	
}
