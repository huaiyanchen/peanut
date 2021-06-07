package com.javasm.bean.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Author：chy
 * @Version：1.0
 * @Date：2021/6/1-20:23
 * @Since:jdk1.8
 * @Description:TODO
 */

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MenuVO {
    /**
     *  菜单id
     */
    private Integer mid;

    private String path;

    private String name;

    private String icon;

    private String state;

    /**
     * 父类id
     */
    private Integer parentid;

    /**
     * 子菜单列表
     */
    private List<MenuVO> children;
}