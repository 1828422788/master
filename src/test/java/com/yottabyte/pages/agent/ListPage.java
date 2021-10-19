package com.yottabyte.pages.agent;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.DropdownUtils;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.FindBys;
import org.openqa.selenium.support.ui.ExpectedConditions;

/**
 * @author sunxj,sunxc
 */
public class ListPage extends PageTemplate {


    public WebElement getMemoButton() {
        return super.getButton("修改备注");
    }

    @FindBy(className = "_2FuqHHfRc-c7BJzf3RvYta")
    private WebElement agentGroup;

    @FindBy(xpath = "//input[contains(@placeholder,'模糊搜索主机名')]")
    private WebElement hostname;

    @FindBy(xpath = "//div/label/span/span")
    private WebElement AllButton;

    public WebElement getMultiGruopButton() {
        return MultiGruopButton;
    }

    @FindBy(xpath = "//span[@class='yotta-popover-content']//li/span[text()='分组']")
    private WebElement MultiGruopButton;

    @FindBy(xpath = "//span[text()='验证组内权限']")
    private WebElement auth;

    @FindBy(xpath = "(//span[text()='验证组内权限'])[2]")
    private WebElement authButton;

    @FindBy(xpath = "(//label[text()='备注']/parent::div/following-sibling::div//input)[2]")
    private WebElement memo;

    public WebElement getAgentExportButton() {
        return AgentExportButton;
    }

    @FindBy(xpath = "//li/span[text()='导出 Agent 信息']")
    private WebElement AgentExportButton;

    public WebElement getAgentExportGUIButton() {
        return AgentExportGUIButton;
    }

    @FindBy(xpath = "//li/span[text()='桌面客户端']")
    private WebElement AgentExportGUIButton;

    public WebElement getAgentDownloadButton() {
        return AgentDownloadButton;
    }


//    @FindBy(xpath = "//span[text()='下载命令']/ancestor::button")
    @FindBy(xpath = "//button[@yotta-test='agent-download_command-button']")
    private WebElement CopyLinux;
    public WebElement getCopyLinux() { return CopyLinux; }


//    @FindBy(xpath = "//span[text()='下载文件']/ancestor::button")
    @FindBy(xpath = "//button[@yotta-test='agent-win_download_file-button']")
    private WebElement DownloadFile;
    public WebElement getDownloadFile() {
//        return super.getButton("下载文件");
        return DownloadFile;
    }

    @FindBy(xpath = "//li/span[text()='下载安装包']")
    private WebElement AgentDownloadButton;

    @FindBy(xpath = "//button[@yotta-test='agent-download_mac_gui-button']")
    private WebElement WindowsGUIButton;

    public WebElement getWindowsGUIButton() {
//        return super.getYottaButtonByText("下载文件");
        return WindowsGUIButton;
    }

    @FindBy(xpath = "//button[@yotta-test='agent-download_win_gui-button']")
    private WebElement MacOsGUIButton;
    public WebElement getMacOsGUIButton() {
        return MacOsGUIButton;
//        return super.getYottaButtonByText("下载命令");
    }

    public WebElement getAuthButton() {
        return authButton;
    }

    public WebElement getAuth() {
        return auth;
    }

    public WebElement getMore(){
        return super.getButton("更多");
    }

    @FindBy(xpath = "//span[text()='分组设置']")
    private WebElement AgentGroupButton;

    public WebElement getStop() {
        return Stop;
    }

    @FindBy(xpath = "//div[@class='yotta-popover-wrap']/span/ul/li/span[text()='停止']")
    private WebElement Stop;

    public WebElement getStart() {
        return Start;
    }

    @FindBy(xpath = "//span[text()='停止']")
    private WebElement Start;
    public WebElement getAgentGroupButton() {
        return AgentGroupButton;
    }

    public WebElement getAgentMultiButton(){
        return super.getYottaButtonByText("批量操作");
    }

    public WebElement getAgentMultiCHooseButton(){
        return super.getYottaButtonByText("请选择");
    }

    public WebElement getAllButton() {
        return AllButton;
    }

    public WebElement getHostname() {
        return hostname;
    }

    public WebElement getRemark() {
        String xpath = "//input[contains(@placeholder,'模糊搜索备注')]";
        return webDriver.findElement(By.xpath(xpath));
    }
    public WebElement getVersion() {
        String xpath = "//input[contains(@placeholder,'精确搜索版本号')]";
        return webDriver.findElement(By.xpath(xpath));
    }
    public WebElement getEnsureButton() {
        String xpath = "(//span[text()='确定']/ancestor::button)[last()]";
        return webDriver.findElement(By.xpath(xpath));
    }
    public WebElement getCancelButton() {
        String xpath = "(//span[text()='取消']/ancestor::button)[last()]";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getResetButton() {
        String xpath = "//span[text()='清空筛选']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getAddsuccessmsg() {
        return Addsuccessmsg;
    }

    @FindBy(xpath = "//div[@class='ant-message-custom-content ant-message-success']//span")
    private WebElement Addsuccessmsg;


    public WebElement getSeniorfilterButton() {
        String xpath = "//span[text()='高级']/ancestor::button";
        return webDriver.findElement(By.xpath(xpath));
    }
    public WebElement getInputElement(String text) {
        String xpath = "//input[contains(@placeholder,' " + text + "')]";
        return webDriver.findElement(By.xpath(xpath));

    }

    public WebElement getMemo() {
        return memo;
    }

    public WebElement getType(){
        String xpath = "(//label[text()='类型']/parent::div/following-sibling::div//span)[2]";
        DropdownUtils dropdownUtils = new DropdownUtils();
        WebElement element = webDriver.findElement(By.xpath(xpath));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return dropdownUtils.getLastDropdownList();
    }

    public WebElement getIP(){
        String xpath = "//input[contains(@placeholder,'模糊搜索 IP')]";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getFinishGroupButton() {
        String xpath = "(//span[text()='完成']//ancestor::button)[last()]";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getFinishButton() {
        String xpath = "//span[text()='完成']//ancestor::button)[1]";
        return webDriver.findElement(By.xpath(xpath));
    }


    public WebElement getGroupButton() {
        String xpath = "//ul[@class='_1TZwQL-XuZ_YtCVKccMfCv']//span[text()='sunxctest']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getMoveGroupButton() {
        String xpath = "//ul[@class='_1TZwQL-XuZ_YtCVKccMfCv']//span[text()='sunxctest']";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getMemoEnsure() {
        return super.getYottaButtonByText("确定");
    }

    @FindBy(xpath = "//p/span[text()='sunxctest']")
    private WebElement OpenGroupButton;

    public WebElement getOpenGroupButton() {
        return OpenGroupButton;
    }

    public WebElement getChangeMemoButton(){
        return super.getButton("修改备注");
    }
    public WebElement getOprationElement(String text) {
        String xpath = "//span[text()='192.168.1.136']/ancestor::td/following-sibling::td/span/a[text()=' " + text + "']";
        return webDriver.findElement(By.xpath(xpath));

    }

    public WebElement getMemoError(){
        String xpath = "//div[@class='ant-form-explain']";
        WebElement element =  webDriver.findElement(By.xpath(xpath));
        return element;
    }

    public WebElement getGroupMemo(){
        String xpath =  "//span[@class='yotta-message-content']";
        WebElement element =  webDriver.findElement(By.xpath(xpath));
        return element;
    }

    public ListPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getAgentGroup() {
        return agentGroup;
    }

    public WebElement getComplete() {
        return super.getButton("完成");
    }
}
