package com.yottabyte.pages.appTable;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ListPage extends EditorPage {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getCreate() {
        return super.getButton("新建");
    }

    @FindBy(className = "ant-input")
    private WebElement node;

    @FindBy(id = "queryText")
    private WebElement queryText;

    public WebElement getQueryText() {
        return queryText;
    }

    public WebElement getNode() {
        return node;
    }
}
