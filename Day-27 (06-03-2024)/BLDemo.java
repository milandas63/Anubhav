package com.layout;

import java.awt.BorderLayout;
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JFrame;

public class BLDemo {

	public static void main(String[] args) {
		JFrame f = new JFrame("BorderLayout Demo");
		f.setLayout(new BorderLayout());

		JButton btnNorth = new JButton("NORTH");
		f.add(btnNorth, BorderLayout.NORTH);

		JButton btnWest = new JButton("WEST");
		f.add(btnWest, BorderLayout.WEST);

		JButton btnCenter = new JButton("Center");
		f.add(btnCenter, BorderLayout.CENTER);

		JButton btnEast = new JButton("EAST");
		f.add(btnEast, BorderLayout.EAST);

		JButton btnSouth = new JButton("SOUTH");
		f.add(btnSouth, BorderLayout.SOUTH);

		f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		f.setBounds(150,200,400,300);
		f.setVisible(true);
	}

}
