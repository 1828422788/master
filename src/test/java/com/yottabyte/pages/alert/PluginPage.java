package com.yottabyte.pages.alert;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class PluginPage extends PageTemplate {
    public PluginPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "verify-text")
    private WebElement verifyText;

    @FindBy(xpath = "//div[@class='el-message-box__btns']//span[contains(text(),'确定')]")
    private WebElement ensureReplace;

    public WebElement getVerifyText() {
        return verifyText;
    }

    public WebElement getUpload() {
        return super.getButton("上传");
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }

    public WebElement getEnsureButton() {
        return super.getButton("确定");
    }

    public WebElement getSuccessMessage() {
        return super.getSuccessMessage();
    }

    public WebElement getEnsureReplace() {
        return ensureReplace;
    }
}
