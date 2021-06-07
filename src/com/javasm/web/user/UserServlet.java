package com.javasm.web.user;

import com.javasm.annotation.ResponseTypeAnnotation;
import com.javasm.bean.Role;
import com.javasm.bean.User;
import com.javasm.bean.vo.UserRoleVO;
import com.javasm.bean.vo.UserVO;
import com.javasm.dao.UserDao;
import com.javasm.dao.impl.UserDaoImpl;
import com.javasm.service.RoleService;
import com.javasm.service.UserService;
import com.javasm.service.impl.RoleServiceImpl;
import com.javasm.service.impl.UserServiceImpl;
import com.javasm.web.BaseServlet;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * @Author：chy
 * @Version：1.0
 * @Date：2021/5/29-16:10
 * @Since:jdk1.8
 * @Description:TODO
 */

@WebServlet("/user.do")
public class UserServlet extends BaseServlet<User> {
    private UserService userService = new UserServiceImpl();
    private UserDao userDao = new UserDaoImpl();
    private RoleService roleService = new RoleServiceImpl();

    @ResponseTypeAnnotation
    public Object show(User user, HttpServletRequest request, HttpServletResponse response) {
        List<UserVO> allUserVo = userService.findAllUserVo();
        return allUserVo;
    }

    @ResponseTypeAnnotation
    public Object delete(User user, HttpServletRequest request, HttpServletResponse response) {
        String message = "删除失败";
        if (userService.deleteUserByUid(user.getUid())) {
            message = "删除成功";
        }
        return message;
    }

    @ResponseTypeAnnotation
    public Object updatePwd(User user, HttpServletRequest request, HttpServletResponse response) {
        String message = "修改失败";
        String uid = request.getParameter("uid");
        String newPwd = request.getParameter("newPwd");
        String confirmPwd = request.getParameter("confirmPwd");
        if (newPwd.equals(confirmPwd)) {
            if (userService.modifyPwd(Integer.parseInt(uid), user.getPwd(), newPwd)) {
                message = "修改成功";
            }
        }
        return message;
    }

    @ResponseTypeAnnotation
    public Object searchPersonData(User user, HttpServletRequest request, HttpServletResponse response) {
        User user1 = userDao.selectUserById(user.getUid());
        return user1;
    }

    @ResponseTypeAnnotation
    public Object updateState(User user, HttpServletRequest request, HttpServletResponse response) {
        String message = "修改失败";
        if (userDao.updateState(user.getUid())) {
            message = "修改成功";
        }
        return message;
    }

    @ResponseTypeAnnotation
    public Object addUser(User user, HttpServletRequest request, HttpServletResponse response) {
        String rid = request.getParameter("rids");
        boolean b = false;
        //如果传来的数据中包含有all,则添加所有权限
        if (rid.contains("all")) {
            List<Role> allRole = roleService.findAllRole();
            //rids rids的数组长度为角色表角色个数
            int[] rids = new int[allRole.size()];
            // 将所有rid写入新的数组rids中
            for (int i = 0; i < allRole.size(); i++) {
                rids[i] = allRole.get(i).getRid();
            }
            //循环在UserRole表中为用户添加rid
            b = userService.addUser(user, rids);
        } else {
            //为当前的uid,拼接选中的rid
            String[] split = rid.split("&");
            int[] rids = new int[split.length];
            for (int i = 0; i < split.length; i++) {
                //以等号分割 接收到的 rid,
                String[] split1 = split[i].split("=");
                // 取等号后的值,即为rid的数值的string类型;
                String rs = split1[1];
                //将数值写入rids数组中.
                rids[i] = Integer.parseInt(rs);
            }
            //循环向UserRole表中赋值;
            b = userService.addUser(user, rids);
        }
        return b ? "添加成功" : "添加失败";
    }


    @ResponseTypeAnnotation
    public Object updateUserRole(User user, HttpServletRequest request, HttpServletResponse response) {
        UserRoleVO userRoleVO = new UserRoleVO();
        userRoleVO.setUser(user);
        //uid=10, username=t


        //获取rids
        String rids = request.getParameter("rids");
        System.out.println("rid++++++++++++++++"+rids);
        //0=2&1=3&2=4
        String[] split = rids.split("&");
        //[0=2, 1=3, 2=4]
        List<String> list = new ArrayList();
        for (int i = 0; i < split.length; i++) {
            //以等号分割 接收到的 rid,
            String[] split1 = split[i].split("=");
            // 取等号后的值,即为rid的数值的string类型;
            String rs = split1[1];
            //将数据加入list中
            list.add(rs);
        }
        //将list加入VO中
        userRoleVO.setRidList(list);
        boolean flag = userService.updateUserRole(userRoleVO);
        return flag ? "添加成功" : "添加失败";

    }


    @ResponseTypeAnnotation
    public Object updateImg(User user, HttpServletRequest request, HttpServletResponse response) {
        String fileName = "";// 文件名
        String projectPath = request.getServletContext().getRealPath("/");

        System.out.println(projectPath);
        File file = new File(projectPath + "//upload");
        if (!file.exists()) {
            file.mkdir();
        }

        DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
        ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> list = servletFileUpload.parseRequest(request);
                for (FileItem fileItem : list) {
                    Date date = new Date();
                    fileName = date.getTime() + fileItem.getName();
                    String filePath = projectPath + "//upload//" + fileName;
                    File newFile = new File(filePath);
                    // 3.3 将上传文件复制给newFile
                    fileItem.write(newFile);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        response.setContentType("text/plain;charset=utf-8");
        System.out.println(fileName);
        return fileName;
    }

    @ResponseTypeAnnotation
    public Object updateUser(User user, HttpServletRequest request, HttpServletResponse response) {
        return userDao.updateUserInfo(user) ? "修改成功" : "修改失败";
    }

    @ResponseTypeAnnotation
    public Object checkUserName(User user, HttpServletRequest request, HttpServletResponse response) {
        List<User> users = userDao.selectAllUser();
        boolean b = true;
        for (User user1 : users) {
            if (user1.getUsername().equals(user.getUsername())) {
                b = false;
                break;
            }
        }
        return b ? "合法用户名" : "用户名重复";
    }
}