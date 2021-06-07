package com.javasm.service;

import com.javasm.bean.Game;
import com.javasm.bean.PageInfo;
import com.javasm.bean.vo.GameTypeVO;

import java.util.List;

public interface GameService {

    /**
     *  查所有
     * @return
     */
    List<Game> findAllGames ();

    /**
     *  增加
     * @return
     */
    boolean addGame(Game game);

    /**
     *  删除 根据id
     * @return
     */
    boolean deletGame(int gid);

    /**
     * 修改
     * @return
     */
    boolean upData(int gid,Game game);

    /**
     *  分页查询
     */
    PageInfo<GameTypeVO> showGameByPage(String pageStr,String countStr,Game game);
}
