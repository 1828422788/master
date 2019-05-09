package com.yottabyte.pages.alert;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class WorkLoadPage extends PageTemplate {
    @FindBy(xpath = "//input[@placeholder='输入姓名']")
    private WebElement searchInput;

    @Override
    public WebElement getSearchInput() {
        return searchInput;
    }

    public WorkLoadPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getReturnButton() {
        return super.getButton("返回监控首页");
    }

}
