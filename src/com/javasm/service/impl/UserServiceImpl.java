package com.javasm.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.javasm.bean.User;
import com.javasm.bean.vo.UserMenuVO;
import com.javasm.bean.vo.UserRoleVO;
import com.javasm.bean.vo.UserVO;
import com.javasm.dao.UserDao;
import com.javasm.dao.impl.UserDaoImpl;
import com.javasm.service.UserService;

import java.util.List;

/**
 * @Author：chy
 * @Version：1.0
 * @Date：2021/5/26-22:27
 * @Since:jdk1.8
 * @Description:TODO
 */

public class UserServiceImpl implements UserService {
    private UserDao userDao = new UserDaoImpl();

    @Override
    public User selectUser(User user) {
        return userDao.selectUserForLogin(user);
    }

    @Override
    public boolean updateLoginTime(User user) {
        return userDao.updateLoginTime(user);
    }

    @Override
    public List<UserMenuVO> selectMenuByUserId(Integer uid) {
        return userDao.selectMenuByUserId(uid);
    }

    @Override
    public List<UserMenuVO> selectAllMenuById(Integer id) {
        List<UserMenuVO> parentList = userDao.selectMenuByUserIdToRoleList(id);
//        System.out.println(parentList);
        System.out.println("JSONObject.toJSONString(parentList) = " + JSONObject.toJSONString(parentList));
        for (UserMenuVO userMenuVO : parentList) {
            List<UserMenuVO> sonList = userDao.selectMenuByUserIdToRoleList(userMenuVO.getUid(), Integer.parseInt(userMenuVO.getId()));
            userMenuVO.setChildren(sonList);
        }
        return parentList;
    }

    @Override
    public List<UserVO> findAllUserVo() {
        return userDao.selectAllUserVo();
    }

    @Override
    public boolean deleteUserByUid(Integer uid) {
        return userDao.deleteUserByUid(uid);
    }

    @Override
    public boolean modifyPwd(Integer uid, String pwd, String newPwd) {
        User user = userDao.selectUserById(uid);
        boolean rs = false;
        if (pwd.equals(user.getPwd())) {
            boolean b = userDao.updatePwd(uid, newPwd);
            rs = b;
        }
        return rs;
    }

    @Override
    public boolean addUser(User user, int[] rids) {
        //uid为当前添加用户在User表中的index
        int uid = userDao.addUser(user);

        boolean b = false;
        if (uid == 0) {
            return b;
        }
        if (rids.length > 0) {
            for (int rid : rids) {
                b = userDao.addUserRole(uid, rid);
            }
        }
        return b;
    }

    @Override
    public boolean updateUserRole(UserRoleVO userRoleVO) {
        return userDao.updateUserRole(userRoleVO);
    }

}