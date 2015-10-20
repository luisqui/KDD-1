package vista.preguntas;

import javax.swing.JPanel;
import java.awt.Color;
import javax.swing.JLabel;
import java.awt.Font;

public class Pregunta1 extends JPanel {

	/**
	 * Create the panel.
	 */
	public Pregunta1() {
		setBackground(new Color(255, 255, 255));
		setLayout(null);
		
		JLabel lblNewLabel = new JLabel("Pregunta 1");
		lblNewLabel.setFont(new Font("Tahoma", Font.PLAIN, 29));
		lblNewLabel.setBounds(36, 72, 327, 53);
		add(lblNewLabel);

	}

}
