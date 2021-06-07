package com.javasm.service;

import com.javasm.bean.Role;

import java.util.List;

/**
 * @Author：chy
 * @Version：1.0
 * @Date：2021/5/31-18:50
 * @Since:jdk1.8
 * @Description:TODO
 */

public interface RoleService {
    /**
     * 查询所有的角色信息
     *
     * @return
     */
    List<Role> findAllRole();

    /**
     * 添加角色及其对应的 菜单
     *
     * @param role
     * @param mids
     * @return
     */
    boolean addRole(Role role, int[] mids);
}