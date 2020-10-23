/**
 * Copyright (c) 2014-2017, test.com
 * All rights reserved.
 */
package hello.model;


import java.io.Serializable;
import java.util.List;

public class Pagination<T> implements Serializable {

    private static final long serialVersionUID = -5220319357445012028L;
    /**
     * 一页数据默认20条
     */
    private int pageSize = 10;
    /**
     * 当前页码
     */
    private int pageNo;

    /**
     * 一共有多少条数据
     */
    private long total;


    /**
     * 一共有多少页
     */
    private int totalPage;

    /**
     * 数据集合
     */
    private transient List rows;

    public List getRows() {
        return rows;
    }

    public void setRows(List rows) {
        this.rows = rows;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public Pagination(int pageNo, int pageSize, long total) {
        this.setPageNo(pageNo);
        this.setPageSize(pageSize);
        this.setTotal(total);
    }
    @Override
    public String toString() {
        return this.toString();
    }

}
