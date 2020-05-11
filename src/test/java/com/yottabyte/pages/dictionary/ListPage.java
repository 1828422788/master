package com.yottabyte.pages.dictionary;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.DropdownUtils;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.security.cert.X509Certificate;


public class ListPage extends ListPageFactory {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    DropdownUtils dropdownUtils = new DropdownUtils();

    @FindBy(xpath = "//div[text()='提示']")
    private WebElement tip;

    @FindBy(className = "ant-modal-content")
    private WebElement popUpWindow;

    @FindBy(xpath = "//span[text()='取消']/ancestor::button")
    private WebElement cancel;

    @FindBy(className = "ant-upload-list-item-name")
    private WebElement fileName;

    @FindBy(xpath = "//span[text()='.csv']/preceding-sibling::input[@placeholder='请输入名称']")
    private WebElement name;

    @FindBy(xpath = "//div[@class='ant-modal-body']//p")
    private WebElement successMessage;

    @FindBy(xpath = "//p[@class='ant-empty-description']")
    private WebElement message;

    @FindBy(className = "el-table__empty-text")
    private WebElement emptyText;

    @FindBy(xpath = "//div[@class='ant-modal-footer']//button")
    private WebElement ensureUpload;

    @FindBy(xpath = "//div[@class='ant-modal-body']//button")
    private WebElement ensureDelete;

    @FindBy(xpath = "//input[@placeholder='请输入名称']")
    private WebElement dictionaryFilter;

    @FindBy(xpath = "//span[@class='_1a4SFPSKE5LHZ9oIlWNopk']/span")
    private WebElement totalItem;

    @FindBy(className = "_2dAJUXRHMFMdem7AELR7it")
    private WebElement UserFilter;

    @FindBy(xpath = "//div[@class='ant-modal-body']//button")
    private WebElement ensureButton2;

    @FindBy(xpath = "//span[text()='无限期']")
    private WebElement indefinitely;

    @FindBy(xpath = "//span[text()='自定义']/preceding-sibling::span")
    private WebElement customize;

    @FindBy(xpath = "//span[text()='无限期']/preceding-sibling::span")
    private WebElement unCustomize;

    @FindBy(xpath = "//div[@aria-selected='true']")
    private WebElement dateNow;

    @FindBy(xpath = "//div[@aria-selected='true']/ancestor::td/following-sibling::td[1]")
    private WebElement dateNext;

    @FindBy(xpath = "//input[@placeholder='请选择日期时间']/ancestor::div[1]")
    private WebElement timeSelector;

    @FindBy(xpath = "//a[text()='选择时间']")
    private WebElement searchTime;

    @FindBy(xpath = "//div[@class='ant-calendar-time-picker-combobox']/div[1]/ul/li[24]")
    private WebElement hour23;

    @FindBy(xpath = "//div[@class='ant-calendar-time-picker-combobox']/div[2]/ul/li[60]")
    private WebElement minute59;

    @FindBy(xpath = "//div[@class='ant-calendar-time-picker-combobox']/div[3]/ul/li[60]")
    private WebElement second59;

    @FindBy(xpath = "//a[text()='选择时间']/following-sibling::a[text()='确 定']")
    private WebElement dateSelectConfirm;

    @FindBy(xpath = "//a[text()='选择日期']/following-sibling::a[text()='确 定']")
    private WebElement timeSelectConfirm;

    @FindBy(xpath = "//div[@class='ant-spin-container']/table/tbody/tr[1]/td[3]")
    private WebElement deadLine;

    public WebElement getName() {
        return name;
    }

    public WebElement getEnsureDelete() {
        return ensureDelete;
    }

    public WebElement getEnsureUpload() {
        return ensureUpload;
    }

    public WebElement getEmptyText() {
        return emptyText;
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getFileName() {
        return fileName;
    }

    public WebElement getUploadButton() {
        return super.getButton("上传");
    }

    public WebElement getGroupInput() {
        return super.getInputElement("字典标签");
    }

    @Override
    public WebElement getTag() {
        return super.getTag();
    }

    public WebElement getGroup() {
        return super.getLastDropdownList();
    }

    public WebElement getEnsureButton() {
        return super.getButton("确定");
    }

    public WebElement getAuthCancelButton() {
        return super.getButton("取消");
    }

    public WebElement getUpdate() {
        return super.getContainsTextButton("更新");
    }

    public WebElement getDictionaryFilter() {
        return dictionaryFilter;
    }

    public WebElement getTotalItem() {
        return totalItem;
    }

    public WebElement getClearIconOld() {
        return super.getClearIcon("old");
    }

    public WebElement getClearIconFirst() {
        return super.getClearIcon("first");
    }

    public WebElement getClearIconSecond() {
        return super.getClearIcon("second");
    }

    public WebElement getUserFilter() {
        return UserFilter;
    }

    public WebElement getEnsureButton2() {
        return ensureButton2;
    }

    @Override
    public WebElement getMessage() {
        return message;
    }

    public WebElement getIndefinitely() {
        return indefinitely;
    }

    public WebElement getCustomize() {
        return customize;
    }

    public WebElement getDateNow() {
        return dateNow;
    }

    public WebElement getDateNext() {
        return dateNext;
    }

    public WebElement getTimeSelector() {
        return timeSelector;
    }

    public WebElement getDateSelectConfirm() {
        return dateSelectConfirm;
    }

    public WebElement getDeadLine() {
        return deadLine;
    }

    public WebElement getSearchTime() {
        return searchTime;
    }

    public WebElement getHour23() {
        return hour23;
    }

    public WebElement getMinute59() {
        return minute59;
    }

    public WebElement getSecond59() {
        return second59;
    }

    public WebElement getTimeSelectConfirm() {
        return timeSelectConfirm;
    }

    public WebElement getUnCustomize() {
        return unCustomize;
    }

    public WebElement getPopUpWindow() {
        return popUpWindow;
    }

    public WebElement getCancel() {
        return cancel;
    }

    public WebElement getTip() {
        return tip;
    }

    public WebElement getTagList(){
        return dropdownUtils.getDropdownList("标签");
    }
}
