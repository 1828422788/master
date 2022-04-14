package com.yottabyte.pages.dashboard;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

/**
 * @author sunxj
 */
public class ListPage extends ListPageFactory {
    public ListPage(WebDriver driver) {
        super(driver);
        driver.manage().window().setSize(new Dimension(1920,1080));
//        driver.manage().window().fullscreen();
    }

    @FindBy(className = "yotta-message-content")
    private WebElement errorMessage;

    @FindBy(xpath = "(//*[contains(@class,'yotta-select-selection-value')])[last()]")
    private WebElement chartYeQian;

    @FindBy(xpath = "//input[@yotta-test='dashboard-new_dashboard_name-input']")
    private WebElement dashboardName;

    @FindBy(xpath = "//span[text()='30']")
    private WebElement thirtyOnePage;

    @FindBy(xpath = "//span[text()='50']")
    private WebElement fiftyOnePage;

    @FindBy(xpath = "//span[contains(text(),'返回列表')]")
    private WebElement returnList;

    @FindBy(xpath = "//*[@yotta-test='dashboard-new_dashboard_app-select']/div")
    private WebElement belongedApp;

    @FindBy(xpath = "//div[contains(@yotta-test,'resource_tag')]//span[@aria-label]")
    private WebElement resourceInput; //资源标签

    @FindBy(xpath = "//div[contains(@yotta-test,'resource_tag')]//input[@class='yotta-select-selection-search']")
    private WebElement resourceTagInput;

    @FindBy(xpath = "//div[@yotta-test='dashboard-new_dashboard_user-select']//span[@class='yotta-select-selection-value']")
    private WebElement dataUser; //数据用户

    @FindBy(xpath = "//label[text()='标签']/parent::div/following-sibling::div//*[contains(@class, 'yotta-tag-close')]")
    private WebElement removeDashboardTagIcon;

    @FindBy(xpath = "//span[text()='数据用户']/following-sibling::span[last()]")
    private WebElement empowerUser;

    @FindBy(xpath = "//span[text()='编辑']/preceding-sibling::label")
    private WebElement empowerEdit;

    @FindBy(xpath = "//span[text()='删除']/preceding-sibling::label")
    private WebElement empowerDelete;

    @FindBy(xpath = "(//tbody[@class='yotta-table-body']/tr/td/div[@class='yotta-table-cell-action']//span[@class='yotta-checkbox-input'])[1]")
    private WebElement listItemOne;

    @FindBy(xpath = "(//tbody[@class='yotta-table-body']/tr/td/div[@class='yotta-table-cell-action']//span[@class='yotta-checkbox-input'])[2]")
    private WebElement listItemTwo;

    @FindBy(xpath = "(//tbody[@class='yotta-table-body']/tr/td/div[@class='yotta-table-cell-action']//span[@class='yotta-checkbox-input'])[3]")
    private WebElement listItemThree;

    @FindBy(xpath = "//span[text()='添加资源标签']")
    private WebElement addResouceTag;

    @FindBy(xpath = "//span[text()='删除']")
    private WebElement multiDelete;

    @FindBy(xpath = "//span[text()='请选择或输入']")
    private WebElement multiAddTag;

    @FindBy(xpath = "//div//input[@class='yotta-select-selection-search']")
    private WebElement multiInputTag;

    @FindBy(xpath = "//div[@yotta-test='resource_tag-change_resource_tag-select']//div[@class='yotta-select-selection-content']")
    private WebElement tagToInput;

    @FindBy(xpath = "//div[contains(@class,'yotta-modal-body')]")
    private WebElement message;

    public WebElement getMessage() {
        return message;
    }

    public WebElement getTagToInput() {
        return tagToInput;
    }

    public WebElement getMultiInputTag() {
        return multiInputTag;
    }

    public WebElement getMultiAddTag() {
        multiAddTag.click();
        return super.getLastDropdownList();
    }

