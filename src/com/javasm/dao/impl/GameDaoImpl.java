package com.javasm.dao.impl;

import com.javasm.bean.Game;
import com.javasm.bean.PageInfo;
import com.javasm.bean.vo.GameTypeVO;
import com.javasm.dao.GameDao;
import com.javasm.util.JdbcUtil;

import java.util.List;

public class GameDaoImpl implements GameDao {

    Class clazz = Game.class;

    @Override //查
    public List<Game> findAllGames() {
        String sql = "select * from game";
        return JdbcUtil.getAll(sql, clazz);
    }

    @Override //增
    public boolean addGame(Game game) {
        String sql = "insert into game(name,typeid,title,size,state,platform,rank) " +
                "values(?,?,?,?,?,?,?)";
        return JdbcUtil.executeUpdate(sql,game.getName(),game.getTypeId(),game.getTitle(),game.getSize(),game.getState(),game.getPlatform(),game.getRank()) > 0;
    }

    @Override //删
    public boolean deletGame(int gid) {
        String sql = "delete from game where gid = ?";
        return JdbcUtil.executeUpdate(sql, gid) > 0;
    }

    @Override //改
    public boolean upData(int gid,Game game) {
        String sql = "update game set name=?,typeid=?,title=?,size=?,state=?,platform=?,rank=? where gid = ? ";
        return JdbcUtil.executeUpdate(sql,game.getName(),game.getTypeId(),game.getTitle(),game.getSize(),game.getState(),game.getPlatform(),game.getRank(),gid)>0;
    }

    @Override //分页
    public List<GameTypeVO> findGameByPage(PageInfo<GameTypeVO> page, Game game) {
        StringBuffer sql = new StringBuffer("select g.*,t.typeName from game g,gametype t where g.typeid=t.typeid");
        if (game != null) {
            if (game.getName() != null && !"".equals(game.getName())) {
                sql.append(" and name like '%" + game.getName() + "%' ");
            }
            if (game.getTypeId() != null) {
                sql.append(" and g.getTypeId() = " + game.getTypeId() + " ");
            }
        }
        sql.append(" limit ?,?");

        return JdbcUtil.getAll(sql.toString(), GameTypeVO.class, page.getStartIndex(), page.getCount());
    }

    @Override //总条数
    public Integer count(Game game) {
        StringBuffer sql = new StringBuffer("select count(1) from game g,gametype t where g.typeid=t.typeid");
        if (game != null) {
            if (game.getName() != null && !"".equals(game.getName())) {
                sql.append(" and name like '%" + game.getName() + "%' ");
            }
            if (game.getTypeId() != null) {
                sql.append(" and g.getTypeId() = " + game.getTypeId() + " ");
            }
        }
        return JdbcUtil.getCount(sql.toString());
    }

}
