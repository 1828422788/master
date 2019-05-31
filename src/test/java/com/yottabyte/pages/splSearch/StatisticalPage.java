package com.yottabyte.pages.splSearch;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ElementExist;
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
public class StatisticalPage extends PageTemplate {
    public StatisticalPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "yw-search-stats-select")
    private List<WebElement> statsSelect;

    @FindBy(className = "el-select-dropdown__list")
    private List<WebElement> dropdownList;

    @FindBy(xpath = "//span[text()='添加']")
    private WebElement addButton;

    @FindBy(className = "el-loading-mask")
    private WebElement loading;

    @FindBy(className = "el-checkbox__label")
    private List<WebElement> checkBoxList;

    @FindBy(xpath = "//span[text()='时间分段']")
    private WebElement timeSlice;

    @FindBy(xpath = "//span[text()='数值分段']")
    private WebElement dataSlice;

    @FindBy(xpath = "//span[text()='时间直方图']")
    private WebElement timeHistogram;

    @FindBy(xpath = "//span[text()='数值直方图']")
    private WebElement dataHistogram;

    @FindBy(xpath = "//span[text()='字段值分类']")
    private WebElement classifyFieldValue;

    @FindBy(xpath = "//span[text()='字段数值']")
    private WebElement fieldNumber;

    @FindBy(xpath = "//span[text()='累计百分比']")
    private WebElement totalPercent;

    @FindBy(xpath = "//span[text()='百分位等级']")
    private WebElement percentDegree;

    @FindBy(xpath = "//span[text()='多级统计']")
    private WebElement multilevelStatistics;

    @FindBy(xpath = "//span[text()='地理分布']")
    private WebElement geographicalDistribution;

    @FindBy(xpath = "//p[text()='字段值']/following-sibling::div")
    private WebElement fieldValue;

    @FindBy(xpath = "//p[text()='展现方式']/following-sibling::div")
    private WebElement presentType;

    @FindBy(xpath = "//p[text()='统计类型']/following-sibling::div")
    private WebElement statisticType;

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

    @FindBy(xpath = "//button[text()='确定'][@class='el-picker-panel__btn']")
    private List<WebElement> ensureButtonList;

    @FindBy(xpath = "//button[@class='el-button yw-search-primary-btn el-button--default']")
    private WebElement generate;

    @FindBy(xpath = "(//div[@class='el-input-group__prepend'][text()='从']/following-sibling::input)[last()]")
    private WebElement startDataValue;

    @FindBy(xpath = "(//div[@class='el-input-group__prepend'][text()='到']/following-sibling::input)[last()]")
    private WebElement endDataValue;

    @FindBy(xpath = "//div[@class='yw-search-stats-select with-select el-input el-input-group el-input-group--append']/input")
    private WebElement timeSpan;

    @FindBy(xpath = "//div[@class='yw-search-stats-select with-select el-input el-input-group el-input-group--append']//i")
    private WebElement dropdownButton;

    @FindBy(xpath = "//p[text()='数值间隔']/following-sibling::div/input")
    private WebElement dataSpan;

    @FindBy(xpath = "//div[@class='yw-search-stats-fieldoption']/input")
    private WebElement topNumber;

    @FindBy(xpath = "//div[@class='yw-search-stats-fieldoption self-option']//i")
    private WebElement selfOptional;

    @FindBy(xpath = "//div[@class='yw-search-stats-select with-select el-input el-input-group el-input-group--append']/input")
    private WebElement timeBucket;

    @FindBy(xpath = "//div[@class='yw-search-stats-select with-select el-input el-input-group el-input-group--append']//i")
    private WebElement timeBucketDropdownButton;

    @FindBy(xpath = "//span[text()='Top']")
    private WebElement topRadio;

    @FindBy(xpath = "//span[text()='自选']")
    private WebElement selfRadio;

    @FindBy(xpath = "//span[text()='+ 添加百分比']")
    private WebElement addPercent;

    @FindBy(xpath = "//div[@class='input-new-tag el-input el-input--mini']/input")
    private WebElement percentInput;

    @FindBy(xpath = "//p[text()='目标值']/following-sibling::div/input")
    private WebElement goalValue;

    @FindBy(xpath = "//span[text()='统计图']")
    private WebElement statisticsGram;

    @FindBy(xpath = "//span[text()='下一步']")
    private WebElement nextStep;

    @FindBy(xpath = "//p[text()='时间桶']/following-sibling::div/button")
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

    @FindBy(xpath = "(//p[text()='统计类型']/following-sibling::div//button/span[text()='生成'])[last()]")
    private WebElement lastGenerateButton;

    @FindBy(xpath = "(//label[@class='el-checkbox'])[last()]")
    private WebElement lastCheckBox;

    @FindBy(className = "icon-bianji")
    private List<WebElement> editColourButtonList;

    @FindBy(xpath = "(//span[contains(text(),'保存')])[last()]")
    private WebElement saveButton;

    @FindBy(xpath = "//input[@placeholder='选择起始日期']")
    private WebElement startTime;

    @FindBy(xpath = "//input[@placeholder='选择截止日期']")
    private WebElement endTime;

    @FindBy(xpath = "//span[text()='类型']")
    private WebElement type;

    @FindBy(xpath = "//span[contains(text(),'75%')]/i")
    private WebElement closePercent;

    @FindBy(className = "yw-search-stats-charts-object")
    private WebElement chart;

    public WebElement getChart() {
        return chart;
    }

    public WebElement getClosePercent() {
        return closePercent;
    }

    public WebElement getAddNum() {
        return super.getButton("添加数值分段");
    }

    public WebElement getType() {
        return type;
    }

    public WebElement getEndTime() {
        return endTime;
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

    public WebElement getFirstEditColourButton() {
        return editColourButtonList.get(0);
    }

    public WebElement getSecondEditColourButton() {
        WebElement element = editColourButtonList.get(1);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.invisibilityOf(webDriver.findElement(By.className("preset-color"))));
        return element;
    }

    public WebElement getThirdEditColourButton() {
        WebElement element = editColourButtonList.get(2);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.invisibilityOf(saveButton));
        return element;
    }

    public WebElement getLastCheckBox() {
        return lastCheckBox;
    }

    public WebElement getLastGenerateButton() {
        return lastGenerateButton;
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
        timeBucketDropdownButton.click();
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

    public WebElement getEnsureButton() {
        return ensureButtonList.get(ensureButtonList.size() - 1);
    }

    public WebElement getCurrentTime() {
        dateEditorList.get(1).click();
        return currentTime.get(currentTime.size() - 1);
    }

    public WebElement getStartTime() {
        return startTime;
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
