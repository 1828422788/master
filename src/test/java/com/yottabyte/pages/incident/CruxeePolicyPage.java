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
        return super.getButton("新建");
    }

    @FindBy(xpath = "//input[@placeholder='请输入名称'][@yotta-test='incident-plicy_name-input']")
    private WebElement cruxeePolicyName;

    public WebElement getCruxeePolicyName() {
        return cruxeePolicyName;
    }

    @FindBy(xpath = "//label[text()='描述']/parent::div/following-sibling::div//input[@placeholder='请输入']")
    private WebElement cruxeePolicyDes;

    public WebElement getCruxeePolicyDes() {
        return cruxeePolicyDes;
    }

    @FindBy(xpath = "//label[contains(text(),'应用条件')]/following::div//span[contains(text(),'添加')]")
    private WebElement addAppCondition;

    public WebElement getAddAppCondition() {
        return addAppCondition;
    }

    public WebElement getAppConditionFieldslist() {
        String xpath = "//label[contains(text(),'应用条件')]/following::div[@yotta-test='incident-apply_field-select']/div";
//        return super.getDropdownListByCruxeePageXpath(xpath);
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getV40LastDropdownList();
    }

    public WebElement getAppConditionOperatorsList() {
        String xpath = "//label[contains(text(),'应用条件')]/following::div[@yotta-test='incident-apply_operator-select']/div";
//        return super.getLastDropdownListOnSendPolicyPage(xpath);
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getV40LastDropdownList();

    }

    @FindBy(xpath = "//label[contains(text(),'应用条件')]/following::input[@placeholder='请输入值']")
    private WebElement appConditionInput;

    public WebElement getAppConditionInput() {
        return appConditionInput;
    }

    @FindBy(xpath = "//label[contains(text(),'应用条件')]/following::div//span[contains(text(),'添加')]/parent::button")
    private WebElement addSecondAppCondition;

    public WebElement getAddSecondAppCondition() {
        return addSecondAppCondition;
    }

    public WebElement getAppConditionSecondFieldslist() {
        String xpath = "//label[contains(text(),'应用条件')]/following::div[@yotta-test='incident-apply_field-select']/following::div[@yotta-test='incident-apply_field-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getV40LastDropdownList();
    }

    public WebElement getAppConditionSecondOperatorsList() {
        String xpath = "//label[contains(text(),'应用条件')]/following::div[@yotta-test='incident-apply_operator-select']/following::div[@yotta-test='incident-apply_operator-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getV40LastDropdownList();
    }

    @FindBy(xpath = "//label[contains(text(),'应用条件')]/following::div[@yotta-test='incident-apply_field-select']/following::div[@yotta-test='incident-apply_field-select']/following::input[@placeholder='请输入值']")
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
        String xpath = "//label[contains(text(),'分组条件')]/following::div[@yotta-test='incident-category_field-select']/div";
        return super.getDropdownListByCruxeePageXpath(xpath);
    }

    @FindBy(xpath = "//label[contains(text(),'停止条件')]/following::span[contains(text(),'添加')]/parent::button")
    private WebElement addStopCondition;

    public WebElement getAddStopCondition() {
        return addStopCondition;
    }

    public WebElement getStopConditionNameslist() {
        String xpath = "//span[text()='告警连续不断发送']/following::span[text()='超过']/following::div[@yotta-test='incident-break_unit-select']/following::div[@yotta-test='incident-break_type-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getV40LastDropdownList();
    }

    public WebElement getStopConditionSecondNameslist() {
        String xpath = "//span[text()='告警连续不断发送']/following::div[@yotta-test='incident-break_unit-select']/following::div[@yotta-test='incident-break_type-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getV40LastDropdownList();
    }

    @FindBy(xpath = "//input[@placeholder='请输入数量']")
    private WebElement stopConditionCruCountInput;

    public WebElement getStopConditionCruCountInput() {
        return stopConditionCruCountInput;
    }

    public WebElement getStopConditionLastAlertFieldNamesList() {
        String xpath = "//span[text()='最后一条告警的字段']/following::div[@yotta-test='incident-break_field-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getV40LastDropdownList();
    }

    public WebElement getStopConditionLastAlertFieldOperatorsList() {
        String xpath = "//span[text()='最后一条告警的字段']/following::div[@yotta-test='incident-break_operator-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getV40LastDropdownList();
    }

    @FindBy(xpath = "//span[text()='告警连续不断发送']/following::input[@yotta-test='incident-break_value-input'][@placeholder='请输入']")
    private WebElement stopConditionContinuousAlertInput;
    public WebElement getStopConditionContinuousAlertInput() {
        return stopConditionContinuousAlertInput;
    }

    public WebElement getStopConditionContinuousAlertInputUnitList() {
        String xpath = "//span[text()='告警连续不断发送']/following::div[@yotta-test='incident-break_unit-select']//span[@class='yotta-select-selection-icon']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getV40LastDropdownList();
    }

    @FindBy(xpath = "//span[text()='最后一条告警的字段']/following::input[@placeholder='请输入']")
    private WebElement stopConditionLastAlertFieldInput;
    public WebElement getStopConditionLastAlertFieldInput() {
        return stopConditionLastAlertFieldInput;
    }

    public WebElement getStopConditionLastAlertPriorityList() {
        String xpath = "//label[contains(text(),'停止条件')]/following::div[@yotta-test='incident-break_priority-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getV40LastDropdownList();
    }

    @FindBy(xpath = "//span[text()='未收到新告警的时间']/following::input[@yotta-test='incident-break_value-input']")
    private WebElement stopConditionNoAlertTimeInput;
    public WebElement getStopConditionNoAlertTimeInput() {
        return stopConditionNoAlertTimeInput;
    }

    public WebElement getStopConditionNoAlertTimeInputUnitList() {
        String xpath = "//span[text()='未收到新告警的时间']/following::div[@yotta-test='incident-break_unit-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getV40LastDropdownList();
    }

    public WebElement getSendPolicyNameslist() {
        String xpath = "//label[contains(text(),'发送策略')]/parent::div/following-sibling::div//div[@yotta-test='incident-policy_send_policy-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getV40LastDropdownList();
    }

    public WebElement getNewCruxeePolicy() {
        return super.getButton("新建");
    }

    public WebElement getSaveCruxeePolicy() {
        return super.getButton("保存");
    }

    public WebElement getRetButton() {
        return super.getButton("确定");
    }

    @FindBy(xpath = "//div[@class='yotta-modal-footer']//span[text()='确定']/parent::button")
    private WebElement affirmButton;
    public WebElement getAffirmButton() {
        return affirmButton;
    }

    @FindBy(xpath = "//div[@class='ant-modal-root']//span[text()='返回列表']/parent::button")
    private WebElement retListButton;

    public WebElement getRetListButton() {
        return retListButton;
    }

    @FindBy(xpath = "//span[text()='确定']/parent::button[@yotta-test='dialog-confirm-button']")
    private WebElement confirmButton;
    public WebElement getConfirmButton() {
        return confirmButton;
    }

    /**
     * 合并策略列表界面元素定位
     */
    @FindBy(xpath = "//input[@placeholder='请输入策略名称']")
    private WebElement cruPolicyNameListSearchInput;

    public WebElement getCruPolicyNameListSearchInput() {
        return cruPolicyNameListSearchInput;
    }

    @FindBy(xpath = "//span[text()='编辑']/parent::button")
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

    @FindBy(xpath = "//span[text()='编辑合并策略']/following::div[contains(text(),'高级配置')]")
    private WebElement setAutoRule;

    public WebElement getSetAutoRule() {
        return setAutoRule;
    }

    @FindBy(xpath = "//span[@yotta-test='incident-rule_condition-dom'][text()='添加规则']")
    private WebElement addRuleButton;

    public WebElement getAddRuleButton() {
        return addRuleButton;
    }

    public WebElement getAutoRulesList() {
//        String xpath = "//span[text()='规则1']/following::div[text()='请选择类型']/parent::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        String xpath = "//div[text()='规则1:']/following::div[@yotta-test='incident-rule_type-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getV40LastDropdownList();
    }

    @FindBy(xpath = "//span[text()='归并的告警数量']/following::span[text()='超过']/following::input[@placeholder='请输入数量']")
    private WebElement cruAlertCountInput;

    public WebElement getCruAlertCountInput() {
        return cruAlertCountInput;
    }

    public WebElement getAutoHandleTaskTypeList() {
//        String xpath = "//span[text()='then']/following::div[text()='请选择类型']/parent::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        String xpath = "//div[text()='Then']/following::div[@yotta-test='incident-then_type-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getV40LastDropdownList();
    }

    public WebElement getTaskToUsersList() {
        String xpath = "//div[text()='Then']/following::div[@yotta-test='incident-then_owner-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getV40LastDropdownList();
    }

    @FindBy(xpath = "//div[text()='Then']/following::button[@yotta-test='incident-then_add-icon']")
    private WebElement addSecondAutoHandleRuleButton;
    public WebElement getAddSecondAutoHandleRuleButton() {
        return addSecondAutoHandleRuleButton;
    }

    public WebElement getSecondAutoHandleTaskTypeList() {
        String xpath = "//div[text()='Then']/following::div[@yotta-test='incident-then_type-select']/following::div[@yotta-test='incident-then_type-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getV40LastDropdownList();
    }

    public WebElement getTaskStatusList() {
        String xpath = "//div[text()='Then']/following::div[@yotta-test='incident-then_status-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getV40LastDropdownList();
    }

    @FindBy(xpath = "//label[contains(text(),'策略启用')]/parent::div/following-sibling::div//span[@class='yotta-switch-input']")
    private WebElement startCruxeePolicy;

    public WebElement getStartCruxeePolicy() {
        return startCruxeePolicy;
    }

    @FindBy(xpath = "//div[text()='提示']")
    private WebElement tip;
    public WebElement gitTip() {
        return tip;
    }

    @FindBy(xpath = "//div[contains(text(),'发送策略')]/parent::div")
    private WebElement sendPolicyItem;
    public WebElement getSendPolicyItem() {
        return sendPolicyItem;
    }

}
