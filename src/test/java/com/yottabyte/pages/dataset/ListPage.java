package com.yottabyte.pages.dataset;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.GetElementFromPage;
import com.yottabyte.utils.WaitForElement;
import cucumber.api.java.en.Then;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import javax.xml.xpath.XPath;

import java.util.List;

import static org.junit.Assert.assertEquals;


/**
 * @author jiangnd
 */
public class ListPage extends ListPageFactory {
    public ListPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    @FindBy(xpath = "//input[@yotta-test='table-filter_text-input']")
    private WebElement searchInputName; //名称

    public WebElement getSearchInputName() {
        return searchInputName;
    }

    //    @FindBy(id = "EditDatabase_name")
    @FindBy(xpath = "//input[@yotta-test='dataset-name-input']")
    private WebElement name; //名称

    public WebElement getName() {
        return name;
    }

    //    @FindBy(id = "EditDatabase_alias")
    @FindBy(xpath = "//input[@yotta-test='dataset-alia-input']")
    private WebElement alias;  //别名

    public WebElement getAlias() {
        return alias;
    }

    //    @FindBy(id = "EditDatabase_queryfilter")
    @FindBy(xpath = "//input[@yotta-test='dataset-queryfilter-input']")
    private WebElement spl;

    public WebElement getSpl() {
        return spl;
    }

    //    @FindBy(xpath = "//span[text()='确定']/parent::button")
    @FindBy(xpath = "//span[text()='确定']/parent::button")
    private WebElement save; //修改节点时候的保存按钮

    public WebElement getSave() {
        return save;
    }

    //    @FindBy(xpath = "//label[@title='所属应用']/parent::div/following-sibling::div")
    @FindBy(xpath = "//div[@yotta-test='dataset-apps-select']/div")
    private WebElement appList; //所属应用

    public WebElement getAppList() {
        appList.click();
        return super.getLastDropdownList();
    }

