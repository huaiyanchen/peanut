package com.javasm.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/5/26-20:32
 * @Since:jdk1.8
 * @Description:TODO
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class BuserInfo {
     private Integer buserid;
     private Integer uid;
     private String bookpartner;
     private Integer bookid;
     private String bchapterid;
     private Integer sortid;

}
