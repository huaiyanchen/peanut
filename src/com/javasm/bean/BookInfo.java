package com.javasm.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BookInfo {

    private Integer bookId;//小说Id

    private String bookName;//小说名称

    private String authorName;//作者名

    private String attribution;//小说属性1.男频2.女频3.出版

    private Integer bookTypeId;//类型Id

    private String updateStatus;//更新状态 0 已完结， 1 连载中

    private  String cover_url;//小说链接

    private String description;//小说简介

    private String wordcount;//字数


}
