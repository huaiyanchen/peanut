package com.javasm.service.impl;

        import com.javasm.bean.Channel;
        import com.javasm.bean.PageInfo;
        import com.javasm.bean.vo.BookInfoVO;
        import com.javasm.bean.vo.ChannelVO;
        import com.javasm.dao.ChannelDao;
        import com.javasm.dao.impl.ChannelDaoImpl;
        import com.javasm.service.ChannelService;

        import java.util.List;

public class ChannelServiceImpl implements ChannelService {
    ChannelDao channelDao = new ChannelDaoImpl();


    @Override
    public PageInfo<ChannelVO> findChannelPage(String currentPageStr, String pageSizeStr, ChannelVO channelVO) {
        Integer count = channelDao.countFind(channelVO);
        PageInfo<ChannelVO> pageInfo = new PageInfo<>(currentPageStr,pageSizeStr,count);
        List<ChannelVO> channelPage = channelDao.findChannelPage(pageInfo, channelVO);

//        System.out.println("asdadasd"+channelPage);

        pageInfo.setList(channelPage);
        return pageInfo;
    }

    @Override
    public boolean deletChannel(int id) {
        return channelDao.deletChannel(id);
    }
}
