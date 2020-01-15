package com.yottabyte.pages.agent;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj,sunxc
 */
public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "ant-radio-wrapper")
    private WebElement file;

    @FindBy(xpath = "//button[@class='el-button el-button--default el-button--primary ']")
    private WebElement ensure;

    @FindBy(className = "ant-message-success")
    private WebElement successMessage;

    @FindBy(className = "adddata-outcome__summary")
    private WebElement summary;

    @FindBy(xpath = "//span[contains(text(),'清理输出源缓存')]")
    private WebElement cleanOutput;

    @FindBy(xpath = "//label[contains(text(),'分配角色')]/following-sibling::div//i")
    private WebElement roleDropdown;

    public WebElement getSourceRoot() {
        return SourceRoot;
    }

    @FindBy(xpath = "//label[contains(@title,'最后修改时间')]/parent::div/following-sibling::div//input")
    private WebElement LastChangeTime;


    @FindBy(xpath = "//span[text()='来源路径']/following-sibling::span")
    private WebElement SourceRoot;

    public WebElement getCheckAppname() {
        return CheckAppname;
    }

    @FindBy(xpath = "//span[text()='appname']/following-sibling::span")
    private WebElement CheckAppname;

    public WebElement getCheckTag() {
        return CheckTag;
    }

    @FindBy(xpath = "//span[text()='tag']/following-sibling::span")
    private WebElement CheckTag;

    public WebElement getPreviewMessage() {
        return PreviewMessage;
    }

    @FindBy(xpath = "//span[text()='文件路径白名单']/following-sibling::span")
    private WebElement WhitelistRoot;

    @FindBy(xpath = "//label[contains(@title,'文件路径黑名单')]/parent::div/following-sibling::div//input")
    private WebElement BlackListInput;

    @FindBy(xpath = "//label[contains(@title,'监听地址')]/parent::div/following-sibling::div//input" )
    private WebElement Listenaddress;

    @FindBy(xpath = "//span[contains(text(),'+ 添加新映射')]")
    private WebElement AddNewMap;

    public WebElement getSyslogip() {
        return Syslogip;
    }

    @FindBy(xpath = "//tr/td[1]/div/div/div/span/input")
    private WebElement Syslogip;

    @FindBy(xpath = "//tr/td[2]/div/div/div/span/div/div/div/ul/li/div/input")
    private WebElement Syslogappname;

    @FindBy(xpath = "//tr/td[3]/div/div/div/span/div/div/div/ul/li/div/input")
    private WebElement Syslogtag;

    public WebElement getCheckListenaddress() {
        return CheckListenaddress;
    }

    @FindBy(xpath = "//span[text()='监听地址']/following-sibling::span/span")
    private WebElement CheckListenaddress;

    public WebElement getCheckMap() {
        return CheckMap;
    }

    @FindBy (xpath = "//span[text()='映射']/following-sibling::span/span")
    private WebElement CheckMap;

    public WebElement getCheckPortType() {
        return CheckPortType;
    }

    @FindBy(xpath = "//span[text()='端口类型']/following-sibling::span")
    private WebElement CheckPortType;


    public WebElement getSyslogtag() {
        return Syslogtag;
    }

    public WebElement getSyslogappname() {
        return Syslogappname;
    }

    public WebElement getAddNewMap() {
        return AddNewMap;
    }

    public WebElement getAddsuccessmsg() {
        return Addsuccessmsg;
    }

    @FindBy(xpath = "//p[@class='_1YeMXA5GiLhhXEnu-UQysl']")
    private WebElement Addsuccessmsg;

    public WebElement getContinueAdd() {
        return ContinueAdd;
    }

    @FindBy(xpath = "//a[text()='继续添加']")
    private WebElement ContinueAdd;

    public WebElement getConfigDatasource() {
        return ConfigDatasource;
    }

    @FindBy(xpath = "//a[text()='批量配置该数据源']")
    private WebElement ConfigDatasource;

    public WebElement getDatafetch() {
        return Datafetch;
    }

    @FindBy(xpath = "//a[text()='提取字段']")
    private WebElement Datafetch;

    public WebElement getCurrentConfiguration() {
        return CurrentConfiguration;
    }

    @FindBy(xpath = "//a[text()='查看当前配置']")
    private WebElement CurrentConfiguration;

    public WebElement getSyslogType() {
        return SyslogType;
    }

    public WebElement getBlackListInput() {
        return BlackListInput;
    }

    @FindBy(xpath = "//div[text()='Syslog']")
    private WebElement SyslogType;

    public WebElement getListenaddress() {
        return Listenaddress;
    }

    public WebElement getWhitelistRoot() {
        return WhitelistRoot;
    }


    public WebElement getMonitoring() {
        return Monitoring;
    }

    @FindBy(xpath = "//span[text()='连续监视']/following-sibling::span")
    private WebElement Monitoring;

    @FindBy(xpath = "//div[@class='ant-form-explain']")
    private WebElement PreviewMessage;

    @FindBy(xpath = "//span[@class='ant-radio']")
    private WebElement ChooseButton;

    public WebElement getAppaname() {
        return Appaname;
    }

    @FindBy(xpath = "//label[contains(@title,'appname')]/parent::div/following-sibling::div//input")
    private WebElement Appaname;

    @FindBy(xpath = "//label[contains(@title,'tag')]/parent::div/following-sibling::div//input")
    private WebElement Tag;

    public WebElement getLastChangeTime() {
        return LastChangeTime;
    }


    public WebElement getInputKind() {
        return InputKind;
    }

    @FindBy(xpath = "//span[text()='输入类型']/following-sibling::span")
    private WebElement InputKind;


    public WebElement getRoleDropdown() {
        roleDropdown.click();
        return super.getLastDropdownList();
    }

    public WebElement getRootMessage() {
        return RootMessage;
    }

    @FindBy(xpath = "//label[contains(@title,'文件或目录')]/parent::div/following-sibling::div//div[@class='ant-form-explain']")
    private WebElement RootMessage;

    public WebElement getWhiteListMessage() {
        return WhiteListMessage;
    }

    @FindBy(xpath = "//label[contains(@title,'文件路径白名单')]/parent::div/following-sibling::div//div[@class='ant-form-explain']")
    private WebElement WhiteListMessage;

    public WebElement getWhiteListInput() {
        return WhiteListInput;
    }
    public WebElement getRootListInput() {
        return RootListInput;
    }

    @FindBy(xpath = "//label[contains(@title,'文件或目录')]/parent::div/following-sibling::div//input")
    private WebElement RootListInput;

    @FindBy(xpath = "//label[contains(@title,'文件路径白名单')]/parent::div/following-sibling::div//input")
    private WebElement WhiteListInput;


    public WebElement getChooseButton() {
        return ChooseButton;
    }


    public WebElement getGroupName() {
        return this.getContainsInputElement("名称");
    }

    public WebElement getCreate() {
        return super.getButton("添加");
    }

    public WebElement getEnsureCleanOutput() {
        return super.getButton("确定");
    }

    public WebElement getCleanOutput() {
        return cleanOutput;
    }

    public WebElement getDeleteConfig() {
        return super.getButton("确定");
    }

    public WebElement getSummary() {
        return summary;
    }

    public WebElement getEnsure() {
        return super.getButton("确定");
    }

    public WebElement getFile() {
        return file;
    }

    public WebElement getBack() {
        return super.getButton("上一步");
    }

    public WebElement getNext() {
        return super.getButton("下一步");
    }

    public WebElement getAdd() {
        return super.getButton("添加");
    }

    public WebElement getDocument() {
        return getInputElement("文件或目录");
    }

    public WebElement getWhiteList() {
        return getInputElement("文件路径白名单");
    }

    public WebElement getLastModifyTime() {
        return getInputElement("最后修改时间");
    }

    public WebElement getTag() {
        return Tag;
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getCleanCache() {
        return super.getButton("清理缓存");
    }

    public WebElement getMessage() {
        return super.getErrorMessage();
    }
    public WebElement getMemoMessage() {
        return MemoMessage;
    }

    @FindBy(xpath = "//p[@class='_1JjlGgMGUnJmBrqR_9PZl8']")
    private WebElement MemoMessage;

    public WebElement getInputElement(String text) {
        return webDriver.findElement(By.xpath("//label[text()='" + text + "']/ancestor::div/following-sibling::div//input"));
    }

    public WebElement getContainsInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[contains(text(),'" + name + "')]/following-sibling::div//input"));
    }
}
