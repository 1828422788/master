package com.yottabyte.pages.alert;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

/**
 * @author sunxj
 */
public class PluginPage extends PageTemplate {
    public PluginPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//div[text()='验证成功']")
    private WebElement verifyText;

    @FindBy(xpath = "//div[@class='el-message-box__btns']//span[contains(text(),'确定')]")
    private WebElement ensureReplace;

    @FindBy(xpath = "//input[@placeholder='请选择插件类型']/preceding-sibling::i")
    private WebElement pluginType;

    public WebElement getPluginType() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(pluginType));
        pluginType.click();
        return webDriver.findElement(By.xpath("(//ul[@class='el-scrollbar__view el-select-dropdown__list'])[last()]"));
    }

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
