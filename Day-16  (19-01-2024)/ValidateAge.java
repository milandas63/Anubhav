package com.exception;

public class ValidateAge {

	public static void main(String[] args) {
		int age;
		int[] ages = {19, 16, 27, 56, 49, 91, 35, 11, 0, 15, 33, -45, 97, 35};
		for(int i=0; i<ages.length; i++) {
			age = ages[i];
			try {
				checkAge(age);
				System.out.println(age+" is a valid age");
			} catch(TooYoungAgeException e) {
				System.out.println(age+" is too young");
			} catch(TooOldAgeException e) {
				System.out.println(age+" is too old");
			} catch(ZeroAgeException e) {
				System.out.println(age+" is zero");
			} catch(NegativeAgeException e) {
				System.out.println(age+" is negative");
			}
		}
	}

	public static void checkAge(int age) throws TooYoungAgeException,
												TooOldAgeException,
												ZeroAgeException,
												NegativeAgeException
	{
		if(age<0) throw new NegativeAgeException();
		else if(age==0) throw new ZeroAgeException();
		else if(age<18) throw new TooYoungAgeException();
		else if(age>90) throw new TooOldAgeException();
		
	}
}
