package com.javasm.bean;

import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;

@Getter
@NoArgsConstructor
public class PageInfo<T> {

    private Integer page;// 当前页
    private Integer count;// 每页显示的数据量
    private Integer allCount;// 总条数
    private Integer startIndex;// 起始下标
    private List<T> list;

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    /**
     * 构造方法
     *
     * @param allCount
     */
    public PageInfo(String pageStr, String countStr, Integer allCount) {
        //  将String字符串转为Integer
        Integer page = pageStr != null && !"".equals(pageStr) ? Integer.valueOf(pageStr) : 1;
        Integer count = countStr != null && !"".equals(countStr) ? Integer.valueOf(countStr) : 3;

        this.page = page;
        this.count = count;
        this.allCount = allCount;

        // 计算起始下标
        this.startIndex = (this.page - 1) * this.count;
    }
}
