package com.file.tree;

import java.io.File;

public class ReadFilesFolders {
	private File f;
	private int level;

	public ReadFilesFolders() {
		f = new File("D:\\IIG\\Anubhav\\");
		System.out.println(f.getName());
		fileTree(f);

	}
	
	private void fileTree(File file) {
		File[] files = file.listFiles();
		for(int i=0; i<files.length; i++) {
			if(files[i].isDirectory()) {
				System.out.println("+- "+replicate("|- ",level)+files[i].getName());
				level++;
				fileTree(files[i]);
				level--;
			} else {
				System.out.println(replicate("|- ",level)+files[i].getName());
			}
		}
	}
	
	private String replicate(String text, int times) {
		StringBuffer buf = new StringBuffer();
		for(int i=0; i<times; i++) {
			buf.append(text);
		}
		return buf.toString();
	}
	
	public static void main(String[] args) {
		new ReadFilesFolders();
	}

}
