package vista;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import java.awt.Color;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.JButton;
import javax.swing.JTextArea;
import javax.swing.JScrollPane;
public class ImportarDatosView extends JFrame{
	private JButton btnCrearTablas;
	private JButton btnImportarDatos;
	private JTextArea textAreaConsole;
	private JScrollPane scrollPane;


	public ImportarDatosView() {
		setTitle("AdventureWorks - Import");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 314, 344);
		setResizable(false);
		
		JPanel contentPane = new JPanel();
		contentPane.setBackground(new Color(230, 230, 230));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JPanel panel = new JPanel();
		panel.setBackground(new Color(224, 96, 97));
		
		panel.setBounds(0, 0, 298, 55);
		contentPane.add(panel);
		panel.setLayout(null);
		
		JLabel lbTituloImportar = new JLabel("\u00BFQUE QUIERE HACER?");
		lbTituloImportar.setFont(new Font("Tahoma", Font.BOLD, 25));
		lbTituloImportar.setForeground(Color.WHITE);
		lbTituloImportar.setBounds(10, 11, 278, 33);
		panel.add(lbTituloImportar);
		
		btnCrearTablas = new JButton("CREAR TABLAS");
		btnCrearTablas.setBounds(10, 83, 278, 38);
		contentPane.add(btnCrearTablas);
		
		btnImportarDatos = new JButton("IMPORTAR DATOS");
		btnImportarDatos.setBounds(10, 132, 278, 38);
		contentPane.add(btnImportarDatos);
		
		textAreaConsole = new JTextArea();
		textAreaConsole.setEditable(false);
		textAreaConsole.setText("Console");
		
		scrollPane = new JScrollPane(textAreaConsole);
		scrollPane.setBounds(10, 216, 278, 79);
		contentPane.add(scrollPane);
		
		setVisible(true);		
	}


	public JButton getBtnCrearTablas() {
		return btnCrearTablas;
	}


	public void setBtnCrearTablas(JButton btnCrearTablas) {
		this.btnCrearTablas = btnCrearTablas;
	}


	public JButton getBtnImportarDatos() {
		return btnImportarDatos;
	}


	public void setBtnImportarDatos(JButton btnImportarDatos) {
		this.btnImportarDatos = btnImportarDatos;
	}


	public JTextArea getTextAreaConsole() {
		return textAreaConsole;
	}


	public void setTextAreaConsole(String accion) {		
		String nuevo = textAreaConsole.getText() + "\n" + accion;		
		textAreaConsole.setText(nuevo);
		scrollPane.getVerticalScrollBar().setValue(scrollPane.getVerticalScrollBar().getMaximum());
	}


	
}
