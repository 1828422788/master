package com.yottabyte.pages.incident;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.stepDefs.SetKeyWithValue;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.ElementExist;
import com.yottabyte.utils.GetLogger;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.*;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

public class SendPolicyPage extends PageTemplate {

    public SendPolicyPage(WebDriver driver) {
        super(driver);
    }

    /**
     * 通知接收组元素定位
     */
    @FindBy(xpath = "//span[text()='通知接收组']/parent::button")
    private WebElement noticeReceiveGroup;

    public WebElement getNoticeReceiveGroup() {
        return noticeReceiveGroup;
    }

    @FindBy(xpath = "//span[text()='新建']/parent::button")
    private WebElement createNoticeReceiveGroup;

    public WebElement getCreateNoticeReceiveGroup() {
        return createNoticeReceiveGroup;
    }

    @FindBy(xpath = "//input[@placeholder='请输入名称']")
    private WebElement noticeReceiveGroupNameInput;

    public WebElement getNoticeReceiveGroupNameInput() {
        return noticeReceiveGroupNameInput;
    }

    public WebElement getReceiveGroupMember() {
        String xpath = "//div[contains(text(),'发送给谁')]/following-sibling::div//div[@class='ant-select-selection__rendered']";
        return super.getLastDropdownListOnSendPolicyPage(xpath);
    }

    public WebElement getReceiveGroupNonMember() {
        String xpath = "//div[contains(text(),'不发送给谁')]/following-sibling::div//div[@class='ant-select-selection__rendered']";
        return super.getLastDropdownListOnSendPolicyPage(xpath);
    }

    public WebElement getReceiveGroupMemberLable() {
        String xpath = "//div[text()='发送给谁']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        return element;
    }

    @FindBy(xpath = "//span[contains(text(),'保存')]/parent::button")
    private WebElement saveNoticeReceiveGroup;

    public WebElement getSaveNoticeReceiveGroup() {
        return saveNoticeReceiveGroup;
    }

    @FindBy(xpath = "//a[text()='删除']")
    private WebElement delNoticeReceiveGroupButton;

    public WebElement getDelNoticeReceiveGroupButton() {
        return delNoticeReceiveGroupButton;
    }

    @FindBy(xpath = "//input[@placeholder='请输入名称']")
    private WebElement noticeReceiveGroupNameSearchInput;

    public WebElement getNoticeReceiveGroupNameSearchInput() {
        return noticeReceiveGroupNameSearchInput;
    }

    @FindBy(xpath = "//a[text()='删除']")
    private WebElement noticeReceiveGroupDeleteButton;

    public WebElement getNoticeReceiveGroupDeleteButton() {
        return noticeReceiveGroupDeleteButton;
    }

    @FindBy(xpath = "//a[text()='编辑']")
    private WebElement noticeReceiveGroupEditButton;

    public WebElement getNoticeReceiveGroupEditButton() {
        return noticeReceiveGroupEditButton;
    }

    @FindBy(xpath = "//span[text()='确定']/parent::button")
    private WebElement confirmDelNoticeReceiveGroupButton;

    public WebElement getConfirmDelNoticeReceiveGroupButton() {
        return confirmDelNoticeReceiveGroupButton;
    }

    /**
     * 发送策略列表界面元素定位
     */
    @FindBy(xpath = "//input[@placeholder='请输入关键字']")
    private WebElement sendPolicyNameListSearchInput;

    public WebElement getSendPolicyNameListSearchInput() {
        return sendPolicyNameListSearchInput;
    }

    @FindBy(xpath = "//a[text()='删除']")
    private WebElement sendPolicyNameDeleteButton;

    public WebElement getSendPolicyNameDeleteButton() {
        return sendPolicyNameDeleteButton;
    }

    @FindBy(xpath = "//span[text()='确定']/parent::button")
    private WebElement confirmDelSendPolicyNameButton;

    public WebElement getConfirmDelSendPolicyNameButton() {
        return confirmDelSendPolicyNameButton;
    }

