package com.javasm.annotation;



import com.javasm.enums.ResponseType;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @Author：chy
 * @Version：1.0
 * @Date：2021/5/24-19:33
 * @Since:jdk1.8
 * @Description:TODO
 */

@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface ResponseTypeAnnotation {
    ResponseType responseType() default ResponseType.AJAX;
}