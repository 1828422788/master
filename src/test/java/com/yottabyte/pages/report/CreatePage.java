package com.yottabyte.pages.report;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.GetTime;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.List;


public class CreatePage extends PageTemplate {

    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "_1JjlGgMGUnJmBrqR_9PZl8")
    private WebElement successMessage;

    @FindBy(className = "_1JjlGgMGUnJmBrqR_9PZl8")
    private WebElement message;

    @FindBy(xpath = "//div[@class = 'ant-message-custom-content ant-message-warning']/span")
    private WebElement errorMessage;


    // 下拉列表
    @FindBy(className = "el-select-dropdown__list")
    private List<WebElement> dropdownLists;

    @FindBy(xpath = "//label[text()='名称']/following-sibling::input")
    private WebElement name;

    @FindBy(xpath = "//label[text()='描述']/following-sibling::input")
    private WebElement describe;

    @FindBy(xpath = "//label[text()='运行用户']/following-sibling::div//input")
    private WebElement runningUser;

    @FindBy(xpath = "//label[text()='报表分组']/following-sibling::div//input[@class='el-input__inner']")
    private WebElement reportGroup;

//    @FindBy(xpath = "//label[text()='报表类型']/following-sibling::div")
//    private WebElement reportTypeButton;

    @FindBy(xpath = "//label[text()='报表类型']/following-sibling::div/div")
    private WebElement reportType;

    @FindBy(xpath = "//li[@class='ant-dropdown-menu-item'][1]")
    private WebElement li;

    @FindBy(className = "ant-collapse-header")
    private WebElement topoTitle;

    @FindBy(xpath = "//label[text()='接收邮箱']/following-sibling::div/div")
    private WebElement emailInput;

    @FindBy(xpath = "//label[text()='接收邮箱']/following-sibling::div//input")
    private WebElement emailField;

    public WebElement getEmailField(){
        emailInput.click();
        return emailField;
    }

    @FindBy(xpath = "(//div[@class='el-scrollbar'])[last()]")
    private WebElement scrollbar;

    @FindBy(xpath = "//label[text()='邮件主题']/following-sibling::input")
    private WebElement subject;

    @FindBy(xpath = "//label[text()='邮件主题']/following-sibling::span")
    private WebElement subjectNote;

    @FindBy(xpath = "//span[text()='趋势图列表']/following-sibling::div/button")
    private WebElement chartList;

    @FindBy(className = "ant-dropdown-menu")
