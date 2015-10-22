package vista.preguntas;

import javax.swing.JPanel;
import java.awt.Color;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.border.TitledBorder;
import javax.swing.JTextField;

public class Pregunta1 extends JPanel {
	private JTextField txtAInicial;
	private JTextField txtMInicial;
	private JTextField txtDInicial;
	private JTextField txtAFinal;
	private JTextField txtMFinal;
	private JTextField txtDFinal;

	/**
	 * Create the panel.
	 */
	public Pregunta1() {
		setBackground(new Color(255, 255, 255));
		setLayout(null);
		
		JPanel panel = new JPanel();
		panel.setBorder(new TitledBorder(null, "Parametrizaci\u00F3n", TitledBorder.LEADING, TitledBorder.TOP, null, null));
		panel.setBounds(10, 22, 430, 95);
		add(panel);
		panel.setLayout(null);
		
		JLabel lblNewLabel = new JLabel("Fecha Inicial:");
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblNewLabel.setBounds(10, 22, 93, 14);
		panel.add(lblNewLabel);
		
		JLabel lblNewLabel_1 = new JLabel("Fecha Final:");
		lblNewLabel_1.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblNewLabel_1.setBounds(10, 50, 80, 14);
		panel.add(lblNewLabel_1);
		
		txtAInicial = new JTextField();
		txtAInicial.setBounds(182, 22, 46, 20);
		panel.add(txtAInicial);
		txtAInicial.setColumns(10);
		
		JLabel lblNewLabel_2 = new JLabel("A\u00F1o (AAAA)");
		lblNewLabel_2.setBounds(115, 25, 70, 14);
		panel.add(lblNewLabel_2);
		
		JLabel lblNewLabel_3 = new JLabel("Mes (MM)");
		lblNewLabel_3.setBounds(238, 24, 58, 14);
		panel.add(lblNewLabel_3);
		
		txtMInicial = new JTextField();
		txtMInicial.setBounds(299, 22, 34, 20);
		panel.add(txtMInicial);
		txtMInicial.setColumns(10);
		
		JLabel lblNewLabel_4 = new JLabel("Dia (DD)");
		lblNewLabel_4.setBounds(339, 25, 46, 14);
		panel.add(lblNewLabel_4);
		
		txtDInicial = new JTextField();
		txtDInicial.setBounds(386, 22, 34, 20);
		panel.add(txtDInicial);
		txtDInicial.setColumns(10);
		
		txtAFinal = new JTextField();
		txtAFinal.setColumns(10);
		txtAFinal.setBounds(181, 48, 46, 20);
		panel.add(txtAFinal);
		
		JLabel label = new JLabel("A\u00F1o (AAAA)");
		label.setBounds(114, 51, 70, 14);
		panel.add(label);
		
		JLabel label_1 = new JLabel("Mes (MM)");
		label_1.setBounds(238, 52, 58, 14);
		panel.add(label_1);
		
		txtMFinal = new JTextField();
		txtMFinal.setColumns(10);
		txtMFinal.setBounds(298, 48, 34, 20);
		panel.add(txtMFinal);
		
		JLabel label_2 = new JLabel("Dia (DD)");
		label_2.setBounds(338, 51, 46, 14);
		panel.add(label_2);
		
		txtDFinal = new JTextField();
		txtDFinal.setColumns(10);
		txtDFinal.setBounds(385, 48, 34, 20);
		panel.add(txtDFinal);

	}
}
