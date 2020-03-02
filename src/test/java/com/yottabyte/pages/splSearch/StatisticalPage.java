package com.yottabyte.pages.splSearch;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ElementExist;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

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

    @FindBy(xpath = "(//p[text()='字段值'])[last()]/following-sibling::div")
    private WebElement fieldValue;

    @FindBy(xpath = "(//span[text()='生成']/ancestor::button)[last()]")
    private WebElement generate;

    @FindBy(xpath = "//*[local-name()='g' and @class='vx-group']/ancestor::div[1]")
    private WebElement chart;

    @FindBy(xpath = "//div[@class='ZvGKqShXaXHE-0feDOBus']/following-sibling::div")
    private WebElement statisticalChart;

    @FindBy(xpath = "(//span[text()='下一步']/ancestor::button)[last()]")
    private WebElement nextStep;

    public WebElement getChartView() {
        return chartView;
    }

    @FindBy(xpath = "//div[@class='eua4mwMYB7k125sVmyyzn']/div[1]/div[2]/div[1]")
    private WebElement chartView;

// 事件计数

    @FindBy(xpath = "//p[text()='展现方式']/following-sibling::div")
    private WebElement presentType;

    @FindBy(xpath = "//span[text()='添加']/ancestor::button")
    private WebElement addButton;

    @FindBy(xpath = "//input[@class='ant-checkbox-input']/ancestor::span")
    private WebElement independentStats;

// 时间分段
// add function for one more time bucket

    @FindBy(xpath = "(//span[text()='时间分段'])[last()]")
    private WebElement timeSlice;

    @FindBy(xpath = "((//p[text()='统计类型'])[last()]/following-sibling::div[1])")
    private WebElement statisticType;

    @FindBy(xpath = "(//input[@placeholder='请选择日期'])[1]")
    private WebElement startDate;

    @FindBy(xpath = "(//input[@placeholder='请选择日期'])[2]")
    private WebElement endDate;

    @FindBy(xpath = "(//input[@placeholder='请选择时间'])[1]")
    private WebElement startTime;

    @FindBy(xpath = "(//input[@placeholder='请选择时间'])[2]")
    private WebElement endTime;

    @FindBy(xpath = "//input[@class='ant-calendar-input ']")
    private WebElement dateInput;

    @FindBy(xpath = "//input[@class='ant-time-picker-panel-input']")
    private WebElement timeInput;

    @FindBy(xpath = "//a[@class='ant-calendar-today-btn ']")
    private WebElement todayDate;

    @FindBy(xpath = "//div[@class='ant-calendar-panel']")
    private WebElement datePanel;

    @FindBy(xpath = "//div[@class='ant-time-picker-panel-inner']")
    private WebElement timePanel;

// 数值分段

    @FindBy(xpath = "//span[text()='数值分段']")
    private WebElement dataSlice;

    @FindBy(xpath = "(//div[1]/input[@class='ant-input css-pcxrzr' and 1])[last()]")
    private WebElement startDataValue;

    @FindBy(xpath = "(//div[@class='_39AAl_kmogj0qVTSo5rkl2']/input[@class='ant-input css-pcxrzr' and 1])[last()]")
    private WebElement endDataValue;

    @FindBy(xpath = "//span[@class='_3iEG4d7LuQMWr0UxtjVuQD']")
    private WebElement addNum;


//  时间直方图

    @FindBy(xpath = "//input[@class='ant-input css-pcxrzr _1yw-V24GdLvRnC8g0mjePJ']")
    private WebElement timeSpan;

    @FindBy(xpath = "//div[@class='css-vtfzx _2q_8HFsJlcX8GNPtnDvgup ant-select ant-select-enabled']/div[@class='ant-select-selection\n" +
            "            ant-select-selection--single' and 1]")
    private WebElement dropdownButton;


//  时间直方图

    @FindBy(xpath = "//span[text()='时间直方图']")
    private WebElement timeHistogram;

//  数值直方图

    @FindBy(xpath = "//span[text()='数值直方图']")
    private WebElement dataHistogram;

    @FindBy(xpath = "//p[text()='数值间隔']/following-sibling::input")
    private WebElement dataSpan;

//  字段值分类

    @FindBy(xpath = "//span[text()='字段值分类']")
    private WebElement classifyFieldValue;

// 字段数值
//分组字段值 usage of this field to write in tests

    @FindBy(xpath = "//span[text()='字段数值']")
    private WebElement fieldNumber;

