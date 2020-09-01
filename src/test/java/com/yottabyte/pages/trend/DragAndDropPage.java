package com.yottabyte.pages.trend;

import com.yottabyte.utils.GetTime;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

public class DragAndDropPage extends CreatePage {
    public DragAndDropPage(WebDriver driver) {
        super(driver);
        driver.manage().window().setSize(new Dimension(1500,900));
    }

    @FindBy(xpath = "//span[text()='查看SPL']")
    private WebElement checkSPL;

    @FindBy(xpath = "(//div[text()='查看SPL']/ancestor::div/following-sibling::div/div)[1]")
    private WebElement SPL;

    @FindBy(className = "ant-popover")
    private WebElement panel;

    @FindBy(className = "ant-modal-close")
    private WebElement closeSPL;

    @FindBy(xpath = "//div[@id='dimensions']/span/span/span")
    private WebElement elementInDimensions;

    @FindBy(xpath = "//div[@id='values']/span/span/span")
    private WebElement elementInValues;

    @FindBy(xpath = "//div[@id='byFields']/span/span/span")
    private WebElement elementInCompare;

    @FindBy(xpath = "//i[@title='同环比']")
    private WebElement compareButton;

    @FindBy(xpath = "//label[text()='同环比']/following-sibling::span/span")
    private WebElement compareField;

    @FindBy(xpath = "//span[text()='分桶粒度']/ancestor::div/following-sibling::input")
    private WebElement span;

    @FindBy(xpath = "//span[text()='最小分桶粒度']/ancestor::div/following-sibling::input")
    private WebElement minSpan;

    @FindBy(xpath = "//span[text()='分桶个数']/ancestor::div/following-sibling::input")
    private WebElement bins;

    @FindBy(xpath = "//span[contains(@class, 'ant-select-tree-switcher')]/i")
    private WebElement iconDown;

    // Labels
    @FindBy (xpath = "//span[text()='标签']/ancestor::div/following-sibling::span//label[1]")
    private WebElement firstLabel;

    @FindBy (xpath = "//span[text()='标签']/ancestor::div/following-sibling::span//label[2]")
    private WebElement secondLabel;

    @FindBy (xpath = "//span[text()='标签']/ancestor::div/following-sibling::span//label[3]")
    private WebElement thirdLabel;

    @FindBy (xpath = "//span[text()='标签']/ancestor::div/following-sibling::span//label[4]")
    private WebElement forthLabel;

    @FindBy(xpath = "(//div[text()='柱状外右侧'])[last()]")
    private WebElement rightPosition;

    @FindBy(xpath = "(//div[@class='_2YOOafB8A7ZfHBScD1QcRz']/div/div)[1]")
    private WebElement otherChart;

    @FindBy(xpath = "//span[text()='展示字号']/ancestor::div[1]/following-sibling::span//input")
    private WebElement fontSize;

    @FindBy(xpath = "//span[text()='dataset_1']")
    private WebElement dataset_1;

    @FindBy(xpath = "//span[text()='dataset_2']")
    private WebElement dataset_2;

    @FindBy(xpath = "//span[text()='dataset_3']")
    private WebElement dataset_3;

    @FindBy(xpath = "//div[@class='_1eGH0JWTfcA_3z1BXlH42u']")
    private WebElement dateEditor;

    @FindBy(xpath = "//button[text()='今天']")
    private WebElement today;

    @FindBy(xpath = "(//div[@class='_2rT4h5iRfwtqnpHKelgSZv'])[last()]/div[1]")
    private WebElement columnField;

    @FindBy(xpath = "(//div[@class='_2rT4h5iRfwtqnpHKelgSZv'])[last()]/div[2]")
    private WebElement operator;

    @FindBy(xpath = "(//div[@class='_2rT4h5iRfwtqnpHKelgSZv'])[last()]/input")
    private WebElement value;

