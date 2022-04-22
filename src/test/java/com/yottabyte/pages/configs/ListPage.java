package com.yottabyte.pages.configs;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.DropdownUtils;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindAll;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.FindBys;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;


public class ListPage extends ListPageFactory {
    public ListPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    DropdownUtils dropdownUtils = new DropdownUtils();

    @FindBy(className = "ant-modal-content")
    private WebElement content;

    @FindBy(xpath = "//span[text()='运行统计']/following-sibling::label//div[@class='el-switch__label el-switch__label--right']")
    private WebElement leftLabel;

    @FindBy(xpath = "//div[@class='el-dialog el-dialog--small']//tr")
    private List<WebElement> smallTr;

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//span[text()='请选择或输入']")
    private WebElement tagInputDiv;
    public WebElement getTagInputDiv(){
        return tagInputDiv;
    }

    //@FindBy(xpath = "//label[text()='标签']/parent::div/following-sibling::div/span//div/input")
    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//input")
    private WebElement tagInput;

    //div[@yotta-test='resource_tag-change_resource_tag-select']//span[@class='yotta-select-selection-placeholder']
    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//div[@class='yotta-select-selection-content']")
    private WebElement tagToInput;

    @FindBy(xpath = "//ul[@role='listbox']")
    private WebElement ul;

    @FindBy(className = "el-message-box__message")
    private WebElement message;

//  @FindBy(className = "ant-empty-description")
    @FindBy(className = "yotta-empty-description")
    private WebElement searchResultIsEmpty;

    @FindBy(xpath = "//ul[@yotta-test='operation-more-menu']/li/span[text()='授权']")
    private WebElement auth;

    @FindBy(xpath = "//ul[@yotta-test='operation-more-menu']/li/span[text()='复制']")
    private WebElement copy;

    @FindBy(xpath = "//ul[@yotta-test='operation-more-menu']/li/span[text()='标签']")
    private WebElement label;

    @FindBy(xpath = "//ul[@yotta-test='operation-more-menu']/li/span[text()='删除']")
    private WebElement delete;

    public WebElement getCopy() {
        return copy;
    }

    public WebElement getLabel() {
        return label;
    }

    public WebElement getAuth() {
        return auth;
    }

    public WebElement getDelete() {
        return delete;
    }

    public WebElement getTagInput() {
        return tagInput;
    }

    public WebElement getTagToInput() {
        return tagToInput;
    }

    public WebElement getContent() {
        return content;
    }

    public List<WebElement> getSmallTr() {
        return smallTr;
    }

    public WebElement getLeftLabel() {
        return leftLabel;
    }

//  @FindBy(xpath = "//button[@role='switch']")
    @FindBy(xpath = "//button[@yotta-test='batch_control-batch_operation-button']/preceding::input[@type='checkbox']/parent::span")
    private WebElement switchButton;
    public WebElement getSwitchButton() {
        return switchButton;
    }

    public WebElement getGroup() {
        return ul;
    }

    public WebElement getTagGroup() {
        return dropdownUtils.getYottaDropdownList("resource_tag-change_resource_tag-select");
    }

    public WebElement getResourceGroupList() {
        String xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return super.getLastDropdownList();
    }

    public WebElement getEnsureButton() {
        return super.getButton("确 定");
    }

    public WebElement getMessage() {
        return message;
    }

    public WebElement getSearchInput() { return super.getSearchInput(); }

    public WebElement getSearch() {
        return super.getSearchIcon();
    }

    public WebElement getErrorMessage() {
        return super.getMessage();
    }

    public WebElement getSearchResultIsEmpty() {
        return searchResultIsEmpty;
    }

    @FindBy(xpath = "//div[@yotta-test='table-filter_tag-select']//span[text()='请选择标签']")
    private WebElement filterTagDiv;
    public WebElement getFilterTagDiv(){
        return filterTagDiv;
    }

    //@FindBy(xpath = "//label[text()='标签']/parent::div/following-sibling::div/span//div/input")
    @FindBy(xpath = "//div[@yotta-test='table-filter_tag-select']//input")
    private WebElement filterTagInput;
    public WebElement getFilterTagInput(){
        return filterTagInput;
    }

    public WebElement getFilterTagSelect(){
        String xpath = "//div[@yotta-test='table-filter_tag-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return super.getLastDropdownList();
    }


}
