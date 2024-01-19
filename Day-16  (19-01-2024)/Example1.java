package com.exception;

public class Example1 {

	public static void main(String[] args) {
		int i = 215;
		int j = 0;
		try {
			double r = i / j;
			System.out.println("result is "+r);
			System.out.println("No exceptions");
		} catch(ArrayIndexOutOfBoundsException e) {
			System.out.println("ArrayIndexOutOfBoundsException");
		} catch(StringIndexOutOfBoundsException e) {
			System.out.println("StringIndexOutOfBoundsException");
		} catch(ClassCastException e) {
			System.out.println("ClassCastException");
		} catch(ArithmeticException e) {
			System.out.println("ArithmeticException "+e.getClass().getName());
		} catch(NullPointerException e) {
			System.out.println("NullPointerException");
		} catch(MyException e) {
			System.out.println("ClassNotFoundException");
		}

	}

}

class MyException extends RuntimeException {
	
}
