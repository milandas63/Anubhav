package com.input.output;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class CopyFile {
	private InputStream is;
	private OutputStream os;

	public CopyFile() {
		try {
			File f = new File("Regex-W3School.pdf");
			long l = f.length();
			double fivePC = (.05 * l);
			long count = 0;
			is = new FileInputStream(f);
			os = new FileOutputStream("RW.pdf");
			int eachByte = 0;
			while( (eachByte=is.read()) != -1 ) {
				os.write(eachByte);
				count++;
				if(count>=fivePC) {
					System.out.print(".");
					count = 0;
				}
			}
		} catch(FileNotFoundException e) {
		} catch(IOException e) {
		} catch(Exception e) {
		} finally {
			try {
				System.out.println("\tCopy successful");
				os.close();
				is.close();
			} catch(IOException e) {
			} catch(Exception e) {
			}
		}
	}
	
	public static void main(String[] args) {
		new CopyFile();
	}

}
