package com.yottabyte.pages.knowledge;

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

    @FindBy(xpath = "//div[text()='全文搜索共 1 个结果']")
    private WebElement searchCount;

    @FindBy(className = "grepKey")
    private WebElement key;

    @FindBy(xpath = "//input[@placeholder='请输入']")
    private WebElement searchInput;

    public WebElement getSearchInput() {
        return searchInput;
    }

    public WebElement getLastDropdownList () {
        String xpath = "//div[@class='yotta-dropdown-menu']//ul";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getSearchAll() {
        return super.getButton("搜索");
    }

    public WebElement getMore() {
        return super.getButton("更多");
    }

    public WebElement getEdit() {
        return webDriver.findElement(By.xpath("//span[text()='编辑']"));
    }

    public WebElement getLabel() {
        return webDriver.findElement(By.xpath("//span[text()='标签']"));
    }

    public WebElement getDelete() {
        return webDriver.findElement(By.xpath("//span[text()='删除']"));
    }

    public WebElement getAuth() {
        return webDriver.findElement(By.xpath("//span[text()='授权']"));
    }

    public WebElement getLabelInput() {
        return webDriver.findElement(By.xpath("//div/span[text()='请选择或输入']"));
    }

    public WebElement getKey() {
        return key;
    }

    public WebElement getSearchCount() {
        return searchCount;
    }

    public WebElement getSearch() {
        return getButton("全文搜索");
    }

    public WebElement getTag() {
        return webDriver.findElement(By.xpath("//input[@class='yotta-select-selection-search']"));
    }

    public WebElement getTagInput() {
        return webDriver.findElement(By.xpath("(//span[@class='yotta-select-selection-icon'])[last()]"));
    }
}
