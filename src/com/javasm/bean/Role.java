package com.javasm.bean;

import java.io.Serializable;
import lombok.Data;

/**
 * role
 * @author 
 */
@Data
public class Role implements Serializable {

    /**
     *  角色id
     */
    private Integer rid;

    /**
     * 角色名称
     */
    private String rname;

    /**
     * 角色状态
     */
    private Integer state;

    /**
     * 序列号
     */
    private static final long serialVersionUID = 1L;
}