//    @FindBy(xpath = "//li[@class='ant-dropdown-menu-item']/ancestor::ul")
    private WebElement chartDropdownList;

    @FindBy(xpath = "//span[text()='crontab']")
    private WebElement crontabButton;

    @FindBy(xpath = "//span[text()='crontab']/ancestor::span/following-sibling::div//input")
    private WebElement crontab;

    @FindBy(xpath = "//span[text()='解 析']/ancestor::button")
    private WebElement parse;

    @FindBy(xpath = "//div[text()='最近十次执行时间']/ancestor::div[1]/following-sibling::div/p[1]")
    private WebElement parseResult;

    // 下一步
    @FindBy(xpath = "//span[text()='下一步']/ancestor::button")
    private WebElement nextButton;

    @FindBy(xpath = "//span[text()='上一步']/ancestor::button")
    private WebElement backButton;

    @FindBy(xpath = "//span[text()='完成']/ancestor::button")
    private WebElement finishButton;

    @FindBy(xpath = "//span[text()='确定']/ancestor::button")
    private WebElement EnsureButton;

    @FindBy(xpath = "//span[text()='定时']/ancestor::span/following-sibling::div/div[1]")
    private WebElement period;

    @FindBy(xpath = "//span[text()='定时']/ancestor::span/following-sibling::div/div[2]")
    private WebElement day;

    @FindBy(xpath = "//input[@placeholder='分']")
    private WebElement minute;

    @FindBy(xpath = "//input[@placeholder='时']")
    private WebElement hour;

    @FindBy(xpath = "(//span[text()='布局设计']/ancestor::div/following-sibling::div/div)[1]")
    private WebElement layout1;

    @FindBy(xpath = "(//span[text()='布局设计']/ancestor::div/following-sibling::div/div)[2]")
    private WebElement layout2;

    @FindBy(xpath = "(//span[text()='布局设计']/ancestor::div/following-sibling::div/div)[3]")
    private WebElement layout3;

    @FindBy(xpath = "(//span[text()='布局设计']/ancestor::div/following-sibling::div/div)[4]")
    private WebElement layout4;

    @FindBy(xpath = "(//span[text()='布局设计']/ancestor::div/following-sibling::div/div)[5]")
    private WebElement layout5;

    @FindBy(xpath = "(//span[text()='布局设计']/ancestor::div/following-sibling::div/div)[6]")
    private WebElement layout6;

    @FindBy(xpath = "(//span[text()='布局设计']/ancestor::div/following-sibling::div/div)[7]")
    private WebElement layout7;

    @FindBy(xpath = "(//span[text()='布局设计']/ancestor::div/following-sibling::div/div)[8]")
    private WebElement layout8;

    @FindBy(xpath = "(//i[@class='el-collapse-item__header__arrow el-icon-arrow-right'])[last()]")
    private WebElement arrow;

    @FindBy(xpath = "(//label[text()='参数设置'])[last()]")
    private WebElement parameterSetting;

    @FindBy(xpath = "(//button[@class='el-button btn-submit el-button--primary'])[last()]")
    private WebElement saveTrend;

    @FindBy(xpath = "(//div[@class='popover-setting-content'])[last()]")
    private WebElement settingContent;

    @FindBy(xpath = "((//span[text()='编辑']/ancestor::button)[last()]) | (//label[@name='operate_edit']/*)")
    private WebElement editButton;

    @FindBy(className = "ant-collapse-header")
    private WebElement trendTitle;

    @FindBy(xpath = "(//label[contains(text(),'图表类型')]/following-sibling::span//i)[last()]")
    private WebElement chartType;

    @FindBy(xpath = "//li[@class='el-dropdown-menu__item']")
    private WebElement firstLi;

    @FindBy(xpath = "//span[text()='布局设计']/ancestor::div/following-sibling::div//span[text()='1']")
    private WebElement badge1;

    @FindBy(xpath = "//span[text()='布局设计']/ancestor::div/following-sibling::div//span[text()='2']")
    private WebElement badge2;

    @FindBy(xpath = "//span[text()='布局设计']/ancestor::div/following-sibling::div//span[text()='3']")
    private WebElement badge3;

    @FindBy(xpath = "//span[text()='布局设计']/ancestor::div/following-sibling::div//span[text()='4']")
    private WebElement badge4;

    @FindBy(xpath = "//label[text()='所属应用']/following-sibling::div/div")
    private WebElement app;

    @FindBy(xpath = "//label[text()='资源标签']/following-sibling::span/div")
    private WebElement tag;

    @FindBy(className = "ant-select-selection__choice__content")
    private WebElement chosenTag;

    @FindBy(xpath = "//label[text()='运行用户']/following-sibling::div//div[@class='ant-select-selection-selected-value']")
    private WebElement selectedUser;

    @FindBy(xpath = "(//div[@class='ant-collapse-header']/div/span[2])[last()]")
    private WebElement chosenTrendLast;

    @FindBy(xpath = "//div[@class='ant-collapse-header']/div/span[2]")
    private WebElement chosenTrendFirst;

    @FindBy(xpath = "(//div[@class='ant-collapse-header']/div/span[2])[last()]/following-sibling::span/i[1]")
    private WebElement lastTrendDelete;

    @FindBy(xpath = "//div[@class='ant-collapse-header']/div/span[2]/following-sibling::span/i[1]")
    private WebElement firstTrendDelete;

    @FindBy(xpath = "(//div[@class='ant-collapse-header']/div/span[2])[last()]/following-sibling::span/i[5]")
    private WebElement lastTrendUpTop;

    @FindBy(xpath = "//div[@class='ant-collapse-header']/div/span[2]/following-sibling::span/i[4]")
    private WebElement firstTrendDownBottom;

    @FindBy(xpath = "(//div[@class='ant-collapse-header']/div/span[2])[last()]/following-sibling::span/i[2]")
    private WebElement lastTrendUp;

    @FindBy(xpath = "//div[@class='ant-collapse-header']/div/span[2]/following-sibling::span/i[3]")
    private WebElement firstTrendDown;

    @FindBy(xpath = "//span[text()='描述']/ancestor::p")
    private WebElement trendDescription;

    @FindBy(xpath = "//span[text()='搜索内容']/ancestor::p")
    private WebElement trendSpl;

    @FindBy(xpath = "//span[text()='数据集']/ancestor::p")
    private WebElement trendData;

    @FindBy(xpath = "//span[text()='统计类型']/ancestor::p")
    private WebElement trendChart;

    @FindBy(xpath = "//span[text()='名称']/following-sibling::span/input")
    private WebElement trendNameField;

    @FindBy(xpath = "//span[text()='描述']/following-sibling::span/input")
    private WebElement trendDescribeField;

    @FindBy(xpath = "//span[text()='搜索内容']/following-sibling::span/textarea")
    private WebElement trendSplField;

    @FindBy(xpath = "//span[text()='统计类型']/following-sibling::span/button")
    private WebElement trendChartType;


    @FindBy(xpath = "//span[text()='取消']/ancestor::button")
    private WebElement cancelButton;

    @FindBy(xpath="//label[text()='所属应用']/following-sibling::div/div")
    private WebElement appField;

    @FindBy(xpath="//label[text()='资源标签']/following-sibling::div/div")
    private WebElement tagField;

    // Types ------------------

    @FindBy(xpath = "//div[contains(text(),'序列')]")
    private WebElement order;

    @FindBy(xpath = "//div[contains(text(),'维度')]")
    private WebElement dimension;

    @FindBy(xpath = "//div[contains(text(),'关系')]")
    private WebElement connection;

    @FindBy(xpath = "//div[contains(text(),'复合')]")
    private WebElement compound;

    @FindBy(xpath = "//div[contains(text(),'地图')]")
    private WebElement map;

    @FindBy(xpath = "//div[contains(text(),'其他')]")
    private WebElement other;

