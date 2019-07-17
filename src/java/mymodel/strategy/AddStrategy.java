package mymodel.strategy;

import org.springframework.boot.autoconfigure.web.ResourceProperties;

public class AddStrategy implements Startegy{


    @Override
    public int calc(int num1, int num2) {
        return  num1 + num2;
    }
}
