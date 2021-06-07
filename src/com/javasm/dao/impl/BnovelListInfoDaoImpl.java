package com.javasm.dao.impl;

import com.javasm.bean.BnovelListInfo;
import com.javasm.bean.vo.NovelListVO;
import com.javasm.bean.vo.NovelVO;
import com.javasm.dao.BnovelListInfoDao;
import com.javasm.util.JdbcUtil;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/5/25-20:08
 * @Since:jdk1.8
 * @Description:TODO
 */
public class BnovelListInfoDaoImpl implements BnovelListInfoDao {
    Class<BnovelListInfo> clazz=BnovelListInfo.class;
    @Override
    public List<BnovelListInfo> findAllNovelListInfo() {
        String sql="select * from novellist";
        return JdbcUtil.getAll(sql,clazz);
    }

    @Override
    public boolean saveNovelListInfo(BnovelListInfo bnovelListInfo) {
        String sql="insert into novellist values(null,?,?,?,?)";
        return JdbcUtil.executeUpdate(sql,bnovelListInfo.getBsortid(),bnovelListInfo.getBsortname(),bnovelListInfo.getIsPar(),bnovelListInfo.getPid())>0;
    }

    @Override
    public boolean updateNovelListInfo(BnovelListInfo bnovelListInfo) {
        String sql="update novellist set bsortid=?,bsortname=?,isPar=?,pid=?";
        return JdbcUtil.executeUpdate(sql,bnovelListInfo.getBsortid(),bnovelListInfo.getBsortname(),bnovelListInfo.getIsPar(),bnovelListInfo.getPid())>0;    }

    @Override
    public boolean deleteNovelListInfo(BnovelListInfo bnovelListInfo) {
        String sql="delete from novellist where bsortid=?";
        return JdbcUtil.executeUpdate(sql,bnovelListInfo.getBsortid())>0; }

    //查询一级目录信息
    @Override
    public List<NovelListVO> findNovelListInfoLevelOne() {
        String sql="select bsortname,pid from(select n1.bsortname, n2.pid,n2.bsortname as bsortname1,n2.bsortid from novellist n1 ,novellist n2 where    n1.bsortid=n2.pid\n" +
                ") as novellist";
        return JdbcUtil.getAll(sql,NovelListVO.class);
    }

    @Override
    public List<NovelListVO> findNovelListInfoLevelTwo() {
        String sql="select bsortid,bsortname1 from(select n1.bsortname, n2.pid,n2.bsortname as bsortname1,n2.bsortid from novellist n1 ,novellist n2 where    n1.bsortid=n2.pid\n" +
                ")as novellist";


        return JdbcUtil.getAll(sql,NovelListVO.class);
    }

    @Override
    public List<NovelListVO> findNovelListAll() {
        String sql="select *from novellist";
        return JdbcUtil.getAll(sql,NovelListVO.class);
    }


}
