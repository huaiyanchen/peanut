package com.javasm.dao.impl;

import com.javasm.bean.Role;
import com.javasm.bean.User;
import com.javasm.bean.vo.UserMenuVO;
import com.javasm.bean.vo.UserRoleVO;
import com.javasm.bean.vo.UserVO;
import com.javasm.dao.RoleDao;
import com.javasm.dao.UserDao;
import com.javasm.util.DateUtil;
import com.javasm.util.JdbcUtil;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author：chy
 * @Version：1.0
 * @Date：2021/5/26-22:21
 * @Since:jdk1.8
 * @Description:TODO
 */

public class UserDaoImpl implements UserDao {
    RoleDao roleDao = new RoleDaoImpl();
    Class<User> clazz = User.class;

    @Override
    public User selectUserForLogin(User user) {
        String sql = "select * from user where username = ? and pwd = ? and state = 1";
        return JdbcUtil.getByParam(sql, clazz, user.getUsername(), user.getPwd());
    }

    @Override
    public User selectUserById(Integer uid) {
        String sql = "select * from user where uid = ?";
        return JdbcUtil.getByParam(sql, clazz, uid);
    }

    @Override
    public List<User> selectAllUser() {
        String sql = "select * from user";
        return JdbcUtil.getAll(sql, clazz);
    }

    @Override
    public boolean updateLoginTime(User user) {
        String sql = "update user set logintime = ? where uid = ?";
        return JdbcUtil.executeUpdate(sql, user.getLogintime(), user.getUid()) > 0;
    }

    @Override
    public List<UserMenuVO> selectMenuByUserId(Integer uid) {
        String sql = "select u.uid      uid,\n" +
                "       m.mid          id,\n" +
                "       u.username username,\n" +
                "       m.path     href,\n" +
                "       m.name     title,\n" +
                "       m.icon     icon,\n" +
                "       m.state    mstate,\n" +
                "       m.parentid    mpid\n" +
                "from user u,\n" +
                "     userole ur,\n" +
                "     role r,\n" +
                "     rolemenu rm,\n" +
                "     menu m\n" +
                "where u.uid = ur.uid\n" +
                "  and ur.rid = r.rid\n" +
                "  and r.rid = rm.rid\n" +
                "  and rm.mid = m.mid\n" +
                "  and ur.uid = ? and u.state = 1\n";
        return JdbcUtil.getAll(sql, UserMenuVO.class, uid);
    }

    @Override
    public List<UserMenuVO> selectMenuByUserIdToRoleList(Integer uid) {
        String sql = "select u.uid      uid,\n" +
                "       m.mid          id,\n" +
                "       u.username username,\n" +
                "       u.headpic  headpic,\n" +
                "       m.path     href,\n" +
                "       m.name     title,\n" +
                "       m.icon     icon,\n" +
                "       m.state    mstate,\n" +
                "       m.parentid    mpid\n" +
                "from user u,\n" +
                "     userole ur,\n" +
                "     role r,\n" +
                "     rolemenu rm,\n" +
                "     menu m\n" +
                "where u.uid = ur.uid\n" +
                "  and ur.rid = r.rid\n" +
                "  and r.rid = rm.rid\n" +
                "  and rm.mid = m.mid\n" +
                "  and ur.uid = ?  and m.parentid = 0  and m.state = 1 and u.state = 1 group by id;\n";
        return JdbcUtil.getAll(sql, UserMenuVO.class, uid);
    }

    @Override
    public List<UserMenuVO> selectMenuByUserIdToRoleList(Integer uid, Integer parentId) {
        String sql = "select u.uid      uid,\n" +
                "       m.mid          id,\n" +
                "       u.username username,\n" +
                "       m.path     href,\n" +
                "       m.name     title,\n" +
                "       m.icon     icon,\n" +
                "       m.state    mstate,\n" +
                "       m.parentid    mpid\n" +
                "from user u,\n" +
                "     userole ur,\n" +
                "     role r,\n" +
                "     rolemenu rm,\n" +
                "     menu m\n" +
                "where u.uid = ur.uid\n" +
                "  and ur.rid = r.rid\n" +
                "  and r.rid = rm.rid\n" +
                "  and rm.mid = m.mid\n" +
                "  and ur.uid = ?  and m.parentid = ?  and m.state = 1 and u.state = 1  group by id\n";
        return JdbcUtil.getAll(sql, UserMenuVO.class, uid, parentId);
    }

