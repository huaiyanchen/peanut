package com.javasm.bean.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/5/31-20:31
 * @Since:jdk1.8
 * @Description:TODO
 */
@Data
@NoArgsConstructor
@AllArgsConstructor

public class NovelListVO {
    //图书目录序号
    private Integer nid;
    //图书一级目录id
    private Integer pid;
    // 图书二级目录id
    private Integer bsortid;
    //图书目录名字
    private String bsortname;
    //图书是否是一级目录
    private Integer isPar;

    private List<NovelListVO>children;

    public List<NovelListVO> getChildren() {
        return children;
    }

    public void setChildren(List<NovelListVO> children) {
         this.children = children;


    }


}
