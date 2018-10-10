package com.yottabyte.pages.alert;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.GetTime;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

/**
 * @author sunxj
 */
public class MonitorPage extends PageTemplate {
    public MonitorPage(WebDriver driver) {
        super(driver);
    }

    @Override
    public WebElement getLastDropdownList() {
        List<WebElement> list = webDriver.findElements(By.className("el-dropdown-menu"));
        return list.get(list.size() - 1);
    }

    @FindBy(className = "expand-button")
    private WebElement expand;

    @FindBy(className = "el-loading-mask")
    private WebElement loadingElement;

    @FindBy(className = "expand-button-open")
    private WebElement retract;

    @FindBy(xpath = "(//i[@class='el-icon-arrow-down el-icon--right'])[1]")
    private WebElement groupDropdown;

    @FindBy(xpath = "(//i[@class='el-icon-arrow-down el-icon--right'])[2]")
    private WebElement gradeDropdown;

    @FindBy(xpath = "(//i[@class='el-icon-arrow-down el-icon--right'])[3]")
    private WebElement statusDropdown;

    @FindBy(xpath = "(//i[@class='el-icon-arrow-down el-icon--right'])[4]")
    private WebElement markDropdown;

    @FindBy(xpath = "(//i[@class='el-icon-arrow-down el-icon--right'])[5]")
    private WebElement operatorDropdown;

    @FindBy(xpath = "//input[@placeholder='请选择快捷时间或时间范围']")
    private WebElement dateEditor;

    @FindBy(xpath = "//li[text()='处理']")
    private WebElement deal;

    @FindBy(xpath = "//li[text()='忽略']")
    private WebElement ignore;

    public WebElement getIgnore() {
        return ignore;
    }

    public WebElement getDeal() {
        return deal;
    }

    public WebElement getSuccessMessage() {
        return super.getSuccessMessage();
    }

    public WebElement getMarkDropdown() {
//        markDropdown.click();
//        return getLastDropdownList();
        return markDropdown;
    }

    public WebElement getOperatorDropdown() {
        operatorDropdown.click();
        return getLastDropdownList();
    }

    public WebElement getDateEditor() {
        return dateEditor;
    }

    public WebElement getStatusDropdown() {
        statusDropdown.click();
        return getLastDropdownList();
    }

    public WebElement getGroupDropdown() {
        groupDropdown.click();
        return getLastDropdownList();
    }

    public WebElement getGradeDropdown() {
        gradeDropdown.click();
        return getLastDropdownList();
    }

    public WebElement getRetract() {
        return retract;
    }

    public WebElement getExpand() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.invisibilityOf(loadingElement));
        return expand;
    }

    public WebElement getTenMinutes() {
        return GetTime.getTime(webDriver, "TenMinutes");
    }

    public WebElement getOneDay() {
        return GetTime.getTime(webDriver, "OneDay");
    }

    public WebElement getTwoDays() {
        return GetTime.getTime(webDriver, "TwoDays");
    }

    public WebElement getThreeDays() {
        return GetTime.getTime(webDriver, "ThreeDays");
    }

    public WebElement getOneHour() {
        return GetTime.getTime(webDriver, "OneHour");
    }

    public WebElement getHalfHour() {
        return GetTime.getTime(webDriver, "HalfHour");
    }


}
