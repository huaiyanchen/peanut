package com.javasm.web;

import com.alibaba.fastjson.JSONObject;
import com.javasm.annotation.ResponseTypeAnnotation;
import com.javasm.enums.ResponseType;
import com.javasm.util.DataConvert;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.util.Map;


/**
 * @Author：chy
 * @Version：1.0
 * @Date：2021/5/24-19:39
 * @Since:jdk1.8
 * @Description:TODO
 */

public class BaseServlet<T> extends HttpServlet {

    private Class<T> entityClazz;// 需要实例化的实体类的类型

    public BaseServlet() {
        // this.getClass().getGenericSuperclass()：com.javasm.web2.BaseServlet2<com.javasm.entity.Userinfo>
        // ParameterizedType：一个泛型类型
        // ParameterizedType.getActualTypeArguments()：此类型的实际类型参数的数组 Type对象
        entityClazz = (Class<T>) ((ParameterizedType) (this.getClass().getGenericSuperclass())).getActualTypeArguments()[0];
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        // 通过type请求参数调用子类中的业务方法
        String type = request.getParameter("type");// type值就是方法名
        // 获取servlet实例（子类）的class
        Class clazz = this.getClass();
        try {
            // 获取method方法
            Method method = getServletMethod(type);
            if (method != null) {
                // 获取到request中所有的参数
                Map<String, String[]> map = request.getParameterMap();
                // 将request中参数封装到实体类中
                T entity = getParaEntity(map);
                // 调用方法
                Object obj = method.invoke(this, entity, request, response);
                // 将数据响应到页面
                responseMassage(method, obj, request, response);
            }
        } catch (NoSuchMethodException | NoSuchFieldException | InstantiationException | InvocationTargetException | IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取需要调用的方法
     *
     * @param type
     * @return
     * @throws NoSuchMethodException
     */
    public Method getServletMethod(String type) throws NoSuchMethodException {
        //  通过方法名和参数类获取到方法  clazz:实体类的类型
        return this.getClass().getMethod(type, entityClazz, HttpServletRequest.class, HttpServletResponse.class);
    }

    /**
     * 将request中的数据封装为实体类
     *
     * @param map
     * @return
     * @throws IllegalAccessException
     * @throws InstantiationException
     * @throws NoSuchFieldException
     */
    public T getParaEntity(Map<String, String[]> map) throws IllegalAccessException, InstantiationException, NoSuchFieldException {
        // 通过entityClazz实例化对象
        T entity = entityClazz.newInstance();
        // 获取所有的成员变量
        Field[] fields = entityClazz.getDeclaredFields();
        for (Field field : fields) {
            // 获取成员变量的名字
            String name = field.getName();
            // 通过name获取map中的值
            String[] values = map.get(name);
            if (values != null && values.length > 0) {
                // 暴力破解
                field.setAccessible(true);
                if (values.length > 1) {// 复选框
                    String value = DataConvert.stringArrayConvertString(values);
                    field.set(entity, value);
                } else {
                    String value = values[0];

                    if ("Integer".equals(field.getType().getSimpleName())) {
                        Integer v = Integer.valueOf(value);
                        field.set(entity, v);
                    } else if ("Float".equals(field.getType().getSimpleName())) {
                        Float v = Float.valueOf(value);
                        field.set(entity, v);
                    } else if ("Boolean".equals(field.getType().getSimpleName())) {
                        Boolean v = Boolean.valueOf(value);
                        field.set(entity, v);
                    } else if ("Double".equals(field.getType().getSimpleName())) {
                        Double v = Double.valueOf(value);
                        field.set(entity, v);
                    } else {
                        field.set(entity, value);
                    }
                }
            }
        }
        return entity;
    }


    /**
     * 响应
     *
     * @param obj
     * @param request
     * @param response
     * @throws IOException
     * @throws ServletException
     */
    public void responseMassage(Method method, Object obj, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        if (obj != null) {
            // 获取method上的注解
            ResponseTypeAnnotation responseTypeAnnotation = method.getAnnotation(ResponseTypeAnnotation.class);
            // 获取ResponseTypeAnnotation注解中的responseType
            ResponseType responseType = responseTypeAnnotation.responseType();
            if (responseType == ResponseType.AJAX) {// ajax
                String result = JSONObject.toJSONString(obj);
                System.out.println("result = " + result);
                PrintWriter out = response.getWriter();
                out.write(result);
                out.flush();
                out.close();
            } else if (responseType == ResponseType.REDIRECT) {//  重定向
                String message = (String) obj;
                response.sendRedirect(message);
            } else if (responseType == ResponseType.FORWARD) {//  转发
                String message = (String) obj;
                request.getRequestDispatcher(message).forward(request, response);
            }
        }
    }
}
