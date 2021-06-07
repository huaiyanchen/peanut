package com.javasm.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Channel {

    private Integer id; //渠道id

    private Integer typeoneid; //一级分类
    private String typeonename; //一级分类名称

    private Integer typetwoid; //二级分类id
    private String typetwoname; //二级分类

    private Integer haveparent;//是否有父级 (0.没有  1.有)

    private Integer channelnum; //渠道号

    private String url;//下载地址

    private String productname;//产品名
    private String productviewname; //展示名

    private Date ctime; //创建时间

    private String platform; //平台

    private String area; //地区

}
