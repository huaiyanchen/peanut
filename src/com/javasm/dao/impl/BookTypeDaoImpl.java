package com.javasm.dao.impl;


import com.javasm.bean.BookType;
import com.javasm.dao.BookTypeDao;
import com.javasm.util.JdbcUtil;

import java.util.List;

public class BookTypeDaoImpl implements BookTypeDao {
    /**
     * 添加小说类型
     * @param bookType 添加的小说类型
     * @return 是否成功
     */
    @Override
    public boolean addType(BookType bookType) {
        String sql = "insert into booktype values(null,?,?,?) ";
        return JdbcUtil.executeUpdate(sql,bookType.getBookTypeName(),bookType.getFlagParent(),bookType.getParentTypeId())>0;
    }

    /**
     * 修改小说类型
     * @param bookType 修改的小说类型
     * @return 是否成功
     */
    @Override
    public boolean updateType(BookType bookType) {
        String sql = "update booktype set bookTypeName = ? , flagParent = ? , parentTypeId = ? where bookTypeId = ? ";
        return JdbcUtil.executeUpdate(sql,bookType.getBookTypeName(),bookType.getFlagParent(),bookType.getParentTypeId(),bookType.getBookTypeId())>0;
    }

    /**
     * 删除小说类型
     * @param typeId 类型IF
     * @return 是否成功
     */
    @Override
    public boolean deleteType(Integer typeId) {
        String sql = "delete from booktype where bookTypeId=?";
        return JdbcUtil.executeUpdate(sql,typeId)>0;
    }

    /**
     * 查找类型
     * @param bookType 查找条件
     * @return 结果集
     */
    @Override
    public List<BookType> findType(BookType bookType) {

        StringBuffer sql =new StringBuffer(" select * from booktype where 1 = 1") ;
        if(bookType != null){
            if(bookType.getFlagParent()!=null){
                sql.append(" and flagParent = "+ bookType.getFlagParent());
            }
            if(bookType.getParentTypeId()!=null && bookType.getParentTypeId()>0){
                sql.append(" and parentTypeId = "+ bookType.getParentTypeId());
            }
        }
//        System.out.println("findTypeaaaaaaaaaaaaaaaa!!"+JdbcUtil.getAll(sql.toString(),BookType.class));
//findTypeaaaaaaaaaaaaaaaa!![BookType(bookTypeId=1, bookTypeName=男生频道, flagParent=0, parentTypeId=0), BookType(bookTypeId=2, bookTypeName=女生频道, flagParent=0, parentTypeId=0), BookType(bookTypeId=3, bookTypeName=灵异频道, flagParent=0, parentTypeId=0)]
        return JdbcUtil.getAll(sql.toString(),BookType.class);
    }

    /**
     * 查找小说类型，通过Id
     * @param id 类型ID
     * @return 小说类型
     */
    @Override
    public BookType findOneById(Integer id) {
        String sql = "select * from booktype where bookTypeId = ?";

        return JdbcUtil.getById(sql,BookType.class,id);
    }
}
