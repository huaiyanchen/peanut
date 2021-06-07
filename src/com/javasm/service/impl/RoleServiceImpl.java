package com.javasm.service.impl;

import com.javasm.bean.Role;
import com.javasm.dao.RoleDao;
import com.javasm.dao.impl.RoleDaoImpl;
import com.javasm.service.RoleService;

import java.util.List;

/**
 * @Author：chy
 * @Version：1.0
 * @Date：2021/5/31-18:51
 * @Since:jdk1.8
 * @Description:TODO
 */

public class RoleServiceImpl implements RoleService {
    private RoleDao roleDao = new RoleDaoImpl();

    @Override
    public List<Role> findAllRole() {
        return roleDao.selectAllRole();
    }

    @Override
    public boolean addRole(Role role, int[] mids) {
        Integer rid = roleDao.addRole(role);
        boolean b = false;
        if (mids.length > 0) {
            for (int i = 0; i < mids.length; i++) {
               b = roleDao.addRoleMenu(rid, mids[i]);
            }
        }
        return b;
    }

}