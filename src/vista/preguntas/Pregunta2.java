package vista.preguntas;

import javax.swing.JPanel;
import java.awt.Color;
import javax.swing.JLabel;
import java.awt.Font;

public class Pregunta2 extends JPanel {

	/**
	 * Create the panel.
	 */
	public Pregunta2() {
		setBackground(new Color(255, 255, 255));
		setLayout(null);
		
		JLabel lblNewLabel = new JLabel("Pregunta 2");
		lblNewLabel.setFont(new Font("Tahoma", Font.PLAIN, 29));
		lblNewLabel.setBounds(20, 80, 350, 115);
		add(lblNewLabel);

	}

}
