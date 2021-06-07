package com.javasm.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Author：chy
 * @Version：1.0
 * @Date：2021/5/27-9:46
 * @Since:jdk1.8
 * @Description:TODO
 */
public class DateUtil {
    static SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    /**
     * 获取当前时间 date
     * @return
     */
    public static Date getNowDate() {
        return new Date();
    }

    /**
     * 获取当前时间 string
     * @return
     */
    public static String getNowString() {
        Date date = new Date();
        return format.format(date);
    }


    /**
     * 时间输出格式化
     * @param date
     * @return
     */
    public static String dateFormat(Date date) {
        return format.format(date);
    }


}