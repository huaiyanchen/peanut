package com.javasm.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 登录的过滤器
 */
@WebFilter(urlPatterns = {"*.do", "*.jsp"})
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        // 从session中获取登录的实例，如果有登录成功，如果没有实例，就没有登录，不能让用户继续访问资源，需要先登录

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        // 1.获取session对象
        HttpSession session = request.getSession();
        // 2.获取存储在session中user
        Object user = session.getAttribute("user");
        // 3.获取用户请求的url，如果是login.jsp|login.do
        String requestURI = request.getRequestURI();
        // System.out.println(requestURI);// /根目录/请求url
        // 4.获取项目的根目录
        String contextPath = request.getContextPath();

        if (user != null || requestURI.contains("/login")) { // 3.如果user不为空，就放行
            filterChain.doFilter(request, response);
        } else {// 4.如果user为空，就跳转到登录的jsp页面
            response.sendRedirect(contextPath + "login2.jsp");
        }
    }

    @Override
    public void destroy() {

    }
}
