package com.yottabyte.pages.splSearch;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.ElementExist;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.List;

/**
 * @author sunxj
 * modified by Kate
 */
public class StatisticalPage extends PageTemplate {
    public StatisticalPage(WebDriver driver) {
        super(driver);
        driver.manage().window().setSize(new Dimension(1200,900));
    }

    @FindBy(xpath = "(//div[contains(@yotta-test,'field') and contains(@yotta-test,'search')]//div[@class='yotta-select-selection'])[last()]")
    private WebElement fieldValue; //字段值

    @FindBy(xpath = "(//span[text()='生成']/ancestor::button)[last()]")
    private WebElement generate;

    @FindBy(xpath = "(//span[text()='确定']/ancestor::button)[last()]")
    private WebElement ensure;

    @FindBy(xpath = "((//*[name()='g']//ancestor::div[@id])[last()]) | (//div[@id='percentile-ranks'])")
    private WebElement chart;

    @FindBy(xpath = "((//*[name()='g']//ancestor::div[@class='wvP16ltexCzCS0OBLHred'])[last()])")
    private WebElement multiStatsChart;

    @FindBy(xpath = "(//span[text()='下一步']/ancestor::button)[last()]")
    private WebElement nextStep;

    @FindBy(xpath = "(//*[text()='展现方式']//following-sibling::div[1]//div[@class='yotta-select-selection'])[last()]")
    private WebElement presentType;

    @FindBy(xpath = "(//*[text()='统计类型']//following-sibling::div[1]//div[@class='yotta-select-selection'])[last()]")
    private WebElement statisticType;

//    @FindBy(xpath = "(//input[@placeholder='开始日期'])[1]")
    @FindBy(xpath = "(//input[@placeholder='开始时间'])[1]")
    private WebElement startDate;

//    @FindBy(xpath = "(//input[@placeholder='结束日期'])[1]")
    @FindBy(xpath = "(//input[@placeholder='结束时间'])[1]")
    private WebElement endDate;

//    @FindBy(xpath = "(//input[@placeholder='开始时间'])[1]")
    @FindBy(xpath = "(//input[@placeholder='输入时间'])[1]")
    private WebElement startTime;

//    @FindBy(xpath = "(//input[@placeholder='结束时间'])[2]")
    @FindBy(xpath = "(//input[@placeholder='输入时间'])[2]")
    private WebElement endTime;

    @FindBy(xpath = "(//input[@yotta-test='search-NumericalBucket_from-input'])[last()]")
    private WebElement startDataValue; //数值分段（从）

    @FindBy(xpath = "(//input[@yotta-test='search-NumericalBucket_to-input'])[last()]")
    private WebElement endDataValue; //数值分段（到）

    @FindBy(className = "yotta-icon-DragFilled")
    private WebElement hideElement;

    @FindBy(xpath = "//span[text()='小时']//ancestor::div[@class='yotta-select-selection']")
    private WebElement time;

    @FindBy(xpath = "//input[@yotta-test='search-ValuesStatistics_time-input' or @yotta-test='search-TimeHistogram_interval-input']")
    private WebElement timeSpan; //时间桶, 时间间隔

    @FindBy(xpath = "//span[contains(text(),'75%')]/following-sibling::span[@aria-label='DeleteOutlined']")
    private WebElement closePercent75;

    @FindBy(xpath = "//span[contains(text(),'25%')]/following-sibling::span[@aria-label='DeleteOutlined']")
    private WebElement closePercent25;

    @FindBy(xpath = "//span[contains(text(),'50%')]/following-sibling::span[@aria-label='DeleteOutlined']")
    private WebElement closePercent50;

    @FindBy(xpath = "//span[contains(text(),'95%')]/following-sibling::span[@aria-label='DeleteOutlined']")
    private WebElement closePercent95;

    @FindBy(xpath = "//span[contains(text(),'99%')]/following-sibling::span[@aria-label='DeleteOutlined']")
    private WebElement closePercent99;

    @FindBy(xpath = "//td[text()='200']//preceding-sibling::td//span[contains(@class,'yotta-checkbox-input')]")
    private WebElement field;

    @FindBy(xpath = "(//span[text()='统计图']/ancestor::button)[last()]")
    private WebElement statisticsGram;

    @FindBy(xpath = "(//p[text()='Step2']/following-sibling::div//span[contains(@class,'yotta-checkbox-input')])[1]")
    private WebElement wholeField;

    @FindBy(xpath = "//*[text()='230']/ancestor::*[2]")
    private WebElement countryChina;

    @FindBy(xpath = "//*[text()='42']/ancestor::*[2]")
    private WebElement provinceSichuan;

    @FindBy(xpath = "//*[text()='TOP']/following-sibling::div//div[@class='yotta-select-selection']")
    private WebElement topElement;

    @FindBy(xpath = "(//span[text()='下一步']/ancestor::button)[last()]")
    private WebElement nextButton;

    @FindBy(xpath = "//span[text()='保存为']")
    private WebElement saveAs;

    @FindBy(xpath = "//li[text()='趋势图']")
    private WebElement saveAsTrend;

    @FindBy(xpath = "//label[text()='名称']/following-sibling::input")
    private WebElement nameInput;

    @FindBy(xpath = "(//p[text()='时间桶'])[last()]/following-sibling::div//i")
    private WebElement timeDropdown;

    public WebElement getIndependentStats() {
        return getYottaCheckbox("search-EventsCounting_unique-checkbox"); //独立数统计
    }

    public WebElement getProvinceSichuan() {
        return provinceSichuan;
    }

    public WebElement getCountryChina() {
        return countryChina;
    }

