package com.rtworld.handle.InvestController;


import com.rtworld.pojo.demand.Lable;
import com.rtworld.pojo.quanInvest.City;
import com.rtworld.pojo.quanInvest.invest;
import com.rtworld.pojo.quanInvest.period;
import com.rtworld.service.investService.IInvestService;
import com.rtworld.util.StringUtils;
import com.rtworld.util.conf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sun.misc.BASE64Decoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class InvestController {
    @Autowired
    private IInvestService investService;

    @RequestMapping(path="/saveInvest.do",method = RequestMethod.POST)
    public ModelAndView saveInvest(invest invest){
        invest.setCreateTime(new Date());
        System.out.println(invest.getUsername());

        ModelAndView mv=new ModelAndView();
        int result =investService.saveInvest(invest);
        if(result ==1 ){
            mv.setViewName("addsuccess");
        }
        if(result ==0){
            mv.addObject("msg","这个项目名已经存在");
            mv.setViewName("new");
        }
        return mv;
        }



    @RequestMapping(path="/newimgLoad.do",method = {RequestMethod.POST})
    @ResponseBody
    public String imgLoad(@RequestParam("imgData") String bs){
        int index1 = bs.indexOf("/") + 1;
        int index2 = bs.indexOf(";");
        String hz = bs.substring(index1, index2);
        String fileName = conf.MYFILEROOT + UUID.randomUUID().toString() + "." + hz;

        BASE64Decoder decoder = new BASE64Decoder();
        OutputStream os = null;
        try {
            byte[] bytes = decoder.decodeBuffer(bs.substring(bs.indexOf(",")+1));
            File file = new File(fileName);
            file.createNewFile(); // 创建这个文件
            os = new FileOutputStream(file);
            os.write(bytes);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(os != null) {
                try {
                    os.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return fileName;
    }

    @RequestMapping("/newimgGet.do")
    public void imgGet(@RequestParam("fileName") String fileName,HttpServletResponse response){
        File file=new File(fileName);
        InputStream is=null;
        OutputStream os=null;
        try {
            is=new FileInputStream(file);
            os = response.getOutputStream();
            byte[] b=new byte[512];
            int len=0;
            while((len=is.read(b))!=-1){
                os.write(b,0,len);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if(is!=null){
                try {
                    is.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if(os!=null){
                try {
                    os.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

    }

    @RequestMapping("/newfile.do")
    @ResponseBody
    public String fileLoad(@RequestParam("fileData") String bs, @RequestParam("fileName") String name){

        int index1 = name.indexOf(".") + 1;
        String hz=name.substring(index1,name.length());
        String fileName = conf.MYFILEROOT + UUID.randomUUID().toString() + "." + hz;

        BASE64Decoder decoder = new BASE64Decoder();
        OutputStream os = null;
        try {
            byte[] bytes = decoder.decodeBuffer(bs.substring(bs.indexOf(",")+1));
            File file = new File(fileName);
            file.createNewFile(); // 创建这个文件
            os = new FileOutputStream(file);
            os.write(bytes);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(os != null) {
                try {
                    os.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return fileName;
    }
    @RequestMapping(path = "/selectperiod.do")
    //，在使用 @RequestMapping后，返回值通常解析为跳转路径，
    // 但是加上 @ResponseBody 后返回结果不会被解析为跳转路径，
    // 而是直接写入 HTTP response body 中
    @ResponseBody
    public List<period> selectAllPeriod(){
        return  investService.selectAllPeriod();
    }
    @RequestMapping("/selectlable.do")
    @ResponseBody
    public  List<Lable> selectLable(){
        return  investService.selectAllLable();
    }
    //城市多选框
    @RequestMapping("/selectcity.do")
    @ResponseBody
    public  List<City> selectAllCity(){
        return  investService.selectAllCity();
    }
    @RequestMapping("/selectindustry.do")
    @ResponseBody
    public  List<String> selectAllindustry(){
        return  investService.selectAllindustry();
    }
    @RequestMapping("/investPage.do")
    @ResponseBody
    public List<invest> paging(HttpServletRequest request){
            invest invest =new invest();
          if(StringUtils.isNotEmpty(request.getParameter("pmessagetype"))){
              invest.setPmessagetype(request.getParameter("pmessagetype"));
          }
          if(StringUtils.isNotEmpty(request.getParameter("pstage"))){
              invest.setPstage(request.getParameter("pstage"));
          }
          if(StringUtils.isNotEmpty(request.getParameter("city"))){
              invest.setCity(request.getParameter("city"));
          }
          if(StringUtils.isNotEmpty(request.getParameter("pname"))){
              invest.setPname(request.getParameter("pname"));
          }
          if(StringUtils.isNotEmpty(request.getParameter("time"))){
              invest.setCreateTime(new Date());
          }
          List<invest> list=investService.findInvest(invest);
          return list;
    }

   @RequestMapping("/getInvestById.do")
    @ResponseBody
    public invest getInvestById(int id){
      invest in=investService.getInvestById(id);
      in.setIndustry(investService.getIndustryByid(id));
       return in;
    }


}
