package service;


import entity.Account;

//Service层接口
public interface LoginService {

    //检验用户登录
    Account checkLogin(String username,String password,String type);
    void Regist(Account user);
}
