package com.javasm.service;

import com.javasm.bean.BookInfo;
import com.javasm.bean.Channel;
import com.javasm.bean.PageInfo;
import com.javasm.bean.vo.BookInfoVO;
import com.javasm.bean.vo.ChannelVO;

import java.util.List;

public interface ChannelService {

    /**
     * 分页查找小说
     * @param currentPageStr 当前页
     * @param pageSizeStr 每页条数
     * @param channelVO 查询条件
     * @return 结果集
     */
    PageInfo<ChannelVO> findChannelPage(String currentPageStr, String pageSizeStr, ChannelVO channelVO);

    /**
     *  删除 根据id
     * @return
     */
    boolean deletChannel(int id);
}
