package com.reflection;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class Decompile {
	
	public Decompile(String className) {
		try {
			Class obj = Class.forName(className);
			Field f[] = obj.getDeclaredFields();
			Constructor c[] = obj.getDeclaredConstructors();
			Method m[] = obj.getDeclaredMethods();
			
			System.out.println(className);
			for(int i=0; i<className.length(); i++)
				System.out.print("-");
			System.out.println();

			
			// Fields
			if(f.length>0) {
				System.out.println("FIELDS:");
				for(int i=0; i<f.length; i++) {
					System.out.println((i+1) + ": " + remove(f[i].toString()));
				}
			}

			// Constructors
			if(c.length>0) {
				System.out.println("CONSTRUCTORS:");
				for(int i=0; i<c.length; i++) {
					System.out.println((i+1) + ": " + remove(c[i].toString()));
				}
			}

			// Methods
			if(m.length>0) {
				System.out.println("METHODS:");
				for(int i=0; i<m.length; i++) {
					System.out.println((i+1) + ": " + remove(m[i].toString()));
				}
			}

			System.out.println("\r\n\r\n\r\n");
		} catch(ClassNotFoundException e) {
		}
		
	}

	private String remove(String text) {
		StringBuffer buf = new StringBuffer();
		char c;
		boolean yn = true;
		for(int i=text.length()-1; i>=0; i--) {
			c = text.charAt(i);
			switch(c) {
			case '.': yn = false; break;
			case ',': yn = true; break;
			case '(': yn = true; break;
			case ')': yn = true; break;
			case '[': yn = true; break;
			case ']': yn = true; break;
			case ' ': yn = true;
			}
			if(yn) buf.insert(0, c);
		}
		return buf.toString();
	}
	
	public static void main(String[] args) {
		new Decompile("java.lang.Class");
	}

}
