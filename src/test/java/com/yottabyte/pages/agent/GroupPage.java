package com.yottabyte.pages.agent;

import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class GroupPage extends ListPageFactory {
    @FindBy(className = "el-message-box__message")
    private WebElement successMessage;

    public GroupPage(WebDriver driver) {
        super(driver);
    }

    @Override
    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getEnsure() {
        return super.getContainsTextButton("确定");
    }
}
