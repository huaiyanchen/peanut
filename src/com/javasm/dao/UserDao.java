package com.javasm.dao;

import com.javasm.bean.User;
import com.javasm.bean.vo.UserMenuVO;
import com.javasm.bean.vo.UserRoleVO;
import com.javasm.bean.vo.UserVO;

import java.util.List;

/**
 * @Author：chy
 * @Version：1.0
 * @Date：2021/5/26-22:18
 * @Since:jdk1.8
 * @Description:TODO
 */

public interface UserDao {
    /**
     * 登陆用的查询用户
     *
     * @param user 用户:只传userName和pwd的
     * @return
     */
    User selectUserForLogin(User user);

    /**
     * 根据uid查询用户
     *
     * @param uid
     * @return
     */
    User selectUserById(Integer uid);

    /**
     * 根据uid查询用户
     *
     * @return
     */
    List<User> selectAllUser();


    /**
     * 修改登陆时间
     * @param user
     * @return
     */
    boolean updateLoginTime(User user);

    /**
     *
     * @param uid
     * @return UserMenuVO
     */
    List<UserMenuVO> selectMenuByUserId(Integer uid);

    /**
     * 根据uid查询 父菜单信息
     *
     * @param uid
     * @return UserMenuVO
     */
    List<UserMenuVO> selectMenuByUserIdToRoleList(Integer uid);


    /**
     * 根据uid  parentId查询 子菜单信息
     *
     * @param uid
     * @param parentId
     * @return UserMenuVO
     */
    List<UserMenuVO> selectMenuByUserIdToRoleList(Integer uid, Integer parentId);

    /**
     * 查询所有的登陆用户的权限
     *
     * @return
     */
    List<UserVO> selectAllUserVo();

    /**
     * 删除 state为1的变为0
     *
     * @param uid
     * @return
     */
    boolean deleteUserByUid(Integer uid);


    /**
     * 修改用户密码
     * @param uid
     * @param newPwd
     * @return
     */
    boolean updatePwd(Integer uid, String newPwd);

    /**
     * 修改state
     *
     * @param uid
     * @return
     */
    boolean updateState(Integer uid);

    /**
     * 添加用户
     *
     * @param user
     * @return
     */
    int addUser(User user);


    /**
     * 添加userrole表的关系字段
     * @param uid
     * @param rid
     * @return
     */
    boolean addUserRole(Integer uid, Integer rid);

    /**
     * 根据 uid 修改对应的 User表中的 username,state, UR表中的uid对应的rid(先清空,再添加.)
     * @param userRoleVO
     * @return
     */
    boolean updateUserRole(UserRoleVO userRoleVO);


    /**
     * 更新用户信息
     *
     * @param user
     * @return
     */
    boolean updateUserInfo(User user);
}