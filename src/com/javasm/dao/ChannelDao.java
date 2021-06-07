package com.javasm.dao;

import com.javasm.bean.BookInfo;
import com.javasm.bean.Channel;
import com.javasm.bean.PageInfo;
import com.javasm.bean.vo.BookInfoVO;
import com.javasm.bean.vo.ChannelVO;

import java.util.List;

public interface ChannelDao {



//     /**
//      * 增加小说
//      * @param bookInfo 添加的小说
//      * @return 是否成功
//      */
//     boolean addBook(BookInfo bookInfo);
//
     /**
      *  删除 根据id
      * @return
      */
     boolean deletChannel(int id);
//
//     /**
//      * 修改小说
//      * @param bookInfo 修改后的小说
//      * @return 是否成功
//      */
//     boolean updateBook(BookInfo bookInfo);
//
//
     /**
      * 分页查找渠道
      *
      * @return 结果集
      */
     List<ChannelVO> findChannelPage(PageInfo<ChannelVO> pageInfo,ChannelVO channelVO);

     /**
      * 统计数量
      * @param channelVO 查找条件
      * @return 数量
      */
     Integer countFind(ChannelVO channelVO);

//
//     /**
//      * 查找小说，通过ID
//      * @param bookId 小说ID
//      * @return 小说
//      */
//     BookInfoVO findOneById(Integer bookId);

}
