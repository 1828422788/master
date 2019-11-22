package com.yottabyte.pages.index;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
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

    @FindBy(xpath = "//div[@class='ant-modal-body']//p")
    private WebElement successMessage;

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

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getErrorMessage() {
        return successMessage;
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//span[text()='" + name + "']/ancestor::div/following-sibling::div/input"));
    }

}
