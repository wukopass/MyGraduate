package com.rtworld;

import org.springframework.boot.autoconfigure.data.redis.RedisProperties;
import redis.clients.jedis.Jedis;

public class Demo {
     //测试redis的连接
    public static void main(String[]args){
        //连接本地Redis服务
        Jedis jedis=new Jedis("198.19.61.251",6379);
        //查看服务器是否运行，打出pong表示OK
        System.out.println("connect is OK============>"+jedis.ping());
    }

}
