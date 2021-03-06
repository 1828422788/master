package com.yottabyte.pages.agent;

import com.yottabyte.pages.EditorPage;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.DropdownUtils;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

/**
 * @author sunxj,sunxc
 */
public class CreatePage extends EditorPage {
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

    @FindBy(xpath = "//label[text()='最后修改时间']/parent::div/following-sibling::div//input")
    private WebElement LastChangeTime;

    @FindBy(xpath = "//span[text()='来源路径: ']/following-sibling::span")
    private WebElement SourceRoot;

    public WebElement getCheckAppname() {
        return getCheckpageElement("appname: ");
    }


    public WebElement getCheckTag() {
        return getCheckpageElement("tag: ");
    }

    public WebElement getPreview() {
        return super.getYottaButtonByText("预览");
    }

    @FindBy(xpath = "//span[text()='文件路径白名单']/following-sibling::span")
    private WebElement WhitelistRoot;

    @FindBy(xpath = "//span[contains(text(),'添加新映射')]")
    private WebElement AddNewMap;

    @FindBy(xpath = "(//input[contains(@yotta-test,'ip-input')])[last()]")
    private WebElement Syslogip;
    public WebElement getSyslogip() {
        return Syslogip;
    }

    @FindBy(xpath = "(//input[contains(@yotta-test,'ip-input')])[1]")
    private WebElement SyslogIpFirst;
    public WebElement getSyslogIpFirst() {
        return SyslogIpFirst;
    }

    @FindBy(xpath = "(//input[contains(@yotta-test,'ip-input')])[last()-1]")
    private WebElement SyslogIpPenult;
    public WebElement getSyslogIpPenult() {
        return SyslogIpPenult;
    }

    @FindBy(xpath = "(//div[contains(@yotta-test,'appname-autocomplete')])[last()]//input")
    private WebElement Syslogappname;

    @FindBy(xpath = "(//div[contains(@yotta-test,'tag-autocomplete')])[last()]//input")
    private WebElement Syslogtag;

    @FindBy(xpath = "(//span[@aria-label='ToTop'])[last()]")
    private WebElement ToTop;
    public WebElement getToTop(){
        return ToTop;
    }

    @FindBy(xpath = "(//span[@aria-label='ToBottom'])[1]")
    private WebElement ToBottom;
    public WebElement getToBottom(){
        return ToBottom;
    }

    @FindBy(xpath = "(//span[@aria-label='MoveUp'])[last()]")
    private WebElement moveUp;
    public WebElement getMoveUp(){
        return moveUp;
    }
    @FindBy(xpath = "(//span[@aria-label='MoveDown'])[last()-1]")
    private WebElement MoveDown;
    public WebElement getMoveDown(){
        return MoveDown;
    }

    @FindBy(xpath = "(//input[contains(@class,'yotta-input')])[2]")
    private WebElement SyslogEditIp;
    public WebElement getSyslogEditIp() {
        return SyslogEditIp;
    }
    @FindBy(xpath = "(//input[contains(@class,'yotta-input')])[last()]")
    private WebElement SyslogEditIpLast;
    public WebElement getSyslogEditIpLast() {
        return SyslogEditIpLast;
    }
    @FindBy(xpath = "(//input[contains(@class,'yotta-input')])[last()-1]")
    private WebElement SyslogEditIpPenult;
    public WebElement getSyslogEditIpPenult() {
        return SyslogEditIpPenult;
    }

    @FindBy(xpath = "(//div[@class='yotta-auto-complete-input'])[1]//input")
    private WebElement SyslogEditappname;
    public WebElement getSyslogEditappname() {
        return SyslogEditappname;
    }
    @FindBy(xpath = "(//div[@class='yotta-auto-complete-input'])[2]//input")
    private WebElement SyslogEdittag;
    public WebElement getSyslogEdittag() {
        return SyslogEdittag;
    }

    @FindBy(xpath = "(//span[@aria-label='Delete'])[last()]")
    private WebElement SyslogDelete;
    public WebElement getSyslogDelete() {
        return SyslogDelete;
    }

