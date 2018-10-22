package com.yottabyte.pages.trend;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.GetTime;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

/**
 * @author sunxj
 */
public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "textarea-icon-padding")
    private WebElement searchInput;

    @FindBy(xpath = "//input[@placeholder='请选择快捷时间或时间范围']")
    private WebElement dateEditor;

    @FindBy(xpath = "//span[text()='设置图表类型']")
    private WebElement chartType;

    @FindBy(xpath = "//span[text()='设置']")
    private WebElement setting;

    @FindBy(className = "line")
    private WebElement line;

    @FindBy(className = "area")
    private WebElement area;

    @FindBy(className = "scatter")
    private WebElement scatter;

    @FindBy(className = "column")
    private WebElement column;

    @FindBy(className = "chart-type-popover")
    private WebElement chartTypePopover;

    @FindBy(className = "yw-search-setting-select")
    private WebElement settingSelect;

    @FindBy(xpath = "//input[@value='horizontal']")
    private WebElement horizontal;

    @FindBy(xpath = "//input[@value='left']")
    private WebElement left;

    @FindBy(xpath = "//input[@value='right']")
    private WebElement right;

    @FindBy(xpath = "//input[@value='vertical']")
    private WebElement vertical;

    @FindBy(className = "el-message-box__message")
    private WebElement message;

    @FindBy(tagName = "th")
    private WebElement header;

    @FindBy(xpath = "//div[text()='Y轴']")
    private WebElement yaxis;

    @FindBy(xpath = "//div[contains(text(),'分组')]")
    private WebElement group;

    @FindBy(xpath = "//div[text()='图例']")
    private WebElement example;

    @FindBy(xpath = "//div[contains(text(),'展示')]")
    private WebElement exhibition;

    @FindBy(xpath = "//div[@class='yw-search-setting-input yw-search-setting-input-text el-input']/input")
    private WebElement unit;

    @FindBy(xpath = "//span[text()='平滑']/ancestor::div/following-sibling::label")
    private WebElement smooth;

    @FindBy(xpath = "//span[text()='连接空数据']/ancestor::div/following-sibling::label")
    private WebElement connectEmptyData;

    @FindBy(xpath = "//div[text()='min']/preceding-sibling::input")
    private WebElement min;

    @FindBy(xpath = "//div[text()='max']/preceding-sibling::input")
    private WebElement max;

    @FindBy(className = "el-radio-button")
    private List<WebElement> radioButtonList;

    @FindBy(xpath = "//div[text()='底部']")
    private WebElement bottomPosition;

    @FindBy(xpath = "//div[text()='右侧']")
    private WebElement rightPosition;

    @FindBy(xpath = "//div[text()='a...']")
    private WebElement firstPosition;

    @FindBy(xpath = "//div[text()='...z']")
    private WebElement secondPosition;

    @FindBy(xpath = "//div[text()='a..z']")
    private WebElement thirdPosition;

    @FindBy(xpath = "(//input[@class='el-input__inner'])[last()]")
    private WebElement startColour;

    @FindBy(xpath = "//span[@style='background: rgb(255, 152, 0);']")
    private WebElement orange;

    @FindBy(xpath = "//span[@style='background: rgb(205, 220, 57);']")
    private WebElement green;

    @FindBy(xpath = "//span[@style='background: rgb(103, 58, 183);']")
    private WebElement purple;


    public WebElement getGenerate() {
        return super.getButton("生成");
    }

    public WebElement getNameInput() {
        return super.getInputElement("名称");
    }

    public WebElement getDescribeInput() {
        return super.getInputElement("描述");
    }

    public WebElement getGroupDropdown() {
        return super.getDropdownList("分组");
    }

    public WebElement getNextButton() {
        return super.getButton("下一步");
    }

    public WebElement getSearchButton() {
        return super.getContainsTextButton("搜索");
    }

    public WebElement getSave() {
        return super.getButton("保存");
    }

    public WebElement getToday() {
        return GetTime.getTime(webDriver, "Today");
    }

    public WebElement getSuccessMessage() {
        return message;
    }

    public WebElement getSearchInput() {
        return searchInput;
    }

    public WebElement getChartType() {
        return chartType;
    }

    public WebElement getSetting() {
        ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='none';", chartTypePopover);
        return setting;
    }

    public WebElement getLine() {
        return line;
    }

    public WebElement getArea() {
        return area;
    }

    public WebElement getScatter() {
        return scatter;
    }

    public WebElement getColumn() {
        return column;
    }

    public WebElement getSettingSelect() {
        settingSelect.click();
        return super.getLastDropdownList();
    }

    public WebElement getDateEditor() {
        return dateEditor;
    }

    public WebElement getHorizontal() {
        return radioButtonList.get(0);
    }

    public WebElement getLeft() {
        return radioButtonList.get(1);
    }

    public WebElement getRight() {
        return radioButtonList.get(2);
    }

    public WebElement getVertical() {
        return radioButtonList.get(3);
    }

    public WebElement getDefaultOrder() {
        return radioButtonList.get(4);
    }

    public WebElement getAscendingOrder() {
        return radioButtonList.get(5);
    }

    public WebElement getDescendingOrder() {
        return radioButtonList.get(6);
    }

    public WebElement getHeader() {
        return header;
    }

    public WebElement getYaxis() {
        return yaxis;
    }

    public WebElement getGroup() {
        return group;
    }

    public WebElement getExample() {
        return example;
    }

    public WebElement getExhibition() {
        return exhibition;
    }

    public WebElement getUnit() {
        return unit;
    }

    public WebElement getSmooth() {
        return smooth;
    }

    public WebElement getConnectEmptyData() {
        return connectEmptyData;
    }

    public WebElement getMin() {
        return min;
    }

    public WebElement getMax() {
        return max;
    }

    public WebElement getBottomPosition() {
        return bottomPosition;
    }

    public WebElement getFirstPosition() {
        rightPosition.click();
        return firstPosition;
    }

    public WebElement getSecondPosition() {
        rightPosition.click();
        return secondPosition;
    }

    public WebElement getThirdPosition() {
        rightPosition.click();
        return thirdPosition;
    }

    public WebElement getStartColour() {
        return startColour;
    }

    public WebElement getOrange() {
        return orange;
    }

    public WebElement getGreen() {
        return green;
    }

    public WebElement getPurple() {
        return purple;
    }
}
