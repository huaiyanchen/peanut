package com.javasm.service.impl;

import com.javasm.bean.BnovelListInfo;
import com.javasm.bean.vo.MenuVO;
import com.javasm.bean.vo.NovelListVO;
import com.javasm.dao.BnovelListInfoDao;
import com.javasm.dao.impl.BnovelListInfoDaoImpl;
import com.javasm.service.BnovelListInfoService;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/5/27-10:51
 * @Since:jdk1.8
 * @Description:TODO
 */
public class BnovelListInfoServiceImpl implements BnovelListInfoService {
    BnovelListInfoDao bnovelListInfoDao=new BnovelListInfoDaoImpl();

    @Override
    public List<BnovelListInfo> findAllNovelListInfo() {
        return bnovelListInfoDao.findAllNovelListInfo();
    }

    @Override
    public boolean saveNovelListInfo(BnovelListInfo bnovelListInfo) {
        return bnovelListInfoDao.saveNovelListInfo(bnovelListInfo);
    }

    @Override
    public boolean updateNovelListInfo(BnovelListInfo bnovelListInfo) {
        return bnovelListInfoDao.updateNovelListInfo(bnovelListInfo);
    }

    @Override
    public boolean deleteNovelListInfo(BnovelListInfo bnovelListInfo) {
        return bnovelListInfoDao.deleteNovelListInfo(bnovelListInfo);
    }

    @Override
    public List<NovelListVO> findNovelListInfoLevelOne() {
        return null;
    }

    //书籍类型级联数据处理
    @Override
    public List<NovelListVO> findNovelListInfoLevelTwo() {

        List<NovelListVO>list= bnovelListInfoDao.findNovelListAll();

        List<NovelListVO> list2 = new ArrayList<>();
        for (NovelListVO novelListVO :  list) {
            //fu
            if (novelListVO.getPid().equals(0)) {
                //children
                List<NovelListVO> children = new ArrayList<>();
                for (NovelListVO vo : list) {
                    if (novelListVO.getBsortid().equals(vo.getPid())) {
                        children.add(vo);
                    }
                }
                novelListVO.setChildren(children);
                list2.add(novelListVO);
            }
        }
        return list2;
    }

    @Override
    public List<NovelListVO> findNovelListAll() {
        return bnovelListInfoDao.findNovelListAll();
    }
}
