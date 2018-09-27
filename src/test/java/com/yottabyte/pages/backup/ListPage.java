package com.yottabyte.pages.backup;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

/**
 * @author sunxj
 */
public class ListPage extends PageTemplate {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//input[@placeholder='请输入appname']")
    private WebElement appNameInput;

    @FindBy(xpath = "//span[text()='添加']")
    private WebElement addButton;

    @FindBy(className = "el-table__body")
    private List<WebElement> tableBodyList;

    public WebElement getEnsureButton() {
        return super.getContainsTextButton("确定");
    }

    public WebElement getAppNameTable() {
        return tableBodyList.get(0);
    }

    public WebElement getAppNameInput() {
        return appNameInput;
    }

    public WebElement getAddButton() {
        return addButton;
    }

    public WebElement getSuccessMessage() {
        return super.getSuccessMessage();
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }
}
