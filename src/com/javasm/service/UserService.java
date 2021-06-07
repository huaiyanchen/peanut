package com.javasm.service;

import com.javasm.bean.User;
import com.javasm.bean.vo.UserMenuVO;
import com.javasm.bean.vo.UserRoleVO;
import com.javasm.bean.vo.UserVO;

import java.util.List;

/**
 * @Author：chy
 * @Version：1.0
 * @Date：2021/5/26-22:26
 * @Since:jdk1.8
 * @Description:TODO
 */

public interface UserService {

    /**
     * 用户登陆用的的 用户查询
     *
     * @param user
     * @return
     */
    User selectUser(User user);

    /**
     * 修改登陆时间
     * @param user
     * @return
     */
    boolean updateLoginTime(User user);

    /**
     *
     *
     * @param uid
     * @return UserMenuVO
     */
    List<UserMenuVO> selectMenuByUserId(Integer uid);


    /**
     * 根据用户id查询 下拉菜单
     * @param id
     * @return
     */
    List<UserMenuVO> selectAllMenuById(Integer id);

    /**
     * 查询所有的登陆用户的权限
     *
     * @return
     */
    List<UserVO> findAllUserVo();


    /**
     * 删除 state为1的变为0
     *
     * @param uid
     * @return
     */
    boolean deleteUserByUid(Integer uid);


    /**
     * 修改用户密码
     *
     * @param uid
     * @param newPwd
     * @return
     */
    boolean modifyPwd(Integer uid, String pwd, String newPwd);

    /**
     * 添加用户和其对应的 userrole表
     *
     * @param user
     * @param rids
     * @return
     */
    boolean addUser(User user, int[] rids);

    /**
     * 根据 uid 修改对应的 User表中的 username,state, UR表中的uid对应的rid(先清空,再添加.)
     * @param userRoleVO
     * @return
     */
    boolean updateUserRole(UserRoleVO userRoleVO);
}