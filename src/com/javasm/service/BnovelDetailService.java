package com.javasm.service;

import com.javasm.bean.BnovelDetailInfo;
import com.javasm.bean.BpageInfo;
import com.javasm.bean.PageInfo;
import com.javasm.bean.vo.NovelVO;

import java.util.List;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/5/30-15:57
 * @Since:jdk1.8
 * @Description:TODO
 */
public interface BnovelDetailService {
    //增加图书信息
    Boolean saveBnovelDetailInfo(BnovelDetailInfo bnovelDetailInfo);

    //修改图书信息
    Boolean updateBnovelDetailInfo(Integer bookid,BnovelDetailInfo bnovelDetailInfo);

    //根据书籍id和名称 二级目录 三条件模糊查询 加分页
    BpageInfo<NovelVO> showNovelByPage (String pageStr, String countStr, NovelVO novelVO);

    //删除图书信息
    Boolean deleteBnovelDetailInfo(Integer bookid);
}
