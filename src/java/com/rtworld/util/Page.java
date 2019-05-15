package com.rtworld.util;


import com.rtworld.util.StringUtils;

import java.util.List;

public class Page<T> {
    private static final int PAGE_NUM = 1;
    private static final int PAGE_SIZE = 3;

    // 总页数
    private int pageSum;
    // 当前页,默认为1
    private int pageNum = PAGE_NUM;
    // 每页显示条数
    private int pageSize = PAGE_SIZE;
    // 总条数
    private int counts;
    // 分页查询的开始位置
    private int start;
    // 分页查询的结束位置
    private int end;
    // 具体分页的javaBean对象
    private T bean;
    // 分页查询出来的结果
    private List<T> beans;

    public List<T> getBeans() {
        return beans;
    }

    public void setBeans(List<T> beans) {
        this.beans = beans;
    }

    public int getPageSum() {
        this.pageSum = (int)Math.ceil(1.0 * getCounts() / getPageSize());
        return pageSum;
    }
    public void setPageSum(int pageSum) {
        this.pageSum = pageSum;
    }
    public int getPageNum() {
        return pageNum;
    }
    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }
    public void setPageNum(String pageNumStr) {
        if(StringUtils.isNotEmpty(pageNumStr)) {
            pageNum = Integer.parseInt(pageNumStr);
        } else {
            pageNum = PAGE_NUM;
        }

    }
    public int getPageSize() {
        return pageSize;
    }
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }
    public void setPageSize(String pageSizeStr) {
        if(StringUtils.isNotEmpty(pageSizeStr)) {
            pageSize = Integer.parseInt(pageSizeStr);
        } else {
            pageSize = PAGE_SIZE;
        }

    }


    public int getCounts() {
        return counts;
    }
    public void setCounts(int counts) {
        this.counts = counts;
    }
    public int getStart() {
        start = (getPageNum() - 1) * getPageSize();
        return start;
    }
    public void setStart(int start) {
        this.start = start;
    }
    public int getEnd() {
        this.end = getPageNum() * getPageSize() - 1;
        return end;
    }
    public void setEnd(int end) {
        this.end = end;
    }
    public T getBean() {
        return bean;
    }
    public void setBean(T bean) {
        this.bean = bean;
    }
}
