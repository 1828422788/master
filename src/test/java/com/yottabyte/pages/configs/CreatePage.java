package com.yottabyte.pages.configs;

import com.yottabyte.pages.PageTemplate;
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
public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//textarea[@placeholder='请输入raw_message']")
    private WebElement logSample;

    @FindBy(xpath = "//span[text()='添加解析规则']")
    private WebElement addRule;

    @FindBy(xpath = "//h3[text()='基本信息']")
    private WebElement basicInfo;

    @FindBy(xpath = "//div[text()='规则配置完成！']")
    private WebElement configDone;

    @FindBy(xpath = "(//div[text()='正则表达式'])[last()]/following-sibling::div/textarea")
    private WebElement regex;

    @FindBy(xpath = "//div[text()='来源字段']")
    private WebElement sourceFieldLabel;

    @FindBy(xpath = "(//label[text()='来源字段']/following-sibling::div//i)[last()]")
    private WebElement sourceField;

    @FindBy(xpath = "//div[text()='路径']/following-sibling::i")
    private WebElement plusButton;

    @FindBy(className = "ant-checkbox-wrapper")
    private WebElement checkbox;

    @FindBy(xpath = "//textarea[@placeholder='请输入替换内容']")
    private WebElement replaceContent;

    @FindBy(className = "json-formatter-boolean")
    private List<WebElement> booleanList;

    @FindBy(xpath = "//span[text()='+ 解析成功时添加字段']")
    private WebElement addField;

    @FindBy(xpath = "//div[text()='添加字段']/following-sibling::div/input")
    private WebElement key;

    @FindBy(xpath = "(//div[text()='添加字段']/following-sibling::div/input)[2]")
    private WebElement value;

    @FindBy(className = "ant-switch")
    private WebElement switchButton;

    @FindBy(xpath = "//div[text()='hostname']/preceding-sibling::input")
    private WebElement hostName;

    @FindBy(className = "yw-extract-sample")
    private WebElement extractSample;

    @FindBy(id = "yw-extract-side-result")
    private WebElement result;

    @FindBy(xpath = "//span[text()='解析失败']")
    private WebElement failedMessage;

    @FindBy(className = "ace_content")
    private WebElement ruleContent;

    @FindBy(className = "anticon-swap")
    private WebElement changeToJson;

    @FindBy(xpath = "//textarea[@placeholder='请输入结构体定义']")
    private WebElement struct;

    @FindBy(className = "el-message__group")
    private WebElement successMessage;

    @FindBy(xpath = "//span[text()='解析成功']")
    private WebElement checkSuccess;

    @FindBy(className = "verify-text")
    private WebElement verifyText;

    @FindBy(xpath = "(//span[text()='解析成功'])[2]")
    private WebElement checkSuccess2;

    @FindBy(xpath = "(//span[text()='解析成功'])[3]")
    private WebElement checkSuccess3;

    @FindBy(xpath = "(//span[text()='解析成功'])[4]")
    private WebElement checkSuccess4;

    @FindBy(xpath = "//span[text()='int']/ancestor::label")
    private WebElement intRadio;

    @FindBy(xpath = "//span[text()='float']/ancestor::label")
    private WebElement floatRadio;

    @FindBy(xpath = "//div[text()='只替换第一个']/preceding-sibling::div/label")
    private WebElement replaceFirst;

    public WebElement getApp() {
        return super.getDropdownList("应用");
    }

    public WebElement getReturn() {
        return super.getButton("返回");
    }

    public WebElement getDone() {
        return super.getButton("完成");
    }

    public WebElement getReplaceFirst() {
        return replaceFirst;
    }

    public WebElement getTimeZone() {
        return super.getDropdownList("时区");
    }

    public WebElement getLanguage() {
        return super.getDropdownList("语言");
    }

    public WebElement getIntRadio() {
        return intRadio;
    }

    public WebElement getFloatRadio() {
        return floatRadio;
    }

    public WebElement getAddRule() {
        return addRule;
    }

    public WebElement getCheckSuccess4() {
        return checkSuccess4;
    }

    public WebElement getCheckSuccess3() {
        return checkSuccess3;
    }

    public WebElement getCheckSuccess2() {
        return checkSuccess2;
    }

    public WebElement getVerifyText() {
        return verifyText;
    }

    public WebElement getCheckSuccess() {
        return checkSuccess;
    }

    public WebElement getRuleName() {
        return getInputElement("规则名称");
    }

    public WebElement getRedirect() {
        return super.getDropdownList("重定向规则");
    }

    public WebElement getStruct() {
        return struct;
    }

    public WebElement getPrefix() {
        return getInputElement("匹配前缀");
    }

    public WebElement getPostfix() {
        return getInputElement("匹配后缀");
    }

    public WebElement getChangeToJson() {
        return changeToJson;
    }

    public WebElement getRuleContent() {
        return ruleContent;
    }

    public WebElement getCode() {
        return getInputElement("编码");
    }

    public WebElement getDictionary() {
        return super.getDropdownList("字典");
    }

    public WebElement getBaseField() {
        return super.getDropdownList("基准字段");
    }

    public WebElement getExtendField() {
        return super.getDropdownList("扩展字段");
    }

    public WebElement getErrorMessage() {
        return failedMessage;
    }

    public WebElement getMaxMatchLength() {
        return getInputElement("最大匹配长度");
    }

    public WebElement getTimestampPrefix() {
        return getInputElement("时间戳前缀");
    }

    public WebElement getExtractSample() {
        return extractSample;
    }

    public WebElement getConfigDone() {
        return configDone;
    }

    public WebElement getBasicInfo() {
        return basicInfo;
    }

    public WebElement getHostName() {
        return hostName;
    }

    public WebElement getAppName() {
        return this.findInputByPlaceholder("请输入appname");
    }

    public WebElement getTag() {
        return this.findInputByPlaceholder("请输入tag");
    }

    public WebElement getSwitchButton() {
        return switchButton;
    }

    public WebElement getNextButton() {
        return super.getButton("下一步");
    }

    public WebElement getKey() {
        return key;
    }

    public WebElement getValue() {
        return value;
    }

    public WebElement getAddField() {
        return addField;
    }

    public WebElement getName() {
        return this.findInputByPlaceholder("请输入规则名称");
    }

    public WebElement getLogtype() {
        return this.findInputByPlaceholder("请输入Logtype");
    }

    public WebElement getGroup() {
        return super.getDropdownList("分组");
    }

    public WebElement getParseButton() {
        return super.getButton("解 析");
    }

    public WebElement getParseRule() {
        return super.getDropdownList("规则类型");
    }

    public WebElement getSourceField() {
        return super.getDropdownList("来源字段");
    }

    public WebElement getContinueButton() {
        return super.getButton("继续");
    }

    public WebElement getFormatRule() {
        return getInputElement("格式规则");
    }

    public WebElement getTargetField() {
        return getInputElement("目标字段");
    }

    public WebElement getFieldSeparator() {
        return getInputElement("字段分隔符");
    }

    public WebElement getKeyRegex() {
        return getInputElement("key正则");
    }

    public WebElement getValueRegex() {
        return getInputElement("value正则");
    }

    public WebElement getGroupRegex() {
        return getInputElement("group正则");
    }

    public WebElement getKVSeparator() {
        return getInputElement("k-v分隔符");
    }

    public WebElement getKeepKey() {
        return getInputElement("保留key");
    }

    public WebElement getDumpKey() {
        return getInputElement("丢弃key");
    }

    public WebElement getTimeFormat() {
        return getInputElement("时间格式");
    }

    public WebElement getDecimal() {
        return super.getDropdownList("数值进制");
    }

    public WebElement getSeparate() {
        return getInputElement("分隔符");
    }

    public WebElement getFieldList() {
        return getInputElement("字段列表");
    }

    public WebElement getSourceFieldInput() {
        return getInputElement("来源字段");
    }

    public WebElement getLogSample() {
        return logSample;
    }

    public WebElement getRegex() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(regex));
        return regex;
    }

    public WebElement getPathInput() {
        plusButton.click();
        return this.getInputElement("路径");
    }

    public WebElement getBoolean1() {
        return booleanList.get(0);
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getCheckbox() {
        return checkbox;
    }

    public WebElement getSource() {
        return findInputByPlaceholder("请输入source");
    }

    public WebElement getReplaceContent() {
        return replaceContent;
    }

    public WebElement getResult() {
        return result;
    }

    public WebElement getEnsureAddParseRule() {
        return super.getButton("确定");
    }
}
