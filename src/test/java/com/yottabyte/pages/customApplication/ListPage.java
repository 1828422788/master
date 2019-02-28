package com.yottabyte.pages.customApplication;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

public class ListPage extends PageTemplate {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getCreate() {
        return super.getButton("新建");
    }

    public WebElement getEnsure() {
        return super.getContainsTextButton("确定");
    }
}
