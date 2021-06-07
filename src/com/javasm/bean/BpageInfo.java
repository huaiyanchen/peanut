package com.javasm.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/5/25-18:30
 * @Since:jdk1.8
 * @Description:TODO
 */
@Data
@NoArgsConstructor

public class BpageInfo<T> {

    private Integer page;//当前页
    private Integer count;//每一页的数据量
    private Integer allCount;//总条数
    private Integer startIndex;//起始下标
    private List<T>list;

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

//    构造方法
    public BpageInfo(String pageStr,String countStr,Integer allCount){
//        页数和每页条数的值和字符串都不为空时，页数默认为1，每页条数默认为3
        Integer page=pageStr !=null&& !"".equals(pageStr)?Integer.valueOf(pageStr):1;
        Integer count=countStr !=null&& !"".equals(countStr)?Integer.valueOf(countStr):3;

        this.page=page;
        this.count=count;
        this.allCount=allCount;
//        计算起始下标
        this.startIndex=(this.page-1)*this.count;
    }

}
