package com.yottabyte.pages.splSearch;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.List;

/**
 * @author sunxj
 */
public class OfflineTaskPage extends PageTemplate {
    public OfflineTaskPage(WebDriver driver) {
        super(driver);
//        isLoaded();
    }

    @FindBy(className = "el-table_1_column_1")
    private List<WebElement> tdList;

    @FindBy(xpath = "//td[@class='el-table_1_column_1']")
    private WebElement emptyElement;

    @FindBy(className = "el-button--primary")
    private WebElement ensureButton;

    public WebElement getEmptyElement() {
        return emptyElement;
    }

    public WebElement getFirstData() {
        return tdList.get(1);
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }

    public WebElement getSuccessMessage() {
        return super.getSuccessMessage();
    }

    public WebElement getEnsureButton() {
        return ensureButton;
    }

    public WebElement getSearch() {
        return super.getSearchIcon();
    }

}