    public WebElement getBelongedApp() {
        belongedApp.click();
        return super.getLastDropdownList();
    }

    public WebElement getDataUserItems() {
        dataUser.click();
        return super.getLastDropdownList();
    }

    public WebElement getReturnList() {
        return returnList;
    }

    public WebElement getErrorMessage() {
        return errorMessage;
    }

    public WebElement getChartYeQian() {
        return chartYeQian;
    }

    public WebElement getThirtyOnePage() {
        return thirtyOnePage;
    }

    public WebElement getFiftyOnePage() {
        return fiftyOnePage;
    }

    public WebElement getDataUser() { return dataUser; }

    public WebElement getDashBoardName() {
        return dashboardName;
    }

    public WebElement getResourceInput() {
        return resourceInput;
    }

    public WebElement getResourceTagInput() {
        return resourceTagInput;
    }

    public WebElement getRemoveDashboardTagIcon() {
        return removeDashboardTagIcon;
    }

    public WebElement getEmpowerUser() { return empowerUser; }

    public WebElement getEmpowerEdit() { return empowerEdit; }

    public WebElement getEmpowerDelete() { return empowerDelete; }

    public WebElement getListItemOne() { return listItemOne; }

    public WebElement getListItemTwo() { return listItemTwo; }

    public WebElement getListItemThree() { return listItemThree; }

    public WebElement getAddResouceTag() { return addResouceTag; }

    public WebElement getMultiDelete() { return multiDelete; }

    public WebElement getMultiOperate(){
        return super.getButton("批量操作");
    }

    public WebElement getMultiChooseButton(){
        return webDriver.findElement(By.xpath("//span[text()='请选择']"));
    }

    public WebElement getInput(String name) {
        return webDriver.findElement(By.xpath("(//span[text()='" + name + "'])[last()]/following-sibling::input"));
    }

    @FindBy(xpath = "//span[text()='授权']")
    private WebElement giveRight;

    public WebElement getGiveRight() { return giveRight; }

    @FindBy(xpath = "//span[text()='标签']")
    private WebElement resouceTag;

    public WebElement getResouceTag() { return resouceTag; }

    @FindBy(xpath = "//span[text()='UIautotest']/ancestor::td/preceding-sibling::td//span[@class='yotta-table-expansion-icon']")
    private WebElement uiautotestSprid;

    public WebElement getUiautotestSprid() { return uiautotestSprid; }

    @FindBy(xpath = "//div[text()='资源标签..............无']")
    private WebElement noResourceTag;

    public WebElement getNoResourceTag() { return noResourceTag; }

    @FindBy(xpath = "//*[@yotta-test='resource_tag-change_resource_tag-select']//span[@class='yotta-select-selection-placeholder']")
    private WebElement resourceTagChange;

    public WebElement getResourceTagChange() { return resourceTagChange; }

    @FindBy(xpath = "//*[@yotta-test='resource_tag-change_resource_tag-select']//input[@class='yotta-select-selection-search']")
    private WebElement resourceTagChangeInput;

    public WebElement getResourceTagChangeInput() { return resourceTagChangeInput; }

    @FindBy(xpath = "//input[@yotta-test='table-filter_text-input']")
    private WebElement searchNameInput;

    public WebElement getSearchNameInput() { return searchNameInput; }

    @FindBy(xpath = "//div[@role='tab' and contains(text(),'我的收藏')]")
    private WebElement myCollection;

    public WebElement getMyCollection() {
        return myCollection;
    }

    public WebElement getFirstDashboardName() {
        return getDasboardNameInTheRow(1);
    }

    public WebElement getSecondDashboardName() {
        return getDasboardNameInTheRow(2);
    }

    public WebElement getThirdDashboardName() {
        return getDasboardNameInTheRow(3);
    }

    private WebElement getDasboardNameInTheRow(int row){
        return webDriver.findElement(By.xpath("//tr[" + row + "]//td[1]"));
    }


}
