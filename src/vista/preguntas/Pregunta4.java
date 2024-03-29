package vista.preguntas;

import javax.swing.JPanel;
import javax.swing.border.TitledBorder;
import javax.swing.UIManager;
import java.awt.Color;
import javax.swing.JLabel;
import java.awt.Font;
import javax.swing.JTextField;
import javax.swing.JSpinner;
import javax.swing.SpinnerNumberModel;

public class Pregunta4 extends JPanel {
	private JTextField txtAInicial;
	private JTextField txtAFinal;
	private JSpinner txtMInicial;
	private JSpinner txtDInicial;
	private JSpinner txtMFinal;
	private JSpinner txtDFinal;

	/**
	 * Create the panel.
	 */
	public Pregunta4() {
		setBackground(Color.WHITE);
		setLayout(null);
		
		JPanel panel = new JPanel();
		panel.setLayout(null);
		panel.setBorder(new TitledBorder(UIManager.getBorder("TitledBorder.border"), "Parametrizaci\u00F3n", TitledBorder.LEADING, TitledBorder.TOP, null, new Color(0, 0, 0)));
		panel.setBounds(10, 11, 430, 95);
		add(panel);
		
		JLabel label = new JLabel("Fecha Inicial:");
		label.setFont(new Font("Tahoma", Font.BOLD, 14));
		label.setBounds(10, 22, 93, 14);
		panel.add(label);
		
		JLabel label_1 = new JLabel("Fecha Final:");
		label_1.setFont(new Font("Tahoma", Font.BOLD, 14));
		label_1.setBounds(10, 50, 80, 14);
		panel.add(label_1);
		
		txtAInicial = new JTextField();
		txtAInicial.setColumns(10);
		txtAInicial.setBounds(182, 22, 46, 20);
		panel.add(txtAInicial);
		
		JLabel label_2 = new JLabel("A\u00F1o (AAAA)");
		label_2.setBounds(115, 25, 70, 14);
		panel.add(label_2);
		
		JLabel label_3 = new JLabel("Mes (MM)");
		label_3.setBounds(238, 24, 58, 14);
		panel.add(label_3);
		
		JLabel label_4 = new JLabel("Dia (DD)");
		label_4.setBounds(339, 25, 46, 14);
		panel.add(label_4);
		
		txtAFinal = new JTextField();
		txtAFinal.setColumns(10);
		txtAFinal.setBounds(181, 48, 46, 20);
		panel.add(txtAFinal);
		
		JLabel label_5 = new JLabel("A\u00F1o (AAAA)");
		label_5.setBounds(114, 51, 70, 14);
		panel.add(label_5);
		
		JLabel label_6 = new JLabel("Mes (MM)");
		label_6.setBounds(238, 52, 58, 14);
		panel.add(label_6);
		
		JLabel label_7 = new JLabel("Dia (DD)");
		label_7.setBounds(338, 51, 46, 14);
		panel.add(label_7);
		
		txtMInicial = new JSpinner();
		txtMInicial.setModel(new SpinnerNumberModel(1, 1, 12, 1));
		txtMInicial.setBounds(295, 21, 34, 20);
		panel.add(txtMInicial);
		
		txtMFinal = new JSpinner();
		txtMFinal.setModel(new SpinnerNumberModel(1, 1, 12, 1));
		txtMFinal.setBounds(295, 49, 34, 20);
		panel.add(txtMFinal);
		
		txtDInicial = new JSpinner();
		txtDInicial.setModel(new SpinnerNumberModel(1, 1, 31, 1));
		txtDInicial.setBounds(385, 21, 34, 20);
		panel.add(txtDInicial);
		
		txtDFinal = new JSpinner();
		txtDFinal.setModel(new SpinnerNumberModel(1, 1, 31, 1));
		txtDFinal.setBounds(385, 49, 34, 20);
		panel.add(txtDFinal);

	}
	
	public String getTxtAInicial() {
		return txtAInicial.getText();
	}

	public String getTxtAFinal() {
		return txtAFinal.getText();
	}

	public String getTxtMInicial() {
		return txtMInicial.getValue().toString();
	}

	public String getTxtMFinal() {
		return txtMFinal.getValue().toString();
	}

	public String getTxtDInicial() {
		return txtDInicial.getValue().toString();
	}

	public String getTxtDFinal() {
		return txtDFinal.getValue().toString();
	}

}
