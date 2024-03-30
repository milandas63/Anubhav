/*
			This is a sentence using few english words
			
			**************
			*  This      *
			*  is        *
			*  a         *
			*  sentence  *
			*  using     *
			*  few       *
			*  english   *
			*  words     *
			**************
 */


public class BoxText {

	public static void main(String[] args) {
		String text = "This is a sentence using few english words with configuration";
		String[] arr = text.split(" ");
		int width = 0;
		for(String each : arr) {
			if(each.length()>width) {
				width = each.length();
			}
		}
		
		System.out.println(replicate("*", width+6));
		for(int i=0; i<arr.length; i++)
			System.out.println("*  "+padR(arr[i],width)+"  *");
		System.out.println(replicate("*", width+6));
	}

	private static String padR(String word, int len) {
		StringBuffer buf = new StringBuffer(word);
		for(int i=buf.length(); i<len; i++) {
			buf.append(" ");
		}
		return buf.toString();
	}

	private static String replicate(String alpha, int len) {
		StringBuffer buf = new StringBuffer();
		for(int i=0; i<len; i++) buf.append(alpha);
		return buf.toString();
	}
}
