package com.yottabyte.pages.fulllink;

import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ListPage extends ListPageFactory {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//div[text()='名称：']/following-sibling::input")
    private WebElement name;

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//div[@class='yotta-select-selection-content']")
    private WebElement tagToInput;

    public WebElement getTagToInput() {
        return tagToInput;
    }

   public WebElement getLabel() { return this.getFunction("标签"); }

   public WebElement getRename() { return this.getFunction("重命名"); }

    public WebElement getAuth() { return this.getFunction("授权"); }

    public WebElement getDelete() { return this.getFunction("删除"); }

    public WebElement getFunction(String name) {
        String xpath = "//ul[@yotta-test='operation-more-menu']/li/span[text()='" + name + "']";
        return webDriver.findElement(By.xpath(xpath));
        }

    public WebElement getName() {
        return name;
    }
}
