package com.yottabyte.pages.splSearch;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

/**
 * @author sunxj
 */
public class OfflineTaskPageNohup extends PageTemplate {
    public OfflineTaskPageNohup(WebDriver driver) {
        super(driver);
//        driver.manage().window().maximize();
        driver.manage().window().setSize(new Dimension(1,1));
//        driver.manage().window().setPosition(new Point(0, 0));
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

    public WebElement getSearch() {
        return super.getSearchIcon();
    }

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
