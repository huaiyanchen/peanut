package com.javasm.web.novel;

import com.javasm.annotation.ResponseTypeAnnotation;
import com.javasm.bean.vo.NovelChapterVO;
import com.javasm.bean.vo.NovelListVO;
import com.javasm.bean.vo.NovelVO;
import com.javasm.enums.ResponseType;
import com.javasm.service.BnovelChapterService;
import com.javasm.service.impl.BnovelChapterServiceImpl;
import com.javasm.web.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/6/1-17:55
 * @Since:jdk1.8
 * @Description:TODO
 */
@WebServlet("/NovelChapter.do")
public class NovelChapterServlet  extends BaseServlet<NovelChapterVO> {
    BnovelChapterService bnovelChapterService=new BnovelChapterServiceImpl();

    @ResponseTypeAnnotation(responseType = ResponseType.AJAX)
    public Object showNovelChapter(NovelChapterVO novelChapterVO, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String bookid = request.getParameter("bookchapId");
        Integer bookid1 = Integer.valueOf(bookid);
        List<NovelChapterVO> list=bnovelChapterService.findNovelChapter(bookid1);
        return list;
    }


}
