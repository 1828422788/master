package com.yottabyte.pages.dataset;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import static org.junit.Assert.assertEquals;

/**
 * @author jiangnd
 */
public class ListPage extends ListPageFactory {
    public ListPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    @FindBy(xpath = "//input[@yotta-test='dataset-name-input']")
    private WebElement name; //名称
    public WebElement getName() {
        return name;
    }

    @FindBy(xpath = "//input[@yotta-test='dataset-alia-input']")
    private WebElement alias;  //别名
    public WebElement getAlias() {
        return alias;
    }

    @FindBy(xpath = "//input[@yotta-test='dataset-nothing-radio']")
    private WebElement nothing;
    public WebElement getNothing() {
        return nothing;
    }

    @FindBy(xpath = "//input[@yotta-test='dataset-convergence-radio']")
    private WebElement convergence;
    public WebElement getConvergence() {
        return convergence;
    }

    @FindBy(xpath = "//input[@yotta-test='dataset-inherit-radio']")
    private WebElement inherit;
    public WebElement getInherit() {
        return inherit;
    }

    @FindBy(xpath = "//input[@yotta-test='dataset-queryfilter-input']")
    private WebElement spl;
    public WebElement getSpl() {
        return spl;
    }

    @FindBy(xpath = "//span[text()='确定']/parent::button")
    private WebElement save; //修改节点时候的保存按钮

    public WebElement getSave() {
        return save;
    }

    public WebElement getAppList() {
        return dropdownUtils.getYottaDropdownList("dataset-apps-select");
    }

    @FindBy(xpath = "//label[contains(text(),'资源标签')]/following::input")
    private WebElement resourceTagInput;

    public WebElement getResourceTagInput() {
        return resourceTagInput;
    }

    @FindBy(xpath = "(//input[@yotta-test='dataset-item-input'])[last()]")
    private WebElement fieldName;
    public WebElement getFieldName() {
        return fieldName;
    }

    @FindBy(xpath = "(//div[@yotta-test='dataset-item-select'])[last()]")
    private WebElement fieldType;
    public WebElement getFieldType() {
        fieldType.click();
        return dropdownUtils.getLastDropdownList();
    }

    @FindBy(xpath = "//span[@aria-label='CloseCircle']")
    private WebElement deleteApp;

    @FindBy(xpath = "//*[@yotta-test='dataset-apps-select']/div")
    private WebElement beforeDeleteApp;

    public WebElement getBeforeDeleteApp() {
        return beforeDeleteApp;
    }

    @FindBy(xpath = "//button[@yotta-test='dataset-add_field-button']")
    private WebElement fieldAdd;

    @FindBy(xpath = "//p[text()='添加']")
    private WebElement fieldLowAdd;

    public WebElement getFieldAdd() {
        return fieldAdd;
    }

    public WebElement getFieldLowAdd() {
        return fieldLowAdd;
    }

    public WebElement getDeleteApp() {
        return deleteApp;
    }

    @FindBy(xpath = "//li[@yotta-test='dataset-authorize-button']/span")
    private WebElement auth;

    public WebElement getAuth() {
        return auth;
    }

    @FindBy(xpath = "//li[@yotta-test='dataset-tag-button']/span")
    private WebElement label;

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//div[@class='yotta-select-selection-content']")
    private WebElement tagToInput;

    public WebElement getTagToInput() {
        return tagToInput;
    }

    public WebElement getLabel() {
        return label;
    }

    @FindBy(xpath = "//li[@yotta-test='dataset-delete-button']/span")
    private WebElement delete;

    public WebElement getDelete() {
        return delete;
    }

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']/div")
    private WebElement tagDropdown;

    public WebElement getTagDropdown() {
        return tagDropdown;
    }

    public WebElement getResourceGroup() {
        String xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return super.getLastDropdownList();
    }

    public WebElement getResourceGroupList() {
        String xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return super.getLastDropdownList();
    }

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//input")
    private WebElement tagInput;

    public WebElement getTagInput() {
        return tagInput;
    }

    public WebElement getCancelDefaultButtonList() {
        String xpath = "//button[@yotta-test='operation-more-button']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return dropdownUtils.getParentElementOfMenuList();
    }

    @FindBy(xpath = "//table[@yotta-test='dataset-list-table']//span[text()='名称']/preceding::input[@type='checkbox']")
    private WebElement allSelectCheckbox;

    public WebElement getAllSelectCheckbox() {
        return allSelectCheckbox;
    }

}
