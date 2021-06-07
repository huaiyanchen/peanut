package com.javasm.dao;

import com.javasm.bean.BnovelDetailInfo;
import com.javasm.bean.BpageInfo;
import com.javasm.bean.PageInfo;
import com.javasm.bean.vo.BookVo;
import com.javasm.bean.vo.NovelListVO;
import com.javasm.bean.vo.NovelVO;

import java.util.List;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/5/28-10:50
 * @Since:jdk1.8
 * @Description:TODO
 */
public interface BnovelDetailInfoDao {

    //分页查询
    List<BnovelDetailInfoDao> findNovelDetailByPage(BpageInfo<BnovelDetailInfoDao> bpage, BnovelDetailInfo bnovelDetailInfo);

    //通过小说书号 bookid查询书籍信息 已完成
    List<BnovelDetailInfo> findNovelDetailByBookId(Integer bookid);

    //通过小说书名bookname 查询书籍信息 模糊查询 已完成
     List<BnovelDetailInfo> findNovelDetailByBookName(String bookname);

    //通过小说类型id查询书籍信息 bsortid   bsortid 尾数数字 可区分一级和二级目录
    List<BnovelDetailInfo> findNovelDetailByBsortId(Integer bsortid,BpageInfo<BnovelDetailInfo>bpage);

    //统计 按类型id查询书籍数量 总条数 完成
    Integer countByBsortId(Integer bsortid);

    //删除图书 完成
    Boolean deleteBnovelDetailInfo(Integer bookid);

    //增加图书 完成
    Boolean saveBnovelDetailInfo(BnovelDetailInfo bnovelDetailInfo);

    //修改图书 完成
    Boolean updateBnovelDetailInfo(Integer bookid,BnovelDetailInfo bnovelDetailInfo);

    //统计 按书名模糊查询书籍数量 总条数 完成
    Integer countByBookname(String bookname);

    //根据书籍id和名称双条件模糊查询 加分页
    List<NovelVO> findNovelDetailByMixedWay(BpageInfo<NovelVO>bpage,NovelVO novelVO);

    //根据书籍id和名称 和二级目录查询 三条件模糊查询 统计总条数
    Integer countOfMixedWay(NovelVO novelVO);

    List<NovelListVO> findBnovelListTwoByOne(Integer  bsortid1);

}
