package service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.LoginDao;
import entity.Account;

import service.LoginService;

@Service
public class LoginServiceImpl implements LoginService{

    @Autowired
    private LoginDao userDao;

    /*
     * 检验用户登录业务
     *
     */

    public synchronized Account checkLogin(String username, String password,String type) {



        Account user =userDao.findByUsername(username,type);

        if(user != null && user.getPassword().equals(password)){

            return user;
        }
        System.out.print(3);
        return null;
    }

    @Override
    public void Regist(Account user) {

        userDao.registerByUsernameAndPassword(user.getAccount(),user.getPassword());

    }
}
