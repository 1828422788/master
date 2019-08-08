package com.yottabyte.utils;

import com.yottabyte.entity.Paging;
import com.yottabyte.hooks.LoginBeforeAllTests;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.List;

/**
 * @author sunxj
 */
public class GetPaging {
    private static WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
    private static Paging paging = new Paging();

    private static void setPagingInfo(Paging paging) {
        // 分页标签
        List<WebElement> pagingLabel = webDriver.findElements(By.className("number"));
        // 总页数
        int totalPage = Integer.parseInt(pagingLabel.get(pagingLabel.size() - 1).getText());
        // 下一页按钮
        WebElement nextPage = webDriver.findElement(By.className("btn-next"));

        paging.setTotalPage(totalPage);
        paging.setNextPage(nextPage);
    }

    public static Paging getPagingInfo() {
        setPagingInfo(paging);
        return paging;
    }
}
