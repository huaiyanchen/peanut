package com.javasm.dao.impl;

import com.javasm.bean.BnovelDetailInfo;
import com.javasm.bean.BpageInfo;
import com.javasm.bean.PageInfo;
import com.javasm.bean.vo.BookVo;
import com.javasm.bean.vo.NovelListVO;
import com.javasm.bean.vo.NovelVO;
import com.javasm.dao.BnovelDetailInfoDao;
import com.javasm.dao.BnovelListInfoDao;
import com.javasm.service.BnovelListInfoService;
import com.javasm.service.impl.BnovelListInfoServiceImpl;
import com.javasm.util.JdbcUtil;

import java.util.List;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/5/28-11:12
 * @Since:jdk1.8
 * @Description:TODO
 */
public class BnovelDetailInfoDaoImpl implements BnovelDetailInfoDao {
    Class<BnovelDetailInfo>clazz=BnovelDetailInfo.class;

    @Override
    public List<BnovelDetailInfoDao> findNovelDetailByPage(BpageInfo<BnovelDetailInfoDao> bpage, BnovelDetailInfo bnovelDetailInfo) {

        return null;
    }
    //通过小说书号 bookid查询书籍信息 完成
    @Override
    public List<BnovelDetailInfo> findNovelDetailByBookId(Integer bookid) {
        String sql="select *from noveldetail where bookid=?";
        return JdbcUtil.getAll(sql,clazz,bookid);
    }

    //通过小说书名bookname 查询书籍信息 模糊查询 完成
    @Override
    public List<BnovelDetailInfo> findNovelDetailByBookName(String bookname) {
        StringBuffer sql=new StringBuffer("select *from noveldetail where 1=1 ");
        sql.append("and bookname like '%"+ bookname +"%'");
        return JdbcUtil.getAll(sql.toString(),clazz);
    }
    //通过小说类型id查询书籍信息 bsortid   bsortid 尾数数字 可区分一级和二级目录
    @Override
    public List<BnovelDetailInfo> findNovelDetailByBsortId(Integer bsortid,BpageInfo<BnovelDetailInfo>bpage) {
        String sql="select *from noveldetail where bsortid=? limit ?,?";
        return JdbcUtil.getAll(sql,clazz,bsortid,bpage.getStartIndex(),bpage.getCount());
    }
    //计算按类型id查的 分页总条数 完成
    @Override
    public Integer countByBsortId(Integer bsortid) {
        String sql="select count(*) from noveldetail where bsortid=?";
        return JdbcUtil.getCount(sql,bsortid);
    }
    //删除图书信息 完成
    @Override
    public Boolean deleteBnovelDetailInfo(Integer bookid) {
        String sql="delete from noveldetail where bookid=?";
        return JdbcUtil.executeUpdate(sql,bookid)>0;
    }
    //新增图书信息  完成
    @Override
    public Boolean saveBnovelDetailInfo(BnovelDetailInfo bnovelDetailInfo) {
        String sql="insert into noveldetail values(null,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
       BnovelDetailInfoDaoImpl  bnovelDetailInfoDaoImpl=new BnovelDetailInfoDaoImpl();
       NovelListVO novelListVO=new NovelListVO();

         List<NovelListVO>list=  bnovelDetailInfoDaoImpl.findBnovelListTwoByOne(bnovelDetailInfo.getBsortid());
        for(NovelListVO novelListVO1:list){
           Integer pid1 = novelListVO1.getPid();
            bnovelDetailInfo.setPid(pid1);
        }
        return JdbcUtil.executeUpdate(sql,bnovelDetailInfo.getBookpartner(),bnovelDetailInfo.getBookid(),bnovelDetailInfo.getBookName(),bnovelDetailInfo.getBstatus(),bnovelDetailInfo.getBwordCount(),bnovelDetailInfo.getBdescription(),bnovelDetailInfo.getBcoverUrl(),bnovelDetailInfo.getBauthorName(),bnovelDetailInfo.getBlastupdatechaptername(),bnovelDetailInfo.getBlastupdatechapterid(),bnovelDetailInfo.getBprice(),bnovelDetailInfo.getBpeanutprice(),bnovelDetailInfo.getBisvip(),bnovelDetailInfo.getBattribution(),bnovelDetailInfo.getBsortid(),bnovelDetailInfo.getPid(),bnovelDetailInfo.getBkeyword(),bnovelDetailInfo.getBisRecommand())>0;
    }

    //根据二级目录查一级目录
    @Override
    public List<NovelListVO> findBnovelListTwoByOne(Integer  bsortid1) {
        String sql="select * from novellist where bsortid=?";
        return JdbcUtil.getAll(sql,NovelListVO.class,bsortid1);
    }

