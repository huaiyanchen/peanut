package com.javasm.service.impl;

import com.javasm.bean.vo.NovelChapterVO;
import com.javasm.dao.BnovelChapterDao;
import com.javasm.dao.impl.BnovelChapterDaoImpl;
import com.javasm.service.BnovelChapterService;

import java.util.List;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/6/1-17:52
 * @Since:jdk1.8
 * @Description:TODO
 */
public class BnovelChapterServiceImpl implements BnovelChapterService {
    BnovelChapterDao bnovelChapterDao=new BnovelChapterDaoImpl();
    @Override
    public List<NovelChapterVO> findNovelChapter(Integer bookid) {
        return  bnovelChapterDao.findNovelChapterByBookid(bookid);
    }
}
