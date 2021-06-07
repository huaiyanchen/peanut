package com.javasm.dao;

import com.javasm.bean.BookType;

import java.util.List;

public interface BookTypeDao {
    /**
     * 添加小说类型
     * @param bookType 添加的小说类型
     * @return 是否成功
     */
    boolean addType(BookType bookType);

    /**
     * 修改小说类型
     * @param bookType 修改的小说类型
     * @return 是否成功
     */
    boolean updateType(BookType bookType);

    /**
     * 删除小说类型
     * @param typeId 类型IF
     * @return 是否成功
     */
    boolean deleteType(Integer typeId);

    /**
     * 查找类型
     * @param bookType 查找条件
     * @return 结果集
     */
    List<BookType> findType(BookType bookType);

    /**
     * 查找小说类型，通过Id
     * @param id 类型ID
     * @return 小说类型
     */
    BookType findOneById(Integer id);

}
