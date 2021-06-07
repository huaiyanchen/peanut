package com.javasm.dao;

import com.javasm.bean.BnovelListInfo;
import com.javasm.bean.vo.NovelListVO;

import java.util.List;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/5/25-18:48
 * @Since:jdk1.8
 * @Description:TODO
 */
public interface BnovelListInfoDao {
    //查询全部目录
    List<BnovelListInfo> findAllNovelListInfo();

    //添加二级目录信息
    boolean saveNovelListInfo(BnovelListInfo bnovelListInfo);
    //修改二级目录信息
    boolean updateNovelListInfo(BnovelListInfo bnovelListInfo);

    //删除二级目录信息
    boolean deleteNovelListInfo(BnovelListInfo bnovelListInfo);


    //查询一级目录
    List<NovelListVO> findNovelListInfoLevelOne();

    //根据一级目录id查询二级目录
    List<NovelListVO> findNovelListInfoLevelTwo();

    List<NovelListVO> findNovelListAll();


}
