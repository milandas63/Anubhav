package com.login;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.Insets;
import java.awt.Rectangle;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JDesktopPane;
import javax.swing.JFrame;
import javax.swing.JInternalFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

public class Login extends JFrame {
	JDesktopPane desktop;
	JInternalFrame iFrm;
	JLabel lblUsername;
	JLabel lblPassword;
	JTextField tfUsername;
	JPasswordField pfPassword;
	
	int width = 1366;
	int height = 768;
	
	public Login() {
		desktop = new JDesktopPane();
		this.setLayout(new BorderLayout());
		this.add(desktop, BorderLayout.CENTER);
		
		this.setBounds(0, 0, width, height);
		this.setMaximizedBounds(new Rectangle(0, 0, width, height));
		this.setVisible(true);

		iFrm = new JInternalFrame(" Login ");
		iFrm.setLayout(new BorderLayout());
		
		JLabel lblCaption = new JLabel(" Login ", JLabel.CENTER);
		lblCaption.setBackground(Color.lightGray);
		lblCaption.setForeground(Color.blue);
		lblCaption.setFont(new Font("Arial", Font.BOLD, 20));
		lblCaption.setOpaque(true);
		lblCaption.setBorder(BorderFactory.createRaisedBevelBorder());
		iFrm.add(lblCaption, BorderLayout.NORTH);

		
		JPanel pnlBody = new JPanel(new BorderLayout()) {
			private static final long serialVersionUID = 1L;
			public Insets getInsets() {
				return new Insets(5,25,25,25);
			}
		};
		iFrm.add(pnlBody, BorderLayout.CENTER);
		JPanel pnlWest = new JPanel(new GridLayout(8,1));
		pnlBody.add(pnlWest, BorderLayout.WEST);
		pnlWest.add(new JLabel(""));
		pnlWest.add(new JLabel(""));
		pnlWest.add(new JLabel(""));
		pnlWest.add(new JLabel("Username: "));
		pnlWest.add(new JLabel("Password: "));
		pnlWest.add(new JLabel(""));
		pnlWest.add(new JLabel(""));
		pnlWest.add(new JLabel(""));

		JPanel pnlCenter = new JPanel(new GridLayout(8,1));
		pnlBody.add(pnlCenter, BorderLayout.CENTER);
		tfUsername = new JTextField();
		pfPassword = new JPasswordField();
		pnlCenter.add(new JLabel(""));
		pnlCenter.add(new JLabel(""));
		pnlCenter.add(new JLabel(""));
		pnlCenter.add(tfUsername);
		pnlCenter.add(pfPassword);
		pnlCenter.add(new JLabel(""));
		pnlCenter.add(new JLabel(""));
		pnlCenter.add(new JLabel(""));

		JPanel pnlBottom = new JPanel(new GridLayout(1,4));
		pnlBody.add(pnlBottom, BorderLayout.SOUTH);
			JButton btnLogin = new JButton(" Login ");
			JButton btnExit = new JButton(" Exit ");
			pnlBottom.add(new JLabel(""));
			pnlBottom.add(btnLogin);
			pnlBottom.add(btnExit);
			pnlBottom.add(new JLabel(""));
			btnExit.addActionListener(new ActionListener() {
				@Override
				public void actionPerformed(ActionEvent ae) {
					System.exit(0);
				}
			});
		
		desktop.add(iFrm);
		iFrm.setBounds((width-400)/2, (height-400)/2, 400, 400);
		iFrm.setVisible(true);
	}

	public static void main(String[] args) {
		new Login();
	}

}
