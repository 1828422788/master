package com.yottabyte.pages.dashboard;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

/**
 * @author sunxj
 */
public class ListPage extends ListPageFactory {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "ant-message-error")
    private WebElement errorMessage;

    @FindBy(xpath = "//span[contains(text(),'返回列表')]")
    private WebElement returnList;

    public WebElement getReturnList() {
        return returnList;
    }

    public WebElement getErrorMessage() {
        return errorMessage;
    }

    public WebElement getDashBoardName() {
        return this.getInputElement("名称");
    }

    public WebElement getResourceInput() {
        return this.getInputElement("资源标签");
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("(//span[text()='" + name + "'])[last()]/following-sibling::span//input"));
    }
}
