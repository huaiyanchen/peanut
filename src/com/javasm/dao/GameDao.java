package com.javasm.dao;

import com.javasm.bean.Game;
import com.javasm.bean.PageInfo;
import com.javasm.bean.vo.GameTypeVO;

import java.util.List;

public interface GameDao {


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
    List<GameTypeVO> findGameByPage(PageInfo<GameTypeVO> page, Game game);

    /**
     * 统计总数量(总条数)
     */
    Integer count(Game game);
}
