package vista.preguntas;

import javax.swing.JPanel;
import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JComboBox;

public class Pregunta3 extends JPanel {

	/**
	 * Create the panel.
	 */
	public Pregunta3() {
		setLayout(null);
		
		JButton btnNewButton = new JButton("New button");
		btnNewButton.setBounds(245, 137, 89, 23);
		add(btnNewButton);
		
		JLabel lblNewLabel = new JLabel("Pregunta3");
		lblNewLabel.setBounds(97, 74, 138, 14);
		add(lblNewLabel);
		
		JComboBox comboBox = new JComboBox();
		comboBox.setBounds(75, 123, 103, 20);
		add(comboBox);

	}

}
