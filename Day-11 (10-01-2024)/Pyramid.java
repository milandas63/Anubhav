public class Pyramid {
	public static void main(String[] args) {
		int spaces = 30;
		int stars = 1;
	
		for(int line=1; line<10; line++) {
			for(int count=0; count<spaces; count++) System.out.print(" ");
			for(int count=0; count<stars; count++)  System.out.print("*");
			System.out.println();
			spaces--; stars+=2;
		}
		
		System.out.println("\r\n\r\n\r\n");
		
		spaces = 30;
		for(int line=1; line<10; line++) {
			for(int count=1; count<=spaces; count++) System.out.print(" ");
			for(int count=1; count<=line; count++)  System.out.print(count);
			for(int count=line-1; count>0; count--) System.out.print(count);
			System.out.println();
			spaces--; stars+=2;
		}
		
	}
}
