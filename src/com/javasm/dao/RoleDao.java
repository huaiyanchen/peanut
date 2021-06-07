package com.javasm.dao;

import com.javasm.bean.Role;

import java.util.List;

/**
 * @Author：chy
 * @Version：1.0
 * @Date：2021/5/31-17:50
 * @Since:jdk1.8
 * @Description:TODO
 */

public interface RoleDao {

    /**
     * 查询所有的角色信息
     *
     * @return
     */
    List<Role> selectAllRole();

    /**
     * 新增 role
     *
     * @param role
     * @return
     */
    Integer addRole(Role role);


    /**
     *
     * @param rid
     * @param mid
     * @return
     */
    boolean addRoleMenu(Integer rid, Integer mid);

    /**
     *  获取所有的ridlist数组
     */
    List<Role> ridList();
}