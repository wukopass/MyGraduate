package com.rtworld.handle;

import com.rtworld.pojo.demand.*;
import com.rtworld.pojo.user.RtUser;
import com.rtworld.service.demand.IDemandService;
import com.rtworld.util.Page;
import com.rtworld.util.StringUtils;
import com.rtworld.util.conf;
import org.apache.ibatis.annotations.Param;
import org.mortbay.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import sun.misc.BASE64Decoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Controller
public class DemandController {
    @Autowired
    private IDemandService demandService;

    @RequestMapping("/saveCooperation.do")
    public String saveAsset(Cooperation cooperation){
        cooperation.setCreateTime(new Date());
        demandService.saveCoop(cooperation);

        return "coop";
    }

    @RequestMapping("/initCity.do")
    @ResponseBody
    public List<String> initCity(){
        return demandService.getAllCity();
    }

    @RequestMapping("/initResource.do")
    @ResponseBody
    public List<CoopType> initResourceType(){
        return demandService.getAllCoopTypes();
    }

    @RequestMapping("/initIndustry.do")
    @ResponseBody
    public List<Industry> initIndustry(){
        return demandService.getAllIndustry();
    }

    @RequestMapping("/initLable.do")
    @ResponseBody
    public List<Lable> initLable(){
        return demandService.getAllLable();
    }

    @RequestMapping(path="/imgLoad.do",method = {RequestMethod.POST})
    @ResponseBody
    public String imgLoad(@RequestParam("imgData") String bs){
        int index1 = bs.indexOf("/") + 1;
        int index2 = bs.indexOf(";");
        String hz = bs.substring(index1, index2);
        String fileName = conf.FILEROOT + UUID.randomUUID().toString() + "." + hz;

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

    @RequestMapping("/imgGet.do")
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

    @RequestMapping("/file.do")
    @ResponseBody
    public String fileLoad(@RequestParam("fileData") String bs,@RequestParam("fileName") String name){

        int index1 = name.indexOf(".") + 1;
        String hz=name.substring(index1,name.length());
        String fileName = conf.FILEROOT + UUID.randomUUID().toString() + "." + hz;

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

    @RequestMapping("/coopPage.do")
    @ResponseBody
    public List<Cooperation> paging(HttpServletRequest request){

        Cooperation cooperation=new Cooperation();

        if(StringUtils.isNotEmpty(request.getParameter("cooperationType"))){
            cooperation.setCooperationType(request.getParameter("cooperationType"));
        }
        if(StringUtils.isNotEmpty(request.getParameter("industryType"))){
            cooperation.setIndustryType(request.getParameter("industryType"));
        }
        if(StringUtils.isNotEmpty(request.getParameter("city"))){
            cooperation.setCity(request.getParameter("city"));
        }
        if(StringUtils.isNotEmpty(request.getParameter("projectName"))){
            cooperation.setProjectName(request.getParameter("projectName"));
        }
        if(StringUtils.isNotEmpty(request.getParameter("time"))){
            cooperation.setCreateTime(new Date());
        }

        List<Cooperation> list=demandService.findCooperation(cooperation);
        return list;
    }

    @RequestMapping("/getCoopById.do")
    @ResponseBody
    public Cooperation getCoopById(int id){
        Cooperation cooperation=demandService.getCooperation(id);
        cooperation.setTypes(demandService.getResourceTypeById(id));
        cooperation.setMyLable(demandService.getLableById(id));

        return cooperation;
    }

    @RequestMapping("/getUser.do")
    @ResponseBody
    public RtUser getUser(int id){
        Cooperation cooperation=demandService.getCooperation(id);
        return demandService.getUserByName(cooperation.getCreateRtUser());
    }

    @RequestMapping("/initAssetType.do")
    @ResponseBody
    public List<String> getAllAssetType(){
        return demandService.getAllAssetType();
    }

    @RequestMapping("/saveAsset.do")
    public String asveAsset(Asset asset){
        asset.setCreateTime(new Date());
        demandService.saveAsset(asset);

        return "asset";
    }

    @RequestMapping("/saveStock.do")
    public String asveStock(Stock stock){
        stock.setCreateTime(new Date());
        demandService.saveStock(stock);

        return "stock";
    }

    @RequestMapping("/assetPage.do")
    @ResponseBody
    public List<Asset> assetPaging(HttpServletRequest request){

        Asset asset=new Asset();


        if(StringUtils.isNotEmpty(request.getParameter("assetType"))){
            asset.setAssetType(request.getParameter("assetType"));
        }
        if(StringUtils.isNotEmpty(request.getParameter("city"))){
            asset.setCity(request.getParameter("city"));
        }
        if(StringUtils.isNotEmpty(request.getParameter("projectName"))){
            asset.setProjectName(request.getParameter("projectName"));
        }
        if(StringUtils.isNotEmpty(request.getParameter("time"))){
            asset.setCreateTime(new Date());
        }
        List<Asset> list=demandService.findAsset(asset);
        return list;
    }
    @RequestMapping("/getAssetById.do")
    @ResponseBody
    public Asset getAssetById(int id){
        Asset asset=demandService.getAssetById(id);
        asset.setMyLable(demandService.getAssetLableById(id));

        return asset;
    }
    @RequestMapping("/getAssetUser.do")
    @ResponseBody
    public RtUser getAssetUser(int id){
        Asset asset=demandService.getAssetById(id);
        return demandService.getUserByName(asset.getCreateRtUser());
    }

    @RequestMapping("/stockPage.do")
    @ResponseBody
    public List<Stock> stockPaging(HttpServletRequest request){

        Stock stock=new Stock();

        if(StringUtils.isNotEmpty(request.getParameter("nature"))){
            stock.setNature(request.getParameter("nature"));
        }
        if(StringUtils.isNotEmpty(request.getParameter("industryType"))){
            stock.setIndustryType(request.getParameter("industryType"));
        }
        if(StringUtils.isNotEmpty(request.getParameter("projectName"))){
            stock.setProjectName(request.getParameter("projectName"));
        }
        if(StringUtils.isNotEmpty(request.getParameter("time"))){
            stock.setCreateTime(new Date());
        }

        List<Stock> list=demandService.findStock(stock);
        return list;
    }

    @RequestMapping("/getStockById.do")
    @ResponseBody
    public Stock getStockById(int id){
        Stock stock=demandService.getStockById(id);
        stock.setMyLable(demandService.getStockLableById(id));

        return stock;
    }
    @RequestMapping("/getStocktUser.do")
    @ResponseBody
    public RtUser getStockUser(int id){
        Stock stock=demandService.getStockById(id);
        return demandService.getUserByName(stock.getCreateRtUser());
    }
}
