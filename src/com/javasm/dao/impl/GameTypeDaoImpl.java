package com.javasm.dao.impl;

import com.alibaba.druid.util.JdbcUtils;
import com.javasm.bean.GameType;
import com.javasm.dao.GameTypeDao;
import com.javasm.util.JdbcUtil;

import java.util.List;

public class GameTypeDaoImpl implements GameTypeDao {

        Class<GameType> clazz = GameType.class;

    @Override
    public List<GameType> findGameType() {
        String sql = "select * from gametype";
        return JdbcUtil.getAll(sql,clazz);
    }
}
