package controlador;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import vista.ReportesView;
import vista.preguntas.*;

public class ControladorReportes implements ActionListener {
	private ReportesView oReportesView;
	private Seleccion oSeleccion0;
	private Pregunta1 oPregunta1;
	private Pregunta2 oPregunta2;
	private Pregunta3 oPregunta3;
	private Pregunta4 oPregunta4;
	
	public ControladorReportes(){
		oReportesView = new ReportesView();		
		oReportesView.getSelectPregunta().addActionListener(this);
				
		
	}

	
	
	@Override
	public void actionPerformed(ActionEvent e) {
		
		if(e.getSource() == oReportesView.getSelectPregunta()){//Al cambiar de pregunta
			int seleccion = oReportesView.getSelectPregunta().getSelectedIndex();
			instanciarPregunta(seleccion);
		}
		
	}
	
	
	
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
			oPregunta2 = new Pregunta2();
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
	
	
}
