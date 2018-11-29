package com.yottabyte.pages.alert;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

/**
 * @author sunxj
 */
public class WorkLoadPage extends PageTemplate {
    public WorkLoadPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getReturnButton() {
        return super.getButton("返回监控首页");
    }
}
