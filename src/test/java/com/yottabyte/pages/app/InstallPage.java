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
