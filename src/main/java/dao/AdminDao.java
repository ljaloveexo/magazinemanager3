package dao;

import com.sun.javafx.collections.MappingChange;
import entity.Account;
import entity.OrderOperation;
import entity.OrderResult;
import entity.RoomInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by isus on 2019/2/20.
 */
public interface AdminDao {
    List<RoomInfo> getRoomInfoList(@Param(value = "startPos") Integer startPos,
                                   @Param(value = "pageSize") Integer pageSize,
                                   @Param(value = "keywords") String keywords);

//    int getRoomInfoCount(@Param(value = "table") String table,
//                 @Param(value="type") String type);

    int getRoomInfoCount(@Param(value = "keywords") String keywords);



    List<OrderOperation> getOrderOperationList(@Param(value = "startPos") Integer startPos,
                                               @Param(value = "pageSize") Integer pageSize,
                                               @Param(value = "keywords") String keywords
                                               );
    int getOrderOperationCount(@Param(value = "keywords") String keywords);




    List<HashMap<String,String>> getOrderRecordList(@Param(value = "startPos") Integer startPos,
                                               @Param(value = "pageSize") Integer pageSize,
                                               @Param(value = "keywords") String keywords
    );
    int getOrderRecordListCount(@Param(value = "keywords") String keywords);

    int insertRecordInfo( @Param(value = "id") String id,
                           @Param(value ="result") String result);


    List<HashMap<String,String>> getAccountInfoList (@Param(value = "startPos") Integer startPos,
                                                     @Param(value = "pageSize") Integer pageSize,
                                                     @Param(value = "keywords") String keywords,
                                                     @Param(value ="type") String type);
    int getAccountInfoListCount (
                                                          @Param(value = "keywords") String keywords,
                                                          @Param(value ="type") String type);
    int insertRoomInfo( @Param(value = "number") String param_1,
                 @Param(value = "address") String param_2,
                 @Param(value ="capacity") Integer param_3,
                 @Param(value = "configuration") String param_4);
    int batchInsert(List list);


}
