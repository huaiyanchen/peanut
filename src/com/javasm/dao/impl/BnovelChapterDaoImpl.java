package com.javasm.dao.impl;

import com.javasm.bean.BnovelDetailInfo;
import com.javasm.bean.vo.NovelChapterVO;
import com.javasm.dao.BnovelChapterDao;
import com.javasm.util.JdbcUtil;

import java.util.List;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/6/1-17:47
 * @Since:jdk1.8
 * @Description:TODO
 */
public class BnovelChapterDaoImpl implements BnovelChapterDao {
    Class<NovelChapterVO>clazz=NovelChapterVO.class;
    //查询书籍所有章节信息 根据bookid
    @Override
    public List<NovelChapterVO> findNovelChapterByBookid(Integer bookid) {
        String sql="select bchapterid,bchapterName,bchaptercontent from novelchapter where bookid=?";
        return JdbcUtil.getAll(sql,clazz,bookid);
    }
}
