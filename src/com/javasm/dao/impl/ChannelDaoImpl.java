package com.javasm.dao.impl;


import com.javasm.bean.Channel;
import com.javasm.bean.PageInfo;
import com.javasm.bean.vo.ChannelVO;
import com.javasm.dao.ChannelDao;
import com.javasm.util.JdbcUtil;

import java.util.List;

public class ChannelDaoImpl implements ChannelDao {

    Class<Channel> clazz = Channel.class;

    @Override
    public boolean deletChannel(int id) {
        String sql = "delete from channel where id = ?";
        return JdbcUtil.executeUpdate(sql, id) > 0;
    }

    /**
     * 分页查询
     *
     * @param pageInfo
     * @param channelVO
     * @return
     */
    @Override
    public List<ChannelVO> findChannelPage(PageInfo<ChannelVO> pageInfo, ChannelVO channelVO) {
        StringBuffer sql = new StringBuffer("select c.*,t1.tid as channelOneTypeId, t1.name as channeOneTypeName,t2.tid as channeTwoTypeId,t2.name as channeTwoTypeName" +
                " from channel as c,channeltype as t1, channeltype as t2" +
                " where t1.tid = t2.pid and c.typetwoid = t2.tid ");
        if (channelVO != null) {
            if (channelVO.getChannelOneTypeId() != null && channelVO.getChannelOneTypeId() > 0) {
                sql.append(" and t2.tid in (select tid from channeltype where pid = " + channelVO.getChannelOneTypeId() + ")");
            }
            if (channelVO.getTypetwoid() != null && channelVO.getTypetwoid() > 0) {
                sql.append(" and t2.tid = " + channelVO.getTypetwoid());
            }
            if (channelVO.getChannelnum() != null && channelVO.getChannelnum() > 0) {
                sql.append(" and c.channelnum = " + channelVO.getChannelnum());
            }
            if (channelVO.getProductname() != null && !"".equals(channelVO.getProductname())) {
                sql.append(" and c.productname like '%" + channelVO.getProductname() + "%'");
            }

        }
        sql.append("limit ?,?");
        return JdbcUtil.getAll(sql.toString(), ChannelVO.class, pageInfo.getStartIndex(), pageInfo.getCount());
    }

    /**
     * 统计数量
     *
     * @param channelVO 查找条件
     * @return 数量
     */
    @Override
    public Integer countFind(ChannelVO channelVO) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(1) from channel where 1=1");
        if (channelVO != null) {
            if (channelVO.getChannelOneTypeId() != null && channelVO.getChannelOneTypeId() > 0) {
                sql.append(" and t2.tid in (select tid from channeltype where pid = " + channelVO.getChannelOneTypeId() + ")");
            }
            if (channelVO.getTypetwoid() != null && channelVO.getTypetwoid() > 0) {
                sql.append(" and t2.tid = " + channelVO.getTypetwoid());
            }
            if (channelVO.getProductname() != null && !"".equals(channelVO.getProductname())) {
                sql.append(" and c.productname like '%" + channelVO.getProductname() + "%'");
            }
            if (channelVO.getChannelnum() != null && channelVO.getChannelnum() > 0) {
                sql.append(" and c.channelnum = " + channelVO.getChannelnum());
            }
        }
        Integer count = JdbcUtil.getCount(sql.toString());
        return count;
    }
}
