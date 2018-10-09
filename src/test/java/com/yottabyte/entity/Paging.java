package com.yottabyte.entity;

import org.openqa.selenium.WebElement;

/**
 * @author sunxj
 */
public class Paging {

    private int totalPage;
    private WebElement nextPage;

    public int getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public WebElement getNextPage() {
        return nextPage;
    }

    public void setNextPage(WebElement nextPage) {
        this.nextPage = nextPage;
    }
}
