package com.yottabyte.pages.index;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

/**
 * @author sunxj
 */
public class ListPage extends PageTemplate {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getAddButton() {
        return super.getButton("新建");
    }

    public WebElement getEnsureDeleteButton() {
        return super.getContainsTextButton("确定");
    }

    public WebElement getSuccessMessage() {
        return super.getSuccessMessage();
    }

    public WebElement getIndexMatchRule() {
        return super.getButton("索引路由规则");
    }
}
