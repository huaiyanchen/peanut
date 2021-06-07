package com.javasm.dao.impl;

import com.javasm.bean.BookInfo;
import com.javasm.bean.PageInfo;
import com.javasm.bean.vo.BookInfoVO;
import com.javasm.dao.BookInfoDao;
import com.javasm.util.JdbcUtil;

import java.util.List;

public class BookInfoDaoImpl implements BookInfoDao {

    @Override
    public boolean addBook(BookInfo bookInfo) {
        String sql = "insert into bookinfo values(null,?,?,?,?,?,?,?,?)";
        return JdbcUtil.executeUpdate(sql,bookInfo.getBookName(),bookInfo.getAuthorName(),bookInfo.getAttribution(),bookInfo.getBookTypeId(),bookInfo.getUpdateStatus(),bookInfo.getCover_url(),bookInfo.getDescription(),bookInfo.getWordcount())>0;
    }


    @Override
    public boolean deleteBook(Integer bookId) {
        String sql = "delete from bookinfo where bookId=?";
        return JdbcUtil.executeUpdate(sql, bookId) > 0;
    }

    @Override
    public boolean updateBook(BookInfo bookInfo) {
        String sql = "update bookinfo set bookName = ? ,authorName = ? ,bookTypeId = ? , updateStatus = ?,cover_url=?,description = ?,wordcount=? where bookid=? ";
            return JdbcUtil.executeUpdate(sql, bookInfo.getBookName(),bookInfo.getAuthorName(),bookInfo.getBookTypeId(),bookInfo.getUpdateStatus(),bookInfo.getCover_url(),bookInfo.getDescription(),bookInfo.getWordcount(),bookInfo.getBookId()) > 0;
    }

    //分页查询
    @Override
    public List<BookInfoVO> findBookPage(PageInfo<BookInfoVO> pageInfo, BookInfoVO bookInfoVO) {
        StringBuffer sql=new StringBuffer("select b.*,t1.bookTypeId as bookOneTypeId, t1.bookTypeName as bookOneTypeName, t2.bookTypeId as bookTwoTypeId,t2.bookTypeName as bookTwoTypeName " +

 "from bookinfo as b, booktype as t1, booktype as t2 " +

 "where t1.bookTypeId = t2.parentTypeId and b.bookTypeId = t2.bookTypeId ");

        if(bookInfoVO!=null){
            if(bookInfoVO.getBookOneTypeId()!=null&&bookInfoVO.getBookOneTypeId()>0){
                sql.append(" and t2.bookTypeId in (SELECT bookTypeId FROM booktype WHERE parentTypeId = "+bookInfoVO.getBookOneTypeId()+")");
            }
            if(bookInfoVO.getBookTypeId()!=null&&bookInfoVO.getBookTypeId()>0){
                sql.append(" AND t2.bookTypeId = "+bookInfoVO.getBookTypeId());
            }
            if(bookInfoVO.getBookName()!=null&&!"".equals(bookInfoVO.getBookName())){
                sql.append(" AND b.bookName like '%"+bookInfoVO.getBookName()+"%'");
            }
            if(bookInfoVO.getBookId()!=null && bookInfoVO.getBookId()>0){
                sql.append(" and bookId   = "+bookInfoVO.getBookId());
            }
        }
        sql.append(" limit ?,?");
        return JdbcUtil.getAll(sql.toString(),BookInfoVO.class,pageInfo.getStartIndex(),pageInfo.getCount());
    }

    /**
     * 统计数量
     * @param bookInfoVO 查找条件
     * @return 数量
     */
    @Override
    public Integer countFind(BookInfoVO bookInfoVO) {
        StringBuffer sql=new StringBuffer ("SELECT COUNT(1) from bookinfo where 1 = 1");
        if(bookInfoVO!=null){
            if(bookInfoVO.getBookOneTypeId()!=null && bookInfoVO.getBookOneTypeId()>0){
                sql.append(" and bookTypeId IN (SELECT bookTypeId FROM booktype WHERE parentTypeId = "+bookInfoVO.getBookOneTypeId()+")");
            }
            if(bookInfoVO.getBookTypeId()!=null && bookInfoVO.getBookTypeId()>0){
                sql.append(" and bookTypeId = "+bookInfoVO.getBookTypeId());
            }
            if(bookInfoVO.getBookId()!=null && bookInfoVO.getBookId()>0){
                sql.append(" and bookId   = "+bookInfoVO.getBookId());
            }
            if(bookInfoVO.getBookName()!=null && !"".equals(bookInfoVO.getBookName())){
                sql.append(" and bookName like '%"+bookInfoVO.getBookName()+"%'");
            }
        }
        String count = JdbcUtil.getCount(sql.toString()).toString();
        return Integer.valueOf(count);
    }


    /**
     * 查找小说，通过ID
     * @param bookId 小说ID
     * @return 小说
     */
    @Override
    public BookInfoVO findOneById(Integer bookId) {
        String sql = "SELECT\n" +
                "b.*,\n" +
                "t1.bookTypeId AS bookOneTypeId,\n" +
                "t1.bookTypeName AS bookOneTypeName,\n" +
                "t2.bookTypeId AS bookTwoTypeId,\n" +
                "t2.bookTypeName AS bookTwoTypeName\n" +
                "FROM\n" +
                "bookinfo AS b ,\n" +
                "booktype AS t1 ,\n" +
                "booktype AS t2\n" +
                "WHERE\n" +
                "t1.bookTypeId = t2.flagParent AND\n" +
                "b.bookTypeId = t2.bookTypeId AND\n" +
                "b.bookId = ?";
        return JdbcUtil.getById(sql,BookInfoVO.class,bookId);
    }


}
