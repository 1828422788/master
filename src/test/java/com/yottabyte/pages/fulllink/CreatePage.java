package com.yottabyte.pages.fulllink;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
        driver.manage().window().setSize(new Dimension(1600, 900));
    }

    @FindBy(xpath = "//div[contains(@class,'yotta-select-option')]")
    private WebElement li;

    @FindBy(xpath = "//label[contains(@class,yotta-switch-round)]")
    private WebElement switchEdit;

    public WebElement getSwitch() {
        return switchEdit;
    }

    @FindBy(xpath = "//span[text()='保存']/parent::button[contains(@class,'disabled')]")
    private WebElement disabledSave;

    public WebElement getDisabledSave() {
        return disabledSave;
    }

    @FindBy(xpath = "//div[@class='yotta-dropdown-menu']//ul")
    private WebElement dropdownList;

    @FindBy(xpath = "//span[@aria-label='SettingOutlined']/parent::button")
    private WebElement settings;

    public WebElement getSettings() {
        settings.click();
        return dropdownList;
    }

    @FindBy(xpath = "//span[@aria-label='GalaxeeOutlined']/parent::button")
    private WebElement dataConfig;

    public WebElement getDataConfig() {
        return dataConfig;
    }

    @FindBy(xpath = "//span[@aria-label='AddOutlined']/parent::button")
    private WebElement addInputItem;

    public WebElement getAddInputItem() {
        return addInputItem;
    }

    @FindBy(xpath = "//span[@aria-label='FilterOutlined']/parent::button")
    private WebElement filter;

    public WebElement getFilter() {
        return filter;
    }

    @FindBy(xpath = "//div[contains(@class,'yotta-textarea')]//textarea")
    private WebElement timelineSPL;

    public WebElement getTimelineSPL() {
        return timelineSPL;
    }

    public WebElement getSave() {
        return getYottaButtonByText("保存");
    }

    public WebElement getEnsure() {
        return getYottaButtonByText("确定");
    }

    public WebElement getCancel() {
        return getYottaButtonByText("取消");
    }

    public WebElement getUpdate() {
        return getYottaButtonByText("更新");
    }

    public WebElement getRequestData() {
        return getYottaButtonByText("请求数据");
    }

    public WebElement getPreview() {
        return getYottaButtonByText("预览该链路图");
    }

    public WebElement getFieldName() {
        return getInputElement("名称关联字段");
    }

    public WebElement getTimestamp() {
        return getInputElement("时间戳关联字段");
    }

    public WebElement getStartField() {
        return getInputElement("边起始关联字段");
    }

    public WebElement getEndField() {
        return getInputElement("边结束关联字段");
    }

    public WebElement getNameSeparator() {
        return getInputElement("名称分割符");
    }

    public WebElement getLayerNumber() {
        return getInputElement("名称分割层数");
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//div[text()='" + name + "']/following-sibling::div//input"));
    }

    public WebElement getToken() {
        return getYottaInput("fulllink_param-template-标识：-input");
    }

    public WebElement getTitle() {
        return getYottaInput("fulllink_param-template-标题：-input");
    }

    public WebElement getDynamicField() {
        return getYottaInput("fulllink_param-template-动态字段：-input");
    }

    @FindBy(xpath = "//div[contains(@class,'yotta-select-menu')]")
    private WebElement dropdownListType;

    @FindBy(xpath = "//div[@yotta-test='fulllink_param-type-select']//span[@class='yotta-select-selection-icon']")
    private WebElement parameterType;
    public WebElement getParameterType() {
        parameterType.click();
        parameterType.click();
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(dropdownListType));
        return dropdownListType;
    }

    @FindBy(xpath = "(//div[@class='_1QKcLCq5ljwLNAWWQDBSOB'])[1]//div[text()]")
    private WebElement firstInput;
    public WebElement getFirstInput() {
        return firstInput;
    }

    @FindBy(xpath = "(//div[@class='_1QKcLCq5ljwLNAWWQDBSOB'])[1]//div[@yotta-test='fulllink_param-list-item-edit-dom']")
    private WebElement firstInputEdit;
    public WebElement getFirstInputEdit() {
        return firstInputEdit;
    }

    @FindBy(xpath = "(//div[@class='_1QKcLCq5ljwLNAWWQDBSOB'])[1]//div[@yotta-test='fulllink_param-list-item-delete-dom']")
    private WebElement firstInputDelete;
    public WebElement getFirstInputDelete() {
        return firstInputDelete;
    }

    @FindBy(xpath = "(//div[@class='_1QKcLCq5ljwLNAWWQDBSOB'])[1]//div[@yotta-test='fulllink_param-item-select']")
    private WebElement firstInputList;
    public WebElement getFirstInputList() {
        firstInputList.click();
        return dropdownListType;
    }

    public WebElement getValue() {
        return getYottaInput("fulllink_param-create-option-value-input");
    }

    public WebElement getLabel() {
        return getYottaInput("fulllink_param-create-option-label-input");
    }

    public WebElement getAdd() {
        return getYottaDiv("fulllink_param-display-option-add-dom");
    }

    public WebElement getDefaultValue() {
        return getYottaDropdownList("fulllink_param-select-value-select");
    }

    public WebElement getSPL() {
        return getYottaTextarea("fulllink_param-dynamic-query-textarea");
    }

    public WebElement getTable() {
        return getYottaTable("table_chart-list-table");
    }

    public WebElement getMessage() {
        return getSuccessMessage();
    }
}