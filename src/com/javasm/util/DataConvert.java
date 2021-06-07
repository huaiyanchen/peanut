package com.javasm.util;

import java.util.Arrays;

/**
 * @Author：chy
 * @Version：1.0
 * @Date：2021/5/24-19:41
 * @Since:jdk1.8
 * @Description:TODO
 */

public class DataConvert {

    public static Integer stringConvertInteger(String value) {
        return value != null && !"".equals(value) ? Integer.valueOf(value) : null;
    }

    public static String stringArrayConvertString(String[] value) {
        String message = "";
        if (value != null && value.length > 0) {
            for (int i = 0; i < value.length; i++) {
                message += value[i];
                if (i < value.length - 1) {
                    message += ",";
                }
            }
        }
        return message;
    }

}
