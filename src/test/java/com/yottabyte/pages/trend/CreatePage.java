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
public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
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

    @FindBy(xpath = "//div[@class='ZvGKqShXaXHE-0feDOBus']/following-sibling::div")
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

    @FindBy(xpath = "//*[text()='124']/ancestor::*[2]")
    private WebElement countryChina;

    @FindBy(xpath = "//*[text()='46']/ancestor::*[2]")
    private WebElement provinceJiangsu;

    @FindBy(xpath = "//div[contains(text(),'关系')]")
    private WebElement connection;

    @FindBy(xpath = "(//div[contains(text(),'曲线图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement lineChart;

    @FindBy(xpath = "(//div[contains(text(),'面积图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement areaChart;

    @FindBy(xpath = "(//div[contains(text(),'柱状图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement columnChart;

    @FindBy(xpath = "(//div[contains(text(),'散点图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement scatterChart;

    @FindBy(xpath = "(//div[contains(text(),'旭日图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement sun;

    @FindBy(xpath = "(//div[contains(text(),'统计地图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement statisticalmap;

    @FindBy(xpath = "(//div[contains(text(),'单值')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement single;

    @FindBy(xpath = "(//div[contains(text(),'环形比例图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement ring;

    @FindBy(xpath = "(//div[contains(text(),'水球图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement liquidfill;

    @FindBy(xpath = "(//div[contains(text(),'雷达图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement radar;

    @FindBy(xpath = "(//div[contains(text(),'漏斗图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement funnel;

    @FindBy(xpath = "(//div[contains(text(),'矩阵热力图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement matrixheatmap;

    @FindBy(xpath = "(//div[contains(text(),'调用链')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement chain;

    @FindBy(xpath = "(//div[contains(text(),'数值')])[last()]")
    private WebElement value;

    @FindBy(xpath = "(//div[text()='常规'])[last()]")
    private WebElement general;

    @FindBy(xpath = "(//div[text()='时序'])[last()]")
    private WebElement timeSequence;

    @FindBy(xpath = "(//div[text()=' 分面'])[last()]")
    private WebElement facet;

    @FindBy(xpath = "(//span[text()='行数']/preceding-sibling::input)[last()]")
    private WebElement rowNum;

    @FindBy(xpath = "(//span[text()='列数']/preceding-sibling::input)[last()]")
    private WebElement columnNum;

    @FindBy(xpath = "//span[text()='展示字号']/ancestor::div/following-sibling::input")
    private WebElement fontSize;

    @FindBy(xpath = "(//span[text()='字段值'])[last()]/ancestor::div/following-sibling::div[1]")
    private WebElement fieldValue;

    //@FindBy(xpath = "(//span[text()='类型'][last()])/ancestor::div/following-sibling::div[1]")
    //@FindBy(className = "_60Zb-B7E6TtmTcIJHF1wy ant-select ant-select-enabled")
    @FindBy(xpath = "(//span[text()='类型'])[last()]/ancestor::div/following-sibling::div[1]")
    private WebElement typeChartField;

    @FindBy(xpath = "(//span[text()='数值字段'][last()])/ancestor::div/following-sibling::div[1]")
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

    @FindBy(xpath = "(//span[text()='字段信息'])[last()]/ancestor::div/following-sibling::div[1]")
    private WebElement infoField;

    @FindBy(xpath = "(//span[text()='标签位置'])[last()]/ancestor::div/following-sibling::div")
    private WebElement labelLocation;

    @FindBy(xpath = "(//span[text()='数据精度'][last()])/ancestor::div/following-sibling::div[1]")
    private WebElement precision;

    @FindBy(xpath = "(//label[text()='资源标签'][last()])/following-sibling::div[1]")
    private WebElement groupField;

    @FindBy(xpath = "(//label[text()='所属应用'][last()])/following-sibling::div[1]")
    private WebElement appField;
//---------------------------------
//Colors --------------------------



//---------------------------------
//Switches ------------------------




    @FindBy(xpath = "//span[text()='统一度量']/ancestor::div/following-sibling::button")
    private WebElement unifyMetric;

    @FindBy(xpath = "//span[text()='多级']/ancestor::div/following-sibling::button")
    private WebElement multistage;

    @FindBy(xpath = "//span[text()='使用千分隔符']/ancestor::div/following-sibling::button")
    private WebElement thousandSeparator;

//---------------------------------
//Buttons -------------------------

    @FindBy(xpath = "//span[text()='生 成']/ancestor::button")
    private WebElement generate;

    @FindBy(xpath = "(//div[contains(@class, 'eDaDRJKwUEJDr6wgG_VbL')])[last()]")
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
    @FindBy (xpath = "//span[text()='标签']/ancestor::div/following-sibling::div/label[1]")
    private WebElement firstLabel;

    @FindBy (xpath = "//span[text()='标签']/ancestor::div/following-sibling::div/label[2]")
    private WebElement secondLabel;

    @FindBy (xpath = "//span[text()='标签']/ancestor::div/following-sibling::div/label[3]")
    private WebElement thirdLabel;

    @FindBy (xpath = "//span[text()='标签']/ancestor::div/following-sibling::div/label[4]")
    private WebElement forthLabel;

//Orders



//---------------------------------
// text - button ------------------


//---------------------------------

//check-box ------------------------

    @FindBy(xpath = "(//div[text()='中国'])/ancestor::span")
    private WebElement selectChina;

    @FindBy(xpath = "(//div[text()='江苏'])/ancestor::span")
    private WebElement selectJiangsu;

    @FindBy(xpath = "(//div[text()='世界'])/ancestor::span")
    private WebElement selectWorld;
//----------------------------------

// Drag and drop -------------------------

    @FindBy(className = "_1pGh3cs00Rp1iccZrcDgHU")
    private WebElement listOfFields;

    @FindBy(className = "_1L7hbwdzCpZJFzkuvvcudu")
    private WebElement checkBox;

//--------------------------------------------
//Table Pencil ---------------------------------------

    @FindBy(xpath = "//th[last()]/i")
    private WebElement pencil;

    @FindBy(xpath = "//div[text()='表格颜色设置']/ancestor::div[2]")
    private WebElement colorPanel;

    @FindBy(xpath = "//label[text()='color']/following-sibling::div")
    private WebElement colorType;

    @FindBy(xpath = "//div[text()='Select']/following-sibling::div")
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

    @FindBy(xpath="(//span[@class='css-j4ndc3'])[last()]/ancestor::div[1]")
    private WebElement changeColor;

    @FindBy(xpath="(//div[text()='Hex'])[last()]/preceding-sibling::input")
    private WebElement colorCode;

    @FindBy(xpath = "//input[@value='min']/ancestor::label/following-sibling::i")
    private WebElement deleteFirstInterval;

    @FindBy(xpath = "//input[@value='min']/ancestor::div/following-sibling::div[1]/i")
    private WebElement deleteSecondInterval;

    @FindBy(xpath = "//input[@value='max']//ancestor::div/preceding-sibling::div[1]/i")
    private WebElement deleteLastInterval;



    @FindBy(xpath = "//span[text()='自 动']/ancestor::button")
    private WebElement autoColor;

    @FindBy(xpath = "//span[text()='自定义']/ancestor::button")
    private WebElement customColor;

    @FindBy(xpath = "//span[contains(text(),'添加值颜色')]/ancestor::button")
    private WebElement addValue;

    @FindBy(xpath = "(//span[text()='值']/following-sibling::input)[last()]")
    private WebElement inputValue;

    @FindBy(xpath = "(//span[text()='值']/following-sibling::i)[last()]")
    private WebElement deleteLastValue;


//----------------------------------------------------
// other ----------------------------
    @FindBy(xpath = "//span[@class='ant-select-arrow']")
    private WebElement dropbutton;

    @FindBy(className = "CodeMirror-code")
    private WebElement searchInput;

    @FindBy(xpath = "//input[@placeholder='请选择快捷时间或时间范围']")
    private WebElement dateEditor;

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

    @FindBy(xpath = "//input[@value='right']")
    private WebElement right;

    @FindBy(xpath = "//input[@value='vertical']")
    private WebElement vertical;

    @FindBy(className = "el-message-box__message")
    private WebElement message;

//    @FindBy(xpath = "//i[@class='iconfont icon-chenggong1']/following-sibling::span")
    @FindBy(className = "_1JjlGgMGUnJmBrqR_9PZl8")
    private WebElement successMessage;

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

    @FindBy(xpath = "(//div[contains(text(),'对比')])[last()]")
    private WebElement compare;

    @FindBy(xpath = "(//span[text()='平滑'])[last()]/ancestor::div/following-sibling::button")
    private WebElement smooth;

    @FindBy(xpath = "(//span[text()='连接空数据'])[last()]/ancestor::div/following-sibling::button")
    private WebElement connectEmptyData;

    @FindBy(xpath = "(//span[text()='显示所有X轴标签'])[last()]/ancestor::div/following-sibling::button")
    private WebElement showAllLabels;

    @FindBy(xpath = "(//span[text()='min']/preceding-sibling::input)[last()]")
    private WebElement min;

    @FindBy(xpath = "(//span[text()='max']/preceding-sibling::input)[last()]")
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

    @FindBy(xpath = "(//div[contains(text(),'维度')])[last()]")
    private WebElement dimension;

    @FindBy(xpath = "(//div[contains(text(),'关系')])[last()]")
    private WebElement relation;

    @FindBy(xpath = "(//div[contains(text(),'复合')])[last()]")
    private WebElement compound;

    @FindBy(xpath = "(//div[contains(text(),'序列')])[last()]")
    private WebElement order;

    @FindBy(xpath = "(//div[text()='地图'])[last()]")
    private WebElement map;

    @FindBy(xpath = "(//div[contains(text(),'其他')])[last()]")
    private WebElement other;

    @FindBy(xpath = "(//div[contains(text(),'饼状图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement pie;

    @FindBy(xpath = "(//div[contains(text(),'玫瑰图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement rose;

    @FindBy(xpath = "(//div[contains(text(),'条形图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement bar;

    @FindBy(xpath = "(//div[@class='img sunburst'])[last()]")
    private WebElement sunburst;

    @FindBy(className = "tracing")
    private WebElement tracing;

    @FindBy(xpath = "(//div[contains(text(),'切分')])[last()]")
    private WebElement divide;

    @FindBy(xpath = "(//div[contains(text(),'分面')])[last()]")
    private WebElement divideSide;

    @FindBy(xpath = "(//p[text()='+ 添加'])[last()]")
    private WebElement addField;

    @FindBy(xpath = "(//div[@class='el-select yw-search-setting-select'])[last()]")
    private WebElement secondSettingSelect;

    @FindBy(xpath = "(//div[contains(text(),'和弦图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement chord;

    @FindBy(xpath = "(//div[contains(text(),'桑基图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement sankey;

    @FindBy(xpath = "(//div[contains(text(),'力图')]/ancestor::div[1])/preceding-sibling::div")
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

    @FindBy(xpath = "(//div[contains(text(),'区间图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement rangeline;

    @FindBy(xpath = "(//div[contains(text(),'多y轴图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement multiaxis;

    @FindBy(xpath = "//span[text()='预测值']/ancestor::div/following-sibling::div")
    private WebElement predict;

    @FindBy(xpath = "//span[text()='实际值']/ancestor::div/following-sibling::div")
    private WebElement actual;

    @FindBy(xpath = "(//span[text()='上限'])[last()]/ancestor::div/following-sibling::div[1]")
    private WebElement topLimit;

    @FindBy(xpath = "(//span[text()='下限'])[last()]/ancestor::div/following-sibling::div[1]")
    private WebElement lowerLimit;

    @FindBy(xpath = "(//div[contains(text(),'热力地图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement heatmap;

    @FindBy(xpath = "(//div[contains(text(),'攻击地图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement attackmap;

    @FindBy(xpath = "(//div[contains(text(),'区划地图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement regionmap;

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

    @FindBy(xpath = "(//div[text()='图标'])[last()]")
    private WebElement icon;

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

    @FindBy(xpath = "(//div[text()='指示器'])[last()]")
    private WebElement indicator;

    @FindBy(xpath = "(//i[@class='el-input__icon el-icon-arrow-up'])[2]")
    private WebElement pagination;

    @FindBy(xpath = "(//ul[@class='el-scrollbar__view el-select-dropdown__list'])[last()]")
    private WebElement pagingSelect;

    @FindBy(xpath = "//label[text()='报表']")
    private WebElement report;

    @FindBy(xpath = "//span[text()='堆叠']/ancestor::div/following-sibling::button")
    private WebElement pile;

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

    @FindBy(xpath = "(//div[text()='降序'])[last()]")
    private WebElement descendingOrder;

    @FindBy(xpath = "(//div[text()='升序'])[last()]")
    private WebElement ascending;

    @FindBy(xpath = "(//span[contains(@style,'background-color: rgb(161, 20, 249);')])[last()] | (//span[contains(@style,'background-color: rgb(156, 39, 176);')])[last()]")
    private WebElement purple;

    @FindBy(xpath = "(//span[contains(@style,'background-color: rgb(248, 0, 80);')])[last()] | (//span[contains(@style,'background-color: rgb(229, 28, 35);')])[last()]")
    private WebElement red;

    @FindBy(xpath = "(//span[contains(@style,'background-color: rgb(251, 173, 8);')])[last()] | (//span[contains(@style,'background-color: rgb(255, 152, 0);')])[last()]")
    private WebElement orange;

    @FindBy(xpath = "(//span[contains(@style,'background-color: rgb(50, 194, 125);')])[last()] | (//span[contains(@style,'background-color: rgb(37, 155, 36);')])[last()]")
    private WebElement green;

    @FindBy(xpath = "(//span[contains(@style,'background-color: rgb(179, 198, 92);')])[last()] | (//span[contains(@style,'background-color: rgb(179, 198, 92);')])[last()]")
    private WebElement lightGreen;

    @FindBy(xpath = "(//span[contains(@style,'background-color: rgb(251, 227, 16);')])[last()] | (//span[contains(@style,'background-color: rgb(255, 235, 59);')])[last()] ")
    private WebElement yellow;

    @FindBy(xpath = "(//span[contains(@style,'background-color: rgb(72, 87, 175);')])[last()] | (//span[contains(@style,'background-color: rgb(63, 81, 181);')])[last()]")
    private WebElement darkBlue;

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

    @FindBy(xpath = "(//span[text()='省级下钻字段'][last()])/ancestor::div/following-sibling::div[1]")
    private WebElement province;

    @FindBy(xpath = "(//span[text()='市级下钻字段'][last()])/ancestor::div/following-sibling::div[1]")
    private WebElement city;

    @FindBy(className = "el-radio-group")
    private WebElement radioGroup;

    @FindBy(className = "range-color-group-add")
    private WebElement addColour;

    @FindBy(xpath = "(//input[@placeholder='min'])[last()]")
    private WebElement minRange;

    @FindBy(xpath = "(//input[@placeholder='max'])[last()]")
    private WebElement maxRange;

    @FindBy(xpath = "//span[text()='分段数']/ancestor::div/following-sibling::input")
    private WebElement segments;

    @FindBy(className = "chart-setting-popover")
    private WebElement settingPopover;

    @FindBy(xpath = "(//span[text()='父id'][last()])/ancestor::div/following-sibling::div[1]")
    private WebElement parentId;

    @FindBy(xpath = "(//span[text()='子id'])[last()]/ancestor::div/following-sibling::div[1]")
    private WebElement childId;

    @FindBy(xpath = "(//span[text()='持续时间'])[last()]/ancestor::div/following-sibling::div[1]")
    private WebElement keepTime;

    @FindBy(xpath = "(//div[text()='时间'])[last()]")
    private WebElement time;

    @FindBy(xpath = "(//div[text()='信息'])[last()]")
    private WebElement info;

    @FindBy(xpath = "(//span[contains(text(),'透明度')])[last()]/ancestor::div/following-sibling::input")
    private WebElement transparency;

    @FindBy(xpath = "(//span[contains(text(),'最小半径')])[last()]/ancestor::div/following-sibling::input")
    private WebElement minRadius;

    @FindBy(xpath = "(//span[contains(text(),'最大半径')])[last()]/ancestor::div/following-sibling::input")
    private WebElement maxRadius;

    @FindBy(xpath = "(//div[@class='img iconfont icon-shanchuxuanting_icon'])[last()]")
    private WebElement delete;

    @FindBy(xpath = "//div[contains(text(),'添加颜色区间')]")
    private WebElement addRange;

    @FindBy(className = "el-switch__label--right")
    private WebElement switchLabel;

    @FindBy(xpath = "(//span[text()='标签展示'])[last()]/ancestor::div/following-sibling::div")
    private WebElement showLabel;

    @FindBy(xpath = "(//*[@class='el-scrollbar'])[last()]")
    private WebElement scrollbar;

    @FindBy(xpath = "//span[text()='斥力因子']/ancestor::div/following-sibling::input")
    private WebElement repulsion;

    @FindBy(className = "yw-trend")
    private WebElement canvas;

    @FindBy(xpath = "//*[local-name()='g' and @class='vx-group']/ancestor::div[1]")
    private WebElement chart;

    @FindBy(id = "timestamp")
    private WebElement dragText;

    @FindBy(id = "xField")
    private WebElement xField;

    @FindBy(id = "yFields")
    private WebElement yField;

    @FindBy(className = "yw-chart-config")
    private WebElement container;

    @FindBy(id = "yw-search-fields-header")
    private WebElement tableHeader;

    @FindBy(xpath = "//span[text()='新建成功！']")
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

    public WebElement getStatisticalChart() {
        return statisticalChart;
    }
    @FindBy(xpath = "(//div[@class='ant-popover-inner-content'])[2]")
    private WebElement settingContent;

    @FindBy(xpath = "//span[text()='统一度量']/ancestor::div/following-sibling::button")
    private WebElement unifiedMetric;

    @FindBy(xpath = "//span[text()='展示字段']/ancestor::div/following-sibling::div//i")
    private WebElement displayField;

    @FindBy(xpath = "//input[@placeholder='展示字号']")
    private WebElement wordSize;

    public WebElement getStatisticalmap() {
        return statisticalmap;
    }


    @FindBy(xpath = "//span[text()='数据精度']/ancestor::div/following-sibling::div")
    private WebElement dataPrecision;

    public WebElement getRing() {
        return ring;
    }

    @FindBy(xpath = "(//span[text()='单位'])[last()]/ancestor::div/following-sibling::input")
    private WebElement unit;

    @FindBy(xpath = "//span[text()='行数']/preceding-sibling::input")
    private WebElement layoutRow;

    @FindBy(xpath = "//span[text()='列数']/preceding-sibling::input")
    private WebElement layoutColumn;

    @FindBy(xpath = "//input[@placeholder='max']/following-sibling::div")
    private WebElement rangeColor;



    public WebElement getType() {
        return type;
    }

    public WebElement getConnection() {
        return connection;
    }

    public WebElement getLineChart() {
        return lineChart;
    }

    public WebElement getAreaChart() {
        return areaChart;
    }

    public WebElement getColumnChart() {
        return columnChart;
    }

    public WebElement getScatterChart() {
        return scatterChart;
    }

    public WebElement getSun() {
        return sun;
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

    public WebElement getChain() {
        return chain;
    }

    public WebElement getDivideSide() {
        return divideSide;
    }

//------------------------------------------------------------------


    public WebElement getFirstLabel() {
        return firstLabel;
    }

    public WebElement getSecondLabel() {
        return secondLabel;
    }

    public WebElement getCompare() {
        return compare;
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
    public WebElement getWordSize() {
        return wordSize;
    }

    public WebElement getDisplayField() {
        displayField.click();
        return super.getLastDropdownList();
    }

    public WebElement getUnifiedMetric() {
        return unifiedMetric;
    }

    public WebElement getSettingContent() {
        return settingContent;
    }

    public WebElement getDataValue() {
        dataValue.click();
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

    public WebElement getUnifyMetric() {
        return unifyMetric;
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

    public WebElement getXField() {
        return xField;
    }

    public WebElement getYField() {
        return yField;
    }

    public WebElement getDragText() {
        return dragText;
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

    public WebElement getRepulsion() {
        return repulsion;
    }

    public WebElement getRowNum() {
        return rowNum;
    }

    public WebElement getColumnNum(){
        return columnNum;
    }

    public WebElement getFontSize() {
        return fontSize;
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

    public WebElement getOrder() {
        return order;
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

    public WebElement getTransparency() {
        return transparency;
    }

    public WebElement getMinRadius() {
        return minRadius;
    }

    public WebElement getMaxRadius() {
        return maxRadius;
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

//    public WebElement getLongitudeInput() {
//        return longitudeInput;
//    }

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

//    public WebElement getLongitude() {
//        longitude.click();
//        return super.getLastDropdownList();
//    }
//
    public WebElement getLatitude() {
        latitude.click();
        return super.getLastDropdownList();
    }

    public WebElement getRegion() {
        return region;
    }

    public WebElement getGeneral() {
        return general;
    }

//    public WebElement getWorld() {
//        return world;
//    }


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

    public WebElement getPile() {
        return pile;
    }

    public WebElement getMultistage() {
        return multistage;
    }

    public WebElement getThousandSeparator() {return thousandSeparator; }

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
        return getContainsTextButton("确定");
    }

    public WebElement getCreateEnsureButton() {
        return getContainsTextButton("确 定");
    }

    public WebElement getGenerate() {
        return generate;
    }

    public WebElement getNameInput() {
        return getInputElement("名称");
    }

    public WebElement getDescribeInput() {
        return getInputElement("描述");
    }

    public WebElement getGroupDropdown() {
        return getDropdownList("分组");
    }

    public WebElement getNextButton() {
        return getButton("下一步");
    }

    public WebElement getFinishButton() {
        return getButton("完成");
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

    public WebElement getSuccessMessage() {
        return successMessage;
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
//        ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='none';", chartTypePopover);
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

    public WebElement getShowAllLabels() {
        return showAllLabels;
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

    public WebElement getValue() {
        return value;
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

    public WebElement getHeatmap() {
        return heatmap;
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

    public WebElement getTable() {
        return table;
    }

    public WebElement getSingle() {
        return getChartButton("单值");
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

    public WebElement getAnnular() {
        return getChartButton("环形比例图");
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

    public WebElement getTimeSequence() {
        return timeSequence;
    }


    public WebElement getFacet() {
        return facet;
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[text()='" + name + "']/following-sibling::input"));
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

    private WebElement getChartButton(String chartName) {
        String xpath = "((//div[text()='" + chartName + "'])[last()]/ancestor::div/preceding-sibling::div)[last()]";
        return webDriver.findElement(By.xpath(xpath));
    }

    //author-jnd
    //数据集的展开按钮
    @FindBy(xpath = "//a[text()='展开']")
    private WebElement zhanKai;

    public WebElement getZhanKai() {
        return zhanKai;
    }

    //数据集的显示位置
    @FindBy(xpath = "//div[@class='_10GY9a1TR9fkHwR6NvTQN7']/span")
    private WebElement dataSetPosition;

    public WebElement getDataSetPosition() {
        return dataSetPosition;
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
//-----------------------------------------------------


}
