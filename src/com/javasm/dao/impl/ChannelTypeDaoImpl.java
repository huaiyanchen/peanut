package com.javasm.dao.impl;

import com.javasm.bean.ChannelType;
import com.javasm.bean.PageInfo;
import com.javasm.dao.ChannelTypeDao;
import com.javasm.util.JdbcUtil;

import java.util.List;

public class ChannelTypeDaoImpl implements ChannelTypeDao {

        Class<ChannelType> channelTypeClass = ChannelType.class;

    @Override
    public List<ChannelType> findType(ChannelType channelType) {
        StringBuffer sql = new StringBuffer("select * from channeltype where 1 = 1 ");

        if (channelType != null) {
            if (channelType.getIsparent() != null) {
                sql.append(" and isparent =" + channelType.getIsparent());
            }
            if (channelType.getPid() != null && channelType.getPid() > 0) {
                sql.append(" and pid = " + channelType.getPid());
            }
        }
        return JdbcUtil.getAll(sql.toString(), ChannelType.class);
    }

    @Override
    public List<ChannelType> findChannelTypePage(PageInfo<ChannelType> pageInfo) {
        String sql = "select * from channeltype limit ?,?";
        return JdbcUtil.getAll(sql,channelTypeClass,pageInfo.getStartIndex(),pageInfo.getCount());
    }

    @Override
    public Integer count() {
        String sql ="select count(1) from channeltype";
        return JdbcUtil.getCount(sql);
    }

    @Override
    public boolean addChannelType(ChannelType channelType) {
        if (channelType.getPid()==0){
            channelType.setIsparent(1);
        }else {
            channelType.setIsparent(0);
        }
        String sql ="insert into channeltype values (null,?,?,?,?,NOW(),?)";
        return JdbcUtil.executeUpdate(sql,channelType.getName(),channelType.getPid(),channelType.getSort(),channelType.getDescription(),channelType.getIsparent())>0;
    }

    @Override
    public boolean updateChannelType(ChannelType channelType) {
        if (channelType.getPid()==0){
            channelType.setIsparent(1);
        }else {
            channelType.setIsparent(0);
        }
        String sql="update channeltype set name=?,pid=?,sort=?,description=?,isparent=? where tid=?";
        return JdbcUtil.executeUpdate(sql,channelType.getName(),channelType.getPid(),channelType.getSort(),channelType.getDescription(),channelType.getIsparent(),channelType.getTid())>0;
    }

    @Override
    public boolean deleteChannelType(int tid) {
        String sql = "delete from channeltype where tid = ?";
        return JdbcUtil.executeUpdate(sql,tid)>0;
    }


}
