package com.layout;

import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JFrame;

public class FLDemo {
	public static void main(String[] args) {
		JFrame f = new JFrame("FlowLayout Demo");
		f.setLayout(new FlowLayout(FlowLayout.LEFT));

		String months[] = {"January","February","March","April","May","June","July","August","September","October","November","December"};
		JButton btnDummy;
		for(int i=0; i<months.length; i++) {
			btnDummy = new JButton(" "+months[i]+" ");
			f.add(btnDummy);
		}

		f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		f.setBounds(150,200,400,300);
		f.setVisible(true);
	}
}
