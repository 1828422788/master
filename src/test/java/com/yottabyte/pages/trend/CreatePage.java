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

    @FindBy(xpath = "(//div[@class='img area'])[last()]")
    private WebElement area;

    @FindBy(xpath = "(//div[@class='img scatter'])[last()]")
    private WebElement scatter;

    @FindBy(xpath = "(//div[@class='img column'])[last()]")
    private WebElement column;

    @FindBy(className = "chart-type-popover")
    private WebElement chartTypePopover;

    @FindBy(className = "yw-search-setting-select")
    private WebElement settingSelect;

    @FindBy(xpath = "(//input[@value='horizontal']/following-sibling::span)[last()]")
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

    @FindBy(xpath = "(//div[text()='Y轴'])[last()]")
    private WebElement yaxis;

    @FindBy(xpath = "(//div[text()='X轴'])[last()]")
    private WebElement xaxis;

    @FindBy(xpath = "(//div[contains(text(),'分组')])[last()]")
    private WebElement group;

    @FindBy(xpath = "(//div[contains(text(),'气泡')])[last()]")
    private WebElement bubble;

    @FindBy(xpath = "(//div[text()='图例'])[last()]")
    private WebElement example;

    @FindBy(xpath = "(//div[contains(text(),'展示')])[last()]")
    private WebElement exhibition;

    @FindBy(xpath = "(//div[@class='yw-search-setting-input yw-search-setting-input-text el-input']/input)[last()]")
    private WebElement unit;

    @FindBy(xpath = "(//span[text()='平滑'])[last()]/ancestor::div/following-sibling::label")
    private WebElement smooth;

    @FindBy(xpath = "(//span[text()='连接空数据'])[last()]/ancestor::div/following-sibling::label")
    private WebElement connectEmptyData;

    @FindBy(xpath = "(//div[text()='min']/preceding-sibling::input)[last()]")
    private WebElement min;

    @FindBy(xpath = "(//div[text()='max']/preceding-sibling::input)[last()]")
    private WebElement max;

    @FindBy(className = "el-radio-button")
    private List<WebElement> radioButtonList;

    @FindBy(xpath = "//div[text()='无']")
    private WebElement noneExample;

    @FindBy(xpath = "//div[text()='底部']")
    private WebElement bottomPosition;

    @FindBy(xpath = "(//div[text()='右侧'])[last()]")
    private WebElement rightPosition;

    @FindBy(xpath = "(//div[text()='a...'])[last()]")
    private WebElement firstPosition;

    @FindBy(xpath = "(//div[text()='...z'])[last()]")
    private WebElement secondPosition;

    @FindBy(xpath = "(//div[text()='a..z'])[last()]")
    private WebElement thirdPosition;

    @FindBy(xpath = "(//input[@class='el-input__inner'][not(@placeholder='请选择')])[last()]")
    private WebElement startColour;

    @FindBy(xpath = "(//input[@class='el-input__inner'])[last()]")
    private WebElement label;

    @FindBy(className = "el-select-dropdown__item")
    private List<WebElement> liList;

    @FindBy(className = "yw-search-setting-switch")
    private WebElement settingSwitch;

    @FindBy(xpath = "//div[contains(text(),'维度')]")
    private WebElement dimension;

    @FindBy(xpath = "(//div[contains(text(),'关系')])[last()]")
    private WebElement relation;

    @FindBy(xpath = "(//div[contains(text(),'复合')])[last()]")
    private WebElement compound;

    @FindBy(xpath = "(//div[contains(text(),'地图')][@class='popover-type-group-item'])[last()]")
    private WebElement map;

    @FindBy(xpath = "(//div[contains(text(),'其他')])[last()]")
    private WebElement other;

    @FindBy(className = "pie")
    private WebElement pie;

    @FindBy(className = "rose")
    private WebElement rose;

    @FindBy(className = "bar")
    private WebElement bar;

    @FindBy(className = "sunburst")
    private WebElement sunburst;

    @FindBy(className = "tracing")
    private WebElement tracing;

    @FindBy(xpath = "(//div[contains(text(),'切分')])[last()]")
    private WebElement divide;

    @FindBy(xpath = "(//p[text()='+ 添加'])[last()]")
    private WebElement addField;

    @FindBy(xpath = "(//div[@class='el-select yw-search-setting-select'])[last()]")
    private WebElement secondSettingSelect;

    @FindBy(xpath = "(//div[@class='img chord'])[last()]")
    private WebElement chord;

    @FindBy(xpath = "(//div[@class='img sankey'])[last()]")
    private WebElement sankey;

    @FindBy(xpath = "(//div[@class='img force'])[last()]")
    private WebElement force;

    @FindBy(xpath = "(//div[text()='目标'])[last()]")
    private WebElement target;

    @FindBy(xpath = "(//div[text()='标记'])[last()]")
    private WebElement mark;

    @FindBy(xpath = "(//div[text()='来源'])[last()]")
    private WebElement source;

    @FindBy(xpath = "(//div[text()='权重'])[last()]")
    private WebElement weight;

    @FindBy(xpath = "(//div[text()='区域'])[last()]")
    private WebElement region;

    @FindBy(xpath = "(//div[text()='下钻'])[last()]")
    private WebElement goingDown;

    @FindBy(xpath = "(//div[@class='img rangeline'])[last()]")
    private WebElement rangeline;

    @FindBy(xpath = "(//div[@class='img multiaxis'])[last()]")
    private WebElement multiaxis;

    @FindBy(xpath = "//span[text()='预测值']/ancestor::div/following-sibling::div")
    private WebElement predict;

    @FindBy(xpath = "//span[text()='实际值']/ancestor::div/following-sibling::div")
    private WebElement actual;

    @FindBy(xpath = "//span[text()='上限']/ancestor::div/following-sibling::div")
    private WebElement topLimit;

    @FindBy(xpath = "//span[text()='下限']/ancestor::div/following-sibling::div")
    private WebElement lowerLimit;

    @FindBy(xpath = "(//div[@class='img heatmap'])[last()]")
    private WebElement heatmap;

    @FindBy(xpath = "(//div[@class='img attackmap'])[last()]")
    private WebElement attackmap;

    @FindBy(xpath = "(//div[@class='img regionmap'])[last()]")
    private WebElement regionmap;

    @FindBy(xpath = "(//div[@class='img geostatsmap'])[last()]")
    private WebElement geostatsmap;

    @FindBy(className = "table")
    private WebElement table;

    @FindBy(xpath = "(//div[@class='img single'])[last()]")
    private WebElement single;

    @FindBy(xpath = "(//div[@class='img liquidfill'])[last()]")
    private WebElement liquidfill;

    @FindBy(xpath = "(//div[@class='img wordcloud'])[last()]")
    private WebElement wordcloud;

    @FindBy(xpath = "(//div[@class='img sequence'])[last()]")
    private WebElement sequence;

    @FindBy(xpath = "(//div[@class='img radar'])[last()]")
    private WebElement radar;

    @FindBy(xpath = "(//div[@class='img funnel'])[last()]")
    private WebElement funnel;

    @FindBy(xpath = "(//div[@class='img matrixheatmap'])[last()]")
    private WebElement matrixheatmap;

    @FindBy(xpath = "//div[text()='背景']")
    private WebElement background;

    @FindBy(xpath = "//div[text()='字体']")
    private WebElement font;

    @FindBy(xpath = "//div[text()='图标']")
    private WebElement icon;

    @FindBy(xpath = "(//div[text()='按字段'])[last()]")
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

    @FindBy(className = "yw-search-setting-switch")
    private WebElement switchButton;

    @FindBy(xpath = "(//div[text()='指示器'])[last()]")
    private WebElement indicator;

    @FindBy(xpath = "(//i[@class='el-input__icon el-icon-arrow-up'])[2]")
    private WebElement pagination;

    @FindBy(xpath = "(//ul[@class='el-scrollbar__view el-select-dropdown__list'])[last()]")
    private WebElement pagingSelect;

    @FindBy(xpath = "//label[text()='报表']")
    private WebElement report;

    @FindBy(xpath = "//span[text()='堆叠']/ancestor::div/following-sibling::label")
    private WebElement pile;

    @FindBy(xpath = "//span[text()='气泡大小']/ancestor::div/following-sibling::div//i")
    private WebElement bubbleSize;

    @FindBy(xpath = "//span[text()='实际值']/ancestor::div/following-sibling::div//i")
    private WebElement actualValue;

    @FindBy(xpath = "(//span[text()='类型']/ancestor::div/following-sibling::div//i)[last()]")
    private WebElement type;

    @FindBy(xpath = "//span[text()='字段值']/ancestor::div/following-sibling::div//i")
    private List<WebElement> filedValueList;

    @FindBy(xpath = "(//span[text()='字段值'])[last()]/ancestor::div/following-sibling::div//input[@class='el-input__inner']")
    private WebElement fieldValueInput;

    @FindBy(xpath = "(//span[text()='气泡大小']/ancestor::div/following-sibling::div//input)[last()]")
    private WebElement bubbleSizeInput;

    @FindBy(xpath = "(//div[text()='降序'])[last()]")
    private WebElement descendingOrder;

    @FindBy(xpath = "(//div[text()='升序'])[last()]")
    private WebElement ascending;

    @FindBy(xpath = "(//span[@style='background: rgb(156, 39, 176);'])[last()]/ancestor::li")
    private WebElement purple;

    @FindBy(xpath = "(//span[@style='background: rgb(229, 28, 35);'])[last()]/ancestor::li")
    private WebElement red;

    @FindBy(xpath = "(//span[@style='background: rgb(255, 152, 0);'])[last()]/ancestor::li")
    private WebElement orange;

    @FindBy(xpath = "(//span[@style='background: rgb(176, 231, 43);'])[last()]/ancestor::li")
    private WebElement green;

    @FindBy(xpath = "(//span[@style='background: rgb(255, 235, 59);'])[last()]/ancestor::li")
    private WebElement yellow;

    @FindBy(xpath = "(//span[text()='实际值'])[last()]/ancestor::div/following-sibling::div//input")
    private WebElement actualValueInput;

    @FindBy(xpath = "(//span[text()='预测值'])[last()]/ancestor::div/following-sibling::div//input")
    private WebElement predictValueInput;

    @FindBy(xpath = "(//span[text()='上限'])[last()]/ancestor::div/following-sibling::div//input")
    private WebElement topLimitInput;

    @FindBy(xpath = "(//span[text()='下限'])[last()]/ancestor::div/following-sibling::div//input")
    private WebElement lowerLimitInput;

    @FindBy(xpath = "//span[text()='经度']/ancestor::div/following-sibling::div//i")
    private WebElement longitude;

    @FindBy(xpath = "(//span[text()='经度'])[last()]/ancestor::div/following-sibling::div//input")
    private WebElement longitudeInput;

    @FindBy(xpath = "(//span[text()='纬度'])[last()]/ancestor::div/following-sibling::div//input")
    private WebElement latitudeInput;

    @FindBy(xpath = "//span[text()='纬度']/ancestor::div/following-sibling::div//i")
    private WebElement latitude;

    @FindBy(xpath = "(//span[text()='中国'])[last()]")
    private WebElement china;

    @FindBy(xpath = "//span[text()='内蒙古']")
    private WebElement neimeng;

    @FindBy(xpath = "//span[text()='省级下钻字段']/ancestor::div/following-sibling::div//i")
    private WebElement province;

    @FindBy(xpath = "//span[text()='市级下钻字段']/ancestor::div/following-sibling::div//i")
    private WebElement city;

    @FindBy(className = "el-radio-group")
    private WebElement radioGroup;

    @FindBy(className = "range-color-group-add")
    private WebElement addColour;

    @FindBy(xpath = "//input[@placeholder='min']")
    private WebElement minRange;

    @FindBy(xpath = "//input[@placeholder='max']")
    private WebElement maxRange;

    @FindBy(xpath = "(//span[text()='分段数'])[last()]/ancestor::div/following-sibling::div//input[@class='el-input__inner']")
    private WebElement segments;

    @FindBy(className = "chart-setting-popover")
    private WebElement settingPopover;

    @FindBy(xpath = "(//span[text()='父ID'])[last()]/ancestor::div/following-sibling::div//input")
    private WebElement parentId;

    @FindBy(xpath = "(//span[text()='子ID'])[last()]/ancestor::div/following-sibling::div//input")
    private WebElement childId;

    @FindBy(xpath = "(//span[text()='持续时间'])[last()]/ancestor::div/following-sibling::div//input")
    private WebElement keepTime;

    @FindBy(xpath = "(//div[text()='时间'])[last()]")
    private WebElement time;

    @FindBy(xpath = "(//div[text()='信息'])[last()]")
    private WebElement info;

    @FindBy(xpath = "(//span[contains(text(),'透明度')])[last()]/ancestor::div/following-sibling::div//input")
    private WebElement transparency;

    @FindBy(xpath = "(//span[contains(text(),'最小半径')])[last()]/ancestor::div/following-sibling::div//input")
    private WebElement minRadius;

    @FindBy(xpath = "(//span[contains(text(),'最大半径')])[last()]/ancestor::div/following-sibling::div//input")
    private WebElement maxRadius;

    @FindBy(xpath = "(//div[@class='img iconfont icon-shanchuxuanting_icon'])[last()]")
    private WebElement delete;

    public WebElement getDelete() {
        return delete;
    }

    public WebElement getTransparency() {
        return transparency;
    }

    public WebElement getMinRadius() {
        return minRadius;
    }

    public WebElement getMaxRadius() {
        return maxRadius;
    }

    public WebElement getParentId() {
        parentId.click();
        return super.getLastDropdownList();
    }

    public WebElement getChildId() {
        childId.click();
        return super.getLastDropdownList();
    }

    public WebElement getKeepTime() {
        keepTime.click();
        return super.getLastDropdownList();
    }

    public WebElement getTime() {
        return time;
    }

    public WebElement getInfo() {
        return info;
    }

    public WebElement getTracing() {
        return tracing;
    }

    public WebElement getSettingPopover() {
        return settingPopover;
    }

    public WebElement getLabel() {
        label.click();
        return super.getLastDropdownList();
    }

    public WebElement getSegments() {
        return segments;
    }

    public WebElement getMark() {
        return mark;
    }

    public WebElement getSource() {
        return source;
    }

    public WebElement getYellow() {
        return yellow;
    }

    public WebElement getMinRange() {
        return minRange;
    }

    public WebElement getMaxRange() {
        return maxRange;
    }

    public WebElement getAddColour() {
        return addColour;
    }

    public WebElement getLongitudeInput() {
        return longitudeInput;
    }

    public WebElement getLatitudeInput() {
        return latitudeInput;
    }

    public WebElement getRadioGroup() {
        return radioGroup;
    }

    public WebElement getNeimeng() {
        return neimeng;
    }

    public WebElement getProvince() {
        province.click();
        return super.getLastDropdownList();
    }

    public WebElement getCity() {
        city.click();
        return super.getLastDropdownList();
    }

    public WebElement getGoingDown() {
        return goingDown;
    }

    public WebElement getChina() {
        return china;
    }

    public WebElement getLongitude() {
        longitude.click();
        return super.getLastDropdownList();
    }

    public WebElement getLatitude() {
        latitude.click();
        return super.getLastDropdownList();
    }

    public WebElement getRegion() {
        return region;
    }

    public WebElement getActualValueInput() {
        return actualValueInput;
    }

    public WebElement getPredictValueInput() {
        return predictValueInput;
    }

    public WebElement getTopLimitInput() {
        return topLimitInput;
    }

    public WebElement getLowerLimitInput() {
        return lowerLimitInput;
    }

    public WebElement getBubbleSizeInput() {
        return bubbleSizeInput;
    }

    public WebElement getFieldValueInput() {
        return fieldValueInput;
    }

    public WebElement getFiledValue2() {
        filedValueList.get(2).click();
        return super.getLastDropdownList();
    }

    public WebElement getFiledValue3() {
        filedValueList.get(4).click();
        return super.getLastDropdownList();
    }

    public WebElement getType() {
        type.click();
        return super.getLastDropdownList();
    }

    public WebElement getActualValue() {
        actualValue.click();
        return super.getLastDropdownList();
    }

    public WebElement getBubbleSize() {
        bubbleSize.click();
        return super.getLastDropdownList();
    }

    public WebElement getPile() {
        return pile;
    }

    public WebElement getReport() {
        return report;
    }

    public WebElement getPagingSelect() {
        pagination.click();
        return pagingSelect;
    }

    public WebElement getBubble() {
        return bubble;
    }

    public WebElement getEnsureButton() {
        return super.getContainsTextButton("确定");
    }

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

    public WebElement getChartTypePopover() {
        return chartTypePopover;
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
        return horizontal;
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
        return ascending;
    }

    public WebElement getDescendingOrder() {
        return descendingOrder;
    }

    public WebElement getHeader() {
        return header;
    }

    public WebElement getYaxis() {
        return yaxis;
    }

    public WebElement getXaxis() {
        return xaxis;
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

    public WebElement getNoneExample() {
        return noneExample;
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

    public WebElement getRed() {
        return red;
    }

    public WebElement getPurple() {
        return purple;
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

    public WebElement getActual() {
        actual.click();
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

    public WebElement getSwitchButton() {
        return switchButton;
    }

    public WebElement getIndicator() {
        return indicator;
    }
}