    public WebElement getCreateSendPolicy() {
        return super.getButton("新 建");
    }

    /**
     * 发送策略编辑界面元素定位
     */
    @FindBy(xpath = "//input[@placeholder='请输入名称']")
    private WebElement sendPolicyName;

    public WebElement getSendPolicyName() {
        return sendPolicyName;
    }

    @FindBy(xpath = "//input[@placeholder='请输入']")
    private WebElement sendIntervalTime;

    public WebElement getSendIntervalTime() {
        return sendIntervalTime;
    }

    @FindBy(xpath = "//span[contains(text(),'incident新增event时发送')]")
    private WebElement checkboxNewEventSend;

    public WebElement getCheckboxNewEventSend() {
        return checkboxNewEventSend;
    }

    @FindBy(xpath = "//span[contains(text(),'incident变更时发送')]")
    private WebElement checkboxUpdatingSend;

    public WebElement getCheckboxUpdatingSend() {
        return checkboxUpdatingSend;
    }

    public WebElement getTunnelPriorityLevel() {
        String xpath = "//span[contains(text(),'优先级')]/following-sibling::span//div[@class='ant-select-selection__rendered']";
        return super.getLastDropdownListOnSendPolicyPage(xpath);
    }

//    public WebElement getMailReceiver() {
//        String xpath = "//label[text()='接收者']/parent::div/following-sibling::div//div[@class='ant-select-selection__rendered']";
//        return super.getLastDropdownListOnSendPolicyPage(xpath);
//    }

    @FindBy(xpath = "//label[text()='接收者']/parent::div/following-sibling::div//div[@class='ant-select-selection__rendered']/ul/li/div/input")
    private WebElement mailReceiver;
    public WebElement getMailReceiver() {
        return mailReceiver;
    }

    @FindBy(xpath = "//label[text()='接收者']/parent::div/following-sibling::div//div[@class='ant-select-selection__rendered']")
    private WebElement mailReceiverButton;

    public WebElement getMailReceiverButton() {
        return mailReceiverButton;
    }

    public WebElement getMailReceiverList() {
        com.yottabyte.utils.WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(mailReceiverButton));
        mailReceiverButton.click();
//        List<WebElement> list = webDriver.findElements(By.className("ant-dropdown-menu-item"));
        //ant-popover-inner-content
        //ant-popover-open
//        ant-select-dropdown-menu-item-group-list
//        ant-select-dropdown-menu-item ant-select-dropdown-menu-item-selected
//        List<WebElement> list = webDriver.findElements(By.className("_2RBmHatSR7JD5UWjhikn9T"));
//        List<WebElement> elements = parentElement.findElements(By.xpath("//li"));
        List<WebElement> list = webDriver.findElements(By.xpath("//ul"));
//        List<WebElement> list = webDriver.findElements(By.className("_2RBmHatSR7JD5UWjhikn9T"));
        com.yottabyte.utils.WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(list.get(list.size() - 1)));
        return list.get(list.size() - 1);
    }

    public WebElement getRelatedSendPluginList() {
        String xpath = "//span[contains(text(),'插件')]/following-sibling::span//div[@class='ant-select-selection__rendered']/following-sibling::span/i";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return super.getLastSendPluginDropdownList();
    }

    public WebElement getSaveSendPolicy() {
        return super.getButton("保 存");
    }

    @FindBy(xpath = "//span[contains(text(),'返回列表')]/parent::button")
    private WebElement OKButton;

    public WebElement getOKButton() {
        return OKButton;
    }

    @FindBy(xpath = "//div[@class='ant-modal-root']//span[text()='返回列表']/parent::button")
    private WebElement retListButton;

    public WebElement getRetListButton() {
        return retListButton;
    }

    @FindBy(xpath = "//span[contains(text(),'确定')]/parent::button")
    private WebElement retButton;

    public WebElement getRetButton() {
        return retButton;
    }

}
