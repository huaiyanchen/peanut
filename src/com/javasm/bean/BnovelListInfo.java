package com.javasm.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/5/25-18:17
 * @Since:jdk1.8
 * @Description:TODO
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BnovelListInfo {
    //图书目录序号
    private Integer nid;
    //图书一级目录id
    private Integer bsortid;
    //图书一级目录名字
    private String bsortname;
    //是否是一级目录 1是 0否
    private  Integer isPar;
    //父级目录id，只有二级目录有，一级目录默认为0
    private Integer pid;

}
