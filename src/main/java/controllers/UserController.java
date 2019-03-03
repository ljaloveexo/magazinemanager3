package controllers;



import common.LimitPageList;
import common.Page;
import entity.Account;
import entity.OrderOperation;
import entity.OrderResult;
import entity.RoomInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;


import org.springframework.web.servlet.ModelAndView;
import service.UserService;


import java.util.List;


@Controller
@RequestMapping("/user")


//这里用了@SessionAttributes，可以直接把model中的user(也就key)放入其中
//这样保证了session中存在user这个对象
@SessionAttributes(value={"user","orderrecord","page","classroomorder"})

public class UserController {




    @Autowired


    private UserService userServivce;

    //正常访问login页面


    //用户信息页面显示

    @RequestMapping(value = "/infoUserFind")
    public String infoUserFind(@ModelAttribute("user") Account user,Model model){
        //调用service方法




        Account list=userServivce.showUserInfo(user.getAccount());

        //若有user则添加到model里并且跳转到成功页面
        model.addAttribute("account",list);
//        Account user1=(Account)session.getAttribute("account");



        return "view/informationUser";
    }




//用户预订页面显示


    @RequestMapping(value = "/orderUser",method= RequestMethod.GET)

    public String orderUser(Model m,HttpSession session){

         List<RoomInfo> roomInfoList = userServivce.getRoomInfoList();


        m.addAttribute("classroomorder",  roomInfoList);



        return "view/orderUser";
    }

   //用户预订
   @RequestMapping(value = "/order",method= RequestMethod.POST)


   @ResponseBody
    public  int  order(OrderOperation orderOperation,@ModelAttribute(value = "user") Account account)

                     {

                        String user=account.getName();
                         String address=orderOperation.getAddress();
                         System.out.println(address);
                         String reason=orderOperation.getReason();
                         String time=orderOperation.getTime();

                         String number=orderOperation.getNumber();
                         String orderdate=orderOperation.getOrderdate();



                         try{
                             address=java.net.URLDecoder.decode(address,"utf-8");

                             time=java.net.URLDecoder.decode(time,"utf-8");
                             reason=java.net.URLDecoder.decode(reason,"utf-8");
                         }
                         catch (IOException e){
                             e.printStackTrace();
                         }

        int count = userServivce.orderUser(number,address,orderdate,time,user,reason,"待处理");





        return count;
    }
//    @RequestMapping(value = "/orderResult",method= RequestMethod.GET)
//
//    public String orderResult(){
//        return "view/orderresultUser";
//    }

    //用户预订结果分页显示

    @RequestMapping(value = "/orderResultUserShow",method= RequestMethod.GET)
    public String orderResultUserShow(){
        return "view/orderresultUser";
    }

    @RequestMapping(value = "/orderResultUser",method= RequestMethod.GET)

    public ModelAndView orderResultUser(@ModelAttribute("user") Account user,Model m,@RequestParam(value="pageNow",required=false) Integer pageNow,
                                        @RequestParam(value = "keywords",required = false) String keywords){


        System.out.println(990);

        try {
            keywords=java.net.URLDecoder.decode(keywords,"utf-8");
        }
        catch (Exception e){
            e.printStackTrace();
        }
        LimitPageList limitPageStuList = userServivce.getLimitPageList(pageNow,user.getName(),keywords);
        Page page = limitPageStuList.getPage();
        //强制类型转换
        List<OrderResult> stuList = (List<OrderResult>) limitPageStuList.getList();

        m.addAttribute("page", page);
        m.addAttribute("orderrecord", stuList);

        ModelAndView modelAndView=new ModelAndView("view/template/orderresultUser");
        return modelAndView;
    }

    //删除预订结果

    @RequestMapping(value = "/deleteOrder",method = RequestMethod.POST)
    public ModelAndView deleteOrder(Model m,@ModelAttribute(value = "user") Account account,int id){
          int count=userServivce.deleteOrder(id);

            ModelAndView modelAndView=orderResultUser(account,m,null,"");
            return modelAndView;


    }




}