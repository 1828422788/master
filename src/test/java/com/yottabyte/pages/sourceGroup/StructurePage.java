package com.yottabyte.pages.sourceGroup;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class StructurePage extends PageTemplate {
    public StructurePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "(//span[text()='AutoTestLogSource'])[1]")
    private WebElement autoTestLogSource;

    @FindBy(className = "el-message__group")
    private WebElement message;

    @FindBy(xpath = "(//span[text()='subSource'])[1]")
    private WebElement subSource;

    @FindBy(xpath = "(//span[text()='AutoTestLogSource'])[1]/following-sibling::div/i[@class='iconfont icon-tianjiatubiaoxuanting_icon']")
    private WebElement addSubSourceButton;

    @FindBy(xpath = "(//span[text()='subSource'])[1]/following-sibling::div/i[@class='iconfont icon-shanchuxuanting_icon']")
    private WebElement deleteSubSourceButton;

    @FindBy(xpath = "(//span[text()='sunxjautotest'])[2]/ancestor::div/following-sibling::div//span")
    private WebElement editSubSource;

    public WebElement getDeleteSubSourceButton() {
        return deleteSubSourceButton;
    }

    public WebElement getEditSubSource() {
        return editSubSource;
    }

    public WebElement getSubSource() {
        return subSource;
    }

    public WebElement getAddSubSourceButton() {
        return addSubSourceButton;
    }

    public WebElement getAutoTestLogSource() {
        return autoTestLogSource;
    }

    public WebElement getSourceName() {
        return super.getInputElement("名称");
    }

    public WebElement getDescribe() {
        return super.getInputElement("描述");
    }

    public WebElement getFatherSource() {
        return super.getDropdownList("父层级");
    }

    public WebElement getSourceGroup() {
        return super.getDropdownList("来源分组");
    }

    public WebElement getHostname() {
        return super.getInputElement("hostname");
    }

    public WebElement getAppname() {
        return super.getInputElement("appname");
    }

    public WebElement getTag() {
        return super.getInputElement("tag");
    }

    public WebElement getFilter() {
        return super.getInputElement("过滤语句");
    }

    public WebElement getSaveButton() {
        return super.getContainsTextButton("保存");
    }

    public WebElement getSuccessMessage() {
        return super.getErrorMessage();
    }

    public WebElement getMessage() {
        return message;
    }

    public WebElement getEnsureButton() {
        return super.getContainsTextButton("确定");
    }
}
