package com.javasm.web.channel;

import com.javasm.annotation.ResponseTypeAnnotation;
import com.javasm.bean.ChannelType;
import com.javasm.service.ChannelTypeService;
import com.javasm.service.impl.ChannelTypeServiceImpl;
import com.javasm.web.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/channelType.do")
public class ChannelTypeServlet extends BaseServlet<ChannelType> {

    private ChannelTypeService channelTypeService = new ChannelTypeServiceImpl();

    @ResponseTypeAnnotation
    public Object addTypeList(ChannelType channelType, HttpServletRequest request, HttpServletResponse response) {
        boolean flag = channelTypeService.addChannelType(channelType);
        String message = flag ? "添加成功" : "添加失败";
        return message;
    }

    @ResponseTypeAnnotation
    public Object updateTypeList(ChannelType channelType, HttpServletRequest request, HttpServletResponse response) {
        boolean flag = channelTypeService.updateChannelType(channelType);
        String message = flag ? "修改成功" : "修改失败";
        return message;

    }

    @ResponseTypeAnnotation
    public Object deleteTypeList(ChannelType channelType, HttpServletRequest request, HttpServletResponse response) {
        boolean flag = channelTypeService.deleteChannelType(channelType.getTid());
        String message = flag ? "删除成功" : "删除失败";
        return message;
    }



}
