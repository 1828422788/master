package com.yottabyte.pages.agent;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj,sunxc
 */
public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "ant-radio-wrapper")
    private WebElement file;

    @FindBy(xpath = "//button[@class='el-button el-button--default el-button--primary ']")
    private WebElement ensure;

    @FindBy(className = "ant-message-success")
    private WebElement successMessage;

    @FindBy(className = "adddata-outcome__summary")
    private WebElement summary;

    @FindBy(xpath = "//span[contains(text(),'清理输出源缓存')]")
    private WebElement cleanOutput;

    @FindBy(xpath = "//label[contains(text(),'分配角色')]/following-sibling::div//i")
    private WebElement roleDropdown;

    public WebElement getRoleDropdown() {
        roleDropdown.click();
        return super.getLastDropdownList();
    }

    public WebElement getRootMessage() {
        return RootMessage;
    }

    @FindBy(xpath = "//label[contains(@title,'文件或目录')]/parent::div/following-sibling::div//div[@class='ant-form-explain']")
    private WebElement RootMessage;

    public WebElement getWhiteListMessage() {
        return WhiteListMessage;
    }

    @FindBy(xpath = "//label[contains(@title,'文件路径白名单')]/parent::div/following-sibling::div//div[@class='ant-form-explain']")
    private WebElement WhiteListMessage;

    public WebElement getWhiteListInput() {
        return WhiteListInput;
    }

    @FindBy(xpath = "//label[contains(@title,'文件路径白名单')]/parent::div/following-sibling::div//input")
    private WebElement WhiteListInput;

    public WebElement getGroupName() {
        return this.getContainsInputElement("名称");
    }

    public WebElement getCreate() {
        return super.getButton("添加");
    }

    public WebElement getEnsureCleanOutput() {
        return super.getButton("确定");
    }

    public WebElement getCleanOutput() {
        return cleanOutput;
    }

    public WebElement getDeleteConfig() {
        return super.getButton("确定");
    }

    public WebElement getSummary() {
        return summary;
    }

    public WebElement getEnsure() {
        return super.getButton("确定");
    }

    public WebElement getFile() {
        return file;
    }

    public WebElement getNext() {
        return super.getButton("下一步");
    }

    public WebElement getAdd() {
        return super.getButton("添加");
    }

    public WebElement getDocument() {
        return getInputElement("文件或目录");
    }

    public WebElement getWhiteList() {
        return getInputElement("文件路径白名单");
    }

    public WebElement getLastModifyTime() {
        return getInputElement("最后修改时间");
    }

    public WebElement getAppname() {
        return getInputElement("appname");
    }

    public WebElement getTag() {
        return getInputElement("tag");
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getCleanCache() {
        return super.getButton("清理缓存");
    }

    public WebElement getMessage() {
        return super.getErrorMessage();
    }
    public WebElement getMemoMessage() {
        return MemoMessage;
    }

    @FindBy(xpath = "//p[@class='_1JjlGgMGUnJmBrqR_9PZl8']")
    private WebElement MemoMessage;

    public WebElement getInputElement(String text) {
        return webDriver.findElement(By.xpath("//label[text()='" + text + "']/ancestor::div/following-sibling::div//input"));
    }

    public WebElement getContainsInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[contains(text(),'" + name + "')]/following-sibling::div//input"));
    }
}
