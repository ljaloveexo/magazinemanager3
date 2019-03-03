package dao;

import entity.Account;
import entity.OrderResult;
import entity.RoomInfo;
import org.apache.ibatis.annotations.Param;

import java.sql.Date;
import java.util.List;


public interface UserDao {


    /**
     * 查找用户名和密码
     * @param username 登录用户名
     * @return
     */
    Account findByUsername(String username);
    List<OrderResult> findOrderResultByUser(@Param("username") String username,@Param(value = "startPos") Integer startPos,
                                            @Param(value = "pageSize") Integer pageSize,
                                            @Param(value = "keywords") String keywords);
    int getCount(@Param(value = "username") String username,
                 @Param(value = "keywords") String keywords);
    List<RoomInfo> getRoomInfoAll();
    int insertOrderResultByUser(@Param("number") String number,
                                              @Param("address") String address,
                                              @Param("orderdate") Date orderdate,
                                              @Param("time") String time,
                                              @Param("user") String user,
                                              @Param("reason") String reason,
                                              @Param("result") String result);
    int getRecordCount(@Param("number") String number,
                 @Param("orderdate") Date orderdate,
                 @Param("time") String time);


    int deleteOrder(@Param("id") int id);



}