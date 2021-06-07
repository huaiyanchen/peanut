package com.javasm.web.novel;

import com.javasm.annotation.ResponseTypeAnnotation;
import com.javasm.bean.BnovelDetailInfo;
import com.javasm.bean.BnovelListInfo;
import com.javasm.bean.vo.NovelVO;
import com.javasm.enums.ResponseType;
import com.javasm.service.BnovelDetailService;
import com.javasm.service.BnovelListInfoService;
import com.javasm.service.impl.BnovelDetailServiceImpl;
import com.javasm.service.impl.BnovelListInfoServiceImpl;
import com.javasm.web.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/5/31-15:29
 * @Since:jdk1.8
 * @Description:TODO
 */

@WebServlet("/AddModifDelete.do")
public class AddModifDeleteServlet extends BaseServlet<BnovelDetailInfo> {
    private BnovelListInfoService bnovelListInfoService = new BnovelListInfoServiceImpl();
    private BnovelDetailService bnovelDetailService = new BnovelDetailServiceImpl();


    //根据booid删除图书信息 返回成功或失败消息
    @ResponseTypeAnnotation(responseType = ResponseType.AJAX)
    public Object deleteNovel(BnovelDetailInfo bnovelDetailInfo, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String bookIdStr = request.getParameter("bookid");
        Integer bookid = Integer.valueOf(bookIdStr);
        BnovelDetailService bnovelDetailService = new BnovelDetailServiceImpl();
        Boolean flag = bnovelDetailService.deleteBnovelDetailInfo(bookid);
        String message = flag ? "删除成功" : "删除失败";
        return message;

    }

    //新增图书目录 返回成功或者失败消息
    @ResponseTypeAnnotation(responseType = ResponseType.AJAX)
    public Object addNovel(BnovelDetailInfo bnovelDetailInfo, HttpServletRequest request, HttpServletResponse response) throws IOException {

//        String battribution = request.getParameter("battribution");
//        System.out.println(battribution);
        BnovelDetailService bnovelDetailService = new BnovelDetailServiceImpl();

        Boolean flag = bnovelDetailService.saveBnovelDetailInfo(bnovelDetailInfo);
        String message = flag ? "添加成功" : "添加失败";
        return message;

    }


    //查询全部目录
    @ResponseTypeAnnotation(responseType = ResponseType.AJAX)
    public Object showBnovellistLevelAll(BnovelListInfo bnovelListInfo, HttpServletRequest request, HttpServletResponse response) throws IOException {
        List<BnovelListInfo> listAll = bnovelListInfoService.findAllNovelListInfo();
        return listAll;
    }

    //根据bookid修改图书信息
    @ResponseTypeAnnotation(responseType = ResponseType.AJAX)
    public Object modifyNovel(BnovelDetailInfo bnovelDetailInfo, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String bookIdStr = request.getParameter("bookresId");
        Integer bookid = Integer.valueOf(bookIdStr);
    Boolean flag= bnovelDetailService.updateBnovelDetailInfo(bookid,bnovelDetailInfo);
        String message = flag ? "修改成功" : "修改失败";
        return message;
    }

}
