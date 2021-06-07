package com.javasm.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class BookType {

    private Integer bookTypeId;//类型Id

    private String bookTypeName;//类型名称

    private Integer flagParent;//是否父类 0 父类 1 子类

    private Integer parentTypeId;//父类Id
}