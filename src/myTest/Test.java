
import java.io.*;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.*;
import java.util.concurrent.Executors;

public class Test {
    @org.junit.Test
    public void fileReadAndWrite() {
        try {
            FileInputStream in = new FileInputStream("D://a.txt");
            FileOutputStream out = new FileOutputStream("D://c.txt");
            //创建一个小卡车，循环来回转载货物，从仓库（源头）到达商场（目的地）
            byte[] buffer = new byte[1024];
            int readLength;
            while ((readLength = in.read(buffer)) > 0) {//这里的in.read(buffer);就是把输入流中的东西，写入到内存中（buffer）。
                System.out.println(new String(buffer, 0, readLength));//这里顺利将字节数组转化为了字符串
                out.write(buffer);//这里就是把内存中（buffer)的内容写出到输出流中，也就写出到了指定文件中
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    @org.junit.Test
    public void nio() throws IOException {
        FileInputStream in = new FileInputStream("D://a.txt");
        FileChannel channel = in.getChannel();
        FileOutputStream out = new FileOutputStream("D://c.txt");
        FileChannel channel2 = out.getChannel();
        ByteBuffer buffer = ByteBuffer.allocate(1024);
        while (channel.read(buffer) != -1) {
            buffer.flip();
            channel2.write(buffer);
            buffer.clear();
            Set a = new HashSet();
            List list = new ArrayList();
            list.add(3);
        }


    }

    @org.junit.Test
    public void chaozuofu() {
        int sum=0;
        for (int i = 2; i <= 100; i++) { // 质数
            for (int k = 2; k <= i; k++) { // 除数
                // 排除所有在 i=k 之前 能被k整除(余数为0)的数
                if (i % k == 0 && i != k) {
                    break;
                }
                // 输出所有在 i=k 且 i%k=0的数
                if (i % k == 0 && i == k) {
                    System.out.println(i);
                    sum+=i;
                }
            }
        }
        System.out.println("sum="+sum);
    }
    /**
    *@Description:
    *@Param:
    *@return:
    *@Author: quan
    *@date: 2019/7/7
    */
    @org.junit.Test
    public void switchTest() {
        Random rand = new Random();
        for (int i = 0; i < 100; i++) {
            int a = rand.nextInt(26) + 'a';
            System.err.println("code          " + (char)a);

        }

    }

}
