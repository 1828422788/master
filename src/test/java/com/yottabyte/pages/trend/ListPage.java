package com.yottabyte.pages.trend;

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

    @FindBy(xpath = "//button[@class='el-button el-button--default el-button--primary ']")
    private WebElement ensureButton;

    @FindBy(className = "el-message__group")
    private WebElement successMessage;

    public WebElement getCreateButton() {
        return super.getButton("新建");
    }

    public WebElement getGroup() {
        return super.getDropdownList("分组");
    }

    public WebElement getEnsure() {
        return super.getContainsTextButton("确定");
    }

    public WebElement getEnsureButton() {
        return ensureButton;
    }

    @Override
    public WebElement getSuccessMessage() {
        return successMessage;
    }

    @Override
    public WebElement getErrorMessage() {
        return successMessage;
    }
}
