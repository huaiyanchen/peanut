package com.javasm.service.impl;

import com.javasm.bean.Game;
import com.javasm.bean.PageInfo;
import com.javasm.bean.vo.GameTypeVO;
import com.javasm.dao.GameDao;
import com.javasm.dao.impl.GameDaoImpl;
import com.javasm.service.GameService;

import java.util.List;

public class GameServiceImpl implements GameService {

    GameDao gameDao = new GameDaoImpl();

    @Override
    public List<Game> findAllGames() {
        return gameDao.findAllGames();
    }

    @Override
    public boolean addGame(Game game) {
        return gameDao.addGame(game);
    }

    @Override
    public boolean deletGame(int gid) {
        return gameDao.deletGame(gid);
    }

    @Override
    public boolean upData(int gid, Game game) {
        return gameDao.upData(gid,game);
    }

    @Override
    public PageInfo<GameTypeVO> showGameByPage(String pageStr, String countStr, Game game) {
        // 总数据

        Integer allCount = gameDao.count(game);

        PageInfo<GameTypeVO> page = new PageInfo<>(pageStr,countStr,allCount);


        List<GameTypeVO> list = gameDao.findGameByPage(page, game);
        page.setList(list);
        return page;
    }


}
