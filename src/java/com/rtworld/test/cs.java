package com.rtworld.test;


import com.rtworld.aspect.BookAOP;
import com.rtworld.handle.UserController;
import com.rtworld.service.IUserService;
import com.rtworld.service.impl.UserServiceImpl;
import com.rtworld.sleep.iaspect.Human;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.TreeSet;

public class cs {

    public static void main(String[] args) {
        ApplicationContext act = new ClassPathXmlApplicationContext("applicationContext.xml");
        Human userManager = (Human) act.getBean("human");
        userManager.sleep();
        System.out.println("\n");
        TreeSet<String>  hello = new TreeSet<>();
     }
}
