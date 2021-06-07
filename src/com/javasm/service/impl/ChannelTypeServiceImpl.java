package com.javasm.service.impl;

import com.javasm.bean.ChannelType;
import com.javasm.bean.PageInfo;
import com.javasm.bean.vo.ChannelVO;
import com.javasm.dao.ChannelTypeDao;
import com.javasm.dao.impl.ChannelTypeDaoImpl;
import com.javasm.service.ChannelService;
import com.javasm.service.ChannelTypeService;

import java.util.List;

public class ChannelTypeServiceImpl implements ChannelTypeService {

    ChannelTypeDao typedao = new ChannelTypeDaoImpl();
    @Override
    public List<ChannelType> findType(ChannelType channelType) {

        return typedao.findType(channelType);
    }

    @Override
    public PageInfo<ChannelType> showChannelByPage(String pageStr, String countStr) {
        Integer allCount = typedao.count();

        PageInfo<ChannelType> page = new PageInfo<>(pageStr,countStr,allCount);

        List<ChannelType> list = typedao.findChannelTypePage(page);
        page.setList(list);

        return page;
    }

    @Override
    public boolean addChannelType(ChannelType channelType) {
        return typedao.addChannelType(channelType);
    }

    @Override
    public boolean updateChannelType(ChannelType channelType) {
        return typedao.updateChannelType(channelType);
    }

    @Override
    public boolean deleteChannelType(int tid) {
        return typedao.deleteChannelType(tid);
    }
}
