package com.lohan.crackme1;

import java.io.PrintStream;
import java.net.MalformedURLException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;

public class example
{
    private static int Counter;

    public example()
    {


        this.<init>();
        Counter = 16;
    }

    public static void ArrayExample()
    {

        String[] r0;
        r0 = new String[5];
        r0[0] = "set value at index 0";
        r0[1] = "index 1 has this value";

        if (r0[0].equals(r0[1]) != false)
        {
            System.out.println("array at index 0 = 1 (wont happen)");
        }
    }

    public static void LoopExample()
    {

        int i0;
        i0 = 0;

        while (i0 < Counter)
        {
            System.out.println((new StringBuilder("current val for loop: ")).append(i0).toString());
            i0 = i0 + 1;
        }
    }

    public static void SwitchExample()
    {


        label_0:
        switch (42)
        {
            case 1:
                System.out.println("val 1");
                break label_0;

            case 2:
                System.out.println("val 2");
                break label_0;

            case 5:
                System.out.println("val 5");
                break label_0;

            case 42:
                System.out.println("val 42");
                break label_0;

            default:
                System.out.println("invalid value");
                break label_0;
        }
    }

    public static void TryCatchExample()
    {

        String r0;
        r0 = "google.com";

        try
        {
            (new URL(r0)).openStream().close();
        }
        catch (MalformedURLException $r7)
        {
            System.out.println((new StringBuilder("Invalid URL ")).append(r0).append(": ").append($r7.getMessage()).toString());
        }
        catch (IOException $r14)
        {
            System.out.println((new StringBuilder("Unable to execute ")).append(r0).append(": ").append($r14.getMessage()).toString());
        }
    }
}
