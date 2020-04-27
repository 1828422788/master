package com.yottabyte.pages.knowledge;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

/**
 * @author sunxj
 */
public class DetailPage extends PageTemplate {
    public DetailPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "ql-file-name")
    private List<WebElement> fileName;

    public List<WebElement> getFileName() {
        return fileName;
    }

    public WebElement getCode() {
        return inputValue("事件代码: ");
    }

    public WebElement getTag() {
        return inputValue("资源标签");
    }

    public WebElement getDesc() {
        return inputValue("事件描述");
    }

    public WebElement getSolution() {
        return inputValue("解决方案");
    }

    private WebElement inputValue(String name) {
        return webDriver.findElement(By.xpath("//div[contains(text(),'" + name + "')]/following-sibling::div"));
    }
}
