package com.yottabyte.pages.trend;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.DropdownUtils;
import com.yottabyte.utils.GetTime;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import org.openqa.selenium.Point;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;


import java.util.List;

/**
 * @author sunxj
 * modified by Kate
 * can be used for creating trends, for editing charts on the search page
 */
public class CreatePageDash extends PageTemplate {
    public CreatePageDash(WebDriver driver) {
        super(driver);
        //webDriver.manage().window().setPosition(new Point(0, 0));
        driver.manage().window().setSize(new Dimension(1200,900));
    }

    private DropdownUtils dropdownUtils = new DropdownUtils();

    public WebElement getChartView() {
        return chartView;
    }

    @FindBy(xpath = "//div[@class='eua4mwMYB7k125sVmyyzn']/div[1]/div[2]/div[1]")
    private WebElement chartView;

    @FindBy(xpath = "//div[@id='spl-chart']")
    private WebElement statisticalChart;

    @FindBy(xpath = "//span[text()='类型']")
    private WebElement type;

    @FindBy(xpath = "//span[contains(text(),'设置')]")
    private WebElement settings;

    @FindBy(xpath = "//span[text()='保存为']")
    private WebElement saveAs;

    @FindBy(xpath = "//li[text()='趋势图']")
    private WebElement saveAsTrend;

    @FindBy(xpath = "//li[text()='定时任务']")
    private WebElement saveAsSchedule;

    // with bubbles
    @FindBy(xpath = "//*[text()='124']/ancestor::*[2]")
    private WebElement countryChina;

    @FindBy(xpath = "//*[text()='46']/ancestor::*[2]")
    private WebElement provinceJiangsu;

    // without bubbles displayed
    @FindBy(xpath = " //*[text()='中国']")
    private WebElement openChina;

    @FindBy(xpath = " //*[text()='江苏']")
    private WebElement openJiangsu;

    @FindBy(xpath = "(//div[text()='时序'])[last()]")
    private WebElement timeSequence;

    @FindBy(xpath = "(//span[text()='行数']/preceding-sibling::div/input)[last()]")
    private WebElement rowNum;

    @FindBy(xpath = "(//span[text()='列数']/preceding-sibling::div/input)[last()]")
    private WebElement columnNum;

    @FindBy(xpath = "(//span[contains(text(),'字段值')])[last()]/ancestor::div/following-sibling::div[1]")
    private WebElement fieldValue;

    @FindBy(xpath = "(//span[contains(text(),'类型')])[last()]/ancestor::div[1]/following-sibling::div[1]")
    private WebElement typeChartField;

    @FindBy(xpath = "((//span[text()='数值字段'][last()])/ancestor::div/following-sibling::div)[1]")
    private WebElement numericField;

    @FindBy(xpath = "(//span[text()='经度'][last()])/ancestor::div/following-sibling::div[1]")
    private WebElement fieldLongitude;

    @FindBy(xpath = "(//span[text()='纬度'][last()])/ancestor::div/following-sibling::div[1]")
    private WebElement fieldLatitude;

    @FindBy(xpath = "(//span[text()='对比时间'][last()])/ancestor::div/following-sibling::div[1]")
    private WebElement contrastTime;

    @FindBy(xpath = "(//span[text()='函数'][last()])/ancestor::div/following-sibling::div[1]")
    private WebElement function;

    @FindBy(xpath = "(//span[text()='开始时间'])[last()]/ancestor::div/following-sibling::div[1]")
    private WebElement startTime;

    @FindBy(xpath = "((//span[text()='展开信息'])[last()]/ancestor::div/following-sibling::div)[1]")
    private WebElement infoField;

    @FindBy(xpath = "((//span[text()='列信息'])[last()]/ancestor::div/following-sibling::div)[1]")
    private WebElement infoColumn;

    @FindBy(xpath = "(//span[text()='标签位置'])[last()]/ancestor::div/following-sibling::div")
    private WebElement labelLocation;

    @FindBy(xpath = "(//span[text()='数据精度'][last()])/ancestor::div/following-sibling::div[1]")
    private WebElement precision;

    @FindBy(xpath = "((//label[contains(text(),'资源标签')][last()])/ancestor::div/following-sibling::div)[1]")
    private WebElement groupField;

    @FindBy(xpath = "((//label[contains(text(),'所属应用')][last()])/ancestor::div/following-sibling::div)[1]")
    private WebElement appField;

    @FindBy(xpath = "//span[text()='生成']/ancestor::button")
    private WebElement generate;

    @FindBy(className = "chart-gui-field-color-box")
    private WebElement addColor;

    @FindBy(xpath = "(//i[@class='anticon css-ifnfqv _2FmD69BXKIajYmOQLvFY29 _14T_hDxmrDu4vX6PHAQs1u'])[1]")
    private WebElement deleteFirst;

    @FindBy(xpath = "(//i[@class='anticon css-ifnfqv _2FmD69BXKIajYmOQLvFY29 _14T_hDxmrDu4vX6PHAQs1u'])[last()]")
    private WebElement deleteLast;

    @FindBy(xpath = "//span[text()='前面']")
    private WebElement unitPositionBefore;

    @FindBy(xpath = "//span[text()='后面']")
    private WebElement unitPositionAfter;

// Labels
    @FindBy (xpath = "//span[text()='标签']/ancestor::div/following-sibling::div//label[1]")
    private WebElement firstLabel;

    @FindBy (xpath = "//span[text()='标签']/ancestor::div/following-sibling::div//label[2]")
    private WebElement secondLabel;

    @FindBy (xpath = "//span[text()='标签']/ancestor::div/following-sibling::div//label[3]")
    private WebElement thirdLabel;

    @FindBy (xpath = "//span[text()='标签']/ancestor::div/following-sibling::div//label[4]")
    private WebElement forthLabel;

    @FindBy(xpath = "(//*[text()='中国'])/ancestor::span")
    private WebElement selectChina;

    @FindBy(xpath = "(//*[text()='江苏'])/ancestor::span")
    private WebElement selectJiangsu;

    @FindBy(xpath = "(//*[text()='世界'])/ancestor::span")
    private WebElement selectWorld;

    @FindBy(className = "_1pGh3cs00Rp1iccZrcDgHU")
    private WebElement listOfFields;

    @FindBy(className = "_1L7hbwdzCpZJFzkuvvcudu")
    private WebElement checkBox;

//--------------------------------------------
//Table Pencil ---------------------------------------

    @FindBy(xpath = "//th[last()]/i")
    private WebElement pencil;

    @FindBy(xpath = "//th[1]/i")
    private WebElement pencilFirst;

    @FindBy(xpath = "//div[text()='表格样式设置']/ancestor::div[2]")
    private WebElement colorPanel;

    @FindBy(xpath = "//label[contains(text(),'表格颜色')]/following-sibling::div")
    private WebElement colorType;

    @FindBy(xpath = "//label[contains(text(),'表格颜色')]/following-sibling::div//div[text()='Select']/following-sibling::div")
    private WebElement selectedValueColorType;

    @FindBy(xpath = "//label[text()='预设置']/following-sibling::span")
    private WebElement selectColor;

    @FindBy(xpath = "//img[@src='/static/img/dashboard/table_color/3.png']/ancestor::a")
    private WebElement continuity;

    @FindBy(xpath = "//img[@src='/static/img/dashboard/table_color/4.png']/ancestor::a")
    private WebElement discrete;

    @FindBy(xpath = "//label[text()='下限值']/following-sibling::input")
    private WebElement lowerLimitValue;

