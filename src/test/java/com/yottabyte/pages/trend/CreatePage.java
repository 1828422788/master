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

    @FindBy(className = "el-select-dropdown__item")
    private List<WebElement> liList;

    @FindBy(className = "yw-search-setting-switch")
    private WebElement settingSwitch;

    @FindBy(xpath = "//div[contains(text(),'维度')]")
    private WebElement dimension;

    @FindBy(xpath = "//div[contains(text(),'关系')]")
    private WebElement relation;

    @FindBy(xpath = "//div[contains(text(),'复合')]")
    private WebElement compound;

    @FindBy(xpath = "//div[contains(text(),'地图')]")
    private WebElement map;

    @FindBy(xpath = "//div[contains(text(),'其他')]")
    private WebElement other;

    @FindBy(className = "pie")
    private WebElement pie;

    @FindBy(className = "rose")
    private WebElement rose;

    @FindBy(className = "bar")
    private WebElement bar;

    @FindBy(className = "sunburst")
    private WebElement sunburst;

    @FindBy(xpath = "//div[contains(text(),'切分')]")
    private WebElement divide;

    @FindBy(xpath = "//p[text()='+ 添加']")
    private WebElement addField;

    @FindBy(xpath = "(//div[@class='el-select yw-search-setting-select'])[last()]")
    private WebElement secondSettingSelect;

    @FindBy(className = "chord")
    private WebElement chord;

    @FindBy(className = "sankey")
    private WebElement sankey;

    @FindBy(className = "force")
    private WebElement force;

    @FindBy(xpath = "//div[text()='目标']")
    private WebElement target;

    @FindBy(xpath = "//div[text()='权重']")
    private WebElement weight;

    @FindBy(className = "rangeline")
    private WebElement rangeline;

    @FindBy(className = "multiaxis")
    private WebElement multiaxis;

    @FindBy(xpath = "//span[text()='预测值']/ancestor::div/following-sibling::div")
    private WebElement predict;

    @FindBy(xpath = "//span[text()='上限']/ancestor::div/following-sibling::div")
    private WebElement topLimit;

    @FindBy(xpath = "//span[text()='下限']/ancestor::div/following-sibling::div")
    private WebElement lowerLimit;

    @FindBy(className = "heatmap")
    private WebElement heatmap;

    @FindBy(className = "attackmap")
    private WebElement attackmap;

    @FindBy(className = "regionmap")
    private WebElement regionmap;

    @FindBy(className = "geostatsmap")
    private WebElement geostatsmap;

    @FindBy(className = "table")
    private WebElement table;

    @FindBy(className = "single")
    private WebElement single;

    @FindBy(className = "liquidfill")
    private WebElement liquidfill;

    @FindBy(className = "wordcloud")
    private WebElement wordcloud;

    @FindBy(className = "sequence")
    private WebElement sequence;

    @FindBy(className = "radar")
    private WebElement radar;

    @FindBy(className = "funnel")
    private WebElement funnel;

    @FindBy(className = "matrixheatmap")
    private WebElement matrixheatmap;

    @FindBy(xpath = "//div[text()='背景']")
    private WebElement background;

    @FindBy(xpath = "//div[text()='字体']")
    private WebElement font;

    @FindBy(xpath = "//div[text()='图标']")
    private WebElement icon;

    @FindBy(xpath = "//div[text()='按字段']")
    private WebElement accordingField;

    @FindBy(xpath = "//div[text()='按名称']")
    private WebElement accordingName;

    @FindBy(xpath = "//div[text()='按趋势']")
    private WebElement accordingTrend;

    @FindBy(xpath = "//div[text()='按区间']")
    private WebElement accordingArea;

    @FindBy(xpath = "//div[text()='绝对值']")
    private WebElement absolute;

    @FindBy(xpath = "//div[text()='百分比']")
    private WebElement percent;

    @FindBy(xpath = "//div[@class='el-autocomplete yw-search-setting-select']//input")
    private WebElement iconName;

    @FindBy(xpath = "//div[@class='range-input-group']//input")
    private List<WebElement> inputList;

    @FindBy(className = "yw-search-setting-switch")
    private WebElement switchButton;

    @FindBy(xpath = "//div[text()='指示器']")
    private WebElement indicator;

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

    public WebElement getYesterday() {
        return GetTime.getTime(webDriver, "Yesterday");
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

    public WebElement getSecondSettingSelect() {
        secondSettingSelect.click();
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
        return liList.get(2);
    }

    public WebElement getGreen() {
        return liList.get(6);
    }

    public WebElement getPurple() {
        return liList.get(liList.size() - 1);
    }

    public WebElement getSettingSwitch() {
        return settingSwitch;
    }

    public WebElement getDimension() {
        return dimension;
    }

    public WebElement getRelation() {
        return relation;
    }

    public WebElement getCompound() {
        return compound;
    }

    public WebElement getMap() {
        return map;
    }

    public WebElement getOther() {
        return other;
    }

    public WebElement getPie() {
        return pie;
    }

    public WebElement getRose() {
        return rose;
    }

    public WebElement getBar() {
        return bar;
    }

    public WebElement getSunburst() {
        return sunburst;
    }

    public WebElement getAddField() {
        return addField;
    }

    public WebElement getDivide() {
        return divide;
    }

    public WebElement getChord() {
        return chord;
    }

    public WebElement getSankey() {
        return sankey;
    }

    public WebElement getForce() {
        return force;
    }

    public WebElement getTarget() {
        return target;
    }

    public WebElement getWeight() {
        return weight;
    }

    public WebElement getRangeline() {
        return rangeline;
    }

    public WebElement getMultiaxis() {
        return multiaxis;
    }

    public WebElement getPredict() {
        predict.click();
        return super.getLastDropdownList();
    }

    public WebElement getTopLimit() {
        topLimit.click();
        return super.getLastDropdownList();
    }

    public WebElement getLowerLimit() {
        lowerLimit.click();
        return super.getLastDropdownList();
    }

    public WebElement getHeatmap() {
        return heatmap;
    }

    public WebElement getAttackmap() {
        return attackmap;
    }

    public WebElement getRegionmap() {
        return regionmap;
    }

    public WebElement getGeostatsmap() {
        return geostatsmap;
    }

    public WebElement getTable() {
        return table;
    }

    public WebElement getSingle() {
        return single;
    }

    public WebElement getLiquidfill() {
        return liquidfill;
    }

    public WebElement getWordcloud() {
        return wordcloud;
    }

    public WebElement getSequence() {
        return sequence;
    }

    public WebElement getRadar() {
        return radar;
    }

    public WebElement getFunnel() {
        return funnel;
    }

    public WebElement getMatrixheatmap() {
        return matrixheatmap;
    }

    public WebElement getBackground() {
        return background;
    }

    public WebElement getFont() {
        return font;
    }

    public WebElement getIcon() {
        return icon;
    }

    public WebElement getAccordingField() {
        return accordingField;
    }

    public WebElement getAccordingName() {
        return accordingName;
    }

    public WebElement getAccordingTrend() {
        return accordingTrend;
    }

    public WebElement getAccordingArea() {
        return accordingArea;
    }

    public WebElement getAbsolute() {
        return absolute;
    }

    public WebElement getPercent() {
        return percent;
    }

    public WebElement getCompareTime() {
        settingSelect.click();
        return super.getLastDropdownList();
    }

    public WebElement getIconName() {
        return iconName;
    }

    public WebElement getStartArea() {
        return inputList.get(0);
    }

    public WebElement getEndArea() {
        return inputList.get(1);
    }

    public WebElement getSwitchButton() {
        return switchButton;
    }

    public WebElement getIndicator() {
        return indicator;
    }
}
