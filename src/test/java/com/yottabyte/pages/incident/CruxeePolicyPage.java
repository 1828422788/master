package com.yottabyte.pages.incident;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

/**
 * 合并策略界面元素定位
 */

public class CruxeePolicyPage extends PageTemplate {

    public CruxeePolicyPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    private WebElement getSelectors(WebElement element) {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        element.click();
        List<WebElement> list = webDriver.findElements(By.className("el-select-dropdown__list"));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(list.get(list.size() - 1)));
        return list.get(list.size() - 1);
    }

    public WebElement getCreateCruxeePolicy() {
        return super.getButton("新 建");
    }

    @FindBy(xpath = "//input[@placeholder='请输入名称']")
    private WebElement cruxeePolicyName;

    public WebElement getCruxeePolicyName() {
        return cruxeePolicyName;
    }

    @FindBy(xpath = "//label[contains(text(),'描述:')]/following::input[@placeholder='请输入']")
    private WebElement cruxeePolicyDes;

    public WebElement getCruxeePolicyDes() {
        return cruxeePolicyDes;
    }

    @FindBy(xpath = "//label[contains(text(),'应用条件')]/following::span[contains(text(),'添加')]")
    private WebElement addAppCondition;

    public WebElement getAddAppCondition() {
        return addAppCondition;
    }

    public WebElement getAppConditionFieldslist() {
        String xpath = "//label[contains(text(),'应用条件')]/following::div//div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        return super.getDropdownListByCruxeePageXpath(xpath);
    }

    public WebElement getAppConditionOperatorsList() {
//        String xpath = "//div[contains(text(), '请选择关系']/following::span/i";
        String xpath = "//label[contains(text(),'应用条件')]/following::div//div[@class='ant-select-selection__rendered']/following-sibling::span/i//following::div//div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    @FindBy(xpath = "//input[@placeholder='请输入值']")
    private WebElement appConditionInput;

    public WebElement getAppConditionInput() {
        return appConditionInput;
    }

    @FindBy(xpath = "//label[contains(text(),'应用条件')]/following::span[contains(text(),'添 加')]/parent::button")
    private WebElement addSecondAppCondition;

    public WebElement getAddSecondAppCondition() {
        return addSecondAppCondition;
    }

    public WebElement getAppConditionSecondFieldslist() {
        String xpath = "//label[contains(text(),'应用条件')]/following::input[@placeholder='请输入值'][@value='事件']/following::div[contains(text(),'请选择字段')]/parent::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getAppConditionSecondOperatorsList() {
        String xpath = "//label[contains(text(),'应用条件')]/following::input[@placeholder='请输入值'][@value='事件']/following::div[contains(text(),'请选择关系')]/parent::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    @FindBy(xpath = "//label[contains(text(),'应用条件')]/following::input[@placeholder='请输入值'][@value='事件']/following::input[@placeholder='请输入值']")
    private WebElement appConditionSecondInput;

    public WebElement getAppConditionSecondInput() {
        return appConditionSecondInput;
    }

    @FindBy(xpath = "//label[contains(text(),'分组条件')]/following::span[contains(text(),'添加')]")
    private WebElement addGroupCondition;

    public WebElement getAddGroupCondition() {
        return addGroupCondition;
    }

    public WebElement getGroupConditionFieldslist() {
        String xpath = "//label[contains(text(),'分组条件')]/following::div//div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        return super.getDropdownListByCruxeePageXpath(xpath);    }

    @FindBy(xpath = "//label[contains(text(),'停止条件')]/following::span[contains(text(),'添 加')]/parent::button")
    private WebElement addStopCondition;

    public WebElement getAddStopCondition() {
        return addStopCondition;
    }

    public WebElement getStopConditionNameslist() {
        String xpath = "//div[text()='告警连续不断发送']/following::span[text()='超过']/following-sibling::input[@placeholder='请输入'][@type='text']/following::div[@class='ant-select-selection__rendered']/following::div//div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getStopConditionSecondNameslist() {
        String xpath = "//div[text()='告警连续不断发送']/following::input[@placeholder='请输入']/following::div[contains(text(),'小时')]/following::div//div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    @FindBy(xpath = "//input[@placeholder='请输入数量']")
    private WebElement stopConditionCruCountInput;

    public WebElement getStopConditionCruCountInput() {
        return stopConditionCruCountInput;
    }

    public WebElement getStopConditionLastAlertFieldNamesList() {
        String xpath = "//div[text()='最后一条告警的字段']/following::div[contains(text(),'请选择字段')]/parent::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getStopConditionLastAlertFieldOperatorsList() {
        String xpath = "//div[text()='最后一条告警的字段']/following::div[text()='请选择关系']/parent::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    @FindBy(xpath = "//div[text()='告警连续不断发送']/following::input[@placeholder='请输入']")
    private WebElement stopConditionContinuousAlertInput;

    public WebElement getStopConditionContinuousAlertInput() {
        return stopConditionContinuousAlertInput;
    }

    public WebElement getStopConditionContinuousAlertInputUnitList() {
        String xpath = "//div[text()='告警连续不断发送']/following::span[text()='超过']/following-sibling::input[@placeholder='请输入'][@type='text']/following::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

//    @FindBy(xpath = "//div[contains(text(),'最后一条告警的字段')]/following::div[contains(text(),'请选择字段')]/following::div[contains(text(),'请选择关系')]/following::div[@class='ant-select-selection__rendered']/following-sibling::span/i")
//    private WebElement stopConditionLastAlertFieldInput;

    public WebElement getStopConditionLastAlertFieldInputList() {
        String xpath = "//div[contains(text(),'最后一条告警的字段')]/following::div[contains(text(),'请选择字段')]/following::div[contains(text(),'请选择关系')]/following::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    @FindBy(xpath = "//div[text()='未收到新告警的时间']/following::input[@placeholder='请输入']")
    private WebElement stopConditionNoAlertTimeInput;

    public WebElement getStopConditionNoAlertTimeInput() {
        return stopConditionNoAlertTimeInput;
    }

    public WebElement getStopConditionNoAlertTimeInputUnitList() {
        String xpath = "//div[text()='未收到新告警的时间']/following::span[text()='超过']/following-sibling::input[@placeholder='请输入'][@type='text']/following::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getSendPolicyNameslist() {
        String xpath = "//div[text()='请选择']/parent::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getSaveCruxeePolicy() {
        return super.getButton("新 建");
    }

    public WebElement getRetButton() {
        return super.getButton("确定");
    }

    @FindBy(xpath = "//div[@class='ant-modal-root']//span[text()='返回列表']/parent::button")
    private WebElement retListButton;

    public WebElement getRetListButton() {
        return retListButton;
    }

    /**
     * 合并策略列表界面元素定位
     */
    @FindBy(xpath = "//input[@placeholder='请输入策略名称']")
    private WebElement cruPolicyNameListSearchInput;

    public WebElement getCruPolicyNameListSearchInput() {
        return cruPolicyNameListSearchInput;
    }

    @FindBy(xpath = "//a[text()='编辑']")
    private WebElement editCruPolicyNameButton;
    public WebElement getEditCruPolicyNameButton() {
        return editCruPolicyNameButton;
    }

    @FindBy(xpath = "//a[text()='删除']")
    private WebElement delCruPolicyNameButton;

    public WebElement getDelCruPolicyNameButton() {
        return delCruPolicyNameButton;
    }

    @FindBy(xpath = "//span[text()='确定']/parent::button")
    private WebElement confirmDelCruPolicyName;

    public WebElement getConfirmDelCruPolicyName() {
        return confirmDelCruPolicyName;
    }

    @FindBy(xpath = "//span[text()='配置合并策略']/following::span[text()='配置自动规则']")

    private WebElement setAutoRule;

    public WebElement getSetAutoRule() {
        return setAutoRule;
    }

    @FindBy(xpath = "//span[text()='添加规则']/parent::div")
    private WebElement addRuleButton;

    public WebElement getAddRuleButton() {
        return addRuleButton;
    }

    public WebElement getAutoRulesList() {
        String xpath = "//div[text()='规则1']/following::div[text()='请选择类型']/parent::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    @FindBy(xpath = "//div[text()='归并的告警数量']/following::span[text()='超过']/following::input[@placeholder='请输入数量']")
    private WebElement cruAlertCountInput;

    public WebElement getCruAlertCountInput() {
        return cruAlertCountInput;
    }

    public WebElement getAutoHandleTaskTypeList() {
        String xpath = "//div[text()='then']/following::div[text()='请选择类型']/parent::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getTaskToUsersList() {
        String xpath = "//div[text()='then']/following::div[text()='将任务分配给']/following::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    @FindBy(xpath = "//div[text()='then']/following::span[text()='添 加']/parent::button")
    private WebElement addSecondAutoHandleRuleButton;

    public WebElement getAddSecondAutoHandleRuleButton() {
        return addSecondAutoHandleRuleButton;
    }

    public WebElement getSecondAutoHandleTaskTypeList() {
        String xpath = "//div[text()='then']/following::div[text()='Derek']/following::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    public WebElement getTaskStatusList() {
        String xpath = "//div[text()='then']/following::div[text()='修改状态为']/following::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

}
