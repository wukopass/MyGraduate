

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.*;



public class TestTest implements  Callable<String> {
    public  TestTest(){}
    public  TestTest(String aa){
        System.err.println(aa +"baby");
    }

    public static  void main(String args[]) throws ExecutionException, InterruptedException {
        ExecutorService  pool = Executors.newFixedThreadPool(5);
        List<Future> list =  new ArrayList<>();
        for(int i = 0;i < 5;i++){
            Callable c = new TestTest(i+"");
            Future f = pool.submit(c);
            list.add(f);
        }
        for (Future f : list) {
            System.out.println("res：" + f.get().toString());
        }
        
    }

    @Override
    public  String call() throws Exception {
        return "ddddddddddddddd";
    }
}