    @FindBy(xpath = "//*[@class='ant-table-tbody']/tr[1]")
    private WebElement tableBody;

    @FindBy(xpath = "//span[text()='满足下列条件']/following-sibling::div/div")
    private WebElement condition;

    @FindBy(xpath = "//span[text()='应用']")
    private WebElement apply;

    @FindBy(xpath = "//span[text()='添加']")
    private WebElement add;

    @FindBy(xpath = "//div[@class='ant-message-notice']//span")
    private WebElement message;

    @FindBy(xpath = "//span[text()='表达式过滤']/preceding-sibling::span")
    private WebElement expression;

    @FindBy(xpath = "(//div[text()='请拖入数据集']) | (//span[text()='拖入数据集到此加入表格']) | (//div[@class='_3J-0LSb-pcRagbVvd09jPY'])")
    private WebElement dropDataset;

    @FindBy(xpath = "//span[text()='数据概览']")
    private WebElement overview;

    @FindBy(xpath = "//div[@class='ant-tabs-nav-wrap']/div/div/div/div[3]")
    private WebElement customTimeTab;

    //Charts --------------------------------------------------------------------------
    public WebElement getLine() {
        return getElementByTitle("曲线图");
    }

    public WebElement getArea() {
        return getElementByTitle("面积图");
    }

    public WebElement getScatter() {
        return getElementByTitle("散点图");
    }

    public WebElement getColumn() {
        return getElementByTitle("柱状图");
    }

    public WebElement getPie() {
        return getElementByTitle("饼状图");
    }

    public WebElement getRose() {
        return getElementByTitle("玫瑰图");
    }

    public WebElement getBar() {
        return getElementByTitle("条形图");
    }

    public WebElement getChord() {
        return getElementByTitle("和弦图");
    }

    public WebElement getSankey() {
        return getElementByTitle("桑基图");
    }

    public WebElement getForce() {
        return getElementByTitle("力图");
    }

    public WebElement getMultiaxis() {
        return getElementByTitle("多y轴图");
    }

    public WebElement getHeatmap() {
        return getElementByTitle("热力地图");
    }

    public WebElement getSingle() {
        return getElementByTitle("单值");
    }

    public WebElement getWordcloud() {
        return getElementByTitle("字符云图");
    }

    public WebElement getRadar() {
        return getElementByTitle("雷达图");
    }

    public WebElement getFunnel() {
        return getElementByTitle("漏斗图");
    }

    public WebElement getTable() {
        return getElementByTitle("统计表");
    }

    //Objects to drag and drop -------------------------------------------------------------------
    public WebElement getDimensions() {
        return getElementById("dimensions");
    }

    public WebElement getValues() {
        return getElementById("values");
    }

    public WebElement getCompareBy() {
        return getElementById("byFields");
    }

    public WebElement getCompareByField() {
        return getElementById("byField");
    }

    public WebElement getBubbles() {
        return getElementById("bubbleField");
    }

    public WebElement getTimestamp() {
        return getElementById("timestamp");
    }

    public WebElement getClientip() {
        return getElementById("apache.clientip");
    }

    public WebElement getGeoCity() {
        return getElementById("apache.geo.city");
    }

    public WebElement getGeoProvince() {
        return getElementById("apache.geo.province");
    }

    public WebElement getResplen() {
        return getElementById("apache.resp_len");
    }

    public WebElement getStatus() {
        return getElementById("apache.status");
    }

    public WebElement getMethod() {
        return getElementById("apache.method");
    }

    //-------------------------------------------------------------------------------------
    public WebElement getElementInDimensions() {
        return elementInDimensions;
    }

    public WebElement getElementInValues() {
        return elementInValues;
    }

    public WebElement getElementInCompare() {
        return elementInCompare;
    }

    public WebElement getCompareButton() {
        return compareButton;
    }

    public WebElement getCompareField() {
        return compareField;
    }



