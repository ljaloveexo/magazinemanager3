package service.Impl;

import common.LimitPageList;
import common.Page;
import dao.AdminDao;
import entity.OrderOperation;
import entity.OrderResult;
import entity.RoomInfo;
import service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * Created by isus on 2019/2/20.
 */

@Service
public class AdminServiceImpl implements AdminService{
    @Autowired
    private AdminDao adminDao;
    private Page page;





    /**
     * 获取分页记录
     * @param pageNow:当前页码，若为null值，则为1
     * @return 返回page和list集合
     */


    public Page getRoomInfoLimitPage(Integer pageNow,String keywords) {


        int totalCount=adminDao.getRoomInfoCount(keywords);
        System.out.println(totalCount);


        if(pageNow!=null){
            page=new Page(totalCount, pageNow);

        }else {
            page = new Page(totalCount, 1);//初始化pageNow为1
        }
        page.setPageSize(10);


        return page;
    }

    public Page getOrderOperationLimitPage(Integer pageNow,String keywords) {


        int totalCount=adminDao.getOrderOperationCount(keywords);

        System.out.println(totalCount);

        if(pageNow!=null){
            page=new Page(totalCount, pageNow);

        }else {
            page = new Page(totalCount, 1);//初始化pageNow为1
        }
        page.setPageSize(4);


        return page;
    }

    public Page getOrderRecordLimitPage(Integer pageNow,String keywords) {
        System.out.println(23);
        int totalCount=adminDao.getOrderRecordListCount(keywords);
        System.out.println(totalCount);
        if(pageNow!=null){
            page=new Page(totalCount, pageNow);

        }else {
            page = new Page(totalCount, 1);//初始化pageNow为1

            System.out.println(page);
        }
        page.setPageSize(4);


        return page;
    }



    public Page getAccountLimitPage(Integer pageNow,String keywords,String type) {
        System.out.println(21);
        int totalCount=adminDao.getAccountInfoListCount(keywords,type);
        System.out.println(totalCount);
        if(pageNow!=null){
            page=new Page(totalCount, pageNow);

        }else {
            page = new Page(totalCount, 1);//初始化pageNow为1

            System.out.println(page);
        }
        page.setPageSize(10);


        return page;
    }



    public LimitPageList getLimitPage(Page page,List stuList){

        LimitPageList LimitPageStuList = new LimitPageList();
        LimitPageStuList.setPage(page);
        LimitPageStuList.setList(stuList);
        return LimitPageStuList;
    }

    //教室信息分页查询
    public LimitPageList getRoomInfoList(Integer pageNow,String keywords){
        Page page=getRoomInfoLimitPage(pageNow,keywords);
        List<RoomInfo> stuList=adminDao.getRoomInfoList(page.getStartPos(), page.getPageSize(),keywords);//从startPos开始，获取pageSize条数据
        System.out.println(stuList.get(0));
        LimitPageList LimitPageStuList=getLimitPage(page,stuList);
        return LimitPageStuList;
    }

    //预订操作分页显示

    public LimitPageList getOrderOperationList(Integer pageNow,String keywords){
        Page page=getOrderOperationLimitPage(pageNow,keywords);
        List<OrderOperation> stuList= adminDao.getOrderOperationList(page.getStartPos(), page.getPageSize(), keywords);//从startPos开始，获取pageSize条数据
        System.out.println(stuList.get(0));
        LimitPageList LimitPageStuList=getLimitPage(page,stuList);
        return LimitPageStuList;
    }





    //预订操作处理

    public synchronized int insertRecordInfo( String id,String result){
        int count=adminDao.insertRecordInfo(id,result);
        return count;
    }


    //预订结果分页显示
    public LimitPageList getOrderRecordList(Integer pageNow,String keywords){

        Page page= getOrderRecordLimitPage(pageNow,keywords);
        List<OrderOperation> stuList=adminDao.getOrderOperationList(page.getStartPos(), page.getPageSize(),keywords);//从startPos开始，获取pageSize条数据
        System.out.println(stuList.get(0));
        LimitPageList LimitPageStuList=getLimitPage(page,stuList);
        return LimitPageStuList;

    }



    //用户信息页面展示

    public LimitPageList getAccountInfoList(Integer pageNow,String keywords,String type){
        page=getAccountLimitPage(pageNow,keywords,type);
        System.out.println(page.getStartPos());
        List<HashMap<String,String>> stuList= adminDao.getAccountInfoList(page.getStartPos(), page.getPageSize(),keywords,type);//从startPos开始，获取pageSize条数据

        LimitPageList LimitPageStuList=getLimitPage(page,stuList);
        return LimitPageStuList;
    }



    //教室信息添加

    public int insertRoomInfo(String number,String address,Integer capacity,String configuration){

        int count=adminDao.insertRoomInfo(number,address,capacity,configuration);
        return count;
    }



}
