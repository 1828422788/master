package com.yottabyte.pages.alert;

import com.yottabyte.pages.EditorPage;
import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

/**
 * @author sunxj
 */
public class PluginPage extends ListPageFactory {
    public PluginPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    @FindBy(xpath = "//div[text()='验证成功']")
    private WebElement verifyText;
    public WebElement getVerifyText() {
        return verifyText;
    }

    @FindBy(xpath = "//input[@placeholder='请选择插件类型']/preceding-sibling::i")
    private WebElement pluginType;

    public WebElement getPluginType() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(pluginType));
        pluginType.click();
        return webDriver.findElement(By.xpath("(//ul[@class='el-scrollbar__view el-select-dropdown__list'])[last()]"));
    }

    public WebElement getUpload() {
        return super.getButton("上传");
    }

    public WebElement getDownload() {
        return super.getButton("下载");
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }

//    @FindBy(xpath = "//button[@yotta-test='alert-upload_confirm-button']")
//    private WebElement ensureButton;
    public WebElement getEnsureButton() {
        return super.getButton("确定");
    }

    public WebElement getSuccessMessage() {
        return super.getSuccessMessage();
    }

    @FindBy(xpath = "//button[@yotta-test='dialog-confirm-button']")
    private WebElement ensureReplace;
    public WebElement getEnsureReplace() {
        return ensureReplace;
    }

    @FindBy(xpath = "//div[text()='存在同名插件']")
    private WebElement verifyTextNameDup;
    public WebElement getVerifyTextNameDup() {
        return verifyTextNameDup;
    }
}
