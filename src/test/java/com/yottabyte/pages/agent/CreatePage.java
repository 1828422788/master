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

    @FindBy(xpath = "//button[@class='el-button el-button--default el-button--primary ']")
    private WebElement ensure;

    @FindBy(xpath = "el-message__group")
    private WebElement successMessage;

    @FindBy(className = "adddata-outcome__summary")
    private WebElement summary;

    public WebElement getSummary() {
        return summary;
    }

    public WebElement getEnsure() {
        return ensure;
    }

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
        return super.getInputElement("文件路径白名单");
    }

    public WebElement getLastModifyTime() {
        return super.getInputElement("最后修改时间");
    }

    public WebElement getAppname() {
        return super.getInputElement("appname");
    }

    public WebElement getTag() {
        return super.getInputElement("tag");
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }
}
