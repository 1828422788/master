package com.yottabyte.pages.trend;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
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

    @FindBy(xpath = "//div[@class='ant-modal-body']//p")
    private WebElement message;

    @FindBy(xpath = "//span[text() = '创建']/ancestor::button")
    private WebElement createButton;

    @FindBy(xpath = "//div[text() = '新建']")
    private WebElement newTrendButton;

    @FindBy(xpath = "//span[text()='确定']/ancestor::button")
    private WebElement ensureButton;

    @FindBy(xpath= "//div[@class='ant-modal-content']")
    private WebElement tagPanel;

    @FindBy(xpath = "(//div[text()='标签'])[last()]/following-sibling::div[1]")
    private WebElement tagField;

    @FindBy(xpath = "//span[text()='趋势图']/ancestor::div/div/span/input")
    private WebElement searchInput;

    public WebElement getSearchInput(){
        return searchInput;
    }


    public WebElement getNewTrendButton(){
        createButton.click();
        return newTrendButton;
    }

    public WebElement getEnsureButton(){
        return ensureButton;
    }

    public WebElement getMessage() {
        return message;
    }

    public WebElement getTagPanel() {
        return tagPanel;
    }

    public WebElement getTagField() {
        tagField.click();
        return this.getLastDropdownList();
    }



}