//  累计百分比

    @FindBy(xpath = "//span[text()='累计百分比']")
    private WebElement totalPercent;

    @FindBy(xpath = "//span[text()='+添加百分比']")
    private WebElement addPercent;

    @FindBy(xpath = "//input[@class='ant-input css-pcxrzr dZIEaC1a73UBe6dusnBe9']")
    private WebElement percentInput;

    @FindBy(xpath = "//span[contains(text(),'75%')]/i")
    private WebElement closePercent75;

    @FindBy(xpath = "//span[contains(text(),'25%')]/i")
    private WebElement closePercent25;

    @FindBy(xpath = "//span[contains(text(),'50%')]/i")
    private WebElement closePercent50;

    @FindBy(xpath = "//span[contains(text(),'95%')]/i")
    private WebElement closePercent95;

    @FindBy(xpath = "//span[contains(text(),'99%')]/i")
    private WebElement closePercent99;

// 百分位等级

    @FindBy(xpath = "//span[text()='百分位等级']")
    private WebElement percentDegree;

    @FindBy(xpath = "//p[text()='目标值']/following-sibling::input")
    private WebElement goalValue;

    @FindBy(xpath = "//div[@class='_1VssFsB7nL6z9XyTQys85g']/div[2]/div[1]")
    private WebElement chartPercent;

// 多级统计

    @FindBy(xpath = "//span[text()='多级统计']")
    private WebElement multilevelStatistics;

    @FindBy(xpath = "//tr[@data-row-key='200']//span[@class='ant-checkbox']")
    private WebElement field;

    @FindBy(xpath = "(//span[text()='统计图']/ancestor::button)[last()]")
    private WebElement statisticsGram;

    // settings for chart maybe should be hidden or else cant locate the button
    @FindBy(xpath = "(//span[text()='生成']/ancestor::button)[last()-1]")
    private WebElement generate1;

    @FindBy(xpath = "(//div[@class='wcTVQUfowuZQBokIvdP_3']/div)[last()]")
    private WebElement tableChart;

    @FindBy(xpath = "(//div[@class='ant-table-selection'])[last()]")
    private WebElement wholeField;

// 地理分布

    @FindBy(xpath = "//span[text()='地理分布']")
    private WebElement geographicalDistribution;

    //230
    @FindBy(xpath = "//*[text()='231']/ancestor::*[2]")
    private WebElement countryChina;

    //42
    @FindBy(xpath = "//*[text()='43']/ancestor::*[2]")
    private WebElement provinceSichuan;

//    @FindBy(xpath = "//*[text()='92']/ancestor::*[2]|//*[text()='46']/ancestor::*[2]")
//    private WebElement provinceJiangsu;

// ---------









    @FindBy(className = "yw-search-stats-select")
    private List<WebElement> statsSelect;

    @FindBy(className = "el-select-dropdown__list")
    private List<WebElement> dropdownList;

    @FindBy(className = "el-loading-mask")
    private WebElement loading;

    @FindBy(className = "el-checkbox__label")
    private List<WebElement> checkBoxList;


    @FindBy(xpath = "//p[text()='Y轴']/following-sibling::div")
    private WebElement yAxis;

    @FindBy(xpath = "//p[text()='分组字段']/following-sibling::div")
    private WebElement groupField;

    @FindBy(xpath = "//p[text()='TOP']/following-sibling::div")
    private WebElement topElement;

    @FindBy(className = "el-date-editor--datetime")
    private List<WebElement> dateEditorList;

    @FindBy(xpath = "//div[@class='el-input el-input--small']/input[@placeholder='选择日期']")
    private List<WebElement> dateInputList;

    @FindBy(xpath = "//a[text()='此刻']")
    private List<WebElement> currentTime;

//    @FindBy(xpath = "//button[text()='确定'][@class='el-picker-panel__btn']")
//    private List<WebElement> ensureButtonList;


//    @FindBy(xpath = "//div[@class='yw-search-stats-select with-select el-input el-input-group el-input-group--append']//i")
//    private WebElement dropdownButton;


    @FindBy(xpath = "//div[@class='yw-search-stats-fieldoption']/input")
    private WebElement topNumber;

    @FindBy(xpath = "//div[@class='yw-search-stats-fieldoption self-option']//i")
    private WebElement selfOptional;

    @FindBy(xpath = "//div[@class='yw-search-stats-select with-select el-input el-input-group el-input-group--append']/input")
    private WebElement timeBucket;

    @FindBy(xpath = "//span[text()='Top']")
    private WebElement topRadio;

    @FindBy(xpath = "//span[text()='自选']")
    private WebElement selfRadio;


    @FindBy(xpath = "(//p[text()='时间桶'])[last()]/following-sibling::div/button")
    private WebElement generateWithGram;

    @FindBy(xpath = "//p[text()='展现方式']/following-sibling::div/button")
    private WebElement generateWithoutTimeBucket;

    @FindBy(xpath = "//span[text()='下一步']")
    private WebElement nextButton;

    @FindBy(xpath = "//div[@class='el-select yw-search-stats-select']")
    private List<WebElement> statsSelectList;

    @FindBy(xpath = "//p[text()='统计类型']/following-sibling::div//button[1]")
    private WebElement nextGenerateButton;

    @FindBy(xpath = "//p[text()='统计类型']/following-sibling::div//button[2]")
    private WebElement lastNextButton;

    @FindBy(xpath = "//th[1]//label")
    private WebElement checkAll;

    @FindBy(xpath = "(//label[@class='el-checkbox'])[last()]")
    private WebElement lastCheckBox;

    @FindBy(xpath = "(//span[@class='col-edit-btn img iconfont icon-bianji'])[last()]")
    private WebElement edit;

    @FindBy(xpath = "(//span[contains(text(),'保存')])[last()]")
    private WebElement saveButton;





    @FindBy(className = "yw-single-chart-container")
    private WebElement chartContainer;


