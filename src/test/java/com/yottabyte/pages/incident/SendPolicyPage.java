package com.yottabyte.pages.incident;

import com.yottabyte.pages.EditorPage;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.*;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

public class SendPolicyPage extends EditorPage {

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

    @FindBy(xpath = "//input[@placeholder='请输入']")
    private WebElement noticeReceiveGroupNameInput;

    public WebElement getNoticeReceiveGroupNameInput() {
        return noticeReceiveGroupNameInput;
    }

    public WebElement getReceiveGroupMemberList() {
        String xpath = "//label[contains(text(),'发送给谁')]/following::span[text()='请选择用户或用户分组']/parent::div";
        return dropdownUtils.getDropdownListbyPath(xpath);
    }

    public WebElement getReceiveGroupNonMemberList() {
        String xpath = "//label[contains(text(),'不发送给谁')]/parent::div/following-sibling::div//span[text()='请选择用户']/ancestor::div[contains(@class,'yotta-select-selection')]";
        return dropdownUtils.getDropdownListbyPath(xpath);
    }

    public WebElement getReceiveGroupMemberLabel() {
        String xpath = "//label[contains(text(),'发送给谁')]";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        return element;
    }

    @FindBy(xpath = "//span[contains(text(),'新建')]/parent::button")
    private WebElement newNoticeReceiveGroup;
    public WebElement getNewNoticeReceiveGroup() {
        return newNoticeReceiveGroup;
    }

    @FindBy(xpath = "//span[contains(text(),'保存')]/parent::button")
    private WebElement saveNoticeReceiveGroup;
    public WebElement getSaveNoticeReceiveGroup() {
        return saveNoticeReceiveGroup;
    }

    @FindBy(xpath = "//span[contains(text(),'更新')]/parent::button")
    private WebElement updateNoticeReceiveGroup;
    public WebElement getUpdateNoticeReceiveGroup() {
        return updateNoticeReceiveGroup;
    }

    @FindBy(xpath = "//a[text()='删除']")
    private WebElement delNoticeReceiveGroupButton;

    public WebElement getDelNoticeReceiveGroupButton() {
        return delNoticeReceiveGroupButton;
    }

//    @FindBy(xpath = "//input[@placeholder='请输入名称']")
    @FindBy(xpath = "//input[@yotta-test='table-filter_text-input']")
    private WebElement noticeReceiveGroupNameSearchInput;

    public WebElement getNoticeReceiveGroupNameSearchInput() {
        return noticeReceiveGroupNameSearchInput;
    }

    @FindBy(xpath = "//a[text()='删除']")
    private WebElement noticeReceiveGroupDeleteButton;

    public WebElement getNoticeReceiveGroupDeleteButton() {
        return noticeReceiveGroupDeleteButton;
    }

    @FindBy(xpath = "//span[text()='编辑']/parent::button")
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
        return super.getButton("新建");
    }

    /**
     * 发送策略编辑界面元素定位
     */
    @FindBy(xpath = "//input[@placeholder='请输入名称'][@yotta-test='incident-name-input']")
    private WebElement sendPolicyName;

    public WebElement getSendPolicyName() {
        return sendPolicyName;
    }

    @FindBy(xpath = "//input[@placeholder='请输入'][@yotta-test='incident-time-number_input']")
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

    @FindBy(xpath = "//div[@class='yotta-col yotta-col-6 yotta-form-item-label']")
    private WebElement pageBlank;
    public WebElement getPageBlank() {
        return pageBlank;
    }

    public WebElement getTunnelPriorityLevelList() {
        String xpath = "//span[contains(text(),'优先级')]/following-sibling::div//span[text()='请选择']/parent::div";
        return dropdownUtils.getDropdownListbyPath(xpath);
    }

    public WebElement getMailReceiverList() {
//        String xpath = "//label[contains(text(),'接收者')]/parent::div/following-sibling::div//span[text()='请选择']/ancestor::div[@class='yotta-select-selection']";
        String xpath = "//div[@yotta-test='incident-email_account_group-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return super.getLastDropdownList();
    }

    public WebElement getRelatedSendPluginList() {
        String xpath = "//span[text()='插件']/following-sibling::div//div[@yotta-test='incident-plugin-select']/div";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return super.getLastDropdownList();
    }

    public WebElement getNewButtonPolicy() {
        return super.getButton("新建");
    }

    public WebElement getSaveSendPolicy() {
        return super.getButton("保 存");
    }

    public WebElement getPluginButton() {
        return super.getButton("通道插件");
    }

    public WebElement getUpLoadPluginButton() {
        return super.getButton("上传插件");
    }

    public WebElement getChoisePluginTypeList() {
        return dropdownUtils.getDownListByText("请选择插件类型");
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

    @FindBy(xpath = "//div[@class='yotta-modal-body']/following-sibling::div//span[text()='确定']/parent::button")
    private WebElement retButton;

    public WebElement getRetButton() {
        return retButton;
    }

    @FindBy(xpath = "//div[contains(text(),'发送策略')]/parent::div")
    private WebElement sendPolicyItem;
    public WebElement getSendPolicyItem() {
        return sendPolicyItem;
    }

}
