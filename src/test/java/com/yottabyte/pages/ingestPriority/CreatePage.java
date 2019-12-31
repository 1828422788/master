package com.yottabyte.pages.ingestPriority;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import com.yottabyte.utils.DropdownUtils;
import org.openqa.selenium.StaleElementReferenceException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

/**
 * @author sunxj
 */
public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    public WebElement getAppName(){
        return this.getInputElement("Appname");
    }

    public WebElement getTag() {
        return this.getInputElement("Tag");
    }
    public WebElement getPriority(){
        String xpath = "//div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        DropdownUtils dropdownUtils = new DropdownUtils();
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return dropdownUtils.getLastDropdownList();
    }

//    public WebElement getPriority2() {
//        return super.getDropdownList("优先级");
//    }

    public WebElement getSaveButton() {
        String xpath = "//span[text()='保存']/ancestor::button";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getSuccessMessage() {
        return webDriver.findElement(By.xpath("//p[@class='_1JjlGgMGUnJmBrqR_9PZl8']"));
    }


    public WebElement getErrorMessage() {
        return webDriver.findElement(By.className("ant-message-notice-content"));
    }

    public WebElement getEnsureButton() {
        String xpath = "//span[text()='确定']/ancestor::button";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getInputElement(String text) {
//        String xpath = "//label[text()='" + text + "']//following-sibling::div//input";
        String xpath = "//label[text()='" + text + "']/following-sibling::div//input";
        return webDriver.findElement(By.xpath(xpath));
    }
}
