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
	private JButton btnSelPregunta;

	public ReportesView() {
		setTitle("Reportes");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 536, 365);
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
		selectPregunta.setBounds(10, 24, 373, 20);
		panel_1.add(selectPregunta);
		
		btnSelPregunta = new JButton("Consultar");
		btnSelPregunta.setBounds(421, 23, 89, 23);
		panel_1.add(btnSelPregunta);
		
		JLabel lblNewLabel_1 = new JLabel("Pregunta:");
		lblNewLabel_1.setBounds(10, 11, 63, 14);
		panel_1.add(lblNewLabel_1);
		
		panelPregunta = new JPanel();
		panelPregunta.setBounds(0, 119, 520, 208);
		contentPane.add(panelPregunta);
		panelPregunta.setLayout(null);
		
		llenarListaPreguntas();
		setVisible(true);
	}	
	
	
	
	public JComboBox getSelectPregunta() {
		return selectPregunta;
	}

	public JButton getBtnSelPregunta() {
		return btnSelPregunta;
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
		selectPregunta.addItem("pregunta 1");
		selectPregunta.addItem("pregunta 2");
		selectPregunta.addItem("pregunta 3");
	}
	
	
	
}
