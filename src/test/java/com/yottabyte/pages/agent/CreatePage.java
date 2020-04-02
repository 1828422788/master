package com.yottabyte.pages.agent;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.DropdownUtils;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

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
        return getCheckpageElement("appname");
    }


    public WebElement getCheckTag() {
        return getCheckpageElement("tag");
    }

    public WebElement getPreviewMessage() {
        return PreviewMessage;
    }

    public WebElement getPreview() {
        return Preview;
    }

    @FindBy(xpath = "//span[text()='文件路径白名单']/following-sibling::span")
    private WebElement WhitelistRoot;

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

    public WebElement getSyslogEditip() {
        return SyslogEditip;
    }

    @FindBy(xpath = "//div[text()='Syslog 配置修改']/parent::div/following-sibling::div/descendant::tbody/tr/td[1]/descendant::input")
    private WebElement SyslogEditip;

    public WebElement getSyslogEditappname() {
        return SyslogEditappname;
    }

    public WebElement getSyslogEdittag() {
        return SyslogEdittag;
    }

    public WebElement getSyslogEditdelete() {

        return SyslogEditdelete;
    }

    @FindBy(xpath = "//div[text()='Syslog 配置修改']/parent::div/following-sibling::div/descendant::tbody/tr/td[2]/descendant::input")
    private WebElement SyslogEditappname;

    @FindBy(xpath = "//div[text()='Syslog 配置修改']/parent::div/following-sibling::div/descendant::tbody/tr/td[3]/descendant::input")
    private WebElement SyslogEdittag;

    @FindBy(xpath = "//div[text()='Syslog 配置修改']/parent::div/following-sibling::div/descendant::tbody/tr/td[5]/descendant::input")
    private WebElement SyslogEditdelete;

    @FindBy(xpath = "(//div[contains(@class,'ant-select-selection--single')])[last()]")
    private WebElement SyslogChar;

    public WebElement getSyslogChar() {
        SyslogChar.click();
        return super.getLastDropdownList();
    }

    @FindBy(xpath = "//label[contains(@title,'appname')]/parent::div/following-sibling::div//input" )
    private WebElement BeatsAppname;

    @FindBy(xpath = "//label[contains(@title,'tag')]/parent::div/following-sibling::div//input" )
    private WebElement BeatsTag;


    public WebElement getBeatsAppname() {
        return BeatsAppname;
    }

    public WebElement getBeatsTag() {
        return BeatsTag;
    }

    public WebElement getCheckListenaddress() {
        return getCheckpageElement("监听地址");
    }


    public WebElement getCheckScriptFile() {
        return getCheckpageElement("脚本文件");
    }

    public WebElement getCheckParam(){
        return getCheckpageElement("参数");
    }

    public WebElement getCheckChangeRowRule(){
        return getCheckpageElement("换行规则");
    }

    public WebElement getCheckInternal(){
        return getCheckpageElement("间隔");
    }
    public WebElement getCheckMap() {
        return getCheckpageElement("映射");
    }


    public WebElement getCheckPortType() {
        return CheckPortType;
    }

    @FindBy(xpath = "//span[text()='端口类型']/following-sibling::span")
    private WebElement CheckPortType;

    public WebElement getChangeMemo() {
        return ChangeMemo;
    }

    @FindBy(xpath = "//div[@class='ant-message-custom-content ant-message-success']")
    private WebElement ChangeMemo;

    @FindBy(className = "ant-table-tbody")
    private List<WebElement> tableBodyList;

    public WebElement getAppNameTable() {
        return getTableElement("文件和目录");
    }

    public WebElement getScriptTable() {
        return getTableElement("脚本");
    }

    public WebElement getFuctionTypeTable() {
        return getTableElement("性能数据");
    }

    public WebElement getDatabaseTypeTable() {
        return getTableElement("数据库数据");
    }

    public WebElement getBeatsTable() {
        return getTableElement("Beats");
    }



    public WebElement getSyslogTable() {
        return getTableElement("Syslog");
    }

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

    public WebElement getConfigDatasourceMsg() {
        return ConfigDatasourceMsg;
    }

    @FindBy(xpath = "//div[@class='ant-modal-title']")
    private WebElement ConfigDatasourceMsg;

    public WebElement getCurrentConfiguration() {
        return CurrentConfiguration;
    }

    @FindBy(xpath = "//a[text()='查看当前配置']")
    private WebElement CurrentConfiguration;

    public WebElement getAutohekafiletest() {
        return autohekafiletest;
    }

    @FindBy(xpath = "//td[text()='apache']")
    private WebElement autohekafiletest;

    public WebElement getEditAutoScript() {
        return getEditAutoScript;
    }

    @FindBy(xpath = "//td[text()='autohekascripttest']/following-sibling::td//a[text()='编辑']")
    private WebElement getEditAutoScript;

    public WebElement getEditAutoFile() {
        return EditAutoFile;
    }

    @FindBy(xpath = "//td[text()='autohekafiletest']/following-sibling::td//a[text()='编辑']")
    private WebElement EditAutoFile;

    public WebElement getDataSourceSwitchStatus() {
        return getSwitchStatus("autohekafiletest");
    }

    public WebElement getScriptSwitchStatus() {
        return getSwitchStatus("autohekascripttest");
    }

    public WebElement getSyslogSwitchStatus() {
        return getSwitchStatus("192.168.1.161:514");
    }

    public WebElement getBeatsSwitchStatus() {
        return getSwitchStatus("192.168.1.139:299");
    }


    public WebElement getFuctionTypeSwitchStatus() {
        return getSwitchStatus("磁盘指标, 系统指标");
    }

    public WebElement getDatabaseTypeSwitchStatus() {
        return getSwitchStatus("autotestmysql");
    }

    public WebElement getSyslogType() {
        return getSoureceTypeElement("Syslog");
    }

    public WebElement getScriptType() {
        return getSoureceTypeElement("脚本");
    }

    public WebElement getFuctionType() {
        return getSoureceTypeElement("性能数据");
    }

    public WebElement getDatabaseType() {
        return getSoureceTypeElement("数据库数据");
    }

    public WebElement getBeatsType() {
        return getSoureceTypeElement("Beats");
    }

    public WebElement getPacketbeatType() {
        return getSoureceTypeElement("Packetbeat");
    }

    public WebElement getS3Type() {
        return getSoureceTypeElement("S3");
    }

    public WebElement getKafkaType() {
        return getSoureceTypeElement("Kafka");
    }

    public WebElement getCreateLink(){
        return getSoureceTypeElement("+新建连接");
    }

    public WebElement getListenaddress() {
        return Listenaddress;
    }

    public WebElement getWhitelistRoot() {
        return WhitelistRoot;
    }


    public WebElement getMonitoring() {
        return Monitoring;
    }

    public WebElement getMysqlDatabase() {
        return MysqlDatabase;
    }
    @FindBy(xpath = "//span[text()='连续监视']/following-sibling::span")
    private WebElement Monitoring;

    @FindBy(xpath = "//div[@class='ant-form-explain']")
    private WebElement PreviewMessage;

    public WebElement getEditMysql() {
        return EditMysql;
    }

    @FindBy(xpath = "//span[text()='autotestmysql']/following-sibling::span/span[text()='编辑']")
    private WebElement EditMysql;

    public WebElement getCopyMysql() {
        return CopyMysql;
    }

    @FindBy(xpath = "//span[text()='autotestmysql']/following-sibling::span/span[text()='复制']")
    private WebElement CopyMysql;

    public WebElement getDeleteMysql() {
        return DeleteMysql;
    }

    @FindBy(xpath = "//span[text()='autotestmysql']/following-sibling::span/span[text()='删除']")
    private WebElement DeleteMysql;

    @FindBy(xpath ="//span[text()='autotestmysql']")
    private WebElement MysqlDatabase;

    @FindBy(xpath = "//p")
    private WebElement Preview;

    @FindBy(xpath = "//span[@class='ant-radio']")
    private WebElement ChooseButton;


    public List<WebElement> getTableBodyList() {
        return tableBodyList;
    }

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

    public WebElement getChooseButton() {
        return ChooseButton;
    }

    public WebElement getGetEditAutoScript() {
        return getEditAutoScript;
    }

