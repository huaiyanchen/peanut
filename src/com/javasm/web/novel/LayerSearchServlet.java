package com.javasm.web.novel;

import com.javasm.annotation.ResponseTypeAnnotation;
import com.javasm.bean.BnovelDetailInfo;
import com.javasm.bean.BnovelListInfo;
import com.javasm.bean.BpageInfo;
import com.javasm.bean.vo.NovelVO;
import com.javasm.dao.BnovelDetailInfoDao;
import com.javasm.dao.impl.BnovelDetailInfoDaoImpl;
import com.javasm.enums.ResponseType;
import com.javasm.service.BnovelDetailService;
import com.javasm.service.BnovelListInfoService;
import com.javasm.service.impl.BnovelDetailServiceImpl;
import com.javasm.service.impl.BnovelListInfoServiceImpl;
import com.javasm.util.DataConvert;
import com.javasm.web.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/5/27-10:34
 * @Since:jdk1.8
 * @Description:TODO
 */
@WebServlet("/Blayersearch.do")
public class LayerSearchServlet extends BaseServlet<NovelVO> {
    private BnovelListInfoService bnovelListInfoService = new BnovelListInfoServiceImpl();
    private BnovelDetailService bnovelDetailService = new BnovelDetailServiceImpl();


    //双条件查询 对接NovelVO
    @ResponseTypeAnnotation(responseType = ResponseType.AJAX)
    public Object showNovel(NovelVO novelVO, HttpServletRequest request, HttpServletResponse response) throws IOException {
        //获取页面数据(分页信息和查询条件)
        String nowPage = request.getParameter("nowPage");

        String pageSize = request.getParameter("pageNum");

        String bsortid2=request.getParameter("bsortid1");

        if(bsortid2.equals("s")){


            novelVO.setBsortid(null);
        }else{
            Integer bsortid3=Integer.valueOf(bsortid2);

            novelVO.setBsortid(bsortid3);
        }
        // 调用双条件查询方法
        BpageInfo<NovelVO> bpageInfo = bnovelDetailService.showNovelByPage(nowPage, pageSize, novelVO);

        return bpageInfo;
    }

    @ResponseTypeAnnotation(responseType = ResponseType.AJAX)
    public Object showNovel2(NovelVO novelVO, HttpServletRequest request, HttpServletResponse response) throws IOException {
        //获取页面数据(分页信息和查询条件)
        String nowPage = request.getParameter("nowPage");
        String pageSize = request.getParameter("pageNum");

        String bsortid2=request.getParameter("bsortid1");

      Integer bsortid3=Integer.valueOf(bsortid2);

        novelVO.setBsortid(bsortid3);




        // 调用三条件查询方法
        BpageInfo<NovelVO> bpageInfo = bnovelDetailService.showNovelByPage(nowPage, pageSize, novelVO);

        return bpageInfo;
    }


}