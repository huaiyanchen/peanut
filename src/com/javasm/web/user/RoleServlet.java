package com.javasm.web.user;

import com.javasm.annotation.ResponseTypeAnnotation;
import com.javasm.bean.Role;
import com.javasm.service.RoleService;
import com.javasm.service.impl.RoleServiceImpl;
import com.javasm.web.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @Author：chy
 * @Version：1.0
 * @Date：2021/5/31-17:48
 * @Since:jdk1.8
 * @Description:TODO
 */

@WebServlet("/role.do")
public class RoleServlet extends BaseServlet<Role> {
    private RoleService roleService = new RoleServiceImpl();

    @ResponseTypeAnnotation
    public Object showRole(Role role, HttpServletRequest request, HttpServletResponse response) {
        List<Role> allRole = roleService.findAllRole();
        return allRole;
    }

    @ResponseTypeAnnotation
    public Object addRole(Role role, HttpServletRequest request, HttpServletResponse response) {
        String mid = request.getParameter("mids");
        String[] split = mid.split("&");
        int[] mids = new int[split.length];
        for (int i = 0; i < split.length; i++) {
            String[] split1 = split[i].split("=");
            String rs = split1[1];
            mids[i] = Integer.parseInt(rs);
        }
        return roleService.addRole(role, mids) ? "添加成功" : "添加失败";
    }
}