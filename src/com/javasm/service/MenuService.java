package com.javasm.service;

import com.javasm.bean.Menu;
import com.javasm.bean.vo.MenuVO;

import java.util.List;

/**
 * @Author：chy
 * @Version：1.0
 * @Date：2021/5/28-15:35
 * @Since:jdk1.8
 * @Description:TODO
 */

public interface MenuService {
    /**
     *查询所有的菜单信息
     * @return
     */
    List<Menu> findAllMenu();


    /**
     * state 变为0
     *
     * @param mid
     * @return
     */
    boolean MakeMenuOutOfWork(Integer mid);


    /**
     * 更新菜单
     *
     * @param menu
     * @return
     */
    boolean updateMenu(Menu menu, int[] rids);

    /**
     * 新增菜菜单
     * @param menu
     * @return
     */
    boolean addMenu(Menu menu,String rid);

    /**
     * 新增子菜单
     * @param menu
     * @param rid
     * @param parentid
     * @return
     */
    boolean addMenu(Menu menu, String rid, String parentid);


    /**
     * 返回前端需要的menu数据
     *
     * @return
     */
    List<MenuVO> menuForList();
}