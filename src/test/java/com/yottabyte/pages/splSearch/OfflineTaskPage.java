package com.yottabyte.pages.splSearch;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

/**
 * @author sunxj
 */
public class OfflineTaskPage extends EditorPage {
    public OfflineTaskPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    @FindBy(className = "el-table_1_column_1")
    private List<WebElement> tdList;

    @FindBy(xpath = "//td[@class='el-table_1_column_1']")
    private WebElement emptyElement;

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

    @FindBy(xpath = "//a[contains(text(),'删除')]")
    private WebElement delDownLoadButton;

    public WebElement getDelDownLoadButton() {
        return delDownLoadButton;
    }

    public WebElement getEnsureAfterDelDownload() {
        return super.getButton("确定");
    }

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
