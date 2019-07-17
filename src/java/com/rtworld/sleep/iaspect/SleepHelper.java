package com.rtworld.sleep.iaspect;

import org.springframework.aop.AfterReturningAdvice;
import org.springframework.aop.MethodBeforeAdvice;
import org.springframework.lang.Nullable;

import java.lang.reflect.Method;

public class SleepHelper implements MethodBeforeAdvice,AfterReturningAdvice {
    @Override
    public void afterReturning(@Nullable Object o, Method method, Object[] objects, @Nullable Object o1) throws Throwable {
        System.err.println("睡觉前要脱衣服");
    }

    @Override
    public void before(Method method, Object[] objects, @Nullable Object o) throws Throwable {
        System.err.println("起床后要穿衣服");
    }
}
