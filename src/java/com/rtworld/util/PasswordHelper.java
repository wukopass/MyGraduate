package com.rtworld.util;

import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.stereotype.Component;

/**
 * @author tl
 * @version 1.0
 * @date 18-10-31
 */
@Component
public class PasswordHelper {
/*	// 生成随机长度字节，用于生成盐
    private final RandomNumberGenerator randomNumberGenerator = new SecureRandomNumberGenerator();
    // 散列算法名称，这里使用md5
    private final String algorithmName = "md5";
    // 散列复杂度次数
    private final int hashIterations = 2;

    public void encryptPassword(User user) {
        *//*生成随机的salt 并将其转换成16进制*//*

        user.setSalt(randomNumberGenerator.nextBytes().toHex());

        *//*使用算法生成 加密后的密码 采用引用传递将值带出去*//*
        String newPassword = new SimpleHash(
                algorithmName,
                user.getPassword(),
                ByteSource.Util.bytes(user.getSalt()),
                hashIterations).toHex();

        user.setPassword(newPassword);
    }*/

}
