package com.rtworld.hello;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

public class FielIODemo {
    private static int x =100;
    String str=new String("hello");
    char[]ch={'a','b'};
    public static void main(String[] args) throws UnsupportedEncodingException {

        InputStream inputStream = null;
//        Reader reader  = new InputStreamReader(inputStream,"utf-8");
        Integer num = new Integer(3);
        String value = new String("hello");
        String newValue = value.intern();//放到常量池,缓存的策略
        FielIODemo  ex = new FielIODemo();
        ex.change(ex.str,ex.ch);
        System.out.print(ex.str+" and ");
        System.out.print(ex.ch);
        Math.floor(-8.5);

    }

    public void change(String str,char ch[]){
        str="test ok";
        ch[0]='c';
    }

    public void heloo(String  aa ) {

    }

}
