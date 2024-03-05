package com.login;

import javax.swing.JDesktopPane;
import javax.swing.JFrame;
import javax.swing.JInternalFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

public class Start {
	String title = "POS Accounting";
	JDesktopPane desktop = new JDesktopPane();

	public Start() {
		JFrame f = new JFrame(title);
		f.add(desktop);
		
		JInternalFrame jif = new JInternalFrame("Login");
		jif.setLayout(null);
		desktop.add(jif);
		jif.setBounds(500,150,400,400);
		jif.setVisible(true);
		
		JLabel lblUser = new JLabel("Username: ");
		lblUser.setBounds(25, 50, 100, 30);
		jif.add(lblUser);

		JTextField tfUser = new JTextField();
		tfUser.setBounds(126, 50, 200, 30);
		jif.add(tfUser);
		
		
		f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		f.setBounds(0,0,1366,730);
		f.setVisible(true);
	}
	
	public static void main(String[] args) {
		new Start();
	}

}
