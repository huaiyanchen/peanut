package com.javasm.service.impl;

import com.javasm.bean.Menu;
import com.javasm.bean.vo.MenuVO;
import com.javasm.dao.MenuDao;
import com.javasm.dao.impl.MenuDaoImpl;
import com.javasm.service.MenuService;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author：chy
 * @Version：1.0
 * @Date：2021/5/28-15:36
 * @Since:jdk1.8
 * @Description:TODO
 */

public class MenuServiceImpl implements MenuService {
    private MenuDao menuDao = new MenuDaoImpl();

    @Override
    public List<Menu> findAllMenu() {
        return menuDao.selectAllMenu();
    }

    @Override
    public boolean MakeMenuOutOfWork(Integer mid) {
        return menuDao.deleteMenuByMid(mid);
    }

    @Override
    public boolean updateMenu(Menu menu, int[] rids) {
        if (rids.length > 0) {
            boolean b = menuDao.deleteRoleMenu(menu.getMid());
            if (b) {
                for (int rid : rids) {
                    menuDao.insertRoleMenu(rid, menu.getMid());
                }
            }
        }
        return menuDao.updateMenu(menu);
    }

    @Override
    public boolean addMenu(Menu menu, String rid) {
        Integer mid = menuDao.addMenu(menu);
        return menuDao.insertRoleMenu(Integer.parseInt(rid), mid);
    }

    @Override
    public boolean addMenu(Menu menu, String rid, String parentid) {
        Integer mid = menuDao.addMenu(menu);
        return menuDao.insertRoleMenu(Integer.parseInt(rid), mid);
    }

    @Override
    public List<MenuVO> menuForList() {
        List<MenuVO> menuVOS = menuDao.selectAllMenuForVO();
        List<MenuVO> res = new ArrayList<>();
        for (MenuVO menuVO : menuVOS) {
            //fu
            if (menuVO.getParentid().equals(0)) {
                //children
                List<MenuVO> children = new ArrayList<>();
                for (MenuVO vo : menuVOS) {
                    if (menuVO.getMid().equals(vo.getParentid())) {
                        children.add(vo);
                    }
                }
                menuVO.setChildren(children);
                res.add(menuVO);
            }
        }
        return res;
    }
}