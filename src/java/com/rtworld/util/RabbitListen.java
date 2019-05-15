package com.rtworld.util;

import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageListener;
import org.springframework.stereotype.Component;

import java.io.UnsupportedEncodingException;

@Component("rabbitListen")
public class RabbitListen implements MessageListener {
    public void onMessage(Message message) {
        try {
            System.out.println("接收到消息..." + new String(message.getBody(),"utf-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }
}
