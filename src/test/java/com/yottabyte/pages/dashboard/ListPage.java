package com.yottabyte.pages.dashboard;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
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
    }

    @FindBy(className = "ant-message-error")
    private WebElement errorMessage;

    @FindBy(className = "ant-select-selection-selected-value")
    private WebElement chartYeQian;

    @FindBy(xpath = "//li[text()='5 条/页']")
    private WebElement fiveOnePage;

    @FindBy(xpath = "//li[text()='50 条/页']")
    private WebElement fiftyOnePage;

    @FindBy(xpath = "//span[contains(text(),'返回列表')]")
    private WebElement returnList;

    @FindBy(xpath = "//span[text()='所属应用']/following-sibling::span/div")
    private WebElement belongedApp;

    @FindBy(xpath = "//span[text()='数据用户']/following-sibling::span//div[@class='ant-select-selection-selected-value']")
    private WebElement dataUser;

    @FindBy(xpath = "//div[text()='标签']/following-sibling::div//*[contains(@class, 'ant-select-remove-icon')]")
    private WebElement removeDashboardTagIcon;

    @FindBy(xpath = "//span[text()='数据用户']/following-sibling::span")
    private WebElement empowerUser;

    @FindBy(xpath = "//span[text()='编辑']")
    private WebElement empowerEdit;

    @FindBy(xpath = "//span[text()='删除']")
    private WebElement empowerDelete;

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

    public WebElement getFiveOnePage() {
        return fiveOnePage;
    }

    public WebElement getFiftyOnePage() {
        return fiftyOnePage;
    }

    public WebElement getDataUser() { return dataUser; }

    public WebElement getDashBoardName() {
        return this.getInput("名称");
    }

    public WebElement getResourceInput() {
        return this.getInput("资源标签");
    }

    public WebElement getAppOwningInput() {
        return this.getInput("所属应用");
    }

    public WebElement getRemoveDashboardTagIcon() {
        return removeDashboardTagIcon;
    }

    public WebElement getEmpowerUser() { return empowerUser; }

    public WebElement getEmpowerEdit() { return empowerEdit; }

    public WebElement getEmpowerDelete() { return empowerDelete; }


    public WebElement getInput(String name) {
        return webDriver.findElement(By.xpath("(//span[text()='" + name + "'])[last()]/following-sibling::span//input"));
    }
}
