package com.javasm.bean.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 权限管理的Vo类
 *
 * @Author：chy
 * @Version：1.0
 * @Date：2021/5/29-15:39
 * @Since:jdk1.8
 * @Description:TODO
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserVO {
    /**
     * 用户id
     */
    private Integer uid;

    /**
     * 用户姓名
     */
    private String username;

    /**
     * 用户角色id
     */
    private Integer rid;

    /**
     * 用户注册时间
     */
    private String regtime;

    /**
     * 用户角色名称
     */
    private String rname;

    /**
     * 用户登录时间
     */
    private String logintime;

    /**
     * 用户状态
     */
    private Integer state;

    /**
     * 头像
     */
    private String headpic;
}