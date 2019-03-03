package controllers;

import common.LimitPageList;
import common.Page;
import entity.Account;
import entity.OrderOperation;
import entity.OrderResult;
import entity.RoomInfo;
import org.apache.commons.codec.EncoderException;
import org.apache.commons.io.IOExceptionWithCause;
import org.apache.ibatis.javassist.bytecode.stackmap.TypeData;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import service.AdminService;


import java.io.IOException;
import java.lang.reflect.Array;
import java.util.*;

/**
 * Created by isus on 2019/2/20.
 */
@Controller
@RequestMapping("/admin")
@SessionAttributes(value={"admin","classroominfoAdmin","roominfopage","operation_list_page","operation_list","result_list_page","result_list"})
public class AdminController {
    @Autowired
    private AdminService adminService;


    //教室信息页面显示
    @RequestMapping(value = "/classroominfoAdminShow" ,method= RequestMethod.GET)
    public String classroominfoAdminShow(){
        return "view/classroominfoAdmin";
    }



    @RequestMapping(value = "/classroominfoAdmin" ,method= RequestMethod.GET)
    public ModelAndView classroominfoAdmin(Model m,@RequestParam(value="pageNow",required=false) Integer pageNow,
                                           @RequestParam(value = "keywords",required = false) String keywords
    ) {
        if(keywords!=null) {

            try {
                keywords = java.net.URLDecoder.decode(keywords, "utf-8");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        System.out.println(keywords);
        LimitPageList limitPageStuList = adminService.getRoomInfoList(pageNow,keywords);
        Page page = limitPageStuList.getPage();
        //强制类型转换
        List<HashMap<String,String>> stuList = (List<HashMap<String,String>>) limitPageStuList.getList();


        m.addAttribute("roominfopage", page);


        m.addAttribute("classroominfoAdmin", stuList);

        ModelAndView modelAndView=new ModelAndView("view/template/classroominfoAdmin");

        return modelAndView;
    }



    //教室信息添加

//    @RequestMapping(value = "/isAddClassRoomInfo" ,method=RequestMethod.POST)
//    @ResponseBody
//    public Object isAddClassRoomInfo(Model m,
//                                     @RequestParam(value = "number") String number,
//                                     @RequestParam(value = "address") String address,
//                                     @RequestParam(value = "capacity") Integer capacity,
//                                     @RequestParam(value = "configuration") String configuration) {
//        System.out.println(9);
//        int count = adminService.insertRoomInfo(number, address, capacity, configuration);
//
//        if (count == 1) {
//            ModelAndView modelAndView = classroominfoAdmin(m, 1,"");
//            return modelAndView;
//        } else {
//
//            return count;
//        }
//    }


//        @RequestMapping(value = "/roominfo_searchAdmin" ,method=RequestMethod.GET)
//        @ResponseBody
//        public Object roominfo_searchAdmin(Model m,
//            @RequestParam(value = "keywords") String keywords)
//        {
//            System.out.println(9);
//            int count=adminService.getRoomInfoList();
//
//            if(count==1){
//                ModelAndView modelAndView=classroominfoAdmin(m,1);
//                return modelAndView;
//            }
//            else {
//
//                return count;
//            }










    //预订操作展示
    @RequestMapping(value = "/orderoperateAdminShow" ,method= RequestMethod.GET)
    public String orderoperateAdminShow( ) {
        return "view/orderoperateAdmin";
    }


    @RequestMapping(value = "/orderoperateAdmin" ,method= RequestMethod.GET)
    public ModelAndView orderoperateAdmin( Model m,@RequestParam(value="pageNow",required=false) Integer pageNow,
                                           @RequestParam(value = "keywords",required = false) String keywords) {
        System.out.println(88);
        try {
            keywords=java.net.URLDecoder.decode(keywords,"utf-8");
        }
        catch (IOException e){
            e.printStackTrace();
        }
        LimitPageList limitPageStuList = adminService.getOrderOperationList(pageNow,keywords);
        System.out.println(keywords);
        Page page = limitPageStuList.getPage();
        //强制类型转换
        List<HashMap<String,String>> stuList = (List<HashMap<String,String>>) limitPageStuList.getList();

        m.addAttribute("operation_list_page", page);
        m.addAttribute("operation_list", stuList);
        System.out.println(page);
        ModelAndView modelAndView=new ModelAndView("view/template/orderoperateAdmin");
        return modelAndView;
    }



    //预订操作处理

    @RequestMapping(value="/operateAdmin",method = RequestMethod.POST)
    public Object operateAdmin(Model m, @RequestParam(value = "id") String id,
                               @RequestParam(value="result") String result){



    if(result.equals("同意")==false){
        result="不同意("+result+")";
    }
        int count=adminService.insertRecordInfo(id,result);
        ModelAndView modelAndView=orderoperateAdmin(m,null,"");
     return modelAndView;
    }






    //预订结果展示

    @RequestMapping(value = "/orderrecordAdminShow",method = RequestMethod.GET)
    public String orderrecordAdminShow(){
        return "view/orderrecordAdmin";
    }
    @RequestMapping(value = "/orderrecordAdmin" ,method= RequestMethod.GET)

    public ModelAndView orderrecordAdmin(Model m, @RequestParam(value="pageNow",required=false) Integer pageNow,
                                         @RequestParam(value="keywords",required = false) String keywords
    ) {
        System.out.println(990);
        try {
            keywords=java.net.URLDecoder.decode(keywords,"utf-8");
        }
        catch (IOException e){
            e.printStackTrace();
        }
        LimitPageList limitPageStuList = adminService.getOrderRecordList(pageNow,keywords);
        Page page = limitPageStuList.getPage();


        //强制类型转换
        List<HashMap<String, String>> stuList = (List<HashMap<String, String>>) limitPageStuList.getList();
        System.out.println(stuList.get(0).get("number"));
        m.addAttribute("result_list_page", page);
        m.addAttribute("result_list", stuList);
        System.out.println(page);


        return new ModelAndView("view/template/orderrecordAdmin");

    }

    //学生信息展示
    @RequestMapping(value = "/userManageAdminShow",method = RequestMethod.GET)
    public String userManageAdminShow(){
        return "view/userManageAdmin";
    }
    @RequestMapping(value = "/userManageAdmin" ,method= RequestMethod.GET)

    public ModelAndView userManageAdmin(Model m, @RequestParam(value="pageNow",required=false) Integer pageNow,
                                        @RequestParam(value = "keywords",required = false) String keywords) {
        System.out.println(33);
        try {
            keywords=java.net.URLDecoder.decode(keywords,"utf-8");
        }
        catch (IOException e){
            e.printStackTrace();
        }
        LimitPageList limitPageStuList = adminService.getAccountInfoList(pageNow,keywords,"user");
        Page page = limitPageStuList.getPage();
        //强制类型转换
        List<HashMap<String, String>> stuList = (List<HashMap<String, String>>) limitPageStuList.getList();
//        System.out.println(stuList.get(0).get("number"));
        m.addAttribute("result_list_page", page);
        m.addAttribute("result_list", stuList);
        System.out.println(page);


        return new ModelAndView("view/template/userManageAdmin");

    }

    //管理员信息展示
    @RequestMapping(value = "/adminManageAdminShow",method = RequestMethod.GET)
    public String adminManageAdminShow(){
        return "view/adminManageAdmin";
    }
    @RequestMapping(value = "/adminManageAdmin" ,method= RequestMethod.GET)

    public ModelAndView adminManageAdmin(Model m, @RequestParam(value="pageNow",required=false) Integer pageNow,
                                         @RequestParam(value = "keywords",required = false) String keywords) {
        System.out.println(111);
        try {
            keywords=java.net.URLDecoder.decode(keywords,"utf-8");
        }
        catch (IOException e){
            e.printStackTrace();
        }
        LimitPageList limitPageStuList = adminService.getAccountInfoList(pageNow,keywords,"admin");
        Page page = limitPageStuList.getPage();


        //强制类型转换
        List<HashMap<String, String>> stuList = (List<HashMap<String, String>>) limitPageStuList.getList();
        System.out.println(stuList.get(0).get("number"));
        m.addAttribute("result_list_page", page);
        m.addAttribute("result_list", stuList);
        System.out.println(page);

        return new ModelAndView("view/template/adminManageAdmin");

    }









}
