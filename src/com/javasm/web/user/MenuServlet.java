package com.javasm.web.user;

import com.javasm.annotation.ResponseTypeAnnotation;
import com.javasm.bean.Menu;
import com.javasm.bean.Role;
import com.javasm.bean.vo.MenuVO;
import com.javasm.service.MenuService;
import com.javasm.service.RoleService;
import com.javasm.service.impl.MenuServiceImpl;
import com.javasm.service.impl.RoleServiceImpl;
import com.javasm.web.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author：chy
 * @Version：1.0
 * @Date：2021/5/28-15:26
 * @Since:jdk1.8
 * @Description:TODO
 */

@WebServlet("/menu.do")
public class MenuServlet extends BaseServlet<Menu> {

    private MenuService menuService = new MenuServiceImpl();
    private RoleService roleService = new RoleServiceImpl();

    @ResponseTypeAnnotation
    public Object show(Menu menu, HttpServletRequest request, HttpServletResponse response) {
        List<Menu> allMenu = menuService.findAllMenu();
        return allMenu;
    }

    @ResponseTypeAnnotation
    public Object delete(Menu menu, HttpServletRequest request, HttpServletResponse response) {
        String message = "删除失败";
        if (menuService.MakeMenuOutOfWork(menu.getMid())) {
            message = "删除成功";
        }
        return message;
    }

    @ResponseTypeAnnotation
    public Object updateMenu(Menu menu, HttpServletRequest request, HttpServletResponse response) {
        String rid = request.getParameter("rid");
        boolean b = false;
        //所有权限
        if (rid.contains("all")) {
            List<Role> allRole = roleService.findAllRole();
            int[] rids = new int[allRole.size()];
            for (int i = 0; i < allRole.size(); i++) {
                rids[i] = allRole.get(i).getRid();
            }
            b = menuService.updateMenu(menu, rids);
        } else {
            String[] split = rid.split("&");
            int[] rids = new int[split.length];
            for (int i = 0; i < split.length; i++) {
                String[] split1 = split[i].split("=");
                String rs = split1[1];
                rids[i] = Integer.parseInt(rs);
            }
            b = menuService.updateMenu(menu, rids);
        }
        return b ? "修改成功" : "修改失败";
    }

    @ResponseTypeAnnotation
    public Object showParents(Menu menu, HttpServletRequest request, HttpServletResponse response) {
        List<Menu> allMenu = menuService.findAllMenu();
        List<Menu> res = new ArrayList<>();
        for (Menu allMenu1 : allMenu) {
            if (allMenu1.getParentid() == 0) {
                res.add(allMenu1);
            }
        }
        return res;
    }

    @ResponseTypeAnnotation
    public Object showMenuList(Menu menu, HttpServletRequest request, HttpServletResponse response) {
        List<MenuVO> menuVOS = menuService.menuForList();
        return menuVOS;
    }

    @ResponseTypeAnnotation
    public Object addMenu(Menu menu, HttpServletRequest request, HttpServletResponse response) {
        String message = "添加失败";
        String rid = request.getParameter("rid");

        //父id
        if (!"".equals(rid)) {
            if (menuService.addMenu(menu, rid)) {
                message = "添加成功";
            }
        }
        return message;
    }

    @ResponseTypeAnnotation
    public Object addMenuChild(Menu menu, HttpServletRequest request, HttpServletResponse response) {
        String message = "添加失败";
        String rid = request.getParameter("rid");
        String parentid = request.getParameter("parentid");
        if (!"".equals(parentid)) {
            if (menuService.addMenu(menu, rid, parentid)) {
                message = "添加成功";
            }
        }
        return message;
    }
}