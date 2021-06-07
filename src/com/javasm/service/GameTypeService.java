package com.javasm.service;

import com.javasm.bean.GameType;

import java.util.List;

public interface GameTypeService {
    /**
     * 查询所有类型
     * @return
     */
    List<GameType> findGameType();
}
