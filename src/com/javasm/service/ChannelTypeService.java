package com.javasm.service;

import com.javasm.bean.ChannelType;
import com.javasm.bean.Game;
import com.javasm.bean.PageInfo;
import com.javasm.dao.ChannelTypeDao;
import com.javasm.dao.impl.ChannelTypeDaoImpl;

import java.util.List;

public interface ChannelTypeService {

    /**
     * 查找类型
     * @param channelType 查找条件
     * @return 结果集
     */
    List<ChannelType> findType(ChannelType channelType);

    /**
     *  分页查找
     * @param pageStr
     * @param countStr
     * @return
     */
    PageInfo<ChannelType> showChannelByPage(String pageStr,String countStr);

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
