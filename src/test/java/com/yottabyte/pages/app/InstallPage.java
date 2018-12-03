package com.yottabyte.pages.app;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

/**
 * @author sunxj
 */
public class InstallPage extends PageTemplate {
    public InstallPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "verify-text")
    private WebElement verifyText;

    @FindBy(xpath = "//span[text()='分组预览']/ancestor::div[@class='yw-one-step active']")
    private WebElement groupPreview;

    @FindBy(xpath = "//span[text()='资源预览']/ancestor::div[@class='yw-one-step active']")
    private WebElement resourcePreview;

    @FindBy(xpath = "(//td[@class='el-table_1_column_2'])[1]")
    private WebElement repeatResource;

    @FindBy(className = "icon-bianji")
    private WebElement editButton;

    @FindBy(className = "confirm_icon")
    private WebElement confirm;

    @FindBy(xpath = "//span[@class='confirm_icon']/preceding-sibling::input")
    private WebElement renameInput;

    @FindBy(xpath = "//span[contains(text(),'AutoTestSourceForApp')]")
    private WebElement editText;

    @FindBy(xpath = "//i[@class='el-icon-circle-check']/following-sibling::span")
    private WebElement importSuccess;

    public WebElement getImportSuccess() {
        return importSuccess;
    }

    public WebElement getEditText() {
        return editText;
    }

    public WebElement getRenameInput() {
        return renameInput;
    }

    public WebElement getConfirm() {
        return confirm;
    }

    public WebElement getEditButton() {
        return editButton;
    }

    public WebElement getRepeatResource() {
        return repeatResource;
    }

    public WebElement getRole() {
        return super.getDropdownList("分配角色");
    }

    public WebElement getResource() {
        return super.getDropdownList("日志来源");
    }

    public WebElement getNextButton() {
        return super.getButton("下一步");
    }

    public WebElement getErrorInfo() {
        return super.getButton("未知错误，请检查文件格式及内容是否正确，然后重新上传");
    }

    public WebElement getCompleteButton() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.invisibilityOf(super.getButton("下一步")));
        return super.getButton("完成");
    }

    public WebElement getVerifyText() {
        return verifyText;
    }

    public WebElement getGroupPreview() {
        return groupPreview;
    }

    public WebElement getResourcePreview() {
        return resourcePreview;
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }
}
