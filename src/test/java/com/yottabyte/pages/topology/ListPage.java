package com.yottabyte.pages.topology;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

/**
 * @author sunxj
 */
public class ListPage extends ListPageFactory {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//div[text()='标签']/following-sibling::div//input")
    private WebElement tag;

    @FindBy(className = "ant-form-explain")
    private WebElement errorMessage;

    public WebElement getErrorMessage() {
        return errorMessage;
    }

    @Override
    public WebElement getTag() {
        return tag;
    }

    public WebElement getNameInput() {
        return getInputElement("名称");
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[text()='" + name + "']/ancestor::div/following-sibling::div//input"));
    }
}
