package com.javasm.bean.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/5/31-11:16
 * @Since:jdk1.8
 * @Description:TODO
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
//显示在前端的八个属性
public class NovelVO {
    //-- 小说的书号
    private String bookid;
    //-- 小说书名
    private String bookName;
    //-- 作者名字
    private String bauthorName;
    //小说类型id
    private Integer bsortid;
    //图书一级目录名字
    private String bsortname;
    //父级目录id，也是二级目录id
    private Integer pid;
    //图书二级目录名字
    private String bsortname1;
    //-- 小说状态 1连载 2完结
    private String bstatus;
}