    public WebElement getSyslogChar() {
        return dropdownUtils.getDropdownListbyPath("//span[@class='yotta-select-selection-value']");
    }

    public WebElement getCheckListenaddress() {
        return getCheckpageElement("监听地址");
    }


    public WebElement getCheckScriptFile() {
        return getCheckpageElement("脚本文件: ");
    }

    public WebElement getCheckParam(){
        return getCheckpageElement("参数: ");
    }

    public WebElement getCheckChangeRowRule(){
        return getCheckpageElement("换行规则: ");
    }

    public WebElement getCheckInternal(){
        return getCheckpageElement("间隔: ");
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

    @FindBy(xpath = "//div[@class='yotta-message-manager']//span[@class='yotta-message-content']")
    private WebElement ChangeMemo;

    @FindBy(xpath = "//div[@class='yotta-dialog-content']/p[contains(text(),'删除目的对象失败，原因：')]")
    private WebElement ChangeMemofail;
    public WebElement getChangeMemofail() {
        return ChangeMemofail;
    }

    @FindBy(xpath = "//td[text()='fute']//following-sibling::td//span[text()='编辑']/..")
    private WebElement FuteEdit;
    public WebElement getFuteEdit(){
        return FuteEdit;
    }

    @FindBy(xpath = "//tbody")
    private WebElement BackUpTable;

    @FindBy(xpath = "//div[text()='输出配置']")
    private WebElement OutputEdit;

    public WebElement getOutputEdit() {
        return OutputEdit;
    }

    public WebElement getAppNameTable() {
        return getTableElement("文件和目录");
    }

    public WebElement getPacketbeatTable() {
        return getTableElement("PacketbeatInput");
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

    public WebElement getOutputTable() {
        return getTableElement("输出配置");
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
        return super.getYottaSpan("agent-syslog_add-dom");
    }

    private String Addsuccessmsg = "//div[@class='yotta-spinner-overlay']//p[contains(text(),'%s')]";
    public String getAddsuccessmsg(String name) {
        return String.format(Addsuccessmsg, name);
    }


    public WebElement getContinueAdd() {
        return super.getYottaButtonByText("继续添加");
    }

    public WebElement getConfigDatasource() {
        return super.getYottaButtonByText("批量配置该数据源");
    }

    public WebElement getDatafetch() {
        return super.getYottaButtonByText("在搜索中验证");
    }


    public WebElement getConfigDatasourceMsg() {
        return ConfigDatasourceMsg;
    }

    @FindBy(xpath = "//div[@class='yotta-modal-title']")
    private WebElement ConfigDatasourceMsg;

    public WebElement getCurrentConfiguration() {
        return super.getYottaButtonByText("查看当前配置");
    }
    public WebElement getSearchThis(){
        return super.getYottaButtonByText("在搜索中验证");
    }

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

//    @FindBy(xpath = "//td[text()='Changeautohekafileappname']/following-sibling::td//a[text()='编辑']")
//    private WebElement EditAutoFile1;
//    public WebElement getEditAutoFile1() {
//        return EditAutoFile1;
//    }


    public WebElement getJmxInput() {
        return webDriver.findElement(By.xpath("//span[text()='JmxInput']"));
    }
    public WebElement getCsvConfing() {
        return CsvConfing;
    }

    @FindBy(xpath = "//span[(text()='CSV文件配置')]/parent::span")
    private WebElement CsvConfing;


    public WebElement getHostConnectInput() {
        return super.getButtonByText("HostConnectInput");
    }

    public WebElement getCleanInputCache() {
        return getLiElement("清理输入源缓存");
    }

    public WebElement getCleanOutputCache() {
        return getLiElement("清理输出源缓存");
    }

    public WebElement getCompressed() {
        return Compressed;
    }

    @FindBy(xpath = "//input[@yotta-test='agent-compressed-switch']")
    private WebElement Compressed;

    public WebElement getEdit() {
        return super.getYottaButtonByText("编 辑");
    }

    public WebElement getEditconfig() {
        return super.getYottaButtonByText("编辑");
    }

    public WebElement getDataSourceSwitchStatus1(){
        return getSwitchStatus1("autohekafiletest");
    }
    public WebElement getDiskQuota() {
        return getBackUpSwitchStatus("磁盘指标");
    }

    public WebElement getDiskIO() {
        return getBackUpSwitchStatus("磁盘IO");
    }

    public WebElement getSystemQuota() {
        return getBackUpSwitchStatus("系统指标");
    }

    public WebElement getCPUQuota() {
        return getBackUpSwitchStatus("单个cpu指标");
    }

    public WebElement getNetQuota() {
        return getBackUpSwitchStatus("单个net指标");
    }

    public WebElement getProcessQuota() {
        return getBackUpSwitchStatus("进程指标");
    }

    public WebElement getZipSaveSwitchStatus() {
        return getBackUpSwitchStatus("压缩保存");
    }

    public WebElement getSecuritySwitchStatus() {
        return getBackUpSwitchStatus("使用安全链接");
    }

    public WebElement getDeleteLogSwitchStatus() {
        return getBackUpSwitchStatus("删日志源");
    }

    @FindBy(xpath = "//span[contains(text(),'磁盘指标')]/ancestor::td/preceding-sibling::td[last()]/span")
    private WebElement FuctionTypeSwitchStatus;
    public WebElement getFuctionTypeSwitchStatus() {
        return FuctionTypeSwitchStatus;
    }
    @FindBy(xpath = "//td[contains(text(),'hekabackup')]/../td[6]/span")
    private WebElement BackUpSwitchStatus1;
    public WebElement getBackUpSwitchStatus1() {
        return BackUpSwitchStatus1;
    }

    private String disableXpath = "//td[contains(text(),'%s')]/preceding-sibling::td[last()]//label[not(contains(@class,'switch-checked'))]";
    public String getDisableXpath(String name) {
        return String.format(disableXpath, name);
    }
    private String enableXpath = "//td[contains(text(),'%s')]/preceding-sibling::td[last()]//label[contains(@class,'switch-checked')]";
    public String getEnableXpath(String name) {
        return String.format(enableXpath, name);
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
        return getYottaButtonByText("新建连接");
    }

    public WebElement getCreateDestObject(){
        return super.getYottaButtonByText("新建目的对象");
    }

    public WebElement getListenaddress() {
        return getInputElement("监听地址");
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

    @FindBy(xpath = "//span[text()='连续监视: ']/following-sibling::span")
    private WebElement Monitoring;

    @FindBy(xpath = "//div[@class='yotta-modal-body']//div[@class='yotta-spinner-overlay']/div/div/div[2]/div[1]/span")
    private WebElement PreviewMessage1;
    public WebElement getPreviewMessage1(){
        return PreviewMessage1;
    }
    @FindBy(xpath = "//div[@class='yotta-modal-body']//div[@class='yotta-spinner-overlay']/div/div/div[2]/div[2]/span")
    private WebElement PreviewMessage2;
    public WebElement getPreviewMessage2(){
        return PreviewMessage2;
    }
    @FindBy(xpath = "//div[@class='yotta-modal-body']//div[@class='yotta-spinner-overlay']/div/div/div[2]/div[3]/span")
    private WebElement PreviewMessage3;
    public WebElement getPreviewMessage3(){
        return PreviewMessage3;
    }
    @FindBy(xpath = "//div[@class='yotta-form-field-help-text']")
    private WebElement PreviewMessage;
    public WebElement getPreviewMessage(){
        return PreviewMessage;
    }
    public WebElement getEditMysql() {
        return EditMysql;
    }

    @FindBy(xpath = "//span[text()='autotestmysql']/following-sibling::span/span[text()='编辑']")
    private WebElement EditMysql;

    public WebElement getEditBackUpObject() {
        return EditBackUpObject;
    }

    @FindBy(xpath = "//span[text()='autotest']/following-sibling::span/span[text()='编辑']")
    private WebElement EditBackUpObject;

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

    public WebElement getDelete(){
        return super.getButtonByText("删除");
    }

    public WebElement getDeleteMysql139() {
        return DeleteMysql139;
    }

    @FindBy(xpath = "//span[text()='autotestmysql139']/following-sibling::span/span[text()='删除']")
    private WebElement DeleteMysql139;

    public WebElement getDeleteBackUpObject() {
        return DeleteBackUpObject;
    }

    @FindBy(xpath = "//span[text()='autotest']/following-sibling::span/span[text()='删除']")
    private WebElement DeleteBackUpObject;

    @FindBy(xpath ="//span[text()='autotestmysql']")
    private WebElement MysqlDatabase;

    public WebElement getMysqlDatabase139() {
        return MysqlDatabase139;
    }

    @FindBy(xpath ="//span[text()='autotestmysql139']")
    private WebElement MysqlDatabase139;

    public WebElement getBackUpObject() {
        return BackUpObject;
    }

    @FindBy(xpath ="//span[text()='autotest']")
    private WebElement BackUpObject;

    @FindBy(xpath = "//span[@class='yotta-radio-input']")
    private WebElement ChooseButton;

    public WebElement getBackUpTable() {
        return BackUpTable;
    }

    @FindBy(xpath = "//label[text()='tag']/parent::div/following-sibling::div//input")
    private WebElement Tag;

    public WebElement getLastChangeTime() {
        return LastChangeTime;
    }

    public WebElement getInputKind() {
        return InputKind;
    }

    @FindBy(xpath = "//span[text()='输入类型: ']/following-sibling::span")
    private WebElement InputKind;

    public WebElement getAgentTitle() {
        return AgentTitle;
    }

    public WebElement getAgentMainTitle() {
        return AgentMainTitle;
    }

    @FindBy(xpath = "//span[@class='yotta-pageheader-title']")
    private WebElement AgentMainTitle;

    public WebElement getRoleDropdown() {
        roleDropdown.click();
        return super.getLastDropdownList();
    }

    public WebElement getRootMessage() {
        return RootMessage;
    }

    @FindBy(xpath = "//label[contains(text(),'文件或目录')]/../../div[2]//div[@class='yotta-form-field-help-text']")
    private WebElement RootMessage;

    public WebElement getWhiteListMessage() {
        return WhiteListMessage;
    }

    @FindBy(xpath = "//label[contains(text(),'文件路径白名单')]/../../div[2]//div[@class='yotta-form-field-help-text']")
    private WebElement WhiteListMessage;

    public WebElement getBackupLocalDisk() {
        return BackupLocalDisk;
    }

    @FindBy(xpath = "(((//label[text()='选择目的对象']/parent::div/following-sibling::div//label)[1])/span)[1]")
    private WebElement BackupLocalDisk;

    @FindBy(xpath = "//span[@class='yotta-pageheader-title']")
    private WebElement AgentTitle;

    public WebElement getAgentConfigurationTitle() {
        return AgentConfigurationTitle;
    }

    @FindBy(xpath = "//div[@class='ant-modal-title']")
    private WebElement AgentConfigurationTitle;

    @FindBy(xpath = "//span[text()='压缩：']/following-sibling::span")
    private WebElement CompressStatus;

    public WebElement getCompressStatus() {
        return CompressStatus;
    }
    @FindBy(xpath = "//span[text()='发送速率限制：']/following-sibling::span")
    private WebElement SendSpeedStatus;

    public WebElement getSendSpeedStatus() {
        return SendSpeedStatus;
    }
    @FindBy(xpath = "//span[text()='单行日志最大长度：']/following-sibling::span")
    private WebElement LogLengthStatus;

    public WebElement getLogLengthStatus() {
        return LogLengthStatus;
    }

    public WebElement getChooseButton() {
        return ChooseButton;
    }

    public WebElement getGetEditAutoScript() {
        return getEditAutoScript;
    }

    public WebElement getGroupName() {
        return this.getContainsInputElement("名称");
    }

    public WebElement getCleanOutput() {
        return cleanOutput;
    }

    public WebElement getSummary() {
        return summary;
    }

    public WebElement getEnsure() {
        return super.getYottaButtonByText("确定");
    }

    public WebElement getFile() {
        return file;
    }

    public WebElement getBack() {
        return super.getYottaButtonByText("上一步");
    }

    public WebElement getBackup() {
        return super.getYottaButtonByText("返回");
    }

    public WebElement getSave() {
        return super.getYottaButtonByText("保存");
    }

    public WebElement getNext() {
        return super.getYottaButtonByText("下一步");
    }

    public WebElement getFinish() {
        return super.getYottaButtonByText("完成");
    }

    public WebElement getSenior() {
        return getLiElement("高级");
    }

    public WebElement getBackupSenior() {
        return super.getYottaButtonByText("高级");
    }

    public WebElement getDetailMoreButton() {
        return DetailMoreButton;
//        DropdownUtils dropdownUtils = new DropdownUtils();
//        WebElement element = webDriver.findElement(By.xpath( "//span[(text()='更多')]/parent::span/parent::div"));
//        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
//        ClickEvent.clickUnderneathButton(element);
//        return webDriver.findElement(By.xpath("(//ul[@class='yotta-menu'])[last()]"));
    }

    @FindBy(xpath = "//span[(text()='更多')]/parent::span")
    private WebElement DetailMoreButton;

    public WebElement getAddBackUP() {
        return super.getYottaButtonByText("添加备份");
    }

    public WebElement getChangeConfiguration() {
        return super.getYottaButtonByText("修改&重启");
    }

    public WebElement getDownloadConfiguration() {
        return super.getYottaButtonByText("下载配置文件");
    }

    public WebElement getBackUp() {
        return webDriver.findElement(By.xpath("//span[text()='备份配置']"));
    }

    public WebElement getDocument() {
        return getInputElement("文件或目录");
    }

    public WebElement getWhiteList() {
        return getInputElement("文件路径白名单");
    }

    public WebElement getBackUPTime() {
        return getInputElement("只备份该时间前的文件");
    }

    public WebElement getLastModifyTime() {
        return getInputElement("最后修改时间");
    }

    public WebElement getFrequency(){
        return getDropDownListElement("采集频率");
    }

    public WebElement getBackUpTimeoutUnit(){
        return getDropDownListElement("超时时间");
    }

    public WebElement getCharset(){
        return getInputElement("charset");
    }

    public WebElement getCharsetKind(){
        return getDropDownListElement("charset");
    }

    public WebElement getCharacterKind(){
        return getDropDownListElement("字符集");
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

    public WebElement getBackUpRoot() {
        return getInputElement("备份路径(绝对路径)");
    }
    public WebElement getBackUpRoot1() {
        return getInputElement("备份路径(路径前缀)");
    }

    public WebElement getBackUpName() {
        return getInputElement("备份策略名");
    }

    public WebElement getBackUpRoute() {
        return getInputElement("执行周期");
    }

    public WebElement getBackUpTimeout() {
        return getInputElement("超时时间");
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

    public WebElement getDestObjectName(){
        return getInputElement("名称");
    }

    public WebElement getThreadNum(){
        return getInputElement("处理线程数");
    }

    public WebElement getServerAddress(){
        return getInputElement("服务器地址");
    }

    public WebElement getTimeOut(){
        return getInputElement("超时秒数");
    }

    public WebElement getSendSpeedLimit(){
        return getInputElement("发送速率限制");
    }

    public WebElement getLogLength(){
        return getInputElement("单行日志最大长度");
    }

    public WebElement getDestObjectKind(){
        return getInputElement("对象类型");
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

    public WebElement getSendSpeed(){
        return getDropDownListElement("发送速率限制");
    }

    public WebElement getTimeKind(){
        return getDropDownListElement("最后修改时间");
    }

    public WebElement getParam() {
        return getInputElement("执行参数");
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
        String xpath = "//span[text()='清理缓存']";
        return webDriver.findElement(By.xpath(xpath));
    }
    @FindBy(xpath = "//span[text()='分发']")
    private WebElement Distribution;
    public WebElement getDistribution(){
        return Distribution;
    }
    @FindBy(xpath = "//td[text()='192.168.1.139']/preceding-sibling::td//input")
    private WebElement AgentOne;
    public WebElement getAgentOne(){
        return AgentOne;
    }
    @FindBy(xpath = "//span[text()='确认分发']/..")
    private WebElement EnsureDistribution;
    public WebElement getEnsureDistribution(){
        return EnsureDistribution;
    }
    @FindBy(xpath = "//td[text()='192.168.1.139']/following-sibling::td[2]")
    private WebElement ChangeMemoSuccess;
    public WebElement getChangeMemoSuccess(){
        return ChangeMemoSuccess;
    }
    @FindBy(xpath = "//tbody/tr[1]/td[1]")
    private WebElement OneBackup;
    public WebElement getOneBackup(){
        return OneBackup;
    }
    @FindBy(xpath = "//span/a[text()='确定']")
    private WebElement Csvcertain;

    @FindBy(xpath = "//span/a[text()='编辑']")
    private WebElement Csvedit;

    public WebElement getCsvedit() {
        return Csvedit;
    }

    public WebElement getCsvdelete() {
        return Csvdelete;
    }

    @FindBy(xpath = "//span/a[text()='删除']")
    private WebElement Csvdelete;

    public WebElement getCsvcertain() {
        return Csvcertain;
    }

    public WebElement getCreate(){
        return getYottaButtonByText("添加数据");
    }

    public WebElement getCsvSave(){
        return getYottaButtonByText("保存文件");
    }

    @FindBy(xpath = "//div[@class='ant-message-custom-content ant-message-info']/span")
    private WebElement CsvChangeMemo;

    public WebElement getCsvChangeMemo(){
        return CsvChangeMemo;
    }

    public WebElement getCsvJmxRmi(){
        return getCsvInput(2);
    }

    public WebElement getCsvUser(){
        return getCsvInput(3);
    }

    public WebElement getCsvPassword(){
        return getCsvInput(4);
    }
    public WebElement getCsvWantPorts(){
        return getCsvInput(5);
    }
    public WebElement getCsvAppName(){
        return getCsvInput(6);
    }
    public WebElement getCsvtag(){
        return getCsvInput(7);
    }

    public WebElement getCsvapplicationName(){
        return getCsvInput(1);
    }

    public WebElement getClean() {
        return super.getYottaButtonByText("清理");
    }


    public WebElement getCancle() {
        return super.getYottaButtonByText("取消");
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

    @FindBy(xpath = "//div[@yotta-test='dialog-content-dom']/p")
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

    public WebElement getSwitchStatus1(String name) {
        return webDriver.findElement(By.xpath("//td[text()='"+name+"']/../td[6]/span"));
    }
    public WebElement getBackUpSwitchStatus(String name) {
        return webDriver.findElement(By.xpath("//label[text()='" + name + "']/parent::div/following-sibling::div//span[@class='yotta-switch-slider']"));
    }

    public WebElement getLiElement(String name) {
        return webDriver.findElement(By.xpath("//span[text()='" + name + "']//ancestor::li"));
    }

    public WebElement getCsvInput(int num){
        return webDriver.findElement(By.xpath("(//input[contains(@class,'yotta-input yotta-input-large ')])[" + num + "]"));

    }
    public WebElement getDropDownListElement(String name) {
        DropdownUtils dropdownUtils = new DropdownUtils();
        String xpath = "//label[text()='" + name + "']/parent::div/following-sibling::div//span[@class='yotta-select-selection-value']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        element.click();
        return webDriver.findElement(By.xpath("//div[contains(@class,'yotta-select-menu')]"));
    }


}
