package com.yottabyte.pages.backup;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

/**
 * @author sunxj
 */
public class ListPage extends EditorPage {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//input[@placeholder='请输入appname']")
    private WebElement appNameInput;
    @FindBy(xpath = "//span[text()='添加']")
    private WebElement addButton;
    @FindBy(xpath = "//div[@role='tablist']/../div[2]//tbody[@class='yotta-table-body']")
    private List<WebElement> tableBodyList;
    @FindBy(className = "el-message__group")
    private WebElement successMessage;
    @FindBy(xpath = "//span[@class='yotta-message-content']")
    private WebElement helpMessage;
    @FindBy(xpath = "//div[@class='yotta-tabs-nav-list']/div[2]/div")
    private WebElement DataList;
    @FindBy(xpath = "//div[@class='yotta-tabs-nav-list']/div[2]/div")
    private WebElement DataListNum;
    @FindBy(xpath = "//table[@yotta-test='backup-data-table']//td[text()='testln']/following-sibling::td//button")
    private WebElement Restore;
    public WebElement getRestore(){
        return Restore;
    }
    @FindBy(xpath = "//table[@yotta-test='backup-data-table']//td[text()='testnyt']/following-sibling::td//button")
    private WebElement Restore1;
    public WebElement getRestore1(){
        return Restore1;
    }
    @FindBy(xpath = "//div[@class='yotta-dialog-content']//p[contains(text(),'已恢复至')]")
    private WebElement Dialog;
    public WebElement getDialog(){
        return Dialog;
    }
    @FindBy(xpath = "//div[@class='yotta-modal-footer']//button")
    private WebElement LogEnsure;
    public WebElement getLogEnsure(){
        return LogEnsure;
    }
    public WebElement getHelpMessage(){
        return helpMessage;
    }
    public WebElement getDataList(){
        return DataList;
    }
    public WebElement getDataListNum(){
        return DataListNum;
    }

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
        return successMessage;
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }
}
