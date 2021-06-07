package com.javasm.service;

import com.javasm.bean.BnovelDetailInfo;
import com.javasm.bean.BnovelListInfo;
import com.javasm.bean.BpageInfo;
import com.javasm.bean.PageInfo;
import com.javasm.bean.vo.BookVo;
import com.javasm.bean.vo.NovelListVO;
import com.javasm.bean.vo.NovelVO;
import com.javasm.dao.BnovelDetailInfoDao;
import com.javasm.dao.BnovelListInfoDao;
import com.javasm.dao.impl.BnovelDetailInfoDaoImpl;
import com.javasm.dao.impl.BnovelListInfoDaoImpl;
import com.javasm.service.impl.BnovelDetailServiceImpl;
import com.javasm.service.impl.BnovelListInfoServiceImpl;
import org.apache.commons.io.input.CountingInputStream;

import java.awt.*;
import java.awt.print.Book;
import java.util.List;
import java.util.Scanner;

/**
 * @Author：戈李阳
 * @Version：1.0
 * @Date：2021/5/28-11:40
 * @Since:jdk1.8
 * @Description:TODO
 */
public class BnovelDetailInfoTest {
    public static void main(String[] args) {


//id和书名双条件查询 id精准，书名模糊查询
//        BnovelDetailInfoDao bnovelDetailInfoDao=new BnovelDetailInfoDaoImpl();
////        Scanner scanner=new Scanner(System.in);
////        System.out.println("请输入bookid");
////          Integer bookid=scanner.nextInt();
////
////        System.out.println("请输入bookname");
////        String bookname=scanner.next();
//                   NovelVO novelVO=new NovelVO();
//        novelVO.setBookid("");
//        novelVO.setBookName("校");
//
//         Integer allCount=bnovelDetailInfoDao.countOfMixedWay(novelVO);
//         BnovelDetailService bnovelDetailService=new BnovelDetailServiceImpl();
//        System.out.println(allCount);
//
//         String pageStr="1";
//         String countStr="5";
//        BpageInfo<NovelVO>bpage=new BpageInfo(pageStr,countStr,allCount);
//
//        BpageInfo<NovelVO>bpageInfo= new BpageInfo<>(pageStr,countStr,allCount);
//        List<NovelVO>list=bnovelDetailInfoDao.findNovelDetailByMixedWay(bpageInfo,novelVO);
//         bpageInfo.setList(list);
//          for(NovelVO bpage1:list){
//              System.out.println(bpage1.toString());
//          }

//        List<BnovelDetailInfo>list= bnovelDetailInfoDao.findNovelDetailByBookName(bookname);
//
//        for(BnovelDetailInfo bpage1:list){
//         System.out.println(bpage1.toString());
//          }

//      增 改
//BnovelDetailInfo bnovelDetailInfo=new BnovelDetailInfo();
//
//        System.out.println("请输入bookid");
//      Integer bookid1=scanner.nextInt();
//
//
//        System.out.println("bookpartner");
//        String bookpartner=scanner.next();
//        bnovelDetailInfo.setBookpartner(bookpartner);
//
//        System.out.println("bookid");
//        Integer bookid=scanner.nextInt();
//        bnovelDetailInfo.setBookid(bookid);
//
//        System.out.println("bookName");
//        String bookName=scanner.next();
//        bnovelDetailInfo.setBookName(bookName);
//
//        System.out.println("bstatus");
//        Integer bstatus=scanner.nextInt();
//        bnovelDetailInfo.setBstatus(bstatus);
//
//        System.out.println("bwordCount");
//        String bwordCount=scanner.next();
//        bnovelDetailInfo.setBwordCount(bwordCount);
//
//        System.out.println("bdescription");
//        String bdescription=scanner.next();
//        bnovelDetailInfo.setBdescription(bdescription);
//
//        System.out.println("bcoverUrl");
//        String bcoverUrl=scanner.next();
//        bnovelDetailInfo.setBcoverUrl(bcoverUrl);
//
//        System.out.println("bauthorName");
//        String bauthorName=scanner.next();
//        bnovelDetailInfo.setBauthorName(bauthorName);
//
//        System.out.println("blastupdatechaptername");
//        String blastupdatechaptername=scanner.next();
//        bnovelDetailInfo.setBlastupdatechaptername(blastupdatechaptername);
//
//
//        System.out.println("blastupdatechapterid");
//        Integer blastupdatechapterid=scanner.nextInt();
//        bnovelDetailInfo.setBlastupdatechapterid(blastupdatechapterid);
//
//        System.out.println("bprice");
//        double bprice=scanner.nextDouble();
//        bnovelDetailInfo.setBprice(bprice);
//
//        System.out.println("bpeanutprice");
//        double bpeanutprice=scanner.nextDouble();
//        bnovelDetailInfo.setBpeanutprice(bpeanutprice);
//
//        System.out.println("bisvip");
//        Integer bisvip=scanner.nextInt();
//        bnovelDetailInfo.setBisvip(bisvip);
//
//        System.out.println("battribution");
//        Integer battribution=scanner.nextInt();
//        bnovelDetailInfo.setBattribution(battribution);
//
//        System.out.println("bsortid");
//        Integer bsortid=scanner.nextInt();
//        bnovelDetailInfo.setBsortid(bsortid);
//
//        System.out.println("pid");
//        Integer pid=scanner.nextInt();
//        bnovelDetailInfo.setPid(pid);
//
//        System.out.println("bkeyword");
//        String bkeyword=scanner.next();
//        bnovelDetailInfo.setBkeyword(bkeyword);
//
//        System.out.println("bisRecommand");
//        Integer bisRecommand=scanner.nextInt();
//        bnovelDetailInfo.setBisRecommand(bisRecommand);
//
////            String bookpartner=scanner.next();
////            Integer bookid=scanner.nextInt();
////            String bookName=scanner.next();
////            Integer bstatus=scanner.nextInt();
////            String bwordCount=scanner.next();
////            String bdescription=scanner.next();
////            String bcoverUrl=scanner.next();
////            String bauthorName=scanner.next();
////            String blastupdatechaptername=scanner.next();
////            Integer blastupdatechapterid=scanner.nextInt();
////            double bprice=scanner.nextDouble();
////            double bpeanutprice=scanner.nextDouble();
////            Integer bisvip=scanner.nextInt();
////            Integer battribution=scanner.nextInt();
////            Integer bsortid=scanner.nextInt();
////            Integer pid=scanner.nextInt();
////            String bkeyword=scanner.next();
////            Integer bisRecommand=scanner.nextInt();
//
//        boolean b=bnovelDetailInfoDao.updateBnovelDetailInfo(bookid1,bnovelDetailInfo);
//     if(b){
//         System.out.println("成功");
//     }

//        BnovelListInfoDao bnovelListInfoDao=new BnovelListInfoDaoImpl();
//        List<NovelListVO>list  = bnovelListInfoDao.findNovelListAll();
//
//
//        for(NovelListVO bpage1:list){
//         System.out.println(bpage1.toString());
//          }
//        Scanner scanner=new Scanner(System.in);
//        System.out.println("请输入Id");
//        Integer scannner1=scanner.nextInt();
//        BnovelDetailService bnovelDetailService = new BnovelDetailServiceImpl();
//        BnovelDetailInfoDao bnovelDetailInfoDao=new BnovelDetailInfoDaoImpl();
//
//
//        List<BnovelDetailInfo> list = bnovelDetailInfoDao.findNovelDetailByBookId(scannner1);
//        for (BnovelDetailInfo bnovelDetailInfo : list) {
//            System.out.println(bnovelDetailInfo.toString());
//        }

//  BnovelListInfoService bnovelListInfoService=new BnovelListInfoServiceImpl();
//        List<NovelListVO> list= bnovelListInfoService.findNovelListInfoLevelTwo();
//        for (NovelListVO bnovelDetailInfo : list) {
//            System.out.println(bnovelDetailInfo.toString());
//        }
    }
}
