package com.layout;

import java.awt.BorderLayout;
import java.awt.GridLayout;

import javax.swing.JButton;
import javax.swing.JFrame;

public class GLDemo {

	public static void main(String[] args) {
		JFrame f = new JFrame("GridLayout Demo");
		f.setLayout(new GridLayout(7,6));

		JButton btnDummy;
		String weekdays[] = {"Sun","Mon","Tue","Wed","Thu","Fri","Sat"};
		for(int i=0; i<weekdays.length; i++) {
			btnDummy = new JButton(weekdays[i]);
			f.add(btnDummy);
		}
		for(int i=1; i<=35; i++) {
			if(i<=31) {
				btnDummy = new JButton(String.valueOf(i));
			} else {
				btnDummy = new JButton("");
			}
			f.add(btnDummy);
		}

		f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		f.setBounds(150,200,500,300);
		f.setVisible(true);
	}

}