    //修改图书信息  完成
    @Override
    public Boolean updateBnovelDetailInfo(Integer bookid,BnovelDetailInfo bnovelDetailInfo) {
        BnovelDetailInfoDaoImpl  bnovelDetailInfoDaoImpl=new BnovelDetailInfoDaoImpl();
        NovelListVO novelListVO=new NovelListVO();

        List<NovelListVO>list=  bnovelDetailInfoDaoImpl.findBnovelListTwoByOne(bnovelDetailInfo.getBsortid());
        for(NovelListVO novelListVO1:list){
            Integer pid1 = novelListVO1.getPid();
            bnovelDetailInfo.setPid(pid1);
        }
        String sql="update noveldetail set bookpartner=?,bookid=?,bookName=?,bstatus=?,bwordCount=?,bdescription=?,bcoverUrl=?,bauthorName=?,blastupdatechaptername=?,blastupdatechapterid=?,bprice=?,bpeanutprice=?,bisvip=?,battribution=?,bsortid=?,pid=?,bkeyword=?,bisRecommand=? where bookid=?";
        return JdbcUtil.executeUpdate(sql,bnovelDetailInfo.getBookpartner(),bnovelDetailInfo.getBookid(),bnovelDetailInfo.getBookName(),bnovelDetailInfo.getBstatus(),bnovelDetailInfo.getBwordCount(),bnovelDetailInfo.getBdescription(),bnovelDetailInfo.getBcoverUrl(),bnovelDetailInfo.getBauthorName(),bnovelDetailInfo.getBlastupdatechaptername(),bnovelDetailInfo.getBlastupdatechapterid(),bnovelDetailInfo.getBprice(),bnovelDetailInfo.getBpeanutprice(),bnovelDetailInfo.getBisvip(),bnovelDetailInfo.getBattribution(),bnovelDetailInfo.getBsortid(),bnovelDetailInfo.getPid(),bnovelDetailInfo.getBkeyword(),bnovelDetailInfo.getBisRecommand(),bookid)>0;
    }

    @Override
    public Integer countByBookname(String bookname) {
        StringBuffer sql=new StringBuffer("select count(*) from noveldetail where 1=1 ");
        sql.append("and bookname like '%"+ bookname +"%' ");
        return JdbcUtil.getCount(sql.toString(),bookname);

    }
    //已完成
    @Override
    public List<NovelVO> findNovelDetailByMixedWay(BpageInfo<NovelVO>bpage,NovelVO novelVO) {
  StringBuffer sql=new StringBuffer("select *from (select n1.bsortname, n2.pid,n2.bsortname as bsortname1,n2.bsortid,bauthorName,bookName,bstatus,bookid from novellist n1,noveldetail ,novellist n2 where n2.bsortid=noveldetail.bsortid and n1.bsortid=n2.pid) as novel where 1=1 ");
  if(novelVO!=null){
      if(novelVO.getBookName()!=null&&!"".equals(novelVO.getBookName())){
          sql.append("and bookname like  '%"+ novelVO.getBookName() +"%'" );
      }
          if(novelVO.getBookid()!=null){
          sql.append("and bookid like  '%"+ novelVO.getBookid() +"%'");
          }
      if(novelVO.getBsortid()!=null){
          sql.append("and bsortid like  '%"+ novelVO.getBsortid() +"%'");
          System.out.println(novelVO.getBsortid());
      }
           sql.append("limit ?,?");
  }

        return JdbcUtil.getAll(sql.toString(),NovelVO.class,bpage.getStartIndex(),bpage.getCount());
    }
    //已完成
    @Override
    public Integer countOfMixedWay(NovelVO novelVO) {
        StringBuffer sql=new StringBuffer("select count(*) from(select n1.bsortname, n2.pid,n2.bsortname as bosortname1,n2.bsortid,bauthorName,bookName,bstatus,bookid from novellist n1,noveldetail ,novellist n2 where n2.bsortid=noveldetail.bsortid and  n1.bsortid=n2.pid )as novel where 1=1 ");
        if(novelVO!=null){
            if(novelVO.getBookName()!=null&&!"".equals(novelVO.getBookName())){
                sql.append("and bookname like  '%"+ novelVO.getBookName() +"%'" );
            }
            if(novelVO.getBookid()!=null){
                sql.append("and bookid like  '%"+ novelVO.getBookid() +"%'");
            }
            if(novelVO.getBsortid()!=null){
                sql.append("and bsortid like  '%"+ novelVO.getBsortid() +"%'");
            }
        }return JdbcUtil.getCount(sql.toString());
    }
}
