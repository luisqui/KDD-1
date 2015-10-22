package vista;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import java.awt.Font;
import java.awt.Color;
import javax.swing.border.LineBorder;
import javax.swing.JComboBox;
import javax.swing.JButton;

public class ReportesView extends JFrame {
	private JPanel panelPregunta;
	private JComboBox selectPregunta;
	private JButton btnConsultar;
	private JButton btnSalir;

	public ReportesView() {
		setTitle("Reportes");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 536, 414);
		JPanel contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		contentPane.setBackground(new Color(230, 230, 230));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JPanel panel = new JPanel();
		panel.setBorder(null);
		panel.setBounds(0, 0, 520, 55);
		panel.setBackground(new Color(224, 96, 97));
		contentPane.add(panel);
		panel.setLayout(null);
		
		JLabel lblNewLabel = new JLabel("Generaci\u00F3n de Reportes");
		lblNewLabel.setForeground(Color.WHITE);
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 25));
		lblNewLabel.setBounds(10, 11, 325, 39);
		panel.add(lblNewLabel);
		
		JPanel panel_1 = new JPanel();
		panel_1.setBackground(new Color(255, 255, 255));
		panel_1.setBounds(0, 53, 520, 55);
		contentPane.add(panel_1);
		panel_1.setLayout(null);
		
		selectPregunta = new JComboBox();
		selectPregunta.setBounds(10, 24, 500, 20);
		panel_1.add(selectPregunta);
		
		JLabel lblNewLabel_1 = new JLabel("Pregunta:");
		lblNewLabel_1.setBounds(10, 11, 63, 14);
		panel_1.add(lblNewLabel_1);
		
		panelPregunta = new JPanel();
		panelPregunta.setBounds(0, 119, 520, 191);
		contentPane.add(panelPregunta);
		panelPregunta.setLayout(null);
		
		JPanel panel_2 = new JPanel();
		panel_2.setLayout(null);
		panel_2.setBorder(null);
		panel_2.setBackground(new Color(224, 96, 97));
		panel_2.setBounds(0, 321, 520, 55);
		contentPane.add(panel_2);
		
		btnConsultar = new JButton("Consultar");
		btnConsultar.setBounds(367, 11, 143, 33);
		panel_2.add(btnConsultar);
		
		btnSalir = new JButton("Salir");
		btnSalir.setBounds(216, 11, 143, 33);
		panel_2.add(btnSalir);
		
		llenarListaPreguntas();
		setVisible(true);
	}
	
		
	public JButton getBtnConsultar() {
		return btnConsultar;
	}
	public JButton getBtnSalir() {
		return btnSalir;
	}
	public JComboBox getSelectPregunta() {
		return selectPregunta;
	}		

	public JPanel getPanelPregunta() {
		return panelPregunta;
	}

	public void cambiarPregunta(JPanel panelNuevo) {
		panelNuevo.setSize(520, 208);
		panelNuevo.setLocation(0, 0);
		this.panelPregunta.removeAll();
		this.panelPregunta.add(panelNuevo);
		this.panelPregunta.revalidate();
		this.panelPregunta.repaint();
	}


	private void llenarListaPreguntas(){
		selectPregunta.addItem("Seleccione");
		selectPregunta.addItem("�Cu�les son las promociones que m�s toman los clientes?");
		selectPregunta.addItem("Comparaci�n de ventas con promoci�n y producto");
		selectPregunta.addItem("Comparaci�n de ventas por volumen frente a ventas por temporada");
		selectPregunta.addItem("�Cu�l es la promoci�n de ventas por volumen que m�s seleccionan?");
		selectPregunta.addItem("Comparativo de ventas por Internet y vendedores de la empresa");
		selectPregunta.addItem("Nivel de ventas por a�o, mes, trimestre y semestre");
		selectPregunta.addItem("Total de ventas de productos agrupados por categor�a");
		selectPregunta.addItem("Total de ventas agrupado por pa�ses");
		selectPregunta.addItem("Monedas m�s usadas por los clientes en las ventas");
		selectPregunta.addItem("Total de ventas por producto y en el tiempo");
		selectPregunta.addItem("Perfil de los clientes que m�s compran por Internet");
		selectPregunta.addItem("Productos que casi nunca se venden");
		selectPregunta.addItem("Productos que m�s se demoran en inventario");
		selectPregunta.addItem("Comparaci�n del nivel de llamadas al call center en d�as laborales vs d�as festivos");
		selectPregunta.addItem("Comparaci�n de llamadas por franjas horarias en d�as laborales");
		selectPregunta.addItem("Una comparaci�n del presupuesto asignado a cada departamento de la empresa");
		selectPregunta.addItem("�Cu�les son las cuentas y su departamento que m�s dinero mueven?");
	}
}
