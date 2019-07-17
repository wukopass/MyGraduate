package com.rtworld.sleep.iaspect;

import com.rtworld.sleep.Sleepable;

public class Human  implements Sleepable{
    @Override
    public void sleep() {
        System.err.println("我要睡觉了");

    }
}