    @Override
    public List<UserVO> selectAllUserVo() {
        String sql = "select u.uid       uid,\n" +
                "       u.username  username,\n" +
                "       r.rid       rid,\n" +
                "       r.rname     rname,\n" +
                "       u.regtime   regtime,\n" +
                "       u.logintime logintime,\n" +
                "       u.state     state,\n" +
                "       u.headpic     headpic\n" +
                "from user u,\n" +
                "     userole ur,\n" +
                "     role r\n" +
                "where u.uid = ur.uid\n" +
                "  and ur.rid = r.rid\n";
        return JdbcUtil.getAll(sql, UserVO.class);
    }

    @Override
    public boolean deleteUserByUid(Integer uid) {
        String sql = "update user set state = 0 where uid = ?";
        return JdbcUtil.executeUpdate(sql, uid) > 0;
    }

    @Override
    public boolean updatePwd(Integer uid, String newPwd) {
        String sql = "update user set pwd = ? where uid = ?";
        return JdbcUtil.executeUpdate(sql, newPwd, uid) > 0;
    }

    @Override
    public boolean updateState(Integer uid) {
        String sql = "update user set state = 1 where uid = ?";
        return JdbcUtil.executeUpdate(sql, uid) > 0;
    }

    /**
     * 添加用户
     *
     * @param user
     * @return 返回值为当前行的 index
     */
    @Override
    public int addUser(User user) {
        String sql = "insert into user (username,pwd,regtime,state) values (?,?,?,?)";
        return JdbcUtil.executeInsetId(sql, user.getUsername(), user.getPwd(), DateUtil.getNowDate(), 1);
    }

    @Override
    public boolean addUserRole(Integer uid, Integer rid) {
        String sql = "insert into userole values(null,?,?)";
        return JdbcUtil.executeUpdate(sql, uid, rid) > 0;
    }

    @Override
    public boolean updateUserInfo(User user) {
        String sql = "update user set username = ? ,headpic = ?, des = ?,sex = ?, birthday = ?, phone = ? where uid = ?";
        return JdbcUtil.executeUpdate(sql, user.getUsername(), user.getHeadpic(), user.getDes(), user.getSex(),
                user.getBirthday(), user.getPhone(), user.getUid()) > 0;
    }

    @Override
    public boolean updateUserRole(UserRoleVO userRoleVO) {
        Integer uid = userRoleVO.getUser().getUid();
        String username = userRoleVO.getUser().getUsername();
        Integer state = userRoleVO.getUser().getState();
        List<String> ridList = userRoleVO.getRidList();

        //清空该uid中的rid
        String sql = "delete from userole where uid = ?";
        int a = JdbcUtil.executeUpdate(sql, uid);

        //修改改uiduser表中的对应的信息
        String sql1 = "update user set username=?, state=? where uid = ?";
        int b = JdbcUtil.executeUpdate(sql1, username, state, uid);

        //将修改后的rid添加到UR表中,循环输入
        int c = 0;
        if (ridList.size() > 0) {
            String sql2 = "insert into userole values (null,?,?)";
            if (ridList.toString().contains("all")) {
                List<Role> list = roleDao.ridList();
                for (Role role : list) {
                    c = JdbcUtil.executeUpdate(sql2, uid, role.getRid());
                }
            } else {
                List<Integer> list = new ArrayList<>();
                for (String s : ridList) {
                    list.add(Integer.valueOf(s));
                }
                for (Integer integer : list) {
                    c = JdbcUtil.executeUpdate(sql2, uid, integer);
                }
            }
        }
        return (a > 0 && b > 0 && c > 0);
    }

}