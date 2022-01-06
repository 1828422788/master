package com.yottabyte.pages.localUpload;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

/**
 * @author sunxj
 */
public class ListPage extends PageTemplate {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//p")
    private WebElement verifyText;

    public WebElement getVerifyText() {
        return verifyText;
    }

    public WebElement getTag() {
        return getInputElement("tag");
    }

    public WebElement getAppName() {
        return getInputElement("appname");
    }

    public WebElement getUploadButton() {
        return super.getButton("上传");
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[contains(text(),'" + name + "')]/parent::div/following-sibling::div//input"));
    }

    public WebElement getConfirmbutton() {
        WebElement element = webDriver.findElement(By.xpath("//span[text()='去验证']/parent::button[@yotta-test='dialog-confirm-button']"));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        return element;
    }

    public WebElement getCancelbutton() {
        return webDriver.findElement(By.xpath("//span[text()='取消']/parent::button[@yotta-test='dialog-cancel-button']"));
    }

}
