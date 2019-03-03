package dao;

import entity.Account;
import org.apache.ibatis.annotations.Param;



public interface LoginDao {


    /**
     * 查找用户名和密码
     * @param username 登录用户名
     * @return
     */
    Account findByUsername(@Param("username") String username,@Param("type") String type);
    /**
     * 注册用户和密码
     */
    void registerByUsernameAndPassword(@Param("username")String username,
                                       @Param("password")String password);
}