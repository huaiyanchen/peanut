package com.javasm.web.user;

import com.alibaba.fastjson.JSONObject;
import com.javasm.annotation.ResponseTypeAnnotation;
import com.javasm.bean.ResponseMessage;
import com.javasm.bean.User;
import com.javasm.bean.vo.UserMenuVO;
import com.javasm.service.UserService;
import com.javasm.service.impl.UserServiceImpl;
import com.javasm.util.DateUtil;
import com.javasm.web.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 登录
 *
 * @Author：chy
 * @Version：1.0
 * @Date：2021/5/26-20:07
 * @Since:jdk1.8
 * @Description:TODO
 */

@WebServlet("/login.do")
public class LoginServlet extends BaseServlet<User> {

    private UserService userService = new UserServiceImpl();

    @ResponseTypeAnnotation
    public Object login(User user, HttpServletRequest request, HttpServletResponse response) {
        ResponseMessage responseMessage = new ResponseMessage();

        String message = "登陆失败,用户名或密码错误!";
        User userLogin = userService.selectUser(user);
        responseMessage.setCode("400");

        if (userLogin != null) {
            //传入用户
            List<UserMenuVO> userMenuVOS = userService.selectMenuByUserId(userLogin.getUid());
            responseMessage.setT(userLogin);
            responseMessage.setCode("200");
            request.getSession().setAttribute("user", userLogin);
            userLogin.setLogintime(DateUtil.getNowString());
            if (userService.updateLoginTime(userLogin)){
                message = "登陆成功";
            }
        }
        responseMessage.setMessage(message);
        return responseMessage;
    }

    @ResponseTypeAnnotation
    public Object show(User user, HttpServletRequest request, HttpServletResponse response) {
        List<UserMenuVO> userMenuVO = userService.selectAllMenuById(user.getUid());
        return userMenuVO;
    }



}