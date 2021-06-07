package com.javasm.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/5/25-18:21
 * @Since:jdk1.8
 * @Description:TODO
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
//共19个属性
public class BnovelDetailInfo {
    //    图书在花生app里的id
    private Integer bid;

    // 小说章节
    private String bookpartner;

    //            -- 小说的书号
    private String bookid;

    //-- 小说书名
    private String bookName;

    //-- 小说状态 1连载 2完结
    private String bstatus;

    //-- 小说总字数
    private String  bwordCount;

    //  -- 小说简介
    private String bdescription;

    //-- 小说封面图片 地址
    private String bcoverUrl;

    //-- 作者名字
    private String bauthorName;

    //-- 最新章节名
    private String blastupdatechaptername;

    //    最新章节id
    private Integer blastupdatechapterid;

    //-- 小说实体书价格
    private String bprice;

    //-- 小说在花生app的价格
    private String bpeanutprice;


    //-- 小说是否是vip类 固定 true:1 false:0
    private String bisvip;


    //-- 小说大区类型  1.男频 2.女频 3.出版
    private String battribution;
    //小说类型id
    private Integer bsortid;


    //    小说一级目录id
    private Integer pid;

    //  --小说关键字
    private String bkeyword;


    //    --小说是否推荐 1是 0否
    private String bisRecommand;
}
