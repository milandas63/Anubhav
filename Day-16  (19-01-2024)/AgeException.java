package com.exception;

public class AgeException extends Exception {
	private static final long serialVersionUID = 1L;

	public AgeException() {
		super();        // calling the immediate matching super-class constructor
	}
	
	public AgeException(String message) {
		super(message);
	}

}