//    @FindBy(xpath = "//p[text()='时间桶']/following-sibling::div/input")
//    private WebElement timeInput;

    @FindBy(xpath = "(//p[text()='时间桶'])[last()]/following-sibling::div//i")
    private WebElement timeDropdown;


    @FindBy(className = "preset-btn")
    private WebElement presetButton;

    @FindBy(xpath = "(//img[@src='/static/img/dashboard/table_color/9.png'])[last()]")
    private WebElement orange;

    @FindBy(xpath = "(//img[@src='/static/img/dashboard/table_color/2.png'])[last()]")
    private WebElement red;

//    @FindBy(className = "yw-search-stats")
//    private WebElement tableChart;

    @FindBy(xpath = "(//label[@class='ranges-from-to-text']/following-sibling::div//input[@class='el-input__inner'][not(@disabled)])[last()]")
    private WebElement maxInput;

    @FindBy(xpath = "(//label[@class='ranges-from-to-text']//input[@class='el-input__inner'][not(@disabled)])[last()]")
    private WebElement minInput;

    @FindBy(xpath = "(//a[@class='img iconfont icon-shanchuxuanting_icon'])[last()]")
    private WebElement delete;

    @FindBy(xpath = "(//span[@class='el-color-picker__color-inner'])[last()]")
    private WebElement colorPicker;

    @FindBy(xpath = "(//input[@class='el-color-dropdown__value'])[last()]")
    private WebElement colorInput;

    @FindBy(xpath = "(//button[@class='el-color-dropdown__btn'])[last()]")
    private WebElement saveColor;

    @FindBy(xpath = "(//span[contains(text(),'值')]/following-sibling::div/input)[last()]")
    private WebElement colorValue;

    @FindBy(className = "icon-bianji")
    private WebElement firstEdit;






    public WebElement getIndependentStats() {
        return independentStats;
    }

    public WebElement getProvinceSichuan() {
        return provinceSichuan;
    }


//    public WebElement getProvinceJiangsu() {
//        return provinceJiangsu;
//    }

    public WebElement getCountryChina() {
        return countryChina;
    }

    public WebElement getGenerate1() {
        return generate1;
    }


    public WebElement getChartPercent() {
        return chartPercent;
    }

    public WebElement getPercentInput() {
        return percentInput;
    }


    public WebElement getTodayDate() {
        return todayDate;
    }

    public WebElement getTimePanel() {
        return timePanel;
    }

    public WebElement getAddNum() {
        return addNum;
    }


    public WebElement getFirstEdit() {
        return firstEdit;
    }

    public WebElement getColorValue() {
        return colorValue;
    }

    public WebElement getAddColor() {
        return super.getButton("添加值颜色");
    }

    public WebElement getCustomize() {
        return super.getButton("自定义");
    }

    public WebElement getSaveColor() {
        return saveColor;
    }

    public WebElement getColorInput() {
        return colorInput;
    }

    public WebElement getColorPicker() {
        return colorPicker;
    }

    public WebElement getDelete() {
        return delete;
    }

    public WebElement getMaxInput() {
        return maxInput;
    }

    public WebElement getMinInput() {
        return minInput;
    }

    public WebElement getAddRangeColour() {
        return super.getButton("添加范围颜色");
    }

    public WebElement getRed() {
        presetButton.click();
        return red;
    }

    public WebElement getTableChart() {
        return tableChart;
    }

    public WebElement getOrange() {
        presetButton.click();
        return orange;
    }

    public WebElement getEdit() {
        return edit;
    }

    public WebElement getWholeField() {
        return wholeField;
    }

