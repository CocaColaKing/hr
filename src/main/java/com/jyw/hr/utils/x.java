package com.jyw.hr.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;
import java.util.UUID;

/**
 * User:jiangyw
 * Date:2018/8/31
 * Time:19:59
 * Create by Intellij IDEA
 * 常用方法工具类
 */
public class x {
    private static final char[] HEX_DIGITS = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f'};

    // 验证码位数
    private static final int CAPTCHA_LENGTH = 6;

    /**
     * 获取唯一uid，取UUID的后12位
     *
     * @return uid
     */
    public static String uidGenerator() {
        return UUID.randomUUID().toString().substring(24, 36);
    }

    /**
     * sha1加密
     *
     * @return 加密后的字符串
     */
    public static String sha1(String s) {
        if (s == null) {
            return null;
        }
        try {
            MessageDigest md = MessageDigest.getInstance("SHA1");
            md.update(s.getBytes());
            byte[] digest = md.digest();
            char[] chars = new char[digest.length * 2];
            int k = 0;
            for (byte b : digest) {
                chars[k++] = HEX_DIGITS[b >>> 4 & 0xf];
                chars[k++] = HEX_DIGITS[b & 0xf];
            }
            return new String(chars);

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        return null;
    }

    /**
     * 验证码
     *
     * @return 6位数字的验证码
     */
    public static String getCaptcha() {
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        while (sb.length() < CAPTCHA_LENGTH) {
            sb.append(HEX_DIGITS[random.nextInt(10)]);
        }
        return sb.toString();
    }
}
