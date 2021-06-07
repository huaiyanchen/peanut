package com.javasm.bean;

import lombok.Data;

import java.io.Serializable;

/**
 * user
 *  继承序列化接口
 * @author
 */

@Data
public class User implements Serializable {
    /**
     *  用户id
     */
    private Integer uid;
    /**
     *  用户昵称
     */
    private String username;
    /**
     *  密码
     */
    private String pwd;
    /**
     *  角色id
     */
    private Integer rid;
    /**
     *  头像
     */
    private String headpic;
    /**
     *
     */
    private String headpicthumb;
    /**
     *  详情
     */
    private String des;
    /**
     *  性别
     */
    private String sex;
    /**
     *  生日
     */
    private String birthday;
    /**
     *
     */
    private String avatarcolor;
    /**
     *  电话
     */
    private String phone;
    /**
     *  状态
     */
    private Integer state;
    /**
     *  注册时间
     */
    private String regtime;
    /**
     *  登录时间
     */
    private String logintime;
    /**
     *  是否有效
     */
    private Integer isvalid;
    /**
     *  创建的用户id
     */
    private Integer createuid;
    /**
     *  渠道
     */
    private String channels;
    /**
     *  序列号
     */
    private static final long serialVersionUID = 1L;
}