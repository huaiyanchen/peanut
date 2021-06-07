package com.javasm.service.impl;

import com.javasm.bean.BnovelDetailInfo;
import com.javasm.bean.BpageInfo;
import com.javasm.bean.PageInfo;
import com.javasm.bean.vo.NovelVO;
import com.javasm.dao.BnovelDetailInfoDao;
import com.javasm.dao.BnovelListInfoDao;
import com.javasm.dao.impl.BnovelDetailInfoDaoImpl;
import com.javasm.dao.impl.BnovelListInfoDaoImpl;
import com.javasm.service.BnovelDetailService;

import java.util.List;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/5/30-15:59
 * @Since:jdk1.8
 * @Description:TODO
 */
public class BnovelDetailServiceImpl implements BnovelDetailService {
    BnovelDetailInfoDao bnovelDetailInfoDao=new BnovelDetailInfoDaoImpl();

        //新增图书
    @Override
    public Boolean saveBnovelDetailInfo(BnovelDetailInfo bnovelDetailInfo) {
        return bnovelDetailInfoDao.saveBnovelDetailInfo(bnovelDetailInfo);
    }
        //修改图书
    @Override
    public Boolean updateBnovelDetailInfo(Integer bookid, BnovelDetailInfo bnovelDetailInfo) {
        return bnovelDetailInfoDao.updateBnovelDetailInfo(bookid,bnovelDetailInfo);
    }

        //id和书名 二级目录 三条件 查询  分页 限定当前页和每页条数
    @Override
    public BpageInfo<NovelVO> showNovelByPage(String pageStr, String countStr, NovelVO novelVO) {
    //计算双查询条件下的结果总条数
      Integer allCount=bnovelDetailInfoDao.countOfMixedWay(novelVO);

        BpageInfo<NovelVO>bpage=new BpageInfo(pageStr,countStr,allCount);
        List<NovelVO> list = bnovelDetailInfoDao.findNovelDetailByMixedWay(bpage,novelVO);
        bpage.setList(list);
        return bpage;
    }
        //根据id删除图书
    @Override
    public Boolean deleteBnovelDetailInfo(Integer bookid) {
        return bnovelDetailInfoDao.deleteBnovelDetailInfo(bookid);
    }
}
