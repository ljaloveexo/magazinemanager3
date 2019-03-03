package service;

import common.LimitPageList;
import entity.RoomInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by isus on 2019/2/20.
 */
public interface AdminService {
    LimitPageList getRoomInfoList(Integer pageNow,String keywords);



    LimitPageList getOrderOperationList(Integer pageNow,String keywords);


    LimitPageList getOrderRecordList(Integer pageNow,String keywords);


    LimitPageList getAccountInfoList(Integer pageNow,String keywords,String type);
    int insertRecordInfo( String id,String result);


    int insertRoomInfo(String number,String address,Integer capacity,String configuration);
}
