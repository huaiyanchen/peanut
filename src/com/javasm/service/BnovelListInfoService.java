package com.javasm.service;

import com.javasm.bean.BnovelListInfo;
import com.javasm.bean.vo.NovelListVO;

import java.util.List;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/5/27-10:49
 * @Since:jdk1.8
 * @Description:TODO
 */
public interface BnovelListInfoService {
    //查询全部目录
    List<BnovelListInfo> findAllNovelListInfo();

    //添加目录信息
    boolean saveNovelListInfo(BnovelListInfo bnovelListInfo);
    //修改目录信息
    boolean updateNovelListInfo(BnovelListInfo bnovelListInfo);

    //删除目录信息
    boolean deleteNovelListInfo(BnovelListInfo bnovelListInfo);


    //查询一级目录
    List<NovelListVO> findNovelListInfoLevelOne();

    //查询二级目录
    List<NovelListVO> findNovelListInfoLevelTwo();

    //连表查询一二级目录关联信息
    List<NovelListVO> findNovelListAll();

}
