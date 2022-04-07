package com.yottabyte.pages.dictionary;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.utils.DropdownUtils;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;


public class ListPage extends ListPageFactory {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    DropdownUtils dropdownUtils = new DropdownUtils();

    @FindBy(className = "yotta-file-upload-text")
    private WebElement fileName;

    @FindBy(xpath = "//input[@yotta-test='dictionary-upload_name-input']")
    private WebElement name;

    @FindBy(xpath = "//div[@class='yotta-modal-body']//p")
    private WebElement successMessage;

    @FindBy(xpath = "//p[@class='ant-empty-description']")
    private WebElement message;

    @FindBy(xpath = "//div[@class='yotta-pagination-elements'][1]")
    private WebElement totalItem;

    @FindBy(xpath = "//input[@yotta-test='role_authorization-filter-input']")
    private WebElement userFilter;

    @FindBy(xpath = "//span[@yotta-test='role_authorization-filter-icon']")
    private WebElement filterIcon;

    @FindBy(xpath = "//span[text()='无限期']")
    private WebElement indefinitely;

    @FindBy(xpath = "//span[text()='自定义']/preceding-sibling::span")
    private WebElement customize;

    @FindBy(xpath = "//span[text()='无限期']/preceding-sibling::span")
    private WebElement unCustomize;

    @FindBy(xpath = "//td[contains(text(),'今天')]")
    private WebElement dateNow;

    @FindBy(xpath = "//div[@aria-selected='true']/ancestor::td/following-sibling::td[1]")
    private WebElement dateNext;

    @FindBy(xpath = "//input[@placeholder='请选择日期']/ancestor::div[1]")
    private WebElement timeSelector;

    @FindBy(xpath = "//a[text()='选择时间']")
    private WebElement searchTime;

    //在“授权”弹出窗口中，首先用搜索框找用户，然后验证“有限期”列
    @FindBy(xpath = "(//table/tbody/tr[1]/td[3])[last()]")
    private WebElement deadLine;

    @FindBy(xpath = "//div[text()='请输入标签名称']/following-sibling::ul/li/div[1]/input")
    private WebElement groupInput;

    @FindBy(xpath = "//button[@yotta-test='dictionary-upload-button']/span")
    private WebElement uploadButton;

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']/div/div")
    private WebElement tagbutton;

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//input")
    private WebElement tag;

    public WebElement getName() {
        return name;
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getFileName() {
        return fileName;
    }

    public WebElement getUploadButton() {
        return uploadButton;
    }

    public WebElement getGroupInput() {
        return groupInput;
    }

    public WebElement getTagButton() {
        return tagbutton;
    }

    public WebElement Tag() { return tag;}

    public WebElement getGroup() {
        return super.getLastDropdownList();
    }

    public WebElement getUpdate() {
        return super.getContainsTextButton("更新");
    }

    public WebElement getTotalItem() {
        return totalItem;
    }

    public WebElement getFilterIcon() {
        return filterIcon;
    }

    public WebElement getUserFilter() {
        filterIcon.click();
        return userFilter;
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

    public WebElement getDeadLine() {
        return deadLine;
    }

    public WebElement getSearchTime() {
        return searchTime;
    }

    public WebElement getUnCustomize() {
        return unCustomize;
    }

    public WebElement getTagList() {
        return dropdownUtils.getYottaDropdownList("resource_tag-change_resource_tag-select");
    }

    @FindBy(xpath = "//button[@yotta-test='dialog-confirm-button']")
    private WebElement confirmButton; //名称
    public WebElement getConfirmButton() {
        return confirmButton;
    }

    @FindBy(xpath = "//button[@yotta-test='dictionary-upload_confirm-button']")
    private WebElement uploadConfirm;
    public WebElement getUploadConfirm() {
        return uploadConfirm;
    }

    @FindBy(xpath = "(//*[@aria-label='Close'])[last()]")
    private WebElement deleteIcon;
    public WebElement getDeleteIcon() {
        return deleteIcon;
    }

}
