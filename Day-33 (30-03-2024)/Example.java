
public class Example {
	
	public void run() {
		byte b = 90;
		
		float f = 34567.99F;
		System.out.println(f);
		
		long x = 94384858584747L;
		
		Integer n = new Integer(10);
		n = 2345;
		int m = new Integer(3233);
		Integer o = 3456;
		
	}

	public static void main(String[] args) {
		// run(); not possible because run() is not static

		/*
		 * 	Example e = new Example();
		 *  e.run();
		 */
		new Example().run();
	}

}
