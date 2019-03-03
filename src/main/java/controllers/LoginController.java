package controllers;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import entity.Account;
import service.LoginService;
import utils.RandomValidateCode;
@Controller
@RequestMapping("/user")
//这里用了@SessionAttributes，可以直接把model中的user(也就key)放入其中
//这样保证了session中存在user这个对象
@SessionAttributes("user")
public class LoginController {
    @Autowired
    private LoginService userServivce;
    //正常访问login页面
    @RequestMapping("/login")
    public String login() {
        return "login";
    }
    //表单提交过来的路径
    @ResponseBody
    @RequestMapping(value = "/checkLogin", method = RequestMethod.POST)
    public String checkLogin( Model model,HttpServletRequest request) {
        //调用service方法
        System.out.println(3);
        String flag = "0";
        String account=request.getParameter("account");
        String password=request.getParameter("password");
        String type=request.getParameter("type");
        Account user = userServivce.checkLogin(account,password,type);
        System.out.println(account);
        //若有user则添加到model里并且跳转到成功页面
        if (user != null) {
            model.addAttribute("user", user);
            System.out.println(type);
            if (type == "user") {
                System.out.println(4);
                flag = "1";
            } else {
                flag = "2";
            }
        }
//        }
        return flag;
    }
    //测试超链接跳转到另一个页面是否可以取到session值
    @RequestMapping("/anotherpage")
    public String hrefpage() {
        return "anotherpage";
    }
    //注销方法
    @RequestMapping("/outLogin")
    public String outLogin(HttpSession session) {
        //通过session.invalidata()方法来注销当前的session
        session.invalidate();
        return "login";
    }
    @RequestMapping("/regist")
    public String regist() {
        return "regist";
    }
    @RequestMapping("/doRegist")
    public String doRegist(Account user, Model model) {
//        System.out.println(user.getAccount());
        userServivce.Regist(user);
        return "success";
    }
    /**
     * 登录页面生成验证码
     */
    @RequestMapping(value = "/getVerify")
    public void getVerify(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
        response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expire", 0);
        RandomValidateCode randomValidateCode = new RandomValidateCode();
        try {
            randomValidateCode.getRandcode(request, response);//输出验证码图片方法
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}