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

    @FindBy(xpath = "//p[text()='您确定要删除该配置项吗？']/ancestor::div[@class='el-message-box']//button[@class='el-button el-button--default el-button--primary ']")
    private WebElement deleteConfig;

    @FindBy(xpath = "//li[contains(text(),'清理输出源缓存')]")
    private WebElement cleanOutput;

    @FindBy(xpath = "//p[text()='清理输出源缓存将导致数据重发，是否继续？']/ancestor::div[@class='el-message-box__content']/following-sibling::div//span[contains(text(),'确定')]")
    private WebElement ensureCleanOutput;

    public WebElement getEnsureCleanOutput() {
        return ensureCleanOutput;
    }

    public WebElement getCleanOutput() {
        return cleanOutput;
    }

    public WebElement getDeleteConfig() {
        return deleteConfig;
    }

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

    public WebElement getCleanCache() {
        return super.getButton("清理缓存");
    }
}
