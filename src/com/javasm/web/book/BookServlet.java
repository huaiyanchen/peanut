package com.javasm.web.book;

import com.javasm.annotation.ResponseTypeAnnotation;
import com.javasm.bean.BookInfo;
import com.javasm.bean.BookType;
import com.javasm.bean.PageInfo;
import com.javasm.bean.vo.BookInfoVO;
import com.javasm.service.BookInfoService;
import com.javasm.service.BookTypeService;
import com.javasm.service.impl.BookInfoServiceImpl;
import com.javasm.service.impl.BookTypeServiceImpl;
import com.javasm.web.BaseServlet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet("/bookInfo.do")
public class BookServlet extends BaseServlet<BookInfo> {
    private BookInfoService bookInfoService = new BookInfoServiceImpl();
    private BookTypeService bookTypeService = new BookTypeServiceImpl();

    @ResponseTypeAnnotation
    public Object showBook(BookInfo bookInfo, HttpServletRequest request, HttpServletResponse response){
        //获取前端数据
        String pageSize = request.getParameter("pageNum");
        String currentPage = request.getParameter("nowPage");

        //接受书籍父类id 的值 :bookOneTypeId
        String bookOneTypeId = request.getParameter("bookOneTypeId");
        //创建VO表对象
        BookInfoVO bookInfoVO = new BookInfoVO();
        //父类类型id
        bookInfoVO.setBookOneTypeId(Integer.valueOf(bookOneTypeId));
        //书名
        bookInfoVO.setBookName(bookInfo.getBookName());
        //二级类型id
        bookInfoVO.setBookTypeId(bookInfo.getBookTypeId());
        //书籍id
        bookInfoVO.setBookId(bookInfo.getBookId());

        PageInfo<BookInfoVO> bookPage = bookInfoService.findBookPage(currentPage, pageSize, bookInfoVO);
//        String massage = JSONObject.toJSONString(bookPage);
        return bookPage;
    }

    @ResponseTypeAnnotation
    public Object updateBook(BookInfo bookInfo, HttpServletRequest request, HttpServletResponse response) {
        //获取前端数据
        boolean flag = bookInfoService.updateBook(bookInfo);

        String message = flag ? "修改成功" : "修改失败";
        System.out.println(message);
        return message;

    }

    @ResponseTypeAnnotation
    public Object showType(BookInfo bookInfo,HttpServletRequest request, HttpServletResponse response){
        String flagParent = request.getParameter("flagParent");
        String parentTypeId = request.getParameter("parentTypeId");

        BookType bookType = new BookType();
        bookType.setFlagParent(Integer.valueOf(flagParent));
        bookType.setParentTypeId(Integer.valueOf(parentTypeId));

        List<BookType> typeList = bookTypeService.findType(bookType);

//        String massage = JSONObject.toJSONString(typeList);
        return typeList;
    }
}