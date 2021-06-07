package com.javasm.dao.impl;

import com.javasm.bean.Role;
import com.javasm.dao.RoleDao;
import com.javasm.util.JdbcUtil;

import java.util.List;

/**
 * @Author：chy
 * @Version：1.0
 * @Date：2021/5/31-17:51
 * @Since:jdk1.8
 * @Description:TODO
 */

public class RoleDaoImpl implements RoleDao {
    Class<Role> clazz = Role.class;

    @Override
    public List<Role> selectAllRole() {
        String sql = "select * from role where state = 1";
        return JdbcUtil.getAll(sql, clazz);
    }

    @Override
    public Integer addRole(Role role) {
        String sql = "insert into role values (null,?,1) ";
        return JdbcUtil.executeInsetId(sql, role.getRname());
    }

    @Override
    public boolean addRoleMenu(Integer rid, Integer mid) {
        String sql = "insert into rolemenu values(null,?,?)";
        return JdbcUtil.executeUpdate(sql, rid, mid) > 0;
    }

    @Override
    public List<Role> ridList() {
        String sql = "select * from role";
        return JdbcUtil.getAll(sql, clazz);
    }
}