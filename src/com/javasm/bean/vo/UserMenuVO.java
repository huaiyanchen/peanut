package com.javasm.bean.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * 登录后的需要在页面上有用的信息
 *
 * @Author：chy
 * @Version：1.0
 * @Date：2021/5/26-21:54
 * @Since:jdk1.8
 * @Description:
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserMenuVO {
    /**
     *  用户id
     */
    private Integer uid;

    private String  id;

    private String username;

    private String headpic;

    private String href;

    private String title;

    private String icon;

    /**
     * 菜单状态
     */
    private Integer mstate;

    /**
     *  父id menu表的id  判断该条记录是父id还是下拉的子菜单的id
     */
    private Integer mpid;


    /**
     * 子菜单的列表
     */
    private List<UserMenuVO> children;
}