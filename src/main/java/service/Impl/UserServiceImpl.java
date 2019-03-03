package service.Impl;

import common.LimitPageList;
import common.Page;

import dao.UserDao;
import entity.Account;
import entity.OrderResult;
import entity.RoomInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import service.UserService;

import java.text.DateFormat;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDao userDao;

    /*
     * 用户信息展示
     *
     */

    public Account showUserInfo(String username) {

        Account user = userDao.findByUsername(username);
        if(user != null){

            return user;
        }
        System.out.print(3);
        return null;
    }

  //用户预订页面展示

    public List<RoomInfo> getRoomInfoList(){
        List<RoomInfo> roomInfoList=userDao.getRoomInfoAll();
        if( roomInfoList != null){

            return  roomInfoList;
        }
        System.out.print(3);
        return null;
    }


    /**
     * 获取分页记录
     * @param pageNow:当前页码，若为null值，则为1
     * @return 返回page和list集合
     */
    //用户预订结果展示
    public LimitPageList getLimitPageList(Integer pageNow,String username,String keywords) {

        LimitPageList LimitPageStuList = new LimitPageList();
        int totalCount=userDao.getCount(username,keywords);//获取总的记录数


        Page page=null;
        if(pageNow!=null){
            page=new Page(totalCount, pageNow);

        }else {
            page = new Page(totalCount, 1);//初始化pageNow为1
        }
            page.setPageSize(4);

        List<OrderResult> stuList=userDao.findOrderResultByUser(username,page.getStartPos(), page.getPageSize(),keywords);//从startPos开始，获取pageSize条数据



        LimitPageStuList.setPage(page);
        LimitPageStuList.setList(stuList);
        return LimitPageStuList;
    }

    //用户预订


    public synchronized  int orderUser
            (String number,String address,String orderdate, String time,
             String user, String reason, String result)

    {

            SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
            Date date = null;
            try {
                date = format1.parse(orderdate);
            } catch (Exception e) {
                e.printStackTrace();
            }
            java.sql.Date d = new java.sql.Date(date.getTime());

            int count = userDao.getRecordCount(number, d, time);

            int insert_count = 0;
            if (count != 1) {
                insert_count = userDao.insertOrderResultByUser(number, address, d, time, user, reason, result);
            }
            return insert_count;



    }

    //预定结果删除

    public  int deleteOrder(int id){
        int count=userDao.deleteOrder(id);
        return count;
    }



}
