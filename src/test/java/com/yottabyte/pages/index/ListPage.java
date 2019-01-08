package com.yottabyte.pages.index;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ListPage extends PageTemplate {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "el-message-box__message")
    private WebElement message;

    @FindBy(className = "el-message__group")
    private WebElement successmessage;

    public WebElement getAddButton() {
        return super.getButton("新建");
    }

    public WebElement getEnsureButton() {
        return super.getContainsTextButton("确定");
    }

    public WebElement getSuccessMessage() {
        return message;
    }

    public WebElement getIndexMatchRule() {
        return super.getButton("索引路由规则");
    }

    public WebElement getMessage() {
        return successmessage;
    }
}
