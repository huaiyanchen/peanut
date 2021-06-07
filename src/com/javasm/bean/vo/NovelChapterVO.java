package com.javasm.bean.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/6/1-17:41
 * @Since:jdk1.8
 * @Description:TODO
 */
@AllArgsConstructor
@NoArgsConstructor
@Data
//显示在书籍查询页面
public class NovelChapterVO {
    //图书章节名字
    private  String bchapterName;
    //图书章节内容
    private  String bchaptercontent;
    //图书章节id
    private  String bchapterid;
}
