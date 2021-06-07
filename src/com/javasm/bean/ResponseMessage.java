package com.javasm.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 响应实体 封装类 用这个实体响应页面判断状态码
 *
 * @Author：chy
 * @Version：1.0
 * @Date：2021/5/27-15:48
 * @Since:jdk1.8
 * @Description:TODO
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResponseMessage<T> {
    //状态码
    private String code;
    //实体
    private T t;
    //message
    private String message;
}