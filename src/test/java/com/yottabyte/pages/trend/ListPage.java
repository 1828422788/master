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

    public WebElement getNewTrendButton(){
        createButton.click();
        return newTrendButton;
    }



    public WebElement getMessage() {
        return message;
    }
}
