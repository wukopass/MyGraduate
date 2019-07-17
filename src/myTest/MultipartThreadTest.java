import org.junit.Test;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseListener;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.*;

/**
 * @author LiuHao
 * @date 2019/5/23 17:10
 * @anno
 */

public class MultipartThreadTest {

	private static Integer time = 1;
	@Test
	public void testFuture() throws ExecutionException, InterruptedException {
		int taskSize = 5;
		ExecutorService pool = Executors.newFixedThreadPool(taskSize);
// 创建多个有返回值的任务
		List<Future> list = new ArrayList<Future>();
		for (int i = 0; i < taskSize; i++) {
			Callable c = new MyCallable();
			Thread a = new Thread(()-> System.err.println("baby"));
			Runnable testRun = ()-> System.err.println("I am runAble");
// 执行任务并获取 Future 对象
			pool.submit(testRun);
			Future f = pool.submit(c);
			//list.add(fa);
			list.add(f);
		}
// 关闭线程池
		pool.shutdown();
// 获取所有并发任务的运行结果
		for (Future f : list) {
// 从 Future 对象上获取任务的返回值，并输出到控制台
			System.out.println("res：" + f.get().toString());
		}
	}
	@Test
	public void testListAdd() {
		MyThreadPool threadPool = new MyThreadPool();
		List<Callable<Boolean>> list = new ArrayList<>();
		//添加任务
		for (int i = 0; i < 20; i++) {
			list.add(new MyCallable());
			//Future来获取callbale对象
			//FutureTask<Boolean> future = new FutureTask<Boolean>());
		}
		Long startTime = System.currentTimeMillis();
		//批量提交任务
		boolean flag = threadPool.invokeAll(list);
		System.out.println(System.currentTimeMillis() - startTime);
	}
	private class MyThreadPool {
		public ThreadPoolExecutor threadPool =
				new ThreadPoolExecutor(10, 20, 60, TimeUnit.SECONDS, new LinkedBlockingQueue<>(), r -> {
			//自定义线程，不用默认的，可以设置为守护线程
			Thread thread = new Thread(r);
			thread.setName("Callable " + thread.getName());
			return thread;
		});

		public Boolean invokeAll(List<Callable<Boolean>> list) {
			try {
				//批量提交任务
				List<Future<Boolean>> back = threadPool.invokeAll(list);
				//获取furute对象
				/*back.forEach(f->{
					try {
						System.err.println("future"+f.get().toString());
					} catch (InterruptedException e) {
						e.printStackTrace();
					} catch (ExecutionException e) {
						e.printStackTrace();
					}
				});*/
				return true;
			} catch (InterruptedException e) {

			}
			return false;
		}

		// public ThreadPoolExecutor threadPool = new ThreadPoolExecutor(10, 20, 60, TimeUnit.SECONDS, new SynchronousQueue<>(), r -> {
		// 	Thread thread = new Thread(r);
		// 	thread.setName("Callable " + thread.getName());
		// 	return thread;
		// });
		//
		// public void invokeAll(List<Callable<Boolean>> list) {
		// 	try {
		// 		List<Callable<Boolean>> targetList = new ArrayList<>();
		// 		int count = 0;
		// 		for (int i = 0; i < list.size(); i++) {
		// 			count++;
		// 			targetList.add(list.get(i));
		// 			if (count == 10 || i == list.size() - 1) {
		// 				count = 0;
		// 				threadPool.invokeAll(targetList);
		// 				targetList = new ArrayList<>();
		// 			}
		// 		}
		// 	} catch (InterruptedException e) {
		//
		// 	}
		// }
	}

	private class MyCallable implements Callable<Boolean> {
		@Override
		public Boolean call() throws Exception {
			System.out.println(Thread.currentThread().getName() + " Start!");
			//随机睡0-999毫秒
			Double sleepTime = Math.random() * 1000;
			Thread.sleep(sleepTime.intValue());
			System.out.println(Thread.currentThread().getName() + " End! Sleep " + sleepTime);
			return true;
		}
	}
}