    public WebElement getPercentInput() {
        return getYottaInput("search-CumulativePercentage_change_percentage-input");
    }

    public WebElement getHideElement() {
        hideElement.click();
        return hideElement;
    }

    public WebElement getAddNum() {
        return getYottaSpan("search-NumericalBucket_add-dom");//添加数值分段
    }

    public WebElement getWholeField() {
        return wholeField;
    }

    public WebElement getField() {
        return field;
    }

    public WebElement getChart() {
        return chart;
    }

    public WebElement getMultiStatsChart() {
        return multiStatsChart;
    }

    public WebElement getClosePercent75() {
        return closePercent75;
    }

    public WebElement getClosePercent25() {
        return closePercent25;
    }

    public WebElement getClosePercent50() {
        return closePercent50;
    }

    public WebElement getClosePercent95() {
        return closePercent95;
    }

    public WebElement getClosePercent99() {
        return closePercent99;
    }

    public WebElement getEndDate() {
        return endDate;
    }

    public WebElement getEndTime() {
        return endTime;
    }

    public WebElement getSaveAsTrend() {
        saveAs.click();
        return saveAsTrend;
    }

    public WebElement getNameInput() {
        return nameInput;
    }

    public WebElement getCreateEnsureButton() {
        return getContainsTextButton("确 定");
    }

    public WebElement getNextButton() {
        return nextButton;
    }

    public WebElement getStatisticsGram() {
        return statisticsGram;
    }

    public WebElement getNextStep() {
        return nextStep;
    }

    public WebElement getGoalValue() {
        return getYottaInput("search-PercentileRanks_target-input"); //目标值
    }

    public WebElement getAddPercent() {
        return getYottaButton("search-CumulativePercentage_add_percentage-button"); //添加百分比
    }

    public WebElement getTopRadio() {
        return getYottaRadio("search-ValuesStatistics_top-radio");
    }

    public WebElement getSelfRadio() {
        return getYottaRadio("search-ValuesStatistics_self-radio");
    }

    public WebElement getSelfRadioField() {
        return getYottaDropdownList("search-ValuesStatistics_top-select"); //自选
    }

    public WebElement getTimeBucketDropdownButton() {
        timeDropdown.click();
        return this.getLastDropdownList();
    }

    public WebElement getDataSpan() {
        return getYottaInput("search-NumericalHistogram_interval-input"); //数值间隔
    }

    public WebElement getTimeSpan() {
        return timeSpan;
    }

    public WebElement getStartDataValue() {
        return startDataValue;
    }

    public WebElement getEndDataValue() {
        return endDataValue;
    }

    public WebElement getGenerate() {
        return generate;
    }

    public WebElement getEnsure() {
        return ensure;
    }

    public WebElement getStartTime() {
        return startTime;
    }

    public WebElement getStartDate() {
        return startDate;
    }

    public WebElement getFieldNumber() {
        return getYottaButton("search-stats_ValuesStatistics-button"); //字段数值
    }

    public WebElement getGroupValue() {
        return getYottaInput("search-ValuesStatistics_top-input"); //分组字段值
    }

    public WebElement getTimeSlice() {
        return getYottaButton("search-stats_TimeBucket-button"); //时间分段
    }

    public WebElement getDataSlice() {
        return getYottaButton("search-stats_NumericalBucket-button"); //数值分段
    }

    public WebElement getTimeHistogram() {
        return getYottaButton("search-stats_TimeHistogram-button"); //时间直方图
    }

    public WebElement getDataHistogram() {
        return getYottaButton("search-stats_NumericalHistogram-button"); //数值直方图
    }

    public WebElement getClassifyFieldValue() {
        return getYottaButton("search-stats_ValuesGroup-button"); //字段值分类
    }

    public WebElement getTotalPercent() {
        return getYottaButton("search-stats_CumulativePercentage-button"); //累计百分比
     }

    public WebElement getPercentDegree() {
        return getYottaButton("search-stats_PercentileRanks-button"); //百分位等级
    }

    public WebElement getMultilevelStatistics() {
        return getYottaButton("search-stats_MultilevelStatistics-button"); //多级统计
    }

    public WebElement getGeographicalDistribution() {
        return getYottaButton("search-stats_GeographicDistribution-button"); //地理分布
    }

    public WebElement getAddButton() {
        return getButton("添加");
    }

    public WebElement getPresentType() throws InterruptedException {
        Thread.sleep(1000);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(presentType));
        ClickEvent.clickUnderneathButton(presentType);
        return this.getLastDropdownList();
    }

    public WebElement getFieldValue() throws InterruptedException {
        Thread.sleep(1000);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(fieldValue));
        ClickEvent.clickUnderneathButton(fieldValue);
        return this.getLastDropdownList();
    }

    public WebElement getTopElement() throws InterruptedException {
        Thread.sleep(1000);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(topElement));
        ClickEvent.clickUnderneathButton(topElement);
        return this.getLastDropdownList();
    }

    public WebElement getStatisticType() throws InterruptedException {
        Thread.sleep(1000);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(statisticType));
        ClickEvent.clickUnderneathButton(statisticType);
        return this.getLastDropdownList();
    }

    public WebElement getTime() throws InterruptedException {
        Thread.sleep(1000);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(time));
        ClickEvent.clickUnderneathButton(time);
        return this.getLastDropdownList();
    }

    public WebElement getYAxis() throws InterruptedException {
        Thread.sleep(1000);
        return getYottaDropdownList("search-ValuesStatistics_y-select"); //Y轴
    }

    public WebElement getGroupField() throws InterruptedException {
        Thread.sleep(1000);
        return getYottaDropdownList("search-ValuesStatistics_by-select"); //分组字段
    }
}
