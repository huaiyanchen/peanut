package com.javasm.bean.vo;

import com.javasm.bean.BookInfo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author：ydw
 * @Version：1.0
 * @Date：2021/5/29-13:01
 * @Since:jdk1.8
 * @Description:TODO
 */

@NoArgsConstructor
@AllArgsConstructor
@Data
public class BookInfoVO extends BookInfo {
    private Integer bookOneTypeId;//一级分类Id
    private String bookOneTypeName;//一级分类名
    private Integer bookTwoTypeId;//二级分类Id
    private String bookTwoTypeName;//二级分类名
}