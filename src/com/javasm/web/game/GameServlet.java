package com.javasm.web.game;

import com.alibaba.druid.util.JdbcUtils;
import com.alibaba.fastjson.JSONObject;
import com.javasm.annotation.ResponseTypeAnnotation;
import com.javasm.bean.Game;
import com.javasm.bean.PageInfo;
import com.javasm.bean.vo.GameTypeVO;
import com.javasm.dao.GameDao;
import com.javasm.dao.impl.GameDaoImpl;
import com.javasm.service.GameService;
import com.javasm.service.impl.GameServiceImpl;
import com.javasm.util.DataConvert;
import com.javasm.util.JdbcUtil;
import com.javasm.web.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/game.do")
public class GameServlet extends BaseServlet<Game> {
    private GameDao gameDao = new GameDaoImpl();
    private GameService gameService = new GameServiceImpl();

    @ResponseTypeAnnotation
    public Object showGame(Game game, HttpServletRequest request, HttpServletResponse response) {
        List<Game> allGames = gameService.findAllGames();

        return allGames;
    }

    @ResponseTypeAnnotation
    public Object showGameByPage(Game game, HttpServletRequest request, HttpServletResponse response) {

        // 获取页面数据（分页数据、查询数据）
//        String currentpage = request.getParameter("currentpage");// 当前页
//        String pageSize = request.getParameter("pageSize");// 每页显示几条数据
//        String gameName = request.getParameter("gameName");// 游戏名称

        String currentpage = request.getParameter("nowPage");// 当前页
        String pageSize = request.getParameter("pageNum");// 每页显示几条数据


//        Game game1 = new Game();
//        Heroinfo heroinfo = new Heroinfo();
//        game1.setName(gameName);
//        heroinfo.setHeroName(heroName);
        // 调用service中的方法实现分页查询
//        PageInfo<HeroTypeVO> pageInfo = heroInfoService.showHeroByPage(currentpage, pageSize, heroinfo);
//        PageInfo<GameTypeVO> pageInfo = gameService.showGameByPage(currentpage, pageSize, game1);

        PageInfo<GameTypeVO> pageInfo = gameService.showGameByPage(currentpage, pageSize, game);

        // 将json的数据发送到浏览器之上
        return pageInfo;
    }

    @ResponseTypeAnnotation
    public Object addGame(Game game, HttpServletRequest request, HttpServletResponse response) {
        Boolean flag = gameService.addGame(game);
        String message = flag ? "添加成功" : "添加失败";
        System.out.println(message);
        return message;
    }

    @ResponseTypeAnnotation
    public Object updataGame(Game game, HttpServletRequest request, HttpServletResponse response) {
        boolean flag = gameService.upData(game.getGid(),game);

        String message = flag ? "修改成功" : "修改失败";
        System.out.println(message);
        return message;
    }

    @ResponseTypeAnnotation
    public Object deleteGame(Game game, HttpServletRequest request, HttpServletResponse response) {
        boolean flag = gameService.deletGame(game.getGid());
        String message = flag ? "删除成功" : "删除失败";
        System.out.println(message);
        return message;
    }

}
