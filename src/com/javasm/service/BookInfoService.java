package com.javasm.service;

import com.javasm.bean.BookInfo;
import com.javasm.bean.PageInfo;
import com.javasm.bean.vo.BookInfoVO;

public interface BookInfoService {
    /**
     * 增加小说
     * @param bookInfo 添加的小说
     * @return 是否成功
     */
    boolean addBook(BookInfo bookInfo);

    /**
     * 删除小说
     * @param bookId 小说Id
     * @return 是否成功
     */
    boolean deleteBook(Integer bookId);

    /**
     * 修改小说
     * @param bookInfo 修改后的小说
     * @return 是否成功
     */
    boolean updateBook(BookInfo bookInfo);


    /**
     * 分页查找小说
     * @param currentPageStr 当前页
     * @param pageSizeStr 每页条数
     * @param bookInfoVO 查询条件
     * @return 结果集
     */
    PageInfo<BookInfoVO> findBookPage(String currentPageStr, String pageSizeStr, BookInfoVO bookInfoVO);

    /**
     * 查找小说，通过ID
     * @param bookId 小说ID
     * @return 小说
     */
    BookInfoVO findOneById(Integer bookId);
}
