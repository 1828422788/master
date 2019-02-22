package com.yottabyte.pages.agent;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//a[text()='下一步']")
    private WebElement next;

    @FindBy(name = "file")
    private WebElement file;

    public WebElement getFile() {
        return file;
    }

    public WebElement getNext() {
        return next;
    }

    public WebElement getAdd() {
        return super.getContainsTextButton("添加");
    }

    public WebElement getDocument() {
        return super.getInputElement("文件或目录");
    }

    public WebElement getWhiteList() {
        return super.getInputElement("路径白名单");
    }

    public WebElement getAppname() {
        return super.getInputElement("appname");
    }

    public WebElement getTag() {
        return super.getInputElement("tag");
    }
}
