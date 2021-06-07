package com.javasm.web.channel;

import com.javasm.annotation.ResponseTypeAnnotation;
import com.javasm.bean.Channel;
import com.javasm.bean.ChannelType;
import com.javasm.bean.PageInfo;
import com.javasm.bean.vo.ChannelVO;
import com.javasm.service.ChannelService;
import com.javasm.service.ChannelTypeService;
import com.javasm.service.impl.ChannelServiceImpl;
import com.javasm.service.impl.ChannelTypeServiceImpl;
import com.javasm.web.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


@WebServlet("/channelInfo.do")
public class ChannelServlet extends BaseServlet<Channel> {

    private ChannelService channelService = new ChannelServiceImpl();
    private ChannelTypeService channelTypeService = new ChannelTypeServiceImpl();

    @ResponseTypeAnnotation
    public Object showChannel(Channel channel, HttpServletRequest request, HttpServletResponse response) {
        //获取前端数据
        String pageSize = request.getParameter("pageNum");
        String currentPage = request.getParameter("nowPage");

//        //接受渠道父类id 的值
        String channelOneTypeId = request.getParameter("channelOneTypeId");
//        //创建VO表对象
        ChannelVO channelVO = new ChannelVO();
//        //父类类型id
        channelVO.setChannelOneTypeId(Integer.valueOf(channelOneTypeId));
//        //渠道名
        channelVO.setProductname(channel.getProductname());
//        //二级类型id
        channelVO.setTypetwoid(channel.getTypetwoid());
//        //渠道号

        channelVO.setChannelnum(channel.getChannelnum());
        PageInfo<ChannelVO> channelPage = channelService.findChannelPage(currentPage, pageSize, channelVO);

        return channelPage;
    }

    @ResponseTypeAnnotation
    public Object showType(Channel channel, HttpServletRequest request, HttpServletResponse response) {

        String pid = request.getParameter("pid");
        String isparent = request.getParameter("isparent");
        //新建type类,并将当前父类id 的值传入
        ChannelType channelType = new ChannelType();
        channelType.setPid(Integer.valueOf(pid));
        channelType.setIsparent(Integer.valueOf(isparent));

        List<ChannelType> typeList = channelTypeService.findType(channelType);

        return typeList;
    }

    @ResponseTypeAnnotation
    public Object deleteChannel(Channel channel, HttpServletRequest request, HttpServletResponse response) {
        boolean flag = channelService.deletChannel(channel.getId());
        String message = flag ? "删除成功" : "删除失败";
        System.out.println(message);

        return message;
    }

    @ResponseTypeAnnotation
    public Object showTypeList(Channel channel, HttpServletRequest request, HttpServletResponse response) {

        String currentpage = request.getParameter("nowPage");
        String pageSize = request.getParameter("pageNum");

        PageInfo<ChannelType> channelTypePageInfo = channelTypeService.showChannelByPage(currentpage, pageSize);

        return channelTypePageInfo;
    }


}