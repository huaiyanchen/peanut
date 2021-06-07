package com.javasm.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/5/25-18:27
 * @Since:jdk1.8
 * @Description:TODO
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BnovelChapterInfo {
    //图书在库内的id
    private Integer cid;
    //图书在花生app里的id
    private Integer bid;
    //图书真实id
    private  String bookid;
    //图书章节名字
    private  String bchapterName;
    //图书章节内容
    private  String bchaptercontent;
    //图书章节id
    private  String bchapterid;
}
