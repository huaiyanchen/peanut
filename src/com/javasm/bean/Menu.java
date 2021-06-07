package com.javasm.bean;

import java.io.Serializable;
import lombok.Data;

/**
 * menu
 * @author 
 */
@Data
public class Menu implements Serializable {

    /**
     * 菜单id
     */
    private Integer mid;

    /**
     * 路径
     */
    private String path;
    /**
     *  菜单名称
     */
    private String name;
    /**
     *  图标
     */
    private String icon;
    /**
     *  状态
     */
    private String state;
    /**
     *  父类id
     */
    private Integer parentid;

    private static final long serialVersionUID = 1L;
}