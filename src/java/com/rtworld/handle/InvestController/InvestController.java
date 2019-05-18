package com.rtworld.handle.InvestController;
import com.rtworld.util.Cons;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.misc.BASE64Decoder;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.UUID;

@Controller
public class InvestController {

    @RequestMapping(path="/newimgLoad.do",method = {RequestMethod.POST})
    @ResponseBody
    public String imgLoad(@RequestParam("imgData") String bs){
        int index1 = bs.indexOf("/") + 1;
        int index2 = bs.indexOf(";");
        String hz = bs.substring(index1, index2);
        String fileName = Cons.MYFILEROOT + UUID.randomUUID().toString() + "." + hz;
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
        String fileName = Cons.MYFILEROOT + UUID.randomUUID().toString() + "." + hz;

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





}
