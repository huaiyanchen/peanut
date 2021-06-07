package com.javasm.dao;


import com.javasm.bean.Channel;
import com.javasm.bean.ChannelType;
import com.javasm.bean.Game;
import com.javasm.bean.PageInfo;
import com.javasm.bean.vo.BookInfoVO;

import java.util.List;

public interface ChannelTypeDao {

    /**
     * 查找类型
     * @param channelType 查找条件
     * @return 结果集
     */
    List<ChannelType> findType(ChannelType channelType);



    /**
     * 分页查找渠道
     * @param pageInfo 分页信息
     * @param pageInfo 查找条件
     * @return 结果集
     */
    List<ChannelType> findChannelTypePage(PageInfo<ChannelType> pageInfo);

    /**
     * 统计总数量(总条数)
     */
    Integer count();

    /**
     *  添加渠道种类
     * @param channelType
     * @return
     */
    boolean addChannelType(ChannelType channelType);

    /**
     *  修改渠道种类
     * @param channelType
     * @return
     */
    boolean updateChannelType(ChannelType channelType);

    /**
     *  删除渠道种类根据tid
     * @param tid
     * @return
     */
    boolean deleteChannelType(int tid);
}
