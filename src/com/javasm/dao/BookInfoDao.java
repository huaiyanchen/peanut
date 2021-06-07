package com.javasm.dao;

import com.javasm.bean.BookInfo;
import com.javasm.bean.PageInfo;
import com.javasm.bean.vo.BookInfoVO;

import java.util.List;

public interface BookInfoDao {
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
     * @param pageInfo 分页信息
     * @param bookInfoVO 查找条件
     * @return 结果集
     */
    List<BookInfoVO> findBookPage(PageInfo<BookInfoVO> pageInfo, BookInfoVO bookInfoVO);

    /**
     * 统计数量
     * @param bookInfoVO 查找条件
     * @return 数量
     */
    Integer countFind(BookInfoVO bookInfoVO);

    /**
     * 查找小说，通过ID
     * @param bookId 小说ID
     * @return 小说
     */
    BookInfoVO findOneById(Integer bookId);

}
