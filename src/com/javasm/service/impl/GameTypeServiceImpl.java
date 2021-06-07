package com.javasm.service.impl;

import com.javasm.bean.GameType;
import com.javasm.dao.GameTypeDao;
import com.javasm.dao.impl.GameTypeDaoImpl;
import com.javasm.service.GameTypeService;

import java.util.List;

public class GameTypeServiceImpl implements GameTypeService {

    private GameTypeDao gameTypeDao = new GameTypeDaoImpl();

    @Override
    public List<GameType> findGameType() {
        return gameTypeDao.findGameType();
    }
}