//----------------------------------

    // 序列-------------------------------
    @FindBy(xpath = "(//div[contains(text(),'曲线图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement lineChart;

    @FindBy(xpath = "(//div[contains(text(),'面积图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement areaChart;

    @FindBy(xpath = "(//div[contains(text(),'柱状图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement columnChart;

    @FindBy(xpath = "(//div[contains(text(),'散点图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement scatterChart;

    //维度---------------------------------
    @FindBy(xpath = "(//div[contains(text(),'玫瑰图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement rose;

    @FindBy(xpath = "(//div[contains(text(),'饼状图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement pie;

    @FindBy(xpath = "(//div[contains(text(),'条形图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement bar;

    @FindBy(xpath = "(//div[contains(text(),'旭日图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement sun;

    //关系--------------------------------
    @FindBy(xpath = "(//div[contains(text(),'和弦图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement chord;

    @FindBy(xpath = "(//div[contains(text(),'桑基图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement sankey;

    @FindBy(xpath = "(//div[contains(text(),'力图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement force;

    //复合---------------------------------
    @FindBy(xpath = "(//div[contains(text(),'多y轴图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement multiaxis;

    @FindBy(xpath = "(//div[contains(text(),'区间图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement rangeline;

    //地图--------------------------------
    @FindBy(xpath = "(//div[contains(text(),'热力地图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement heatmap;

    @FindBy(xpath = "(//div[contains(text(),'攻击地图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement attackmap;

    @FindBy(xpath = "(//div[contains(text(),'区划地图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement regionmap;

    @FindBy(xpath = "(//div[contains(text(),'统计地图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement statisticalmap;

    //其他 -------------
    @FindBy(xpath = "(//div[contains(text(),'统计表')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement table;

    @FindBy(xpath = "(//div[contains(text(),'单值')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement single;

    @FindBy(xpath = "(//div[contains(text(),'环形比例图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement ring;

    @FindBy(xpath = "(//div[contains(text(),'水球图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement liquidfill;

    @FindBy(xpath = "(//div[contains(text(),'字符云图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement wordcloud;

    @FindBy(xpath = "(//div[contains(text(),'循序图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement sequence;

    @FindBy(xpath = "(//div[contains(text(),'雷达图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement radar;

    @FindBy(xpath = "(//div[contains(text(),'漏斗图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement funnel;

    @FindBy(xpath = "(//div[contains(text(),'矩阵热力图')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement matrixheatmap;

    @FindBy(xpath = "(//div[contains(text(),'调用链')]/ancestor::div[1])/preceding-sibling::div")
    private WebElement chain;

//----------------------------------------

    //Tabs -------------------------------------

    @FindBy(xpath = "(//div[contains(text(),'Y轴')])[last()]")
    private WebElement yaxis;

    @FindBy(xpath = "(//div[contains(text(),'Y轴 2')])[last()]")
    private WebElement yaxis2;

    @FindBy(xpath = "(//div[contains(text(),'Y轴 3')])[last()]")
    private WebElement yaxis3;

    @FindBy(xpath = "(//div[contains(text(),'X轴')])[last()]")
    private WebElement xaxis;

    @FindBy(xpath = "(//div[contains(text(),'分组')])[last()]")
    private WebElement group;

    @FindBy(xpath = "(//div[contains(text(),'展示')])[last()]")
    private WebElement exhibition;

    @FindBy(xpath = "(//div[contains(text(),'数值')])[last()]")
    private WebElement value;

    @FindBy(xpath = "(//div[contains(text(),'切分')])[last()]")
    private WebElement divide;

    @FindBy(xpath = "(//div[text()='常规'])[last()]")
    private WebElement general;

    @FindBy(xpath = "(//div[contains(text(),'气泡')])[last()]")
    private WebElement bubble;

    @FindBy(xpath = "(//div[text()='时间'])[last()]")
    private WebElement time;

    @FindBy(xpath = "(//div[text()='信息'])[last()]")
    private WebElement info;

    @FindBy(xpath = "(//div[text()='图例'])[last()]")
    private WebElement example;

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

    @FindBy(xpath = "(//div[text()='图标'])[last()]")
    private WebElement icon;

    @FindBy(xpath = "(//div[text()='指示器'])[last()]")
    private WebElement indicator;

    @FindBy(xpath = "(//div[text()='时序'])[last()]")
    private WebElement timeSequence;

    @FindBy(xpath = "(//div[text()='对比'])[last()]")
    private WebElement compare;

    @FindBy(xpath = "(//div[text()=' 分面'])[last()]")
    private WebElement facet;

//-----------------------------------------------
//Inputs ----------------------------------------

    @FindBy(xpath = "(//span[contains(text(),'单位')]/ancestor::div[1]/following-sibling::input)[last()]")
    private WebElement unit;

    @FindBy(xpath = "//span[text()='图标名称']/ancestor::div/following-sibling::div[1]//input")
    private WebElement iconName;

    @FindBy(xpath = "(//span[contains(text(),'透明度')])[last()]/ancestor::div/following-sibling::input")
    private WebElement transparency;

    @FindBy(xpath = "(//span[contains(text(),'最小半径')])[last()]/ancestor::div/following-sibling::input")
    private WebElement minRadius;

    @FindBy(xpath = "(//span[contains(text(),'最大半径')])[last()]/ancestor::div/following-sibling::input")
    private WebElement maxRadius;

    @FindBy(xpath = "//span[text()='分段数']/ancestor::div/following-sibling::input")
    private WebElement segments;

    @FindBy(xpath = "(//span[text()='min']/preceding-sibling::input)[last()]")
    private WebElement min;

    @FindBy(xpath = "(//span[text()='max']/preceding-sibling::input)[last()]")
    private WebElement max;

    @FindBy(xpath = "(//input[@placeholder='min'])[last()]")
    private WebElement minRange;

    @FindBy(xpath = "(//input[@placeholder='max'])[last()]")
    private WebElement maxRange;

    @FindBy(xpath = "//span[text()='斥力因子']/ancestor::div/following-sibling::input")
    private WebElement repulsion;

    @FindBy(xpath = "(//span[text()='行数']/preceding-sibling::input)[last()]")
    private WebElement rowNum;

    @FindBy(xpath = "(//span[text()='列数']/preceding-sibling::input)[last()]")
    private WebElement columnNum;

    @FindBy(xpath = "//span[text()='展示字号']/ancestor::div/following-sibling::input")
    private WebElement fontSize;

//------------------------------------------------
//Dropdown Fields---------------------------------

    @FindBy(xpath = "(//span[contains(text(),'字段值')])[last()]/ancestor::div/following-sibling::input")
    private WebElement fieldValue;

    @FindBy(xpath = "(//span[contains(text(),'类型')])[last()]/ancestor::div/following-sibling::div[1]")
    private WebElement typeChartField;

    @FindBy(xpath = "(//span[text()='数值字段'][last()])/ancestor::div/following-sibling::input")
    private WebElement numericField;

    @FindBy(xpath = "(//span[text()='经度'][last()])/ancestor::div/following-sibling::input")
    private WebElement fieldLongitude;

    @FindBy(xpath = "(//span[text()='纬度'][last()])/ancestor::div/following-sibling::input")
    private WebElement fieldLatitude;

    @FindBy(xpath = "(//span[text()='上限'])[last()]/ancestor::div/following-sibling::input[1]")
    private WebElement topLimit;

    @FindBy(xpath = "(//span[text()='下限'])[last()]/ancestor::div/following-sibling::input[1]")
    private WebElement lowerLimit;

    @FindBy(xpath = "(//span[text()='对比时间'][last()])/ancestor::div/following-sibling::div[1]")
    private WebElement contrastTime;

    @FindBy(xpath = "(//span[text()='省级下钻字段'][last()])/ancestor::div/following-sibling::input")
    private WebElement province;

    @FindBy(xpath = "(//span[text()='市级下钻字段'][last()])/ancestor::div/following-sibling::input")
    private WebElement city;

    @FindBy(xpath = "(//span[text()='函数'][last()])/ancestor::div/following-sibling::input")
    private WebElement function;

    @FindBy(xpath = "(//span[text()='父id'][last()])/ancestor::div/following-sibling::input")
    private WebElement parentId;

    @FindBy(xpath = "(//span[text()='子id'])[last()]/ancestor::div/following-sibling::input")
    private WebElement childId;

    @FindBy(xpath = "(//span[text()='开始时间'])[last()]/ancestor::div/following-sibling::input")
    private WebElement startTime;

    @FindBy(xpath = "(//span[text()='持续时间'])[last()]/ancestor::div/following-sibling::input")
    private WebElement keepTime;

    @FindBy(xpath = "(//span[text()='字段信息'])[last()]/ancestor::div/following-sibling::input")
    private WebElement infoField;

    @FindBy(xpath = "//span[text()='预测值']/ancestor::div/following-sibling::input[1]")
    private WebElement predict;

    @FindBy(xpath = "//span[text()='实际值']/ancestor::div/following-sibling::input[1]")
    private WebElement actual;

    @FindBy(xpath = "(//span[text()='标签展示'])[last()]/ancestor::div/following-sibling::div")
    private WebElement showLabel;

    @FindBy(xpath = "(//span[text()='标签位置'])[last()]/ancestor::div/following-sibling::div")
    private WebElement labelLocation;

    @FindBy(xpath = "(//span[text()='气泡大小'])[last()]/ancestor::div/following-sibling::input")
    private WebElement bubbleSize;

    @FindBy(xpath = "(//span[text()='数据精度'][last()])/ancestor::div/following-sibling::div[1]")
    private WebElement precision;

    @FindBy(xpath = "(//span[text()='展示字段'][last()])/ancestor::div/following-sibling::input")
    private WebElement displayField;

//---------------------------------
//Colors --------------------------

    @FindBy(xpath = "(//span[contains(@style,'background-color: rgb(161, 20, 249);')])[last()]")
    private WebElement purple;

    @FindBy(xpath = "(//span[contains(@style,'background-color: rgb(248, 0, 80);')])[last()]")
    private WebElement red;

    @FindBy(xpath = "(//span[contains(@style,'background-color: rgb(251, 173, 8);')])[last()]")
    private WebElement orange;

    @FindBy(xpath = "(//span[contains(@style,'background-color: rgb(50, 194, 125);')])[last()]")
    private WebElement green;

    @FindBy(xpath = "(//span[contains(@style,'background-color: rgb(179, 198, 92);')])[last()]")
    private WebElement lightGreen;

    @FindBy(xpath = "(//span[contains(@style,'background-color: rgb(251, 227, 16);')])[last()]")
    private WebElement yellow;

    @FindBy(xpath = "(//span[contains(@style,'background-color: rgb(72, 87, 175);')])[last()]")
    private WebElement darkBlue;

//---------------------------------
//Switches ------------------------

    @FindBy(xpath = "(//span[contains(text(),'平滑')])[last()]/ancestor::div/following-sibling::button")
    private WebElement smooth;

    @FindBy(xpath = "(//span[contains(text(),'连接空数据')])[last()]/ancestor::div/following-sibling::button")
    private WebElement connectEmptyData;

    @FindBy(xpath = "//span[text()='堆叠']/ancestor::div/following-sibling::button")
    private WebElement pile;

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

    @FindBy(xpath = "(//div[text()='按字段'])[last()]")
    private WebElement accordingField;

    @FindBy(xpath = "(//div[text()='按名称'])[last()]")
    private WebElement accordingName;

    @FindBy(xpath = "(//div[text()='按趋势'])[last()]")
    private WebElement accordingTrend;

    @FindBy(xpath = "//div[text()='按区间']")
    private WebElement accordingArea;

    @FindBy(xpath = "//span[text()='背景']")
    private WebElement background;

    @FindBy(xpath = "//span[text()='字体']")
    private WebElement font;

    @FindBy(xpath = "//span[text()='绝对值']")
    private WebElement absolute;

    @FindBy(xpath = "//span[text()='百分比']")
    private WebElement percent;

    @FindBy(xpath = "(//i[@class='anticon css-ifnfqv _2FmD69BXKIajYmOQLvFY29 _14T_hDxmrDu4vX6PHAQs1u'])[1]")
    private WebElement deleteFirst;

    @FindBy(xpath = "(//i[@class='anticon css-ifnfqv _2FmD69BXKIajYmOQLvFY29 _14T_hDxmrDu4vX6PHAQs1u'])[last()]")
    private WebElement deleteLast;

    @FindBy(xpath = "//span[text()='前面']")
    private WebElement unitPositionBefore;

    @FindBy(xpath = "//span[text()='后面']")
    private WebElement unitPositionAfter;

    // Legend Positions
    @FindBy(xpath = "(//div[text()='底部'])[last()]")
    private WebElement bottomPosition;

    @FindBy(xpath = "(//div[text()='柱状外右侧'])[last()]")
    private WebElement rightPosition;

    @FindBy(xpath = "(//div[text()='a...'])[last()]")
    private WebElement firstPosition;

    @FindBy(xpath = "(//div[text()='...z'])[last()]")
    private WebElement secondPosition;

    @FindBy(xpath = "(//div[text()='a..z'])[last()]")
    private WebElement thirdPosition;

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
    @FindBy(xpath = "(//div[text()='降序'])[last()]")
    private WebElement descendingOrder;

    @FindBy(xpath = "(//div[text()='升序'])[last()]")
    private WebElement ascendingOrder;


//---------------------------------
// text - button ------------------

    @FindBy(xpath = "(//p[text()='+ 添加'])[last()] | (//i[contains(@class,'anticon-plus')])")
    private WebElement addField;

    @FindBy(xpath = "(//p[text()='添加字段配置'])[last()]")
    private WebElement addConfigFields;

    @FindBy(xpath = "//div[contains(text(),'添加颜色区间')]")
    private WebElement addRange;

//---------------------------------

//check-box ------------------------

    @FindBy(xpath = "(//div[text()='中国'])/ancestor::span")
    private WebElement selectChina;

    @FindBy(xpath = "(//div[text()='江苏'])/ancestor::span")
    private WebElement selectJiangsu;

    @FindBy(xpath = "(//div[text()='世界'])/ancestor::span")
    private WebElement selectWorld;
//----------------------------------

    @FindBy(xpath = "//label[text()='报表类型']/following-sibling::div//div[@class='ant-select-selection-selected-value']")
    private WebElement defaultReportType;

    @FindBy(xpath = "//div[contains(@class,'ant-slider-handle')]")
    private WebElement sliderHandle;

    @FindBy(xpath = "//a[@aria-label='选择趋势图']/span")
    private WebElement chartListWord;

    @FindBy(xpath = "//input[@placeholder='选择趋势图']")
    private WebElement chartListInput;

    @FindBy(xpath = "//span[text()='定时']/ancestor::span/following-sibling::i//*[name()='use' and @*='#icon-beizhu_icon']")
    private WebElement executionTip;

    @FindBy(xpath = "//div[@class='t9XNaEf3Cqblwk37xjCVk']")
    private WebElement executionTipElement;

    public WebElement getExecutionTipElement() {
        return executionTipElement;
    }

    public WebElement getExecutionTip() {
        return executionTip;
    }

    public WebElement getChartListButtonWord() {
        return chartListWord;
    }

    public WebElement getChartListInput() {
        chartListWord.click();
        WebDriverWait wait = new WebDriverWait(webDriver,10);
        wait.until(ExpectedConditions.elementToBeClickable(chartListInput));
        return chartListInput;
    }

    public WebElement getSliderHandle() {
        return sliderHandle;
    }

    public WebElement getDefaultReportType() {
        return defaultReportType;
    }

    public WebElement getChosenTag() {
        return chosenTag;
    }

    public WebElement getSelectedUser() {
        return selectedUser;
    }

    public WebElement getChosenTrendLast(){
        return chosenTrendLast;
    }
    public WebElement getChosenTrendFirst(){
        return chosenTrendFirst;
    }
    public WebElement getLastTrendDelete() {
        return lastTrendDelete;
    }
    public WebElement getFirstTrendDelete() {
        return firstTrendDelete;
    }
    public WebElement getLastTrendUpTop() {
        return lastTrendUpTop;
    }
    public WebElement getFirstTrendDownBottom() {
        return firstTrendDownBottom;
    }
    public WebElement getLastTrendUp() {
        return lastTrendUp;
    }
    public WebElement getFirstTrendDown() {
        return firstTrendDown;
    }

    public WebElement getTrendDescription() {
        return trendDescription;
    }
    public WebElement getTrendSpl() {
        return trendSpl;
    }
    public WebElement getTrendData() {
        return trendData;
    }
    public WebElement getTrendChart() {
        return trendChart;
    }

    public WebElement getTrendNameField() {
        return trendNameField;
    }
    public WebElement getTrendDescribeField() {
        return trendDescribeField;
    }
    public WebElement getTrendSplField() {
        return trendSplField;
    }
    public WebElement getTrendChartType() {
        return trendChartType;
    }

    public WebElement getCancelButton() {
        return cancelButton;
    }

    public WebElement getApp() {
        app.click();
        return this.getLastDropdownList();
    }

    public WebElement getTag() {
        tag.click();
        return this.getLastDropdownList();
    }

    public WebElement getFirstLi() {
        return firstLi;
    }

    public WebElement getBadge1() {
        return badge1;
    }

    public WebElement getBadge2() {
        return badge2;
    }

    public WebElement getBadge3() {
        return badge3;
    }

    public WebElement getBadge4() {
        return badge4;
    }

    public WebElement getChartType() {
        return chartType;
    }

    public WebElement getTrendTitle() {
        return trendTitle;
    }

    public WebElement getSettingContent() {
        return settingContent;
    }

    public WebElement getSaveTrend() {
        return saveTrend;
    }

    public WebElement getParameterSetting() {
        return parameterSetting;
    }

    public WebElement getEditButton() {
        return editButton;
    }

    public WebElement getArrow() {
        return arrow;
    }

    public WebElement getScrollbar() {
        return scrollbar;
    }

    public WebElement getTopoTitle() {
        return topoTitle;
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getMessage() {
        return message;
    }

    public WebElement getErrorMessage() {
        return errorMessage;
    }

    public WebElement getDropdownList() {
        return dropdownLists.get(dropdownLists.size() - 1);
    }

    public WebElement getName() {
        return name;
    }

    public WebElement getDescribe() {
        return describe;
    }

    public WebElement getRunningUser() {
        runningUser.click();
        return this.getDropdownList();
    }

    public WebElement getReportGroup() {
        reportGroup.click();
        return this.getDropdownList();
    }

    public WebElement getReportType() {
        WebDriverWait wait = new WebDriverWait(webDriver,10);
        wait.until(ExpectedConditions.elementToBeClickable(reportType));
        reportType.click();
        return this.getLastDropdownList();
    }

    public WebElement getEmailInput() {
//        return emailInput;
        emailInput.click();
        return this.getLastDropdownList();
    }

    public WebElement getEmail() {
        return super.getButton("wang.yueming@yottabyte.cn");
    }

    public WebElement getEmail1() {
        return super.getButton("sun.xiaojing@yottabyte.cn");
    }

    public WebElement getSubject() {
        return subject;
    }

    public WebElement getSubjectNote() {
        return subjectNote;
    }

    public WebElement getPeriod() {
        period.click();
        return this.getLastDropdownList();
    }

    public WebElement getDay() {
        day.click();
        return this.getLastDropdownList();
    }

    public WebElement getHour() {
        return hour;
    }

    public WebElement getMinute() {
        return minute;
    }

    public WebElement getNextButton() {
        return nextButton;
    }

    public WebElement getBackButton() {
        return backButton;
    }

    public WebElement getFinishButton() {
        return finishButton;
    }

    public WebElement getEnsureButton() {
        return EnsureButton;
    }

//    public WebElement getChartList() throws InterruptedException {
//        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(chartList));
//        chartList.click();
//        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(li));
//        return chartDropdownList;
//    }

    public WebElement getChartListButton() {
        return chartList;
    }

    public WebElement getListOfCharts(){
        return chartList;
    }

    public WebElement getChartList() throws InterruptedException {
        chartList.click();
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(li));
        return chartDropdownList;
    }

    public WebElement getChartListDropdown(){
        chartList.click();
        return chartDropdownList;
    }

    public WebElement getChart() {
        return chartList;
    }

    public WebElement getLayout1() {
        return layout1;
    }

    public WebElement getSave() {
        return super.getButton("完成");
    }

    public WebElement getCrontab() {
        crontabButton.click();
        return crontab;
    }

    public WebElement getParse() {
        return parse;
    }

    public WebElement getParseResult() {
        return parseResult;
    }

    public WebElement getLayout2() {
        return layout2;
    }

    public WebElement getLayout3() {
        return layout3;
    }

    public WebElement getLayout4() {
        return layout4;
    }

    public WebElement getLayout5() {
        return layout5;
    }

    public WebElement getLayout6() {
        return layout6;
    }

    public WebElement getLayout7() {
        return layout7;
    }

    public WebElement getLayout8() {
        return layout8;
    }

    //--------------------------------------------------------------------

    public WebElement getOrder() {
        return order;
    }

    public WebElement getDimension() {
        return dimension;
    }

    public WebElement getConnection() {
        return connection;
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

//------------------------------------------------------------------


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



    public WebElement getPie() {
        return pie;
    }

    public WebElement getRose() {
        return rose;
    }

    public WebElement getBar() {
        return bar;
    }

    public WebElement getSun() {
        return sun;
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



    public WebElement getRangeline() {
        return rangeline;
    }

    public WebElement getMultiaxis() {
        return multiaxis;
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

    public WebElement getStatisticalmap() {
        return statisticalmap;
    }

    public WebElement getTable() {
        return table;
    }

    public WebElement getSingle() {
        return single;
    }

    public WebElement getRing() {
        return ring;
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

    public WebElement getChain() {
        return chain;
    }

//------------------------------------------------------------------

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

    public WebElement getUnifyMetric() {
        return unifyMetric;
    }

    public WebElement getSelectJiangsu() {
        return selectJiangsu;
    }

    public WebElement getSelectWorld() {
        return selectWorld;
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

    public WebElement getShowLabel() {
        showLabel.click();
        return super.getLastDropdownList();
    }

    public WebElement getLabelLocation() {
        labelLocation.click();
        return super.getLastDropdownList();
    }

    public WebElement getFieldValue() {
        return fieldValue;
    }

    public WebElement getTypeChartField() {
        typeChartField.click();
        return this.getLastDropdownList();
    }

    public WebElement getNumericField() {
        return numericField;
    }

    public WebElement getContrastTime() {
        contrastTime.click();
        return this.getLastDropdownList();
    }

    public WebElement getFieldLongitude() {
        return fieldLongitude;
    }

    public WebElement getFieldLatitude() {
        return fieldLatitude;
    }

    public WebElement getLightGreen() {
        return lightGreen;
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

    public WebElement getProvince() {
        return province;
    }

    public WebElement getCity() {
        return city;
    }

    public WebElement getGoingDown() {
        return goingDown;
    }

    public WebElement getSelectChina() {
        return selectChina;
    }

    public WebElement getRegion() {
        return region;
    }

    public WebElement getGeneral() {
        return general;
    }

    public WebElement getBubbleSize() {
        return bubbleSize;
    }

    public WebElement getPrecision() {
        precision.click();
        return super.getLastDropdownList();
    }

    public WebElement getDisplayField() {
        displayField.click();
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

    public WebElement getBubble() {
        return bubble;
    }

    public WebElement getGenerate() {
        return generate;
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

//    public WebElement getSuccessMessage() {
//        return successMessage;
//    }
//
//    public WebElement getChartType() {
//        return chartType;
//    }


    public WebElement getAscendingOrder() {
        return ascendingOrder;
    }

    private WebElement getInput(String name) {
        String xpath = "//label[contains(text(),'" + name + "')]/following-sibling::input";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getDescendingOrder() {
        return descendingOrder;
    }

    public WebElement getYaxis() {
        return yaxis;
    }

    public WebElement getYaxis2() {
        return yaxis2;
    }

    public WebElement getYaxis3() {
        return yaxis3;
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


    public WebElement getAddField() {
        return addField;
    }

    public WebElement getAddConfigFields() {
        return addConfigFields;
    }

    public WebElement getDivide() {
        return divide;
    }

    public WebElement getValue() {
        return value;
    }

    public WebElement getTarget() {
        return target;
    }

    public WebElement getWeight() {
        return weight;
    }

    public WebElement getPredict() {
        return predict;
    }

    public WebElement getActual() {
        return actual;
    }

    public WebElement getTopLimit() {
        return topLimit;
    }

    public WebElement getLowerLimit() {
        return lowerLimit;
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

    public WebElement getIconName() {
        return iconName;
    }

    public WebElement getIndicator() {
        return indicator;
    }

    public WebElement getTimeSequence() {
        return timeSequence;
    }

    public WebElement getCompare() {
        return compare;
    }

    public WebElement getFacet() {
        return facet;
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[text()='" + name + "']/following-sibling::input"));
    }

}