//    @FindBy(xpath = "//div[@class='ant-select-selection-selected-value']")
//    private WebElement Frequency;

    public WebElement getGroupName() {
        return this.getContainsInputElement("名称");
    }

    public WebElement getCreate() {
        return super.getButton("新建");
    }

    public WebElement getCleanOutput() {
        return cleanOutput;
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

    public WebElement getBackup() {
        return super.getButton("返回");
    }

    public WebElement getSave() {
        return super.getButton("保存");
    }
    public WebElement getNext() {
        return super.getButton("下一步");
    }

    public WebElement getFinish() {
        return super.getButton("完成");
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

    public WebElement getFrequency(){
        return getDropDownListElement("采集频率");
    }

    public WebElement getCharacterKind(){
        return getDropDownListElement("字符集");
    }

    public WebElement getCharsetKind(){
        return getDropDownListElement("charset");
    }

    public WebElement getRoot() {
        return getInputElement("路径");
    }

    public WebElement getRegex() {
        return getInputElement("换行正则");
    }

    public WebElement getBlackList() {
        return getInputElement("文件路径黑名单");
    }

    public WebElement getStream() {
        return getInputElement("分流字段");
    }

    public WebElement getContextWhiteList() {
        return getInputElement("日志内容白名单");
    }

    public WebElement getContextBlackList() {
        return getInputElement("日志内容黑名单");
    }

    public WebElement getEditSql() {
        return getInputElement("SQL 语句");
    }
    public WebElement getInternalTime() {
        return getInputElement("间隔时间");
    }

    public WebElement getInternalTimeKind() {
        return getDropDownListElement("间隔时间");
    }

    public WebElement getEidtFrequency() {
        return getInputElement("采集频率");
    }

    public WebElement getIncreaseData() {
        return getInputElement("增量字段");
    }

    public WebElement getIncreaseSymbol() {
        return getInputElement("增量操作符");
    }

    public WebElement getRecordNumber() {
        return getInputElement("每轮采集记录条数");
    }

    public WebElement getExcuteFile() {
        return getInputElement("可执行文件");
    }


    public WebElement getAppname(){
        return getInputElement("appname");
    }
    public WebElement getProcessWhiteList(){
        return getInputElement("采集进程白名单");
    }

    public WebElement getPreAppname(){
        return getInputElement("appname前缀");
    }

    public WebElement getScriptFile() {
        return getInputElement("脚本文件");
    }

    public WebElement getSpecialPort() {
        return getInputElement("采集特定端口");
    }

    public WebElement getTimeKind(){
        return getDropDownListElement("最后修改时间");
    }

    public WebElement getParam() {
        return getInputElement("参数");
    }

    public WebElement getChangeRowRule() {
        return getInputElement("换行规则");
    }

    public WebElement getInterval(){
        return getInputElement("间隔");
    }

    public WebElement getSort() {
        return getInputElement("排序字段");
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

    public WebElement getCancle() {
        return super.getButton("取消");
    }

    public WebElement getMessage() {
        return super.getErrorMessage();
    }

    public WebElement getLinkName() {
        return getInputElement("连接名称");
    }
    public WebElement getUsername() {
        return getInputElement("用户名");
    }

    public WebElement getPassword() {
        return getInputElement("密码");
    }
    public WebElement getMysqlPort() {
        return getInputElement("端口");
    }


    public WebElement getHost() {
        return getInputElement("主机");
    }

    public WebElement getDataBaseName() {
        return getInputElement("数据库名");
    }

    public WebElement getMaxLink() {
        return getInputElement("最大连接数");
    }

    public WebElement getSql() {
        return getInputElement("SQL 查询语句");
    }



    public WebElement getMemoMessage() {
        return MemoMessage;
    }

    @FindBy(xpath = "//p[@class='_1JjlGgMGUnJmBrqR_9PZl8']")
    private WebElement MemoMessage;

    public WebElement getInputElement(String text) {
        return webDriver.findElement(By.xpath("//label[text()='" + text + "']/parent::div/following-sibling::div//input"));
    }

    public WebElement getContainsInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[contains(text(),'" + name + "')]/following-sibling::div//input"));
    }

    public WebElement getSoureceTypeElement(String name) {
        return webDriver.findElement(By.xpath("//div[text()='" + name + "']"));
    }
    public WebElement getCheckpageElement(String name) {
        return webDriver.findElement(By.xpath("//span[text()='" + name + "']/following-sibling::span/span"));
    }

    public WebElement getTableElement(String name) {
        return webDriver.findElement(By.xpath("//div[text()='" + name +"']/following-sibling::div//tbody"));
    }

    public WebElement getSwitchStatus(String name) {
        return webDriver.findElement(By.xpath("//td[text()='" + name +"']/following-sibling::td//span[@class='_3c6He8Je7GGUAtVZrEV7Nd']"));
    }


    public WebElement getDropDownListElement(String name) {
        DropdownUtils dropdownUtils = new DropdownUtils();
        WebElement element = webDriver.findElement(By.xpath("//label[@title='" + name + "']/parent::div/following-sibling::div//div[@class='ant-select-selection__rendered']/following-sibling::span/i"));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return dropdownUtils.getLastDropdownList();
    }
}