//    public WebElement getTimeInput() {
//        return timeInput;
//    }

    public WebElement getField() {
        return field;
    }

    public WebElement getChartContainer() {
        return chartContainer;
    }

    public WebElement getChart() {
        return chart;
    }
    public WebElement getStatisticalChart() {
        return statisticalChart;
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

//    public WebElement getAddNum() {
//        return super.getButton("添加数值分段");
//    }

    public WebElement getEndDate() {
        return endDate;
    }

    public WebElement getEndTime() {
        return endTime;
    }

    public WebElement getDateInput() {
        return dateInput;
    }

    public WebElement getTimeInput() {
        return timeInput;
    }

    public WebElement getGenerateTime() {
        return super.getButton("生成");
    }

    public WebElement getSaveButton() {
        return saveButton;
    }

    public WebElement getLowerLimit() {
        return super.getInputElement("下限值");
    }

    public WebElement getMiddleLimit() {
        return super.getInputElement("中值");
    }

    public WebElement getTopLimit() {
        return super.getInputElement("上限值");
    }

    public WebElement getColourDropdown() {
        return super.getDropdownList("颜色");
    }

    public WebElement getLastCheckBox() {
        return lastCheckBox;
    }

    public WebElement getLastFieldValue() {
        statsSelectList.get(4).click();
        return this.getLastDropdownList();
    }

    public WebElement getLastStatisticType() {
        statsSelectList.get(5).click();
        return this.getLastDropdownList();
    }

    public WebElement getLastNextButton() {
        return lastNextButton;
    }

    public WebElement getCheckAll() {
        return checkAll;
    }

    public WebElement getNextGenerateButton() {
        return nextGenerateButton;
    }

    public WebElement getNextFieldValue() {
        statsSelectList.get(2).click();
        return this.getLastDropdownList();
    }

    public WebElement getNextButton() {
        return nextButton;
    }

    public WebElement getGenerateWithoutTimeBucket() {
        return generateWithoutTimeBucket;
    }

    public WebElement getGenerateWithGram() {
        return generateWithGram;
    }

    public WebElement getStatisticsGram() {
        return statisticsGram;
    }

    public WebElement getNextStep() {
        return nextStep;
    }

    public WebElement getGoalValue() {
        return goalValue;
    }

    public WebElement getAddPercent() {
        addPercent.click();
        return percentInput;
    }

    public WebElement getTopRadio() {
        return topRadio;
    }

    public WebElement getSelfRadio() {
        return selfRadio;
    }

    public WebElement getTimeBucketDropdownButton() {
        timeDropdown.click();
        return this.getLastDropdownList();
    }

    public WebElement getTimeBucket() {
        return timeBucket;
    }

    public WebElement getSelfOptional() {
        if (ElementExist.isElementExist(webDriver, loading))
            WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.invisibilityOf(loading));
        selfOptional.click();
        return this.getLastDropdownList();
    }

    public WebElement getTopNumber() {
        return topNumber;
    }

    public WebElement getDataSpan() {
        return dataSpan;
    }

    public WebElement getTime() {
        dropdownButton.click();
        return this.getLastDropdownList();
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

//    public WebElement getEnsureButton() {
//        return ensureButtonList.get(ensureButtonList.size() - 1);
//    }

    public WebElement getCurrentTime() {
        dateEditorList.get(1).click();
        return currentTime.get(currentTime.size() - 1);
    }

    public WebElement getStartTime() {
        return startTime;
    }

    public WebElement getStartDate() {
        return startDate;
    }

    public WebElement getErrorMessage() {
        return super.getErrorMessage();
    }

    public WebElement getStatisticType() {
        statisticType.click();
        return this.getLastDropdownList();
    }

    public WebElement getFieldNumber() {
        return fieldNumber;
    }

    public WebElement getTimeSlice() {
        return timeSlice;
    }

    public WebElement getDataSlice() {
        return dataSlice;
    }

    public WebElement getTimeHistogram() {
        return timeHistogram;
    }

    public WebElement getDataHistogram() {
        return dataHistogram;
    }

    public WebElement getClassifyFieldValue() {
        return classifyFieldValue;
    }

    public WebElement getTotalPercent() {
        return totalPercent;
    }

    public WebElement getPercentDegree() {
        return percentDegree;
    }

    public WebElement getMultilevelStatistics() {
        return multilevelStatistics;
    }

    public WebElement getGeographicalDistribution() {
        return geographicalDistribution;
    }

    public WebElement getEventCheckBox() {
        return checkBoxList.get(checkBoxList.size() - 1);
    }

    public WebElement getLoading() {
        return loading;
    }

    public WebElement getAddButton() {
        return addButton;
    }

    public WebElement getPresentType() {
        presentType.click();
        return this.getLastDropdownList();
    }

    public WebElement getFieldValue() {
        fieldValue.click();
        return this.getLastDropdownList();
    }

    public WebElement getTopElement() {
        topElement.click();
        return this.getLastDropdownList();
    }

    public WebElement getYAxis() {
        yAxis.click();
        return this.getLastDropdownList();
    }

    public WebElement getGroupField() {
        groupField.click();
        return this.getLastDropdownList();
    }
}
