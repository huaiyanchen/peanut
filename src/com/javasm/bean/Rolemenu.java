package com.javasm.bean;

import java.io.Serializable;
import lombok.Data;

/**
 * rolemenu
 * @author 
 */
@Data
public class Rolemenu implements Serializable {
    /**
     *  角色菜单id
     */
    private Integer rmid;

    /**
     *  角色id
     */
    private Integer rid;

    /**
     *  菜单id
     */
    private Integer mid;

    private static final long serialVersionUID = 1L;
}