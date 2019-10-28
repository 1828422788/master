package com.yottabyte.pages.queryScopes;

import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

/**
 * @author sunxj
 */
public class ListPage extends ListPageFactory {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getName() {
        return super.getPlaceholderInput("请输入名称");
    }

    public WebElement getDescribe() {
        return super.getPlaceholderInput("请输入描述");
    }

    public WebElement getSourceTag() {
        return super.getPlaceholderInput("请输入标签名称");
    }

    public WebElement getHostname() {
        return super.getPlaceholderInput("请输入 Hostname");
    }

    public WebElement getTag() {
        return super.getPlaceholderInput("请输入 Tag");
    }

    public WebElement getAppname() {
        return super.getPlaceholderInput("请输入 Appname");
    }

    public WebElement getFilter() {
        return super.getPlaceholderInput("请输入过滤条件");
    }
}
