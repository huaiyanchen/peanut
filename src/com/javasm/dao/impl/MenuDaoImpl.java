package com.javasm.dao.impl;

import com.javasm.bean.Menu;
import com.javasm.bean.Rolemenu;
import com.javasm.bean.vo.MenuVO;
import com.javasm.dao.MenuDao;
import com.javasm.util.JdbcUtil;

import java.util.List;

/**
 * @Author：chy
 * @Version：1.0
 * @Date：2021/5/28-15:34
 * @Since:jdk1.8
 * @Description:TODO
 */

public class MenuDaoImpl implements MenuDao {

    Class<Menu> clazz = Menu.class;

    @Override
    public List<Menu> selectAllMenu() {
        String sql = "select * from menu";
        return JdbcUtil.getAll(sql, clazz);
    }

    @Override
    public List<MenuVO> selectAllMenuForVO() {
        String sql = "select * from menu";
        return JdbcUtil.getAll(sql, MenuVO.class);
    }

    @Override
    public boolean deleteMenuByMid(Integer mid) {
        String sql = "update menu set state = 0 where mid = ?";
        return JdbcUtil.executeUpdate(sql, mid) > 0;
    }

    @Override
    public boolean updateMenu(Menu menu) {
        String sql = "update menu set name = ?, icon = ?, state = ?, parentid = ? where mid = ?";
        return JdbcUtil.executeUpdate(sql, menu.getName(), menu.getIcon(), menu.getState(), menu.getParentid(), menu.getMid()) > 0;
    }

    @Override
    public Integer addMenu(Menu menu) {
        String sql = "insert into  menu values(null,?,?,?,?,?)";
        return JdbcUtil.executeInsetId(sql, menu.getPath(), menu.getName(), menu.getIcon(), menu.getState(), menu.getParentid());
    }

    @Override
    public boolean insertRoleMenu(Integer rid, Integer mid) {
        String sql = "insert into  rolemenu values(null,?,?)";
        return JdbcUtil.executeInsetId(sql, rid, mid) > 0;

    }

    @Override
    public boolean deleteRoleMenu(Integer mid) {
        String sql = "delete  FROM rolemenu where mid = ?";
        return JdbcUtil.executeUpdate(sql, mid) > 0;
    }

    @Override
    public Rolemenu selectRoleMenu(Integer rid, Integer mid) {
        String sql = "select * from rolemenu where rid =? and mid = ?";
        return JdbcUtil.getByParam(sql, Rolemenu.class, rid, mid);
    }

}