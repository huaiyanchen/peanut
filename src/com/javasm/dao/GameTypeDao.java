package com.javasm.dao;

import com.javasm.bean.GameType;

import java.util.List;

public interface GameTypeDao {

    /**
     *  查询所有游戏类型
     * @return
     */
    List<GameType> findGameType();

}
