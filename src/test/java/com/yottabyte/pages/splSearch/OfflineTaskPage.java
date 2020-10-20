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
        driver.manage().window().fullscreen();
    }

//    @FindBy(className = "el-table_1_column_1")
//    private List<WebElement> tdList;
//
//    @FindBy(xpath = "//td[@class='el-table_1_column_1']")
//    private WebElement emptyElement;

//    public WebElement getEmptyElement() {
//        return emptyElement;
//    }

//    public WebElement getFirstData() {
//        return tdList.get(1);
//    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }

    public WebElement getSuccessMessage() {
        return super.getSuccessMessage();
    }

    public WebElement getSearch() {
        return super.getSearchIcon();
    }

//    @Override
//    protected void isLoaded() throws Error {
//        WebDriverWait wait = new WebDriverWait(webDriver, 10, 1000);
//        wait.until(new ExpectedCondition<Boolean>() {
//            @Override
//            public Boolean apply(WebDriver driver) {
//                return driver.findElements(By.className("el-table_1_column_1")).size() > 1;
//            }
//        });
//    }

    @FindBy(xpath = "//a[contains(text(),'删除')]")
    private WebElement delDownLoadButton;

    public WebElement getDelDownLoadButton() {
        return delDownLoadButton;
    }

    public WebElement getEnsureAfterDelDownload() {
        return super.getButton("确定");
    }

    //@FindBy(className = "el-button--primary")
    @FindBy(xpath = "//span[contains(text(),'确定')]/parent::button")
    private WebElement ensureButton;

    public WebElement getEnsureButton() {
        return ensureButton;
    }

    @FindBy(xpath = "//input[@placeholder='请输入名称']")
    private WebElement dbListPageSearchInput;

    public WebElement getDbListPageSearchInput() {
        return dbListPageSearchInput;
    }

}
