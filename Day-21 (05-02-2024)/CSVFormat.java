package com.input.output;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.Writer;

public class CSVFormat {
	private BufferedReader r;
	private BufferedWriter w;
	String id,name,gender,email,mobile;
	StringBuffer buf;
	
	public CSVFormat() {
		try {
			r = new BufferedReader(new InputStreamReader(System.in));
			w = new BufferedWriter(new OutputStreamWriter(new FileOutputStream("employ.csv")));

			buf = new StringBuffer();
			for(int i=0; i<24; i++) System.out.println();

			System.out.println("EMPLOY INFORMATION SYSTEM");
			System.out.println("-------------------------");
			
			System.out.println();
			System.out.print("Employ ID:   ");
			id = r.readLine();
			
			System.out.print("Employ Name: ");
			name = r.readLine();

			System.out.print("Gender:      ");
			gender = r.readLine();

			System.out.print("Email ID:    ");
			email = r.readLine();

			System.out.print("Mobile No.:  ");
			mobile = r.readLine();

			System.out.println();

			buf.append(id);
			buf.append(",\"");
			buf.append(name);
			buf.append("\",\"");
			buf.append(gender);
			buf.append("\",\"");
			buf.append(email);
			buf.append("\",\"");
			buf.append(mobile);
			buf.append("\"\r\n");
			
			w.write(buf.toString());
			w.close();
			
		} catch(FileNotFoundException e) {
		} catch(IOException e) {
		}
	}
	
	public static void main(String[] args) {
		new CSVFormat();
	}

}