    //--------------------------------------------------------------------------------------

    public WebElement getCheckSPL() {
        return checkSPL;
    }

    public WebElement getSPL() {
        return SPL;
    }

    public WebElement getCloseSPL() {
        return closeSPL;
    }

    public WebElement getPanel() {
        return panel;
    }

    public WebElement getSpan() {
        return span;
    }

    public WebElement getMinSpan() {
        return minSpan;
    }

    public WebElement getBins() {
        return bins;
    }

    //--------------------------------------------------------------------------------

    public WebElement getYesterday() {
        return getElementSpanByTitle("环比");
    }

    public WebElement getLastTradeDay() {
        iconDown.click();
        return getElementSpanByTitle("同比上一个交易日");
    }

    public WebElement getLastYear() {
        iconDown.click();
        return getElementSpanByTitle("去年同比值");
    }

    public WebElement getLastMonth() {
        iconDown.click();
        return getElementSpanByTitle("上月同比值");
    }

    public WebElement getLastWeek() {
        iconDown.click();
        return getElementSpanByTitle("上周同比值");
    }

    //---------------------------------------------------------------------------------

    public WebElement getFirstLabel() {
        return firstLabel;
    }

    public WebElement getSecondLabel() {
        return secondLabel;
    }

    public WebElement getThirdLabel() {
        return thirdLabel;
    }

    public WebElement getForthLabel() {
        return forthLabel;
    }

    public WebElement getRightPosition() {
        return rightPosition;
    }

    //----------------------------------------------------------------------------------

    public WebElement getOtherChart() {
        return otherChart;
    }

    public WebElement getFontSize() {
        return fontSize;
    }

    public WebElement getDataset_1() {
        return dataset_1;
    }

    public WebElement getDataset_2() {
        return dataset_2;
    }

    public WebElement getDataset_3() {
        return dataset_3;
    }

    public WebElement getDateEditor() {
        return dateEditor;
    }

    public WebElement getToday() {
        return today;
    }

    public WebElement getCustomTimeTab() {
        return customTimeTab;
    }

    public void getCustomTime() {
        GetTime.getTime(webDriver, "CustomTime");
    }

    public WebElement getStartTimeField() {
        return GetTime.getTime(webDriver, "StartTimeInput");
    }

    public WebElement getEndTimeField() {
        return GetTime.getTime(webDriver, "EndTimeInput");
    }

    public WebElement getStartDateField() {
        return GetTime.getTime(webDriver, "StartDateInput");
    }

    public WebElement getEndDateField() {
        return GetTime.getTime(webDriver, "EndDateInput");
    }

    public WebElement getApplyCustomTime() {
        return GetTime.getTime(webDriver, "ApplyCustomTime");
    }

    public WebElement getColumnField() {
        columnField.click();
        return super.getLastDropdownList();
    }

    public WebElement getOperator() {
        operator.click();
        return super.getLastDropdownList();
    }

    public WebElement getValue() {
        return value;
    }

    public WebElement getTableBody() {
        return tableBody;
    }

    public WebElement getCondition() {
        condition.click();
        return super.getLastDropdownList();
    }

    public WebElement getApply() {
        return apply;
    }

    public WebElement getAdd() {
        return add;
    }

    public WebElement getMessage() {
        return message;
    }

    public WebElement getExpression() {
        return expression;
    }

    public WebElement getDropDataset() {
        return dropDataset;
    }

    public WebElement getOverview() {
        return overview;
    }

    private WebElement getElementById(String name){
        return webDriver.findElement(By.id(name));
    }

    private WebElement getElementByTitle(String name) {
        return webDriver.findElement(By.xpath("//div[@title='" + name+ "']"));
    }

    private WebElement getElementSpanByTitle(String name) {
        WebElement element = webDriver.findElement(By.xpath("//span[@title='" + name+ "']/preceding-sibling::span/span"));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(element));
        return element;
    }

}
