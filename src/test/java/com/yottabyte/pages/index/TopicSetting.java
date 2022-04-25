package com.yottabyte.pages.index;

import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class TopicSetting extends ListPageFactory {
    public TopicSetting(WebDriver driver) {
        super(driver);
    }
    @FindBy(xpath = "//div[@class='yotta-form-field-help-text']")
    private WebElement ErrorMessage;

    public WebElement getErrorMessage() {
        return ErrorMessage;
    }

    @FindBy(xpath = "//p[@class='yotta-dialog-contenttext']")
    private WebElement ErrorLog;
    public WebElement getErrorLog(){
        return ErrorLog;
    }
    public WebElement getCreateButton() {
        return super.getButton("新建");
    }

    public WebElement getName() {
        return getInputElement("名称");
    }

    public WebElement getDescribe() {
        return getInputElement("描述");
    }

    public WebElement getEnsureButton() {
        return super.getButton("保存");
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[text()='" + name + "']/ancestor::div/following-sibling::div//input"));
    }

    public WebElement getReturnList() {
        return super.getButton("返回");
    }

}
