package com.javasm.bean;

import java.io.Serializable;
import lombok.Data;

/**
 * userole
 * @author chy
 */
@Data
public class Userole implements Serializable {
    /**
     *  用户表中的角色id
     */
    private Integer urid;

    /**
     *  用户id
     */
    private Integer uid;

    /**
     *  角色id
     */
    private Integer rid;

    private static final long serialVersionUID = 1L;
}