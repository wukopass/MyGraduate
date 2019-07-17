package mymodel.strategy;

/**
 *
 * 环境角色
 *   类似于TreeSet
 */
public class Environment {
    //策略的引用
    private Startegy startegy;

    public Environment(Startegy startegy){
        this.startegy = startegy;
    }

    public  int calulate(int a ,int b){
        return  startegy.calc(a,b);
    }
}
