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

    @FindBy(className = "_3vWjsNSa82KJ2BOg98qxO8")
    private WebElement chart;

    @FindBy(xpath = "//span[@aria-label='InfoCircleFilled']/ancestor::div/following-sibling::div/p")
    private WebElement prompt;

    @FindBy(className = "yotta-popover-wrap")
    private WebElement panel;

    @FindBy(className = "yotta-modal-close-icon")
    private WebElement closeSPL;

    @FindBy(xpath = "(//div[contains(@yotta-test,'dimensions')]//span[@aria-label='ControllSquareFilled'])[1]")
    private WebElement elementInDimensions;

    @FindBy(xpath = "(//div[contains(@yotta-test,'values-icon')]//span[@aria-label='ControllSquareFilled'])[1]")
    private WebElement elementInValues;

    @FindBy(xpath = "(//div[contains(@yotta-test,'values2')]//span[@aria-label='ControllSquareFilled'])[1]")
    private WebElement elementInValues2;

    @FindBy(xpath = "(//div[contains(@yotta-test,'compareFields')]//span[@aria-label='ControllSquareFilled'])[1]")
    private WebElement elementInCompare;

    @FindBy(xpath = "//i[@title='同环比']")
    private WebElement compareButton;

    @FindBy(xpath = "//label[text()='同环比']/following-sibling::span/span")
    private WebElement compareField;

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

    @FindBy(xpath = "//div[@type='dataset']//span[text()='dataset_1']")
    private WebElement dataset_1;

    @FindBy(xpath = "//div[@type='dataset']//span[text()='dataset_2']")
    private WebElement dataset_2;

    @FindBy(xpath = "//div[@type='dataset']//span[text()='dataset_3']")
    private WebElement dataset_3;

    @FindBy(xpath = "//div[@class='ant-message-notice']//span")
    private WebElement message;

    @FindBy(xpath = "//div[@yotta-test='trend-dataset_multiple_drop_area-dom']/div | //div[@yotta-test='trend-dataset_merge_drop_area-input']")
    private WebElement dropDataset;

    @FindBy(xpath = "//span[text() = '启用数值2']/preceding-sibling::span")
    private WebElement addValueField;

    @FindBy(xpath = "//span[text()='数值']/following-sibling::span[@aria-label='EditOutlined']")
    private WebElement editFirstField;

    @FindBy(xpath = "//span[text()='数值2']/following-sibling::span[@aria-label='EditOutlined']")
    private WebElement editSecondField;

    @FindBy(xpath = "//span[@class='_3TjVnCiCABbodAnOm8kMEf']")
    private WebElement homeButton;

    @FindBy(xpath = "(//div[@yotta-test='trend-dataset_merge_field_cell-dom' and text()='apache.clientip'])[1]")
    private WebElement clientipInTable;

    @FindBy(xpath = "(//input[@yotta-test='trend-dataset_merge_field_name-input'])[last()]")
    private WebElement lastColumn;

    public WebElement getChart() {
        return chart;
    }

    public WebElement getPrompt() {
        return prompt;
    }

    //Charts --------------------------------------------------------------------------
    public WebElement getLine() {
        return getChartButton("line");
    }

    public WebElement getArea() {
        return getChartButton("area");
    }

    public WebElement getScatter() {
        return getChartButton("scatter");
    }

    public WebElement getColumn() {
        return getChartButton("column");
    }

    public WebElement getPie() {
        return getChartButton("pie");
    }

    public WebElement getRose() {
        return getChartButton("rose");
    }

    public WebElement getBar() {
        return getChartButton("bar");
    }

    public WebElement getSunburst() {
        return getChartButton("sunburst");
    }

    public WebElement getFlame() {
        return getChartButton("flame");
    }

    public WebElement getChord() {
        return getChartButton("chord");
    }

    public WebElement getSankey() {
        return getChartButton("sankey");
    }

    public WebElement getForce() {
        return getChartButton("force");
    }

    public WebElement getMultiaxis() {
        return getChartButton("multiaxis");
    }

    public WebElement getHeatmap() {
        return getChartButton("heatmap");
    }

    public WebElement getRegionmap() {
        return getChartButton("regionmap");
    }

    public WebElement getSingle() {
        return getChartButton("single");
    }

    public WebElement getLiquidfill() {
        return getChartButton("liquidfill");
    }

    public WebElement getWordcloud() {
        return getChartButton("wordcloud");
    }

    public WebElement getRadar() {
        return getChartButton("radar");
    }

    public WebElement getFunnel() {
        return getChartButton("funnel");
    }

    public WebElement getMatrixheatmap() {
        return getChartButton("matrixheatmap");
    }

    public WebElement getTable() {
        return getChartButton("table");
    }

    //Objects to drag and drop -------------------------------------------------------------------
    public WebElement getDimensions() {
        return getElementById("dimensions");
    }

    public WebElement getValues() {
        return getElementById("values");
    }

    public WebElement getValues2() {
        return getElementById("values2");
    }

    public WebElement getCompareBy() {
        return getElementById("compareFields");
    }

    public WebElement getCompareByField() {
        return getElementById("byField");
    }

    public WebElement getBubbles() {
        return getElementById("bubbleField");
    }

    public WebElement getTimestamp() {
        return getDraggableElement("timestamp");
    }

    public WebElement getClientip() {
        return getDraggableElement("apache.clientip");
    }

    public WebElement getGeoCity() {
        return getDraggableElement("apache.geo.city");
    }

    public WebElement getGeoProvince() {
        return getDraggableElement("apache.geo.province");
    }

    public WebElement getResplen() {
        return getDraggableElement("apache.resp_len");
    }

    public WebElement getStatus() {
        return getDraggableElement("apache.status");
    }

    public WebElement getMethod() {
        return getDraggableElement("apache.method");
    }

    //-------------------------------------------------------------------------------------
    public WebElement getElementInDimensions() {
        return elementInDimensions;
    }

    public WebElement getElementInValues() {
        return elementInValues;
    }

    public WebElement getElementInValues2() {
        return elementInValues2;
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
        return getYottaButton("trend-BI_SPL-button");
    }

    public WebElement getSPL() {
        return getYottaDiv("trend-SPL-dom");
    }

    public WebElement getCloseSPL() {
        return closeSPL;
    }

    public WebElement getPanel() {
        return panel;
    }

    public WebElement getSpan() {
        return getYottaInput("trend-BI_time_span-input");
    }

    public WebElement getMinSpan() {
        return getYottaInput("trend-BI_time_min_span-input");
    }

    public WebElement getBins() {
        return getYottaInput("trend-BI_time_bins-number_input");
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
        return getYottaInput("trend-BI_param_singleChartFontSize-number_input");
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
        return getYottaDiv("trend-dataset_time-date_time_picker");
    }

    public WebElement getToday() {
        return getYottaLabel("date_time_picker-select_shortcut_今天-dom");
    }

    public WebElement getCustomTimeTab() {
        return getYottaTab("自定义时间范围");
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
        return getYottaDropdownList("trend-dataset_filter_condtion_field-select");
    }

    public WebElement getOperator() {
        return getYottaDropdownList("trend-dataset_filter_condtion_sign-select");
    }

    public WebElement getValue() {
        return getYottaInput("trend-dataset_filter_condtion_value-input");
    }

    public WebElement getTableBody() {
        return getYottaTable("trend-dataset_preview-table");
    }

    public WebElement getCondition() {
        return getYottaDropdownList("trend-dataset_filter_condition_type-select");
    }

    public WebElement getApply() {
        return getYottaSpan("trend-dataset_filter_condtion_apply-dom");
    }

    public WebElement getAdd() {
        return getYottaSpan("trend-dataset_filter_condtion_apply-dom");
    }

    public WebElement getMessage() {
        return message;
    }

    public WebElement getExpression() {
        return getYottaRadio("trend-dataset_filter_expression-radio");
    }

    public WebElement getDropDataset() {
        return dropDataset;
    }

    public WebElement getOverview() {
        return getYottaSpan("trend-dataset_preview-dom");
    }

    public WebElement getDatasetSPL() {
        return getYottaSpan("trend-dataset_SPL-dom");
    }

    public WebElement getSaveAsDataset() {
        return getYottaSpan("trend-dataset_save-dom");
    }

    public WebElement getAddValueField() {
        return addValueField;
    }

    public WebElement getEditFirstField() {
        return editFirstField;
    }

    public WebElement getEditSecondField() {
        return editSecondField;
    }

    public WebElement getEditColor() {
        return getYottaDiv("trend-BI_field_color-dom");
    }

    public WebElement getTypeFunction() {
        return getYottaDropdownList("trend-BI_method-select");
    }

    public WebElement getTypeChartField() {
        return getYottaDropdownList("trend-BI_field_chart_type-select");
    }

    public WebElement getSmooth() {
        return getYottaCheckbox("trend-BI_field_smooth-switch");
    }

    public WebElement getConnectEmptyData() {
        return getYottaCheckbox("trend-BI_field_connectnull-switch");
    }

    public WebElement getHomeButton() {
        return homeButton;
    }

    public WebElement getClientipInTable() {
        return clientipInTable;
    }

    public WebElement getEmptySpace() {
        return getYottaDiv("trend-dataset_merge_field_empty-input");
    }

    public WebElement getLastColumn() {
        return lastColumn;
    }

    private WebElement getElementById(String name) {
        return webDriver.findElement(By.xpath("//div[@yotta-test=trend-BI_" + name + "-icon']"));
    }

    private WebElement getDraggableElement(String name) {
        return webDriver.findElement(By.xpath("//div[@yotta-test='trend-BI_draggable_field-dom']/span[text()='" + name + "']"));
    }

    private WebElement getChartButton(String name) {
        return webDriver.findElement(By.xpath("//div[@yotta-test='trend-BI_chart_type_" + name + "-dom']"));
    }

    private WebElement getElementSpanByTitle(String name) {
        WebElement element = webDriver.findElement(By.xpath("//span[@title='" + name+ "']/preceding-sibling::span/span"));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(element));
        return element;
    }

}
