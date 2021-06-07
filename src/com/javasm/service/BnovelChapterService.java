package com.javasm.service;

import com.javasm.bean.vo.NovelChapterVO;

import java.util.List;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/6/1-17:50
 * @Since:jdk1.8
 * @Description:TODO
 */
public interface BnovelChapterService {

        //查询书籍章节信息
     List<NovelChapterVO> findNovelChapter(Integer bookid);
    }
