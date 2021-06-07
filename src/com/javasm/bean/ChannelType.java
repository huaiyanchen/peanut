package com.javasm.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ChannelType {
    private Integer tid; //类型id

    private String name; //类型名称

    private Integer pid; //对应的父类id(没有的话为0)

    private String sort; //排序

    private String description; //备注

    private Date ctime; //创建时间

    private Integer isparent; //是否为父类 1 为是,0为否
}
