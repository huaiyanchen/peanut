package com.javasm.bean.vo;

import com.javasm.bean.User;
import com.javasm.bean.Userole;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserRoleVO {

    /**
     *  传递的User对象
     */
    private User user;

    /**
     * UserRole 表中的rid的list
     */
    private List<String> ridList;


}
