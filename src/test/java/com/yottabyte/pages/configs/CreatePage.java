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

    @FindBy(xpath = "//h3[text()='日志样例']/following-sibling::div/textarea")
    private WebElement logSample;

    @FindBy(xpath = "//h3[text()='基本信息']")
    private WebElement basicInfo;

    @FindBy(xpath = "//h3[text()='规则配置完成！']")
    private WebElement configDone;

    @FindBy(xpath = "//label[text()='正则表达式']/following-sibling::div/textarea")
    private WebElement regex;

    @FindBy(xpath = "(//label[text()='正则表达式']/following-sibling::div/textarea)[2]")
    private WebElement regex2;

    @FindBy(className = "json-formatter-string")
    private List<WebElement> valueList;

    @FindBy(className = "json-formatter-number")
    private List<WebElement> numberList;

    @FindBy(xpath = "//label[text()='来源字段']")
    private WebElement sourceFieldLabel;

    @FindBy(xpath = "(//label[text()='来源字段']/following-sibling::div//i)[last()]")
    private WebElement sourceField;

    @FindBy(xpath = "(//label[contains(text(),'来源字段')]/following-sibling::div//input[@class='el-input__inner'])[2]")
    private WebElement sourceFieldLabel2;

    @FindBy(xpath = "(//label[contains(text(),'来源字段')]/following-sibling::div//input[@class='el-input__inner'])[3]")
    private WebElement sourceFieldLabel3;

    @FindBy(xpath = "(//label[contains(text(),'来源字段')]/following-sibling::div//input[@class='el-input__inner'])[4]")
    private WebElement sourceFieldLabel4;

    @FindBy(className = "el-icon-plus")
    private WebElement plusButton;

    @FindBy(className = "yw-extract-big-input")
    private WebElement pathInput;

    @FindBy(className = "el-checkbox")
    private WebElement checkbox;

    @FindBy(xpath = "//div[text()='source']/preceding-sibling::input")
    private WebElement source;

    @FindBy(xpath = "//label[text()='替换内容']/following-sibling::div/textarea")
    private WebElement replaceContent;

    @FindBy(className = "json-formatter-boolean")
    private List<WebElement> booleanList;

    @FindBy(xpath = "//a[text()='+ 解析成功时添加字段']")
    private WebElement addField;

    @FindBy(xpath = "//input[@placeholder='请输入键']")
    private WebElement key;

    @FindBy(xpath = "//input[@placeholder='请输入键']/ancestor::div/following-sibling::div/input")
    private WebElement value;

    @FindBy(className = "el-switch")
    private WebElement switchButton;

    @FindBy(xpath = "//div[text()='appname']/preceding-sibling::input")
    private WebElement appName;

    @FindBy(xpath = "//div[text()='tag']/preceding-sibling::input")
    private WebElement tag;

    @FindBy(xpath = "//div[text()='hostname']/preceding-sibling::input")
    private WebElement hostName;

    @FindBy(className = "yw-extract-sample")
    private WebElement extractSample;

    @FindBy(id = "yw-extract-side-result")
    private WebElement result;

    @FindBy(className = "my-check-failed")
    private WebElement failedMessage;

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
        return appName;
    }

    public WebElement getTag() {
        return tag;
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
        return getInputElement("规则名称");
    }

    public WebElement getLogtype() {
        return getInputElement("Logtype");
    }

    public WebElement getGroup() {
        return super.getDropdownList("分组");
    }

    public WebElement getParseButton() {
        return super.getButton("解析");
    }

    public WebElement getParseRule() {
        return super.getDropdownList("添加解析规则");
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

    public WebElement getSourceFieldLabel2() {
        sourceFieldLabel2.click();
        return getLastDropdownList();
    }

    public WebElement getSourceField() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(sourceFieldLabel));
        sourceField.click();
        return super.getLastDropdownList();
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
        return pathInput;
    }

    public WebElement getBoolean1() {
        return booleanList.get(0);
    }

    public WebElement getSuccessMessage() {
        return super.getSuccessMessage();
    }

    public WebElement getNumber1() {
        return numberList.get(0);
    }

    public WebElement getNumber2() {
        return numberList.get(1);
    }

    public WebElement getValue1() {
        return valueList.get(0);
    }

    public WebElement getValue2() {
        return valueList.get(1);
    }

    public WebElement getValue3() {
        return valueList.get(2);
    }

    public WebElement getValue4() {
        return valueList.get(3);
    }

    public WebElement getValue5() {
        return valueList.get(4);
    }

    public WebElement getValue6() {
        return valueList.get(5);
    }

    public WebElement getValue7() {
        return valueList.get(6);
    }

    public WebElement getValue8() {
        return valueList.get(7);
    }

    public WebElement getValue9() {
        return valueList.get(8);
    }

    public WebElement getValue10() {
        return valueList.get(9);
    }

    public WebElement getValue11() {
        return valueList.get(10);
    }

    public WebElement getValue12() {
        return valueList.get(11);
    }

    public WebElement getValue13() {
        return valueList.get(12);
    }

    public WebElement getValue14() {
        return valueList.get(13);
    }

    public WebElement getValue15() {
        return valueList.get(14);
    }

    public WebElement getValue16() {
        return valueList.get(15);
    }

    public WebElement getValue17() {
        return valueList.get(16);
    }

    public WebElement getValue18() {
        return valueList.get(17);
    }

    public WebElement getCheckbox() {
        return checkbox;
    }

    public WebElement getSource() {
        return source;
    }

    public WebElement getSourceFieldLabel3() {
        sourceFieldLabel3.click();
        return super.getLastDropdownList();
    }

    public WebElement getSourceFieldLabel4() {
        sourceFieldLabel4.click();
        return super.getLastDropdownList();
    }

    public WebElement getRegex2() {
        return regex2;
    }

    public WebElement getReplaceContent() {
        return replaceContent;
    }

    @Override
    public WebElement getInputElement(String text) {
        String xpath = "//label[contains(text(),'" + text + "')]/following-sibling::input";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getResult() {
        return result;
    }
}
