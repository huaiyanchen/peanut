package com.javasm.dao;

import com.javasm.bean.BpageInfo;
import com.javasm.bean.vo.NovelChapterVO;
import com.javasm.bean.vo.NovelVO;

import java.util.List;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/6/1-17:44
 * @Since:jdk1.8
 * @Description:TODO
 */
public interface BnovelChapterDao {

    //根据bookid查询书籍的章节信息
    List<NovelChapterVO> findNovelChapterByBookid(Integer bookid);
}
