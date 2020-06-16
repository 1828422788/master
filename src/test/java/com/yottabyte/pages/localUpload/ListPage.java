package com.yottabyte.pages.localUpload;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ListPage extends PageTemplate {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//span[@class='ant-progress-text']/ancestor::div/following-sibling::span")
    private WebElement verifyText;

    public WebElement getVerifyText() {
        return verifyText;
    }

    public WebElement getTag() {
        return getInputElement("Tag");
    }

    public WebElement getAppName() {
        return getInputElement("Appname");
    }

    public WebElement getUploadButton() {
        return super.getButton("上传");
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[contains(text(),'" + name + "')]/following-sibling::div//input"));
    }
}
