package com.yottabyte.pages.app;

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

    @FindBy(xpath = "//input[@placeholder='请输入']")
    private WebElement getSearchInput;

    public WebElement getCreateButton() {
        return super.getButton("新建");
    }

    public WebElement getInstallButton() {
        return super.getButton("安装");
    }

    public WebElement getEnsureButton() {
        return super.getContainsTextButton("确定");
    }

    public WebElement getSuccessMessage() {
        return super.getSuccessMessage();
    }

    public WebElement getGetSearchInput() {
        return getSearchInput;
    }
}
