package com.yottabyte.pages.trend;

import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ListPage extends ListPageFactory {
    public ListPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    @FindBy(xpath = "//div[@yotta-test='trend-new_trend-button']/button")
    private WebElement createButton;

    @FindBy(xpath = "//div[text()='新建']")
    private WebElement create;

    @FindBy(xpath = "//li[@yotta-test='trend-normal_trend-menu_item']")
    private WebElement newTrendButton;

    @FindBy(xpath = "//li[@yotta-test='trend-dataset_trend-menu_item']")
    private WebElement newTrendFromDataset;

    @FindBy(xpath = "//span[contains(text(),'标签')]/ancestor::div[contains(@class,'modal-header')]")
    private WebElement tagPanel;

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']")
    private WebElement tagField;

    @FindBy(xpath = "//div[@yotta-test='trend-new_trend_mode_single-dom']")
    private WebElement singleDataset;

    @FindBy(xpath = "//div[@yotta-test='trend-new_trend_mode_multiple-dom']")
    private WebElement multiDataset;

    @FindBy(xpath = "//div[@yotta-test='trend-new_trend_mode_merge-dom']")
    private WebElement unionDataset;

    @FindBy(xpath = "(//tr)[last()]/td[4]")
    private WebElement tagOfTheLastItem;

    @FindBy(xpath = "(//tr)[last()]/td[3]")
    private WebElement appOfTheLastItem;

    @FindBy(xpath = "//li[@yotta-test='trend-operation_authorize-button']/span")
    private WebElement auth;

    @FindBy(xpath = "//li[@yotta-test='trend-operation_copy-button']/span")
    private WebElement copy;

    @FindBy(xpath = "//li[@yotta-test='trend-operation_tag-button']/span")
    private WebElement label;

    @FindBy(xpath = "//li[@yotta-test='trend-operation_delete-button']/span")
    private WebElement delete;

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//div[@class='yotta-select-selection-content']")
    private WebElement tagToInput;

    @FindBy(className = "yotta-pageheader-title")
    private WebElement hideElement;

    public WebElement getHideElement() {
        hideElement.click();
        return hideElement;
    }

    public WebElement getTagToInput() {
        return tagToInput;
    }

    public WebElement getAuth() { return auth; }

    public WebElement getDelete() { return delete; }

    public WebElement getCopy() { return copy; }

    public WebElement getLabel() { return label; }

    public WebElement getAppOfTheLastItem() {
        return appOfTheLastItem;
    }

    public WebElement getTagOfTheLastItem() {
        return tagOfTheLastItem;
    }

    public WebElement getCreate() {
        return create;
    }

    public WebElement getNewTrendButton() {
        createButton.click();
        return newTrendButton;
    }

    public WebElement getNewTrendFromDataset() {
        createButton.click();
        return newTrendFromDataset;
    }

    public WebElement getSingleDataset() {
        return singleDataset;
    }

    public WebElement getMultiDataset() {
        return multiDataset;
    }

    public WebElement getUnionDataset() {
        return unionDataset;
    }

    public WebElement getTagPanel() {
        return tagPanel;
    }

    public WebElement getTagField() {
        tagField.click();
        return this.getLastDropdownList();
    }

    @FindBy(xpath = "//input[@yotta-test='table-filter_text-input']")
    private WebElement searchNameInput; //名称

    public WebElement getSearchNameInput() {
        return searchNameInput;
    }

    @FindBy(xpath = "//span[text()='确定']/parent::button")
    private WebElement ensureButton;

    public WebElement getEnsureButton() {
        return ensureButton;
    }


    //加速
    @FindBy(xpath = "//label[text()='加速功能']/ancestor::div/following-sibling::div//label")
    WebElement accelerationSwitch;
    public WebElement getAccelerationSwitch() {
        return accelerationSwitch;
    }

    @FindBy(name = "timerange")
    WebElement timeRange;
    public WebElement getTimeRange() {
        timeRange.click();
        return dropdownUtils.getLastDropdownList();
    }

    @FindBy(xpath = "//span[@aria-label='QuestionCircle']")
    WebElement infoIcon;
    public WebElement getInfoIcon() {
        return infoIcon;
    }

    @FindBy(xpath = "//*[@role='tooltip']")
    WebElement tooltip;
    public WebElement getTooltip() {
        return tooltip;
    }

    public WebElement getAccelerationManagement() {
        return super.getButton("加速任务管理");
    }
}