    //@FindBy(xpath = "//label[@title='资源标签']/parent::div/following-sibling::div")
//    private WebElement resourceGroup;
    public WebElement getResourceGroup() {
        String xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    //@FindBy(xpath = "//label[@title='资源标签']/parent::div/following-sibling::div//input")
    @FindBy(xpath = "//label[contains(text(),'资源标签')]/following::input")
    private WebElement resourceTagInput;

    public WebElement getResourceTagInput() {
        return resourceTagInput;
    }

    //利用应用查询
//  @FindBy(xpath = "//div[text()='请选择应用']/parent::div")
    @FindBy(xpath = "//div[@yotta-test='table-filter_app-select']")
    private WebElement appSearch;

    public WebElement getAppSearch() {
        appSearch.click();
        return super.getLastDropdownList();
    }

    @FindBy(xpath = "//div[@yotta-test='table-filter_tag-select']/div")
    private WebElement resourceDropdown;

    public WebElement getResourceDropdown() {
//        this.groupDropdownIcon("请选择标签").click();
        resourceDropdown.click();
        return super.getLastDropdownList();
    }

    @FindBy(xpath = "//label[text()='约束语句']/ancestor::div//following-sibling::div//div[text()='请输入约束语句']")
    // @FindBy(xpath= "//div[text()='请输入约束语句']")
    private WebElement tipsYuJu;
    //    @FindBy(xpath = "//label[@title='父子行为']/parent::div/following-sibling::div//span[text()='继承']")
    @FindBy(xpath = "//label[contains(text(),'父子行为')]/following::span[text()='继承']")
    private WebElement inherit; //父子行为继承
    //数据集预定义字段列表
    //第1个字段名称
    //@FindBy(id="EditDatabase_fields[0].name")
//  @FindBy(xpath = "//span[@class='css-pcxrzr ant-input-group-wrapper']/span/input[@id='EditDatabase_fields[0].name']")
    @FindBy(xpath = "//label[contains(text(),'字段')]/following::input[@placeholder='请输入']")
    private WebElement firstFieldName;

    @FindBy(xpath = "//label[text()='名称']/ancestor::div//following-sibling::div//div[text()='请输入数据集名称']")
    //@FindBy(xpath= "//div[text()='请输入数据集名称']")
    private WebElement tipsName;

    //@FindBy(xpath= "//div[text()='请输入别名']")
    @FindBy(xpath = "//label[text()='别名']/ancestor::div//following-sibling::div//div[text()='请输入别名']")
    private WebElement tipsAlias;
    //第1个字段类型
    // @FindBy(id="EditDatabase_fields[0].type")
//    @FindBy(xpath = "//span[@class='css-pcxrzr ant-input-group-wrapper']/span/span/div[@id='EditDatabase_fields[0].type']")
    @FindBy(xpath = "//label[contains(text(),'字段')]/following::input[@placeholder='请输入']/following-sibling::span[@class='yotta-input-append']/div/div")
    private WebElement firstFieldType;

    public WebElement getFirstFieldType() {
        // firstFieldType.click();
        // return super.getLastDropdownList();
        return firstFieldType;
    }

    //第2个字段名称
//    @FindBy(id = "EditDatabase_fields[1].name")
    @FindBy(xpath = "//label[contains(text(),'字段')]/following::input[@placeholder='请输入']/following::input[@placeholder='请输入']")
    private WebElement secondFieldName;

    //第2个字段类型
//    @FindBy(id = "EditDatabase_fields[1].type")
    @FindBy(xpath = "//label[contains(text(),'字段')]/following::input[@placeholder='请输入']/following::input[@placeholder='请输入']/following-sibling::span[@class='yotta-input-append']/div/div")
    private WebElement secondFieldType;

    public WebElement getSecondFieldType() {
//         secondFieldType.click();
//         return super.getLastDropdownList();
        return secondFieldType;
    }

    public WebElement getSecondFieldTypeList() {
//        String xpath = "//div/label[contains(text(),'字段')]/following::div[@class='ant-select-selection__rendered']/following::div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        String xpath = "//label[contains(text(),'字段')]/following::input[@placeholder='请输入']/following::input[@placeholder='请输入']/following-sibling::span[@class='yotta-input-append']/div/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return getLastDropdownList();
    }

    @FindBy(xpath = "//div[@id='EditDatabase_app_ids']//i[contains(@class,'anticon-close-circle')]")
    private WebElement deleteApp;

    @FindBy(className = "ant-select-selection__rendered")
    private WebElement beforeDeleteApp;
    //新建数据集弹窗中的汇聚继承
    @FindBy(xpath = "//label[contains(text(),'父子行为')]/following::span[text()='汇聚']")
    private WebElement huiJu;  //父子行为为汇聚
    @FindBy(xpath = "//span[contains(text(),'数值')]")
    private WebElement number;

    public WebElement getNumber() {
        return number;
    }

    @FindBy(xpath = "//span[contains(text(),'字符串')]")
    private WebElement strStr;

    public WebElement getBeforeDeleteApp() {
        return beforeDeleteApp;
    }

    public WebElement getTipsName() {
        return tipsName;
    }

    public WebElement getTipsAlias() {
        return tipsAlias;
    }

    public WebElement getTipsYuJu() {
        return tipsYuJu;
    }

    public WebElement getHuiJu() {
        return huiJu;
    }

    public WebElement getInherit() {
        return inherit;
    }

    public WebElement getFirstFieldName() {
        return firstFieldName;
    }

    public WebElement getSecondFieldName() {
        return secondFieldName;
    }

    //    @FindBy(xpath = "//label[@title='字段']/parent::div/following-sibling::div//span[text()='添加']")
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

    @FindBy(xpath = "//span[text()='确定']/parent::button")
    private WebElement ensure;

    public WebElement getEnsure() {
        return ensure;
    }

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']/div")
    private WebElement tagDropdown;

    public WebElement getTagDropdown() {
        return tagDropdown;
    }

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//input")
    private WebElement tagInput;

    public WebElement getTagInput() {
        return tagInput;
    }
}
