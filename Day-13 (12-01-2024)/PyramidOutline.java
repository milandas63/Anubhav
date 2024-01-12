package com.pattern;

//	Draw a outline of a triangle using stars?

public class PyramidOutline {
	public static void main(String[] args) {
		int spaces = 40;
		int stars = 1;
		String printChar = "*";
		
		for(int i=1; i<=15; i++) {
			for(int j=0; j<spaces; j++) System.out.print(" ");
			for(int j=0; j<stars; j++) {
				if(j==0 || j==(stars-1) || i==15) {
					printChar = "*";
				} else {
					printChar = " ";
				}
				System.out.print(printChar);
			}
			System.out.println();
			spaces--; stars+=2;
		}
	}
}
