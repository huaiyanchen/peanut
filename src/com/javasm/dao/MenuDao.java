package com.javasm.dao;

import com.javasm.bean.Menu;
import com.javasm.bean.Rolemenu;
import com.javasm.bean.vo.MenuVO;

import java.util.List;

/**
 * @Author：chy
 * @Version：1.0
 * @Date：2021/5/28-15:32
 * @Since:jdk1.8
 * @Description:TODO
 */

public interface MenuDao {

    /**
     *查询所有的菜单信息
     * @return
     */
    List<Menu> selectAllMenu();

    /**
     *查询所有的菜单信息
     * @return
     */
    List<MenuVO> selectAllMenuForVO();

    /**
     * 删除 不是真的删除 让state变为0
     *
     * @param mid
     * @return
     */
    boolean deleteMenuByMid(Integer mid);

    /**
     * 更新菜单
     * @param menu
     * @return
     */
    boolean updateMenu(Menu menu);

    /**
     * 新增菜单
     *
     * @param menu
     * @return
     */
    Integer addMenu(Menu menu);

    /**
     * 插入rolemenu表
     *
     * @return
     */
    boolean insertRoleMenu(Integer rid, Integer mid);

    /**
     * 更新rolemenu表
     *
     * @param mid
     * @return
     */
    boolean deleteRoleMenu(Integer mid);

    /**
     * 查询rolemenu表
     *
     * @param rid
     * @param mid
     * @return
     */
    Rolemenu selectRoleMenu(Integer rid, Integer mid);


}