    @FindBy(xpath = "//label[text()='中值']/following-sibling::input")
    private WebElement middleValue;

    @FindBy(xpath = "//label[text()='上限值']/following-sibling::input")
    private WebElement upperLimitValue;


    @FindBy(xpath = "//span[text()='添加范围颜色']/ancestor::button")
    private WebElement addInterval;

    @FindBy(xpath = "//input[@value='max']/ancestor::div/preceding-sibling::div[1]/input")
    private WebElement intervalInput;

    @FindBy(xpath="(//span[@class='css-trkpwz'])[last()-1]/ancestor::div[1]")
    private WebElement changeColor;

    @FindBy(xpath="(//div[text()='Hex'])[last()-1]/preceding-sibling::input")
    private WebElement colorCode;

    @FindBy(xpath = "//input[@value='min']/ancestor::label/following-sibling::i")
    private WebElement deleteFirstInterval;

    @FindBy(xpath = "//input[@value='min']/ancestor::div/following-sibling::div[1]/i")
    private WebElement deleteSecondInterval;

    @FindBy(xpath = "//input[@value='max']//ancestor::div/preceding-sibling::div[1]/i")
    private WebElement deleteLastInterval;

    @FindBy(xpath = "//span[text()='默 认']/ancestor::button")
    private WebElement defaultColor;

    @FindBy(xpath = "//span[text()='随 机']/ancestor::button")
    private WebElement autoColor;

    @FindBy(xpath = "//span[text()='自定义']/ancestor::button")
    private WebElement customColor;

    @FindBy(xpath = "//span[contains(text(),'添加值颜色')]/ancestor::button")
    private WebElement addValue;

    @FindBy(xpath = "(//span[text()='值']/following-sibling::input)[last()]")
    private WebElement inputValue;

    @FindBy(xpath = "(//span[text()='值']/following-sibling::i)[last()]")
    private WebElement deleteLastValue;

    @FindBy(xpath = "//label[contains(text(),'字体颜色')]/following-sibling::div//span/span")
    private WebElement changeFontColor;

    @FindBy(xpath = "(//div[text()='Hex'])[last()]/preceding-sibling::input")
    private WebElement fontColor;

    @FindBy(xpath = "//label[contains(text(),'字体样式')]/following-sibling::div")
    private WebElement fontStyle;

    @FindBy(xpath = "//label[contains(text(),'列宽度')]/following-sibling::div//input")
    private WebElement columnWidth;

    @FindBy(xpath = "//label[contains(text(),'对齐方式')]/following-sibling::div")
    private WebElement alignment;

    @FindBy(xpath = "//label[contains(text(),'对齐方式')]/following-sibling::div//div[text()='Select']/following-sibling::div")
    private WebElement selectedAlignment;

//----------------------------------------------------
// other ----------------------------
    @FindBy(xpath = "//span[@class='ant-select-arrow']")
    private WebElement dropbutton;

    @FindBy(className = "CodeMirror-code")
    private WebElement searchInput;

    @FindBy(className = "yotta-date-time-picker")
    private WebElement dateEditor;

    @FindBy(xpath = "//label[text()='每个分片取样']/ancestor::div/following-sibling::div//input")
    private WebElement fenPianQuYang;

    @FindBy(xpath = "//span[text()='设置图表类型']")
    private WebElement chartType;

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

    @FindBy(xpath = "//input[@value='right']/ancestor::label")
    private WebElement right;

    @FindBy(xpath = "//input[@value='vertical']")
    private WebElement vertical;

    @FindBy(className = "el-message-box__message")
    private WebElement message;

//    @FindBy(xpath = "//i[@class='iconfont icon-chenggong1']/following-sibling::span")
    @FindBy(className = "_1JjlGgMGUnJmBrqR_9PZl8")
    private WebElement successMessage;

    @FindBy(xpath = "//*[name()='use' and @*='#icon-cuowu']/ancestor::*[name()='i']/following-sibling::p")
    private WebElement errorMessage;

    @FindBy(tagName = "th")
    private WebElement header;

    @FindBy(xpath = "(//div[contains(text(),'Y轴 2')])[last()]")
    private WebElement yaxis2;

    @FindBy(xpath = "(//div[contains(text(),'Y轴 3')])[last()]")
    private WebElement yaxis3;

    @FindBy(xpath = "(//span[text()='min']/preceding-sibling::div/input)[last()]")
    private WebElement min;

    @FindBy(xpath = "(//span[text()='max']/preceding-sibling::div/input)[last()]")
    private WebElement max;

    @FindBy(className = "el-radio-button")
    private List<WebElement> radioButtonList;

    @FindBy(xpath = "//div[text()='无']")
    private WebElement noneExample;

    @FindBy(xpath = "(//div[text()='底部'])[last()]")
    private WebElement bottomPosition;

    @FindBy(xpath = "(//div[text()='柱状外右侧'])[last()]")
    private WebElement rightPosition;

    @FindBy(xpath = "(//input[@class='el-input__inner'][not(@placeholder='请选择')])[last()]")
    private WebElement startColor;

    @FindBy(xpath = "(//div[text()='a...'])[last()]")
    private WebElement firstPosition;

    @FindBy(xpath = "(//div[text()='...z'])[last()]")
    private WebElement secondPosition;

    @FindBy(xpath = "(//div[text()='a..z'])[last()]")
    private WebElement thirdPosition;

    @FindBy(xpath = "(//span[text()='图表起始颜色']/ancestor::div/following-sibling::div/div)[1]")
    private WebElement startColour;

    @FindBy(xpath = "(//input[@class='el-input__inner'])[last()]")
    private WebElement label;

    @FindBy(className = "el-select-dropdown__item")
    private List<WebElement> liList;

    @FindBy(className = "yw-search-setting-switch")
    private WebElement settingSwitch;

    @FindBy(xpath = "(//div[contains(text(),'关系')])[last()]")
    private WebElement relation;

    @FindBy(className = "tracing")
    private WebElement tracing;

    @FindBy(xpath = "(//div[contains(text(),'分面')])[last()]")
    private WebElement divideSide;

    @FindBy(xpath = "(//p[text()='+ 添加'])[last()] | (//i[contains(@class,'anticon-plus')])")
    private WebElement addField;

    @FindBy(xpath = "(//p[text()='添加字段配置'])[last()]")
    private WebElement addConfigFields;

    @FindBy(xpath = "(//div[@class='el-select yw-search-setting-select'])[last()]")
    private WebElement secondSettingSelect;

    @FindBy(xpath = "//span[text()='预测值']/ancestor::div/following-sibling::div")
    private WebElement predict;

    @FindBy(xpath = "//span[text()='实际值']/ancestor::div/following-sibling::div")
    private WebElement actual;

    @FindBy(xpath = "//span[text()='异常值']/ancestor::div/following-sibling::div")
    private WebElement outlier;

    @FindBy(xpath = "(//span[text()='上限'])[last()]/ancestor::div/following-sibling::div[1]")
    private WebElement topLimit;

    @FindBy(xpath = "(//span[text()='下限'])[last()]/ancestor::div/following-sibling::div[1]")
    private WebElement lowerLimit;

    @FindBy(xpath = "(//div[@class='img geostatsmap'])[last()]")
    private WebElement geostatsmap;

    @FindBy(className = "table")
    private WebElement table;

    @FindBy(xpath = "(//div[contains(text(),'字符云图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement wordcloud;

    @FindBy(xpath = "(//div[contains(text(),'循序图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement sequence;

    @FindBy(xpath = "//span[text()='背景']")
    private WebElement background;

    @FindBy(xpath = "//span[text()='字体']")
    private WebElement font;

    @FindBy(xpath = "(//div[text()='按字段'])[last()]")
    private WebElement accordingField;

    @FindBy(xpath = "(//div[text()='按名称'])[last()]")
    private WebElement accordingName;

    @FindBy(xpath = "(//div[text()='按趋势'])[last()]")
    private WebElement accordingTrend;

    @FindBy(xpath = "//div[text()='按区间']")
    private WebElement accordingArea;

    @FindBy(xpath = "//span[text()='绝对值']")
    private WebElement absolute;

    @FindBy(xpath = "//span[text()='百分比']")
    private WebElement percent;

    @FindBy(xpath = "//span[text()='图标名称']/ancestor::div/following-sibling::div[1]//input")
    private WebElement iconName;

    @FindBy(xpath = "(//*[@class='el-switch yw-search-setting-switch'])[last()]")
    private WebElement switchButton;

    @FindBy(xpath = "(//i[@class='el-input__icon el-icon-arrow-up'])[2]")
    private WebElement pagination;

    @FindBy(xpath = "(//ul[@class='el-scrollbar__view el-select-dropdown__list'])[last()]")
    private WebElement pagingSelect;

    @FindBy(xpath = "//span[text()='另存为报表']/ancestor::button")
    private WebElement report;

    @FindBy(xpath = "(//span[text()='气泡大小'])[last()]/ancestor::div/following-sibling::div[1]")
    private WebElement bubbleSize;

    @FindBy(xpath = "//span[text()='实际值']/ancestor::div/following-sibling::div//i")
    private WebElement actualValue;

    @FindBy(xpath = "//span[text()='字段值']/ancestor::div/following-sibling::div//i")
    private List<WebElement> fieldValueList;

    @FindBy(xpath = "//span[text()='字段值']/ancestor::div/following-sibling::div//i")
    private List<WebElement> filedValueList;

    @FindBy(xpath = "(//span[text()='字段值'])[last()]/ancestor::div/following-sibling::div//input[@class='el-input__inner']")
    private WebElement fieldValueInput;

    @FindBy(xpath = "(//span[text()='气泡大小']/ancestor::div/following-sibling::div//input)[last()]")
    private WebElement bubbleSizeInput;

    @FindBy(xpath = "(//div[text()='降序'])[last()]/ancestor::label")
    private WebElement descendingOrder;

    @FindBy(xpath = "(//div[text()='升序'])[last()]/ancestor::label")
    private WebElement ascending;

//Colors ------------------------------------------------------------------
    @FindBy(xpath = "(//div[contains(@style,'rgb(161, 20, 249)')])[last()] | (//div[contains(@style,'rgb(156, 39, 176)')])[last()]")
    private WebElement purple;

    @FindBy(xpath = "(//div[contains(@style,'rgb(248, 0, 80)')])[last()] | (//div[contains(@style,'rgb(229, 28, 35)')])[last()]")
    private WebElement red;

    @FindBy(xpath = "(//div[contains(@style,'rgb(251, 173, 8)')])[last()] | (//div[contains(@style,'rgb(255, 152, 0)')])[last()]")
    private WebElement orange;

    @FindBy(xpath = "(//div[contains(@style,'rgb(50, 194, 125)')])[last()] | (//div[contains(@style,'rgb(37, 155, 36)')])[last()]")
    private WebElement green;

    @FindBy(xpath = "(//div[contains(@style,'rgb(179, 198, 92)')])[last()] | (//div[contains(@style,'rgb(179, 198, 92)')])[last()]")
    private WebElement lightGreen;

    @FindBy(xpath = "(//div[contains(@style,'rgb(251, 227, 16)')])[last()] | (//div[contains(@style,'rgb(255, 235, 59)')])[last()] ")
    private WebElement yellow;

    @FindBy(xpath = "(//div[contains(@style,'rgb(72, 87, 175)')])[last()] | (//div[contains(@style,'rgb(63, 81, 181)')])[last()]")
    private WebElement darkBlue;
//----------------------------------------------------------------------------

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

    @FindBy(xpath = "(//span[text()='江苏'])[last()]")
    private WebElement jiangsu;

    @FindBy(xpath = "(//span[text()='内蒙古'])[last()]")
    private WebElement neimeng;

    @FindBy(xpath = "(//span[text()='省级下钻'][last()])/ancestor::div/following-sibling::div[1]")
    private WebElement province;

    @FindBy(xpath = "(//span[text()='市级下钻'][last()])/ancestor::div/following-sibling::div[1]")
    private WebElement city;

    @FindBy(className = "el-radio-group")
    private WebElement radioGroup;

    @FindBy(className = "range-color-group-add")
    private WebElement addColour;

    @FindBy(xpath = "(//input[@placeholder='min'])[last()]")
    private WebElement minRange;

    @FindBy(xpath = "(//input[@placeholder='max'])[last()]")
    private WebElement maxRange;

    @FindBy(className = "chart-setting-popover")
    private WebElement settingPopover;

    @FindBy(xpath = "(//span[text()='父id'][last()])/ancestor::div/following-sibling::div[1]")
    private WebElement parentId;

    @FindBy(xpath = "(//span[text()='子id'])[last()]/ancestor::div/following-sibling::div[1]")
    private WebElement childId;

    @FindBy(xpath = "(//span[text()='持续时间'])[last()]/ancestor::div/following-sibling::div[1]")
    private WebElement keepTime;

    @FindBy(xpath = "(//span[contains(text(),'纬度')])[last()]/following-sibling::input")
    private WebElement centerLatitude;

    @FindBy(xpath = "(//span[contains(text(),'经度')])[last()]/following-sibling::input")
    private WebElement centerLongitude;

    @FindBy(xpath = "(//span[contains(text(),'来源名称')])[last()]/following-sibling::input")
    private WebElement mapName;

    @FindBy(xpath = "(//span[contains(text(),'URL')])[last()]/following-sibling::input")
    private WebElement mapURL;

    @FindBy(xpath = "(//span[contains(text(),'Subdomains')])[last()]/following-sibling::input")
    private WebElement subdomains;

    @FindBy(xpath = "((//span[text()='数据圆圈图层'][last()])/ancestor::div/following-sibling::div)[1]")
    private WebElement dataCircleLayer;

    @FindBy(xpath = "((//span[text()='热力图图层'][last()])/ancestor::div/following-sibling::div)[1]")
    private WebElement heatmapLayer;

    @FindBy(xpath = "//*[@class='leaflet-control-layers-toggle']")
    private WebElement mapSettings;

    @FindBy(xpath = "//span[contains(text(),'min(apache.resp_len)')]")
    private WebElement deleteMin;

    @FindBy(xpath = "(//div[@class='img iconfont icon-shanchuxuanting_icon'])[last()]")
    private WebElement delete;

    @FindBy(xpath = "//div[contains(text(),'添加颜色区间')]")
    private WebElement addRange;

    @FindBy(className = "el-switch__label--right")
    private WebElement switchLabel;

    @FindBy(xpath = "(//span[text()='标签展示'])[last()]/ancestor::div/following-sibling::div")
    private WebElement showLabel;

    @FindBy(xpath = "(//span[text()='钻取模式'])[last()]/ancestor::div/following-sibling::div")
    private WebElement drillDownMode;

    @FindBy(xpath = "(//div[text()='深圳市']/ancestor::*[@class='vx-group'][1])[last()]")
    private WebElement shenZhen;

    @FindBy(xpath = "(//*[@class='_1_m_DyhFaFqqMWBfXY4Evv']) | (//div[text()='配置'])")
    private WebElement hideElement;

    @FindBy(xpath = "(//*[@class='el-scrollbar'])[last()]")
    private WebElement scrollbar;

    @FindBy(className = "yw-trend")
    private WebElement canvas;

    @FindBy(xpath = "//*[local-name()='g' and @class='vx-group']/ancestor::div[1]")
    private WebElement chart;

    @FindBy(className = "yw-chart-config")
    private WebElement container;

    @FindBy(id = "yw-search-fields-header")
    private WebElement tableHeader;

    @FindBy(xpath = "//span[text()='新建成功']")
    private WebElement successCreate;

    @FindBy(xpath = "//span[text()='更新成功']")
    private WebElement successUpdate;

    @FindBy(xpath = "//label[text()='所属应用']/following-sibling::div//i")
    private WebElement appDropdownIcon;

    @FindBy(className = "ant-popover-inner-content")
    private WebElement content;

    @FindBy(xpath = "(//label[text()='今天']/following-sibling::i)[2]")
    private WebElement setting;

    @FindBy(xpath = "//span[text()='数值字段']/ancestor::div/following-sibling::div//i")
    private WebElement dataField;

    @FindBy(xpath = "//span[text()='字段值']/ancestor::div/following-sibling::div//i")
    private WebElement dataValue;

    @FindBy(xpath = "//div[text()='Y轴 2']")
    private WebElement yaxisTwo;

    @FindBy(xpath = "(//span[text()='字段值：'])[2]/parent::div/following-sibling::div//i")
    private WebElement dataValue2;

    @FindBy(xpath = "(//span[text()='字段配置 3']/parent::div/parent::div/following-sibling::div//div[@class='ant-select-selection__rendered'])[1]")
    private WebElement fieldThreeValue;

    @FindBy(xpath = "(//span[text()='字段配置 3']/parent::div/parent::div/following-sibling::div//div[@class='ant-select-selection__rendered'])[2]")
    private WebElement fieldThreeType;

    public WebElement getStatisticalChart() {
        return statisticalChart;
    }
    @FindBy(xpath = "(//div[@class='ant-popover-inner-content'])[2]")
    private WebElement settingContent;

    @FindBy(xpath = "(//span[text()='展示字段']/ancestor::div/following-sibling::div)[1]")
    private WebElement displayField;

    @FindBy(xpath = "(//span[text()='图中展示']/ancestor::div/following-sibling::div)[1]")
    private WebElement displayedOnChart;

    @FindBy(xpath = "//input[@placeholder='展示字号']")
    private WebElement wordSize;


    @FindBy(xpath = "//span[text()='数据精度']/ancestor::div/following-sibling::div")
    private WebElement dataPrecision;

    @FindBy(xpath = "//span[text()='行数']/preceding-sibling::input")
    private WebElement layoutRow;

    @FindBy(xpath = "//span[text()='列数']/preceding-sibling::input")
    private WebElement layoutColumn;

    @FindBy(xpath = "//input[@placeholder='max']/following-sibling::div")
    private WebElement rangeColor;

    @FindBy(xpath = "((//*[@class='anticon-spin'])[2]) | (//span[contains(@class,'ant-spin-dot')])")
    private WebElement loading;

    @FindBy(xpath = "(//span[text()='类型：'])[last()]/ancestor::div/following-sibling::div")
    private WebElement typeDropdown;

    @FindBy(className = "yotta-search-control-text")
    private WebElement searchStatus;

    @FindBy(xpath = "//span[text()='dataset_1']")
    private WebElement dataset_1;

    @FindBy(xpath = "//span[text()='all_']")
    private WebElement allResources;

    @FindBy(xpath = "//*[@cy='33']")
    private WebElement chartElement;

    @FindBy(xpath = "//div[contains(@class,'ant-slider-handle')]")
    private WebElement sliderHandle;

    @FindBy(xpath = "(//tr/td[2])[1]")
    private WebElement cell;

    //默认
    @FindBy(xpath = "(//tr[2]/td[2]/div)[1]")
    private WebElement cell2;

    @FindBy(xpath = "//div[text()='提示']/ancestor::div/following-sibling::div//p")
    private WebElement prompt;

    @FindBy(xpath = "//span[text()='已存搜索']")
    private WebElement savedSearch;

    @FindBy(className = "ant-message-notice")
    private WebElement notice;

    @FindBy(className = "yotta-dialog-title")
    private WebElement confirmMessage;

    @FindBy(xpath = "//*[name()='rect' and @class='vx-bar']/following-sibling::*[@font-size='12']")
    private WebElement sankeyElement;

    @FindBy(xpath = "//*[(contains(text(),'200') or contains(text(),'/')) and name()='text']/following-sibling::*[name()='circle']")
    private WebElement chordElement;

    @FindBy(xpath = "//*[contains(@style,'cubic-bezier')]/following-sibling::*[@font-size>7]")
    private WebElement forceElement;

    @FindBy(xpath = "//*[@class='vx-group' and name()='g']/*[text()='南京市' and name()='text']")
    private WebElement wordcloudElement;

    @FindBy(xpath = "//*[@class='vx-group']/*[@class='vx-line-radial']")
    private WebElement radarElement;

    @FindBy(xpath = "//*[contains(@id,'funnel')]")
    private WebElement funnelElement;

    @FindBy(xpath = "//*[@class='vx-circle']/following-sibling::*[contains(@class,'vx-area-closed')]")
    private WebElement liquidfillElement;

    @FindBy(xpath = "//*[@class='vx-group']/*[contains(@fill,'rgb(211, 17, 33)') or contains(@fill,'rgb(253, 144, 62)') or contains(@fill,'rgb(255, 231, 148)')]")
    private WebElement matrixheatmapElement;

    @FindBy(xpath = "//div[contains(@class,'bar')]/ancestor::div[1]/following-sibling::div[2]//div[contains(@class,'bar')]")
    private WebElement chainTableElement;

    @FindBy(xpath = "//div[@class='tooltipTopBoundary']/following-sibling::div[contains(@id,'tracing')]/canvas")
    private WebElement chainTreeElement;

    @FindBy(xpath = "//div[contains(@id,'sequence')]")
    private WebElement sequenceElement;

    @FindBy(xpath = "//*[@class='vx-group']//*[contains(@id,endArrow) or contains(@id,startArrow)]")
    private WebElement networkElement;

    @FindBy(xpath = "(//div[contains(@style,'justify-content: center')]//span)[last()]")
    private WebElement singleElement;

    @FindBy(xpath = "(//*[@class='vx-group']//*[name()='text'])[1]")
    private WebElement ringElement_1;

    @FindBy(xpath = "(//*[@class='vx-group']//*[name()='text' and @fill='gray'])")
    private WebElement ringElement_2;

    @FindBy(xpath = "(//*[@class='vx-group']//*[@class='vx-arc']/following-sibling::*)[1]")
    private WebElement sunElement;

    @FindBy(xpath = "//*[@class='vx-bar']/ancestor::*[2]/following-sibling::*[contains(@class,'vx-axis-bottom')]")
    private WebElement barElement;

    @FindBy(xpath = "(//*[@class='vx-group']//*[@class='vx-arc']/following-sibling::*[@class='vx-line']/preceding-sibling::*)[last()]")
    private WebElement pieElement;

    @FindBy(xpath = "//*[@class='vx-group']//*[@class='vx-arc']")
    private WebElement pieNoLabelsElement;

    @FindBy(xpath = "//*[@class='vx-group']/*/div[contains(@style,'font-size: 12px;')]")
    private WebElement flameElement;

    @FindBy(xpath = "//*[@class='vx-group']//*[contains(@class,'vx-rows')]/following-sibling::*[@class='vx-linepath']")
    private WebElement lineChartElement;

    @FindBy(xpath = "//*[@class='vx-group']//*[@class='vx-area-closed']")
    private WebElement areaChartElement;

    @FindBy(xpath = "//*[@class='vx-group']//*[@cx and @r and contains(@style,'pointer-events')]")
    private WebElement scatterChartElement;

    @FindBy(xpath = "//*[@class='vx-group']//*[@y and @height and @fill]")
    private WebElement columnChartElement;

    @FindBy(xpath = "//*[@class='vx-group']//*[contains(@class,'vx-threshold')]")
    private WebElement rangelineElement;

    @FindBy(xpath = "//*[@class='heatmap-canvas']")
    private WebElement heatmapElement;

    @FindBy(xpath = "//*[@class='vx-group geo']/*[@fill='#131d42']")
    private WebElement regionmapDarkElement;

    @FindBy(xpath = "//*[@class='vx-group geo']/*[@fill='#FFFFFF']")
    private WebElement regionmapLightElement;

    @FindBy(xpath = "//*[@class='vx-group geo']/following-sibling::*/*[contains(@id,'link')]")
    private WebElement attackmapElement;

    public WebElement getAttackmapElement() {
        return attackmapElement;
    }

    public WebElement getRegionmapLightElement() {
        return regionmapLightElement;
    }

    public WebElement getRegionmapDarkElement() {
        return regionmapDarkElement;
    }

    public WebElement getHeatmapElement() {
        return heatmapElement;
    }

    public WebElement getRangelineElement() {
        return rangelineElement;
    }

    public WebElement getColumnChartElement() {
        return columnChartElement;
    }

    public WebElement getScatterChartElement() {
        return scatterChartElement;
    }

    public WebElement getAreaChartElement() {
        return areaChartElement;
    }

    public WebElement getLineChartElement() {
        return lineChartElement;
    }

    public WebElement getFlameElement() {
        return flameElement;
    }

    public WebElement getPieNoLabelsElement() {
        return pieNoLabelsElement;
    }

    public WebElement getPieElement(){
        return pieElement;
    }

    public WebElement getBarElement() {
        return barElement;
    }

    public WebElement getSunElement() {
        return sunElement;
    }

    public WebElement getRingElement_1() {
        return ringElement_1;
    }

    public WebElement getRingElement_2() {
        return ringElement_2;
    }

    public WebElement getSingleElement() {
        return singleElement;
    }

    public WebElement getNetworkElement() {
        return networkElement;
    }

    public WebElement getSequenceElement() {
        return sequenceElement;
    }

    public WebElement getChainTreeElement() {
        return chainTreeElement;
    }

    public WebElement getChainTableElement() {
        return chainTableElement;
    }

    public WebElement getMatrixheatmapElement() {
        return matrixheatmapElement;
    }

    public WebElement getLiquidfillElement() {
        return liquidfillElement;
    }

    public WebElement getFunnelElement() {
        return funnelElement;
    }

    public WebElement getRadarElement() {
        return radarElement;
    }

    public WebElement getWordcloudElement() {
        return wordcloudElement;
    }

    public WebElement getForceElement() {
        return forceElement;
    }

    public WebElement getChordElement() {
        return chordElement;
    }

    public WebElement getSankeyElement() {
        return sankeyElement;
    }

    public WebElement getConfirmMessage() {
        return confirmMessage;
    }

    public WebElement getNotice() {
        return notice;
    }

    public WebElement getSavedSearch() {
        return savedSearch;
    }

    public WebElement getPrompt() {
        return prompt;
    }

    public WebElement getCell2(){
        return cell2;
    }

    public WebElement getCell() {
        return cell;
    }

    public WebElement getSliderHandle() {
        return sliderHandle;
    }

    public WebElement getChartElement() {
        return chartElement;
    }

    public WebElement getDataset_1() {
        return dataset_1;
    }

    public WebElement getAllResources() {
        return allResources;
    }

    public WebElement getSearchStatus() throws InterruptedException {
        Thread.sleep(1000);
        return searchStatus;
    }

    public WebElement getTypeDropdown() {
        typeDropdown.click();
        return getLastDropdownList();
    }

    public WebElement getLoading() {
        return loading;
    }

    public WebElement getType() {
        return type;
    }

    public WebElement getRangeColor() {
        return rangeColor;
    }

    public WebElement getLayoutRow() {
        return layoutRow;
    }

    public WebElement getLayoutColumn() {
        return layoutColumn;
    }

    public WebElement getDivideSide() {
        return divideSide;
    }

    public WebElement getFirstLabel() {
        return firstLabel;
    }

    public WebElement getSecondLabel() {
        return secondLabel;
    }

    public WebElement getDataPrecision() {
        dataPrecision.click();
        return super.getLastDropdownList();
    }

    public WebElement getThirdLabel() {
        return thirdLabel;
    }

    public WebElement getForthLabel() {
        return forthLabel;
    }


    public WebElement getSettings() {
        return settings;
    }

    public WebElement getSaveAsTrend() {
        saveAs.click();
        return saveAsTrend;
    }

    public WebElement getSaveAsSchedule() {
        saveAs.click();
        return saveAsSchedule;
    }

    public WebElement getProvinceJiangsu() {
        return provinceJiangsu;
    }

    public WebElement getOpenChina() {
        return openChina;
    }

    public WebElement getOpenJiangsu() {
        return openJiangsu;
    }

    public WebElement getWordSize() {
        return wordSize;
    }

    public WebElement getDisplayField() {
        displayField.click();
        return super.getLastDropdownList();
    }

    public WebElement getDisplayedOnChart() {
        displayedOnChart.click();
        return super.getLastDropdownList();
    }

    public WebElement getSettingContent() {
        return settingContent;
    }

    public WebElement getYaxisTwo() {
        return yaxisTwo;
    }

    public WebElement getDataValue() {
        dataValue.click();
        return super.getLastDropdownList();
    }

    public WebElement getDataValue2() {
        dataValue2.click();
        return super.getLastDropdownList();
    }

    public WebElement getFieldThreeValue() {
        fieldThreeValue.click();
        return super.getLastDropdownList();
    }

    public WebElement getFieldThreeType() {
        fieldThreeType.click();
        return super.getLastDropdownList();
    }

    public WebElement getDataField() {
        dataField.click();
        return super.getLastDropdownList();
    }

    public WebElement getContent() {
        return content;
    }

    public WebElement getCountryChina() {
        return countryChina;
    }

    public WebElement getComplete() {
        return super.getButton("完成");
    }

    public WebElement getSuccessUpdate() {
        return successUpdate;
    }

    public WebElement getSuccessCreate() {
        return successCreate;
    }

    public WebElement getTableHeader() {
        return tableHeader;
    }

    public WebElement getContainer() {
        return container;
    }

    public WebElement getChart() {
        return chart;
    }

    public WebElement getSelectJiangsu() {
        return selectJiangsu;
    }

    public WebElement getSelectWorld() {
        return selectWorld;
    }

    public WebElement getJiangsu() {
        return jiangsu;
    }

    public WebElement getCanvas() {
        return canvas;
    }

    public WebElement getRowNum() {
        return rowNum;
    }

    public WebElement getColumnNum(){
        return columnNum;
    }

    public WebElement getScrollbar() {
        return scrollbar;
    }

    public WebElement getShowLabel() {
        WebDriverWait wait = new WebDriverWait(webDriver,10);
        wait.until(ExpectedConditions.elementToBeClickable(showLabel));
        showLabel.click();
        return super.getLastDropdownList();
    }

    public WebElement getDrillDownMode() {
        drillDownMode.click();
        return super.getLastDropdownList();
    }

    public WebElement getShenZhen() {
        return shenZhen;
    }

    public WebElement getHideElement() {
        return hideElement;
    }

    public WebElement getLabelLocation() {
        WebDriverWait wait = new WebDriverWait(webDriver,10);
        wait.until(ExpectedConditions.elementToBeClickable(labelLocation));
        labelLocation.click();
        return super.getLastDropdownList();
    }

    public WebElement getFieldValue() {
        WebDriverWait wait = new WebDriverWait(webDriver,10);
        wait.until(ExpectedConditions.elementToBeClickable(fieldValue));
        fieldValue.click();
        return this.getLastDropdownList();
    }

    public WebElement getTypeChartField() {
        typeChartField.click();
        return this.getLastDropdownList();
    }

    public WebElement getNumericField() {
        numericField.click();
        return this.getLastDropdownList();
    }

    public WebElement getContrastTime() {
        WebDriverWait wait = new WebDriverWait(webDriver,10);
        wait.until(ExpectedConditions.elementToBeClickable(contrastTime));
        contrastTime.click();
        return this.getLastDropdownList();
    }

    public WebElement getFieldLongitude() {
        fieldLongitude.click();
        return this.getLastDropdownList();
    }

    public WebElement getFieldLatitude() {
        fieldLatitude.click();
        return this.getLastDropdownList();
    }

    public WebElement getLightGreen() {
        return lightGreen;
    }

    public WebElement getSwitchLabel() {
        return switchLabel;
    }

    public WebElement getAddRange() {
        return addRange;
    }

    public WebElement getDeleteFirst() {
        return deleteFirst;
    }

    public WebElement getDeleteLast() {
        return deleteLast;
    }

    public WebElement getUnitPositionBefore() {
        return unitPositionBefore;
    }

    public WebElement getUnitPositionAfter() {
        return unitPositionAfter;
    }

    public WebElement getDelete() {
        return delete;
    }

    public WebElement getCenterLatitude() {
        return centerLatitude;
    }

    public WebElement getCenterLongitude() {
        return centerLongitude;
    }

    public WebElement getMapName() {
        return mapName;
    }

    public WebElement getMapURL() {
        return mapURL;
    }

    public WebElement getSubdomains() {
        return subdomains;
    }

    public WebElement getDataCircleLayer() {
        dataCircleLayer.click();
        return super.getLastDropdownList();
    }

    public WebElement getHeatmapLayer() {
        heatmapLayer.click();
        return super.getLastDropdownList();
    }

    public WebElement getMapSettings() {
        return mapSettings;
    }

    public WebElement getDeleteMin() {
        return deleteMin;
    }

    public WebElement getFunction() {
        function.click();
        return super.getLastDropdownList();
    }

    public WebElement getParentId() {
        parentId.click();
        return super.getLastDropdownList();
    }

    public WebElement getChildId() {
        childId.click();
        return super.getLastDropdownList();
    }

    public WebElement getStartTime() {
        startTime.click();
        return super.getLastDropdownList();
    }

    public WebElement getKeepTime() {
        keepTime.click();
        return super.getLastDropdownList();
    }

    public WebElement getInfoField() {
        infoField.click();
        return super.getLastDropdownList();
    }

    public WebElement getInfoColumn() {
        infoColumn.click();
        return super.getLastDropdownList();
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

    public WebElement getYellow() {
        return yellow;
    }

    public WebElement getDarkBlue(){
        return darkBlue;
    }

    public WebElement getMinRange() {
        return minRange;
    }

    public WebElement getMaxRange() {
        return maxRange;
    }

    public WebElement getAddColor() {
        return addColor;
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

    public WebElement getSelectChina() {
        return selectChina;
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

    public WebElement getFieldValue2() {
        fieldValueList.get(2).click();
        return super.getLastDropdownList();
    }

    public WebElement getFieldValue3() {
        fieldValueList.get(4).click();
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

    public WebElement getPrecision() {
        precision.click();
        return super.getLastDropdownList();
    }

    public WebElement getGroupField() {
        groupField.click();
        return super.getLastDropdownList();
    }

    public WebElement getAppField() {
        appField.click();
        return super.getLastDropdownList();
    }

//--Charts

    public WebElement getLineChart() {
        return getChartButton("曲线图");
    }

    public WebElement getAreaChart() {
        return getChartButton("面积图");
    }

    public WebElement getScatterChart() {
        return getChartButton("散点图");
    }

    public WebElement getColumnChart() {
        return getChartButton("柱状图");
    }

    public WebElement getPie() {
        return getChartButton("饼状图");
    }

    public WebElement getRose() {
        return getChartButton("玫瑰图");
    }

    public WebElement getBar() {
        return getChartButton("条形图");
    }

    public WebElement getSun() {
        return getChartButton("旭日图");
    }

    public WebElement getFlame() {
        return getChartButton("火焰图");
    }

    public WebElement getChord() {
        return getChartButton("和弦图");
    }

    public WebElement getSankey() {
        return getChartButton("桑基图");
    }

    public WebElement getForce() {
        return getChartButton("力图");
    }

    public WebElement getRangeline() {
        return getChartButton("区间图");
    }

    public WebElement getMultiaxis() {
        return getChartButton("多y轴图");
    }

    public WebElement getHeatmap() {
        return getChartButton("热力地图");
    }

    public WebElement getAttackmap() {
        return getChartButton("攻击地图");
    }

    public WebElement getRegionmap() {
        return getChartButton("区划地图");
    }

    public WebElement getGeostatsmap() {
        return getChartButton("统计地图");
    }

    public WebElement getSingle() {
        return getChartButton("单值");
    }

    public WebElement getRing() {
        return getChartButton("环形比例图");
    }

    public WebElement getLiquidfill() {
        return getChartButton("水球图");
    }

    public WebElement getWordcloud() {
        return getChartButton("字符云图");
    }

    public WebElement getSequence() {
        return getChartButton("循序图");
    }

    public WebElement getRadar() {
        return getChartButton("雷达图");
    }

    public WebElement getFunnel() {
        return getChartButton("漏斗图");
    }

    public WebElement getMatrixheatmap() {
        return getChartButton("矩阵热力图");
    }

    public WebElement getChain() {
        return getChartButton("调用链");
    }

    public WebElement getNetworkNode() {
        return getChartButton("网络节点图");
    }

//--Tabs

    public WebElement getOrder() {
        return getTabElement("序列");
    }

    public WebElement getDimension() {
        return getTabElement("维度");
    }

    public WebElement getConnection() {
        return getTabElement("关系");
    }

    public WebElement getCompound() {
        return getTabElement("复合");
    }

    public WebElement getMap() {
        return getTabElement("地图");
    }

    public WebElement getOther() {
        return getTabElement("其他");
    }

    public WebElement getXaxis() {
        return getTabElement("X轴");
    }

    public WebElement getYaxis() {
        return getTabElement("Y轴");
    }

    public WebElement getGroup() {
        return getTabElement("分组");
    }

    public WebElement getFacet() {
        return getTabElement("分面");
    }

    public WebElement getExample() {
        return getTabElement("图例");
    }

    public WebElement getExhibition() {
        return getTabElement("展示");
    }

    public WebElement getBubble() {
        return getTabElement("气泡");
    }

    public WebElement getValue() {
        return getTabElement("数值");
    }

    public WebElement getDivide() {
        return getTabElement("切分");
    }

    public WebElement getSource() {
        return getTabElement("来源");
    }

    public WebElement getTarget() {
        return getTabElement("目标");
    }

    public WebElement getWeight() {
        return getTabElement("权重");
    }

    public WebElement getRegion() {
        return getTabElement("区域");
    }

    public WebElement getGoingDown() {
        return getTabElement("下钻");
    }

    public WebElement getGeneral() {
        return getTabElement("常规");
    }

    public WebElement getTile() {
        return getTabElement("平铺");
    }

    public WebElement getIcon() {
        return getTabElement("图标");
    }

    public WebElement getSecondTitle() {
        return getTabElement("二级标题");
    }

    public WebElement getCompare() {
        return getTabElement("对比");
    }

    public WebElement getMark() {
        return getTabElement("标记");
    }

    public WebElement getIndicator() {
        return getTabElement("指示器");
    }

    public WebElement getTime() {
        return getTabElement("时间");
    }

    public WebElement getInfo() {
        return getTabElement("信息");
    }

    public WebElement getIndicators() {
        return getTabElement("指标");
    }


//--Input elements

    public WebElement getUnit() {
        return getInputSetting("单位");
    }

    public WebElement getRepulsion() {
        return getInputSetting("斥力因子");
    }

    public WebElement getLabelInterval() {
        return getInputSetting("标签间隔");
    }

    public WebElement getTransparency() {
        return getInputSetting("透明度");
    }

    public WebElement getMinRadius() {
        return getInputSetting("最小半径");
    }

    public WebElement getMaxRadius() {
        return getInputSetting("最大半径");
    }

    public WebElement getZoomLevel() {
        return getInputSetting("缩放级别");
    }

    public WebElement getMapOpacity() {
        return getInputSetting("透明度");
    }

    public WebElement getFontSize() {
        return getInputSetting("展示字号");
    }

    public WebElement getTitleName() {
        return getInputSetting("名称");
    }

    public WebElement getSegments() {
        return getInputSetting("分段数");
    }


//--Switch elements
    public WebElement getPile() {
        return getSwitchElement("堆叠");
    }

    public WebElement getSmooth() {
        return getSwitchElement("平滑");
    }

    public WebElement getConnectEmptyData() {
        return getSwitchElement("连接空数据");
    }

    public WebElement getMultistage() {
        return getSwitchElement("多级");
    }

    public WebElement getThousandSeparator() {
        return getSwitchElement("使用千分隔符");
    }

    public WebElement getShowBubbles() {
        return getSwitchElement("展示气泡");
    }

    public WebElement getShowLabels() {
        return getSwitchElement("展示标签");
    }

    public WebElement getShowAllLabels() {
        return getSwitchElement("显示所有x轴标签");
    }

    public WebElement getUnifyMetric() {
        return getSwitchElement("统一度量");
    }

    public WebElement getOnlineMap() {
        return getSwitchElement("使用在线地图");
    }

//-----------------



    public WebElement getReport() {
        return report;
    }

    public WebElement getPagingSelect() {
        pagination.click();
        return pagingSelect;
    }

    public WebElement getEnsureButton() {
        return getContainsTextButton("确定");
    }

    public WebElement getCreateEnsureButton() {
        return getContainsTextButton("确 定");
    }

    public WebElement getCancelButton() {
        return getContainsTextButton("取消");
    }

    public WebElement getGenerate() {
        return generate;
    }

    public WebElement getNameInput() {
        return getInputElement("name");
    }

    public WebElement getDescribeInput() {
        return getInputElement("description");
    }

    public WebElement getGroupDropdown() {
        return getDropdownList("分组");
    }

    public WebElement getNextButton() {
        return getButton("下一步");
    }

    public WebElement getBackButton() {
        return getButton("上一步");
    }

    public WebElement getFinishButton() {
        return getButton("完成");
    }

    public WebElement getReturnButton() {
        return getButton("返回");
    }

    public WebElement getSearchButton() {
        return getButton("搜索");
    }

    public WebElement getSave() {
        return getButton("保存");
    }

    public WebElement getToday() {
        return GetTime.getTime(webDriver, "Today");
    }

    public WebElement getYesterday() {
        return GetTime.getTime(webDriver, "Yesterday");
    }

    public WebElement getThisWeek() {
        return GetTime.getTime(webDriver, "ThisWeek");
    }

    public WebElement getThisMonth() {
        return GetTime.getTime(webDriver, "ThisMonth");
    }

    public WebElement getLastWeek() {
        return GetTime.getTime(webDriver, "LastWeek");
    }

    public WebElement getLastMonth() {
        return GetTime.getTime(webDriver, "LastMonth");
    }

    public WebElement getOneDay() {
        return GetTime.getTime(webDriver, "OneDay");
    }

    public WebElement getTwoDays() {
        return GetTime.getTime(webDriver, "TwoDays");
    }

    public WebElement getSevenDays() {
        return GetTime.getTime(webDriver, "SevenDays");
    }

    public WebElement getWholeTime() {
        return GetTime.getTime(webDriver, "WholeTime");
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getErrorMessage() {
        return errorMessage;
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

    public WebElement getFenPianQuYang() {
        return fenPianQuYang;
    }

    public WebElement getHorizontal() {
        return horizontal;
    }

    public WebElement getLeft() {
        return radioButtonList.get(1);
    }

    public WebElement getRight() {
        return right;
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

    public WebElement getYaxis2() {
        return yaxis2;
    }

    public WebElement getYaxis3() {
        return yaxis3;
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

    public WebElement getStartColor() {
        return startColor;
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

    public WebElement getRelation() {
        return relation;
    }

    public WebElement getAddField() {
        return addField;
    }

    public WebElement getAddConfigFields() {
        return addConfigFields;
    }

    public WebElement getPredict() {
        WebDriverWait wait = new WebDriverWait(webDriver,10);
        wait.until(ExpectedConditions.elementToBeClickable(predict));
        predict.click();
        return super.getLastDropdownList();
    }

    public WebElement getActual() {
        WebDriverWait wait = new WebDriverWait(webDriver,10);
        wait.until(ExpectedConditions.elementToBeClickable(actual));
        actual.click();
        return super.getLastDropdownList();
    }

    public WebElement getOutlier() {
        WebDriverWait wait = new WebDriverWait(webDriver,10);
        wait.until(ExpectedConditions.elementToBeClickable(outlier));
        outlier.click();
        return super.getLastDropdownList();
    }

    public WebElement getTopLimit() {
        WebDriverWait wait = new WebDriverWait(webDriver,10);
        wait.until(ExpectedConditions.elementToBeClickable(topLimit));
        topLimit.click();
        return super.getLastDropdownList();
    }

    public WebElement getLowerLimit() {
        WebDriverWait wait = new WebDriverWait(webDriver,10);
        wait.until(ExpectedConditions.elementToBeClickable(lowerLimit));
        lowerLimit.click();
        return super.getLastDropdownList();
    }

    public WebElement getTable() {
        return table;
    }

    public WebElement getBackground() {
        return background;
    }

    public WebElement getFont() {
        return font;
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

    public WebElement getTimeSequence() {
        return timeSequence;
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//input[@name='" + name + "']"));
    }

    public WebElement getInputSetting(String name) {
        return webDriver.findElement(By.xpath("(//span[contains(text(),'" + name + "')]/ancestor::div[1]/following-sibling::div//input)[last()]"));
    }

    public WebElement getSwitchElement(String name) {
        return webDriver.findElement(By.xpath("//span[text()='" + name + "']/ancestor::div/following-sibling::div//label"));
    }

    public WebElement getTabElement(String name) {
        return webDriver.findElement(By.xpath("(//div[text()='" + name + "'])[last()]"));
    }

    public WebElement getAppDropdown() {
        appDropdownIcon.click();
        return dropdownUtils.getLastDropdownList();
    }


    public WebElement getListOfFields() {
        return listOfFields;
    }

    public WebElement getCheckBox() {
        return checkBox;
    }


//Table Color -----------------------------------------------
    public WebElement getPencil() {
        return pencil;
    }

    public WebElement getPencilFirst() {
        return pencilFirst;
    }

    public WebElement getColorPanel() {
        return colorPanel;
    }

    public WebElement getColorType() {
        WebDriverWait wait = new WebDriverWait(webDriver,10);
        wait.until(ExpectedConditions.elementToBeClickable(colorType));
        colorType.click();
        return super.getLastDropdownList();
    }

    public WebElement getSelectedValueColorType() {
        return selectedValueColorType;
    }

    public WebElement getSelectColor() {
        return selectColor;
    }

    public WebElement getContinuity() {
        return continuity;
    }

    public WebElement getDiscrete() {
        return discrete;
    }

    public WebElement getLowerLimitValue() {
        return lowerLimitValue;
    }

    public WebElement getMiddleValue() {
        return middleValue;
    }

    public WebElement getUpperLimitValue() {
        return upperLimitValue;
    }

//-----------------------------------------------------------

    private WebElement getChartButton(String chartName) {
        String xpath = "//p[text()='" + chartName + "']/ancestor::div/preceding-sibling::div[contains(@class,'yotta-chart-selector-avatar')]";
        return webDriver.findElement(By.xpath(xpath));
    }

    //author-jnd
    //数据集的展开按钮
    @FindBy(xpath = "//*[text()='展开']/ancestor::button")
    private WebElement zhanKai;

    public WebElement getZhanKai() {
        return zhanKai;
    }

    //数据集的显示位置
    @FindBy(xpath = "//div[@class='_3ET1_zfWFNtizQm9NnT996']/span")
    private WebElement dataSetPosition;

    public WebElement getDataSetPosition() {
        return dataSetPosition;
    }

    @FindBy(xpath = "//span[text()='搜索配置']")
    private WebElement searchConfig;

    public WebElement getSearchConfig() {
        return searchConfig;
    }

    @FindBy(xpath = "//span[contains(@class,'close-icon')]")
    private WebElement closeWindow;

    public WebElement getCloseWindow() {
        return closeWindow;
    }

// Table - pencil;-----------------
    public WebElement getAddInterval() {
        return addInterval;
    }

    public WebElement getIntervalInput() {
        return intervalInput;
    }

    public WebElement getChangeColor() {
        return changeColor;
    }

    public WebElement getColorCode() {
        WebDriverWait wait = new WebDriverWait(webDriver,10);
        wait.until(ExpectedConditions.elementToBeClickable(changeColor));
        changeColor.click();
        return colorCode;
    }

    public WebElement getDeleteFirstInterval() {
        return deleteFirstInterval;
    }

    public WebElement getDeleteSecondInterval() {
        return deleteSecondInterval;
    }

    public WebElement getDeleteLastInterval() {
        return deleteLastInterval;
    }

    public WebElement getDefaultColor() {
        return defaultColor;
    }

    public WebElement getAutoColor() {
        return autoColor;
    }

    public WebElement getCustomColor() {
        return customColor;
    }

    public WebElement getAddValue() {
        return addValue;
    }

    public WebElement getInputValue() {
        return inputValue;
    }

    public WebElement getDeleteLastValue() {
        return deleteLastValue;
    }

    public WebElement getFontColor() {
        WebDriverWait wait = new WebDriverWait(webDriver,10);
        wait.until(ExpectedConditions.elementToBeClickable(changeFontColor));
        changeFontColor.click();
        return fontColor;
    }

    public WebElement getFontStyle() {
        fontStyle.click();
        return super.getLastDropdownList();
    }

    public WebElement getColumnWidth() {
        return columnWidth;
    }

    public WebElement getAlignment() {
        alignment.click();
        return super.getLastDropdownList();
    }

    public WebElement getSelectedAlignment() {
        return  selectedAlignment;
    }
//-----------------------------------------------------


    // for 调用链
    @FindBy(xpath = "(//span[text()='展示类型'])[last()]/ancestor::div/following-sibling::div")
    private WebElement tracingType;

    public WebElement getTracingType() {
        WebDriverWait wait = new WebDriverWait(webDriver,10);
        wait.until(ExpectedConditions.elementToBeClickable(tracingType));
        tracingType.click();
        return super.getLastDropdownList();
    }

    //Sparkline
    @FindBy(xpath = "(//span[text()='使用Sparkline'])[last()]/ancestor::div/following-sibling::button")
    private WebElement sparkline;

    @FindBy(xpath = "(//span[text()='Sparkline x轴字段'])[last()]/ancestor::div/following-sibling::div")
    private WebElement sparklineField;

    public WebElement getSparkline() {
        return sparkline;
    }

    public WebElement getSparklineField() {
        WebDriverWait wait = new WebDriverWait(webDriver,10);
        wait.until(ExpectedConditions.elementToBeClickable(sparklineField));
        sparklineField.click();
        return super.getLastDropdownList();
    }

    @FindBy(xpath = "(//label[contains(text(),'资源标签')][last()])/ancestor::div/following-sibling::div//input")
    private WebElement tagInput;

    @FindBy(xpath = "(//span[@class='yotta-select-option-label'])[1]")
    private WebElement selectAddedTag;

    @FindBy(xpath = "//label[contains(text(),'资源标签')]/ancestor::div/following-sibling::div//span[@class='yotta-tag-content']")
    private WebElement selectedTag;

    @FindBy(xpath = "//label[contains(text(),'资源标签')]/ancestor::div/following-sibling::div//span[@class='yotta-tag-content']/following-sibling::span")
    private WebElement deleteTag;

    public WebElement getTagInput() {
        groupField.click();
        return tagInput;
    }

    public WebElement getSelectAddedTag() {
        return selectAddedTag;
    }

    public WebElement getSelectedTag() {
        return selectedTag;
    }

    public WebElement getDeleteTag() {
        return deleteTag;
    }

    @FindBy(xpath = "(//div[text()='添加指标'])[last()]")
    private WebElement addIndicator;

    @FindBy(xpath = "//*[text()='POST']/preceding-sibling::*")
    private WebElement clickPOST;

    @FindBy(xpath = "//*[text()='北京']/preceding-sibling::*")
    private WebElement clickBeijing;

    public WebElement getAddIndicator() {
        return addIndicator;
    }

    public WebElement getClickPOST() {
        return clickPOST;
    }

    public WebElement getClickBeijing() {
        return clickBeijing;
    }

}
