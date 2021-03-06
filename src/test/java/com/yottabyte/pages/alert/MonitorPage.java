package com.yottabyte.pages.alert;

import com.yottabyte.pages.EditorPage;
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
public class MonitorPage extends EditorPage {
    public MonitorPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
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

    @FindBy(xpath = "//textarea[@placeholder='请输入']")
    private WebElement handlingSuggestion;

    @FindBy(xpath = "//li[text()='ping主机']")
    private WebElement pingHost;

    @FindBy(xpath = "//li[text()='rsyslog告警']")
    private WebElement rsyslogAlert;

    @FindBy(xpath = "//li[text()='邮件告警']")
    private WebElement emailAlert;

    @FindBy(xpath = "//div[@class='method-input-block']//input")
    private WebElement ipAddress;

    @FindBy(xpath = "//span[text()='执行']")
    private WebElement executeButton;

    @FindBy(className = "plugin-result-content")
    private WebElement executeResult;

    @FindBy(xpath = "//li[text()='告警转发']")
    private WebElement forwardAlert;

    @FindBy(xpath = "//div[text()='已处理']")
    private WebElement handled;

    @FindBy(className = "el-icon-edit")
    private WebElement editButton;

    @FindBy(className = "el-icon-circle-check")
    private WebElement Check;

    @FindBy(xpath = "(//ul[@class='el-dropdown-menu group-menu'])[last()]")
    private WebElement groupMenu;

    @FindBy(className = "link-knowledge-icon")
    private WebElement linkKnowledge;

    @FindBy(xpath = "(//i[@class='el-icon-arrow-down el-icon--right'])[last()]")
    private WebElement arrowDown;

    @FindBy(className = "dropdown_knowledges_list")
    private WebElement knowledgeList;

    @FindBy(xpath = "//span[contains(text(),'KnowledgeForAlert')]")
    private WebElement knowledgeForAlert;

    @FindBy(xpath = "//span[contains(text(),'AlertKnowledge')]")
    private WebElement alertKnowledge;

    @FindBy(xpath = "//span[text()='already done']/ancestor::div[@class='handled-text']//following-sibling::span[@class='el-tag el-tag--primary']")
    private List<WebElement> knowledgeLists;

    @FindBy(className = "el-tag__close")
    private WebElement deleteKnowledge;

    @FindBy(xpath = "//span[@title='KnowledgeForAlert']/ancestor::span/preceding-sibling::div//span")
    private WebElement associateKnowledge;

    public WebElement getAssociateKnowledge() {
        return associateKnowledge;
    }

    public WebElement getDeleteKnowledge() {
        return deleteKnowledge;
    }

    public List<WebElement> getKnowledgeLists() {
        return knowledgeLists;
    }

    public WebElement getAlertKnowledge() {
        return alertKnowledge;
    }

    public WebElement getKnowledgeForAlert() {
        return knowledgeForAlert;
    }

    public WebElement getSaveKnowledge() {
        return super.getContainsTextButton("保存");
    }

    public WebElement getKnowledgeList() {
        return knowledgeList;
    }

    public WebElement getCreateKnowledge() {
        return super.getContainsTextButton("新建");
    }

    public WebElement getArrowDown() {
        return arrowDown;
    }

    public WebElement getLinkKnowledge() {
        return linkKnowledge;
    }

    public WebElement getGroupMenu() {
        return groupMenu;
    }

    public WebElement getReturnToAlertPage() {
        return super.getButton("返回监控首页");
    }

    public WebElement getCheck() {
        return Check;
    }

    public WebElement getEditButton() {
        return editButton;
    }

    public WebElement getHandled() {
        return handled;
    }

    public WebElement getForwardAlert() {
        return forwardAlert;
    }

    public WebElement getEmailAlert() {
        return emailAlert;
    }

    public WebElement getRsyslogAlert() {
        return rsyslogAlert;
    }

    public WebElement getSyslogAddress() {
        return super.getInputElement("Syslog地址");
    }

    public WebElement getReceiver() {
        return super.getInputElement("接收者");
    }

    public WebElement getExecuteResult() {
        return executeResult;
    }

    public WebElement getExecuteButton() {
        return executeButton;
    }

    public WebElement getIpAddress() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(ipAddress));
        return ipAddress;
    }

    public WebElement getPingHost() {
        return pingHost;
    }

    public WebElement getHandlingSuggestion() {
        return handlingSuggestion;
    }

    public WebElement getIgnore() {
        return ignore;
    }

    public WebElement getDeal() {
        return deal;
    }

    public WebElement getSuccessMessage() {
        return super.getSuccessMessage();
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }

    public WebElement getMarkDropdown() {
        return markDropdown;
    }

    public WebElement getOperatorDropdown() {
        return operatorDropdown;
    }

    public WebElement getDateEditor() {
        return dateEditor;
    }

    public WebElement getStatusDropdown() {
        WaitForElement.waitUntilLoadingDisappear();
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

    public WebElement getSevenDays() {
        return GetTime.getTime(webDriver, "SevenDays");
    }

    public WebElement getYes() {
        return super.getButton("是");
    }

    public WebElement getNo() {
        return super.getButton("否");
    }
}
