package com.lohan.crackme1;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.net.MalformedURLException;
import java.net.URL;

public class example
{
  private static int Counter;

  public example()
  {
    Counter = 16;
  }

  public static void ArrayExample()
  {
    String[] arrayOfString = new String[5];
    arrayOfString[0] = "set value at index 0";
    arrayOfString[1] = "index 1 has this value";
    if (arrayOfString[0].equals(arrayOfString[1]))
      System.out.println("array at index 0 = 1 (wont happen)");
  }

  public static void LoopExample()
  {
    for (int i = 0; ; i++)
    {
      if (i >= Counter)
        return;
      System.out.println("current val for loop: " + i);
    }
  }

  public static void SwitchExample()
  {
    switch (42)
    {
    default:
      System.out.println("invalid value");
    case 1:
    case 2:
    case 42:
    case 5:
    }
    while (true)
    {
      return;
      System.out.println("val 1");
      continue;
      System.out.println("val 2");
      continue;
      System.out.println("val 42");
      continue;
      System.out.println("val 5");
    }
  }

  public static void TryCatchExample()
  {
    try
    {
      new URL("google.com").openStream().close();
      return;
    }
    catch (MalformedURLException localMalformedURLException)
    {
      while (true)
        System.out.println("Invalid URL " + "google.com" + ": " + localMalformedURLException.getMessage());
    }
    catch (IOException localIOException)
    {
      while (true)
        System.out.println("Unable to execute " + "google.com" + ": " + localIOException.getMessage());
    }
  }
}
