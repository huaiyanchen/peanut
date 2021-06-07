package com.javasm.web.novel;

import com.javasm.annotation.ResponseTypeAnnotation;
import com.javasm.bean.BnovelDetailInfo;
import com.javasm.bean.vo.NovelListVO;
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
 * @Date：2021/5/31-20:44
 * @Since:jdk1.8
 * @Description:TODO
 */
@WebServlet("/NovelList.do")
public class ConnectedSearchServlet extends BaseServlet<NovelListVO> {
    private BnovelListInfoService bnovelListInfoService = new BnovelListInfoServiceImpl();

    @ResponseTypeAnnotation(responseType = ResponseType.AJAX)
    public Object showNovelList(NovelListVO novelListVO, HttpServletRequest request, HttpServletResponse response) throws IOException {
     List<NovelListVO>list= bnovelListInfoService.findNovelListInfoLevelTwo();
    return list;
    }

}
