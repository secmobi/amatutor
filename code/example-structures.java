package com.lohan.crackme1;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;

public class example {
	private static int Counter;
	
	public example() { Counter = 16; }
	
	public static void LoopExample()
	{
		for ( int i = 0; i < Counter; i++ )
			System.out.println("current val for loop: " + i);
	}

	public static void SwitchExample()
	{
		int val = 42;
        switch (val) {
            case 1:  System.out.println("val 1"); break;
            case 2:  System.out.println("val 2"); break;
            case 42: System.out.println("val 42"); break;
            case 5:  System.out.println("val 5"); break;
            default: System.out.println("invalid value");break;
        }		
	}
	
	public static void TryCatchExample()
	{
		String urlStr = "google.com";
		try {
		    // Get the image
		    URL url = new URL(urlStr);
		    InputStream is = url.openStream();
		    is.close();
		} catch (MalformedURLException e) {
		    // Print out the exception that occurred
		    System.out.println("Invalid URL " + urlStr + ": " + e.getMessage());
		} catch (IOException e) {
		    // Print out the exception that occurred
		    System.out.println("Unable to execute " + urlStr + ": " + e.getMessage());
		}		
	}
	
	public static void ArrayExample()
	{
		String someArray[] = new String[5];
		
		someArray[0] = "set value at index 0";
		someArray[1] = "index 1 has this value";
		
		if ( someArray[0].equals(someArray[1]) )
		{
			System.out.println("array at index 0 = 1 (wont happen)");
		}
	}
}
