package com.javasm.service.impl;

import com.javasm.bean.BookInfo;
import com.javasm.bean.PageInfo;
import com.javasm.bean.vo.BookInfoVO;
import com.javasm.dao.BookInfoDao;
import com.javasm.dao.impl.BookInfoDaoImpl;
import com.javasm.service.BookInfoService;

import java.util.List;

public class BookInfoServiceImpl implements BookInfoService {

    private BookInfoDao bookInfoDao = new BookInfoDaoImpl();

    /**
     * 增加小说
     * @param bookInfo 添加的小说
     * @return 是否成功
     */
    @Override
    public boolean addBook(BookInfo bookInfo) {
        return bookInfoDao.addBook(bookInfo);
    }

    /**
     * 删除小说
     * @param bookId 小说Id
     * @return 是否成功
     */
    @Override
    public boolean deleteBook(Integer bookId) {
        return bookInfoDao.deleteBook(bookId);
    }

    /**
     * 修改小说
     * @param bookInfo 修改后的小说
     * @return 是否成功
     */
    @Override
    public boolean updateBook(BookInfo bookInfo) {
        return bookInfoDao.updateBook(bookInfo);
    }

    /**
     * 分页查找小说
     * @param currentPageStr 当前页
     * @param pageSizeStr 每页条数
     * @param bookInfoVO 查询条件
     * @return 结果集
     */
    @Override
    public PageInfo<BookInfoVO> findBookPage(String currentPageStr, String pageSizeStr, BookInfoVO bookInfoVO) {
        Integer count = bookInfoDao.countFind(bookInfoVO);
        PageInfo<BookInfoVO> pageInfo = new PageInfo<>(currentPageStr,pageSizeStr,count);
        List<BookInfoVO> bookInfoVOS = bookInfoDao.findBookPage(pageInfo, bookInfoVO);
        pageInfo.setList(bookInfoVOS);
        return pageInfo;
    }

    /**
     * 查找小说，通过ID
     * @param bookId 小说ID
     * @return 小说
     */
    @Override
    public BookInfoVO findOneById(Integer bookId) {
        return bookInfoDao.findOneById(bookId);
    }
}
