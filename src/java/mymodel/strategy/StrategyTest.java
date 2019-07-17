package mymodel.strategy;

public class StrategyTest {
    public static void main(String[] args) {
        /**
         *
         * addStraategy是传入的具体策略类
         */
        Environment environment = new Environment(new AddStrategy());
        int resulr = environment.calulate(3,3);
        System.err.println(resulr);
    }
}
