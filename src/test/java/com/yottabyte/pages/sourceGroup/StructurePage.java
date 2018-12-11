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

    @FindBy(xpath = "//i[@class='el-icon-circle-check']/following-sibling::span")
    private WebElement importSuccessMsg;

    @FindBy(className = "verify-text")
    private WebElement verifyText;

    @FindBy(className = "yw-list-title")
    private WebElement preview;

    @FindBy(xpath = "(//span[text()='AutoTestUploadFather']/ancestor::div[@class='item-title tree-row'])[2]/following-sibling::div//span")
    private WebElement uploadSubSource;

    @FindBy(xpath = "(//span[text()='AutoTestEditFather']/ancestor::div[@class='item-title tree-row'])[2]/following-sibling::div//span")
    private WebElement autoTestEditSubSource;

    @FindBy(xpath = "//div[@class='source-repeat-body'][contains(text(),'已存在的日志来源')]/span")
    private WebElement cancelExist;

    @FindBy(className = "icon-bianji")
    private WebElement editButton;

    @FindBy(xpath = "//span[@class='confirm_icon source-edit-button']/preceding-sibling::input")
    private WebElement editInput;

    @FindBy(className = "source-edit-button")
    private WebElement saveEditButton;

    @FindBy(xpath = "//span[text()='AutoTestUploadSubSource']")
    private WebElement autoTestUploadSubSource;

    @FindBy(xpath = "//span[text()='AutoTestUploadFather']")
    private WebElement autoTestUploadFather;

    @FindBy(xpath = "//span[text()='AutoTestEditSubSource']")
    private WebElement autoTestEditSource;

    @FindBy(xpath = "//span[text()='AutoTestEditFather']")
    private WebElement autoTestEditFather;

    @FindBy(xpath = "//div[@class='el-form-item__content']/span")
    private WebElement content;

    public WebElement getContent() {
        return content;
    }

    public WebElement getAutoTestEditFather() {
        return autoTestEditFather;
    }

    public WebElement getAutoTestEditSource() {
        return autoTestEditSource;
    }

    public WebElement getAutoTestEditSubSource() {
        return autoTestEditSubSource;
    }

    public WebElement getCancelExist() {
        return cancelExist;
    }

    public WebElement getEditButton() {
        return editButton;
    }

    public WebElement getEditInput() {
        return editInput;
    }

    public WebElement getSaveEditButton() {
        return saveEditButton;
    }

    public WebElement getAutoTestUploadSubSource() {
        return autoTestUploadSubSource;
    }

    public WebElement getAutoTestUploadFather() {
        return autoTestUploadFather;
    }

    public WebElement getUploadSubSource() {
        return uploadSubSource;
    }

    public WebElement getVerifyText() {
        return verifyText;
    }

    public WebElement getImportSuccessMsg() {
        return importSuccessMsg;
    }

    public WebElement getPreview() {
        return preview;
    }

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

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }

    public WebElement getMessage() {
        return message;
    }

    public WebElement getEnsureButton() {
        return super.getContainsTextButton("确定");
    }

    public WebElement getImportAndExportButton() {
        return super.getButton("导入/导出");
    }

    public WebElement getImportButton() {
        this.getImportAndExportButton().click();
        return super.getButton("导入");
    }

    public WebElement getExportButton() {
        this.getImportAndExportButton().click();
        return super.getButton("导出");
    }

    public WebElement getNextButton() {
        return super.getButton("下一步");
    }

    public WebElement getCompleteButton() {
        return super.getButton("完成");
    }
}
