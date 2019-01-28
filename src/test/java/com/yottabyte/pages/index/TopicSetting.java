package com.yottabyte.pages.index;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class TopicSetting extends PageTemplate {
    public TopicSetting(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "el-message__group")
    private WebElement successMessage;

    @FindBy(xpath = "(//span[contains(text(),'确定')][not(@class)])[last()]")
    private WebElement ensureDelete;

    public WebElement getCreateButton() {
        return super.getButton("新建");
    }

    public WebElement getName() {
        return super.getInputElement("名称");
    }

    public WebElement getDescribe() {
        return super.getInputElement("描述");
    }

    public WebElement getEnsureButton() {
        return super.getButton("确定");
    }

    public WebElement getEnsureDelete() {
        return ensureDelete;
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }

}
