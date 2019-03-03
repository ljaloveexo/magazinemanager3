package service;


import common.LimitPageList;
import entity.Account;
import entity.OrderResult;
import entity.RoomInfo;

import java.util.List;
import java.util.Random;

//Service层接口
public interface UserService {

    //检验用户登录
    Account showUserInfo(String username);
//    List<OrderResult> orderResultUser(String username);
    LimitPageList getLimitPageList(Integer pageNow, String username,String keywords);
    List<RoomInfo> getRoomInfoList();
    int  orderUser(String number,String address,String orderdate, String time, String user, String reason, String result);
    int deleteOrder(int id);
}
