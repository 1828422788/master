package com.yottabyte.pages.dashboard;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ConstructPageFactoryWithName;
import com.yottabyte.utils.GetTime;
import com.yottabyte.utils.Paging;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindAll;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

/**
 * @author sunxj
 */
public class DetailPage extends PageTemplate {
    public DetailPage(WebDriver driver) {
        super(driver);
        driver.manage().window().setSize(new Dimension(1920,1080));
//        driver.manage().window().fullscreen();
    }

    @FindBy(className = "el-loading-mask")
    private WebElement loading;

    @FindBy(xpath = "//span[contains(text(),'确定')]")
    private List<WebElement> ensureList;

    @FindBy(xpath = "//th[text()='apache.geo.city']/i")
    private WebElement chartEditor;

    @FindBy(xpath = "(//*[@yotta-test='table_chart-edit-icon'])[2]")
    private WebElement chartEditorNumber;

    @FindBy(className = "control-panel-content")
    private WebElement filter;

    @FindBy(className = "el-switch__label--left")
    private WebElement clickableButton;

    @FindBy(className = "icon-tianjiatubiaoxuanting_icon")
    private WebElement addButton;

    @FindBy(className = "icon-yichuyiruxuanting_icon")
    private WebElement moveButton;

    @FindBy(className = "icon-gengxinxuanting_icon")
    private WebElement refreshButton;

    @FindBy(className = "icon-cunweibaobiao_icon")
    private WebElement saveAsReportButton;

    @FindBy(className = "icon-yejianxuanting_icon")
    private WebElement nightModeButton;

    @FindBy(className = "icon-quanpingxuanting_icon")
    private WebElement fullScreenButton;

    @FindBy(className = "el-checkbox")
    private List<WebElement> checkBox;

    @FindBy(className = "el-tabs__item")
    private List<WebElement> tabList;

    @FindBy(className = "icon-qiehuan1")
    private WebElement switchButton;

    @FindBy(className = "dash-switch-ul")
    private WebElement dropdownList;

    @FindBy(className = "icon-guanbianniu")
    private WebElement closeTag;

    @FindBy(className = "dropdown-link-btn")
    private WebElement dropDownLinkButton;

    @FindBy(xpath = "//span[contains(text(),'恢复')][@class='action']")
    private WebElement recoverTag;

    @FindBy(xpath = "//div[@class='yotta-modal-footer']/button")
    private WebElement ensureErrorSplButton;

    @FindBy(xpath = "//div[@class='yotta-checkbox-group']//span[@class='yotta-checkbox-input']")
    private WebElement listForBang;

    @FindBy(xpath = "//span[text()='移出标签页']")
    private WebElement moveoutTag;

    @FindBy(xpath = "//span[text()='保存为']")
    private WebElement saveAs;

    @FindBy(xpath = "//span[text()='存为报表']")
    private WebElement saveAsReport;

    @FindBy(xpath = "//span[text()='更多配置']")
    private WebElement moreConfig;

    @FindBy(xpath = "(//span[text()='通用配置'])[2]")
    private WebElement moreConfigs;

    @FindBy(className = "yotta-message-content")
    private WebElement successMessage;

    @FindBy(className = "yotta-message-content")
    private WebElement errorMessage;

    @FindBy(xpath = "(//span[text()='全局时间']/following-sibling::i)[last()]")
    private WebElement deleteTimeTag;

    @FindBy(xpath = "//span[@yotta-test='dashboard-delete_filter-icon']")
    private WebElement deleteTag;

    @FindBy(xpath = "//*[@yotta-test='dashboard-filter_setting-icon']")
    private WebElement editTime;

    @FindBy(xpath = "(//span[text()='time']/following-sibling::span)[last()]")
    private WebElement deleteTime;

    @FindBy(xpath = "//*[@yotta-test='dashboard-add_item-dropdown']/span/span")
    private WebElement addEventButton;

    @FindBy(className = "yw-dropdown-menu")
    private List<WebElement> eventList;

    @FindBy(xpath = "//div[@class='yotta-form-field']//span[@class='yotta-select-selection-value']")
    private WebElement inputType;

    @FindBy(xpath = "//div[@id='config']")
    private WebElement highJsonEditor;

    @FindBy(xpath = "//span[text()='添加']")
    private WebElement addChoiceValueButton;

    @FindBy(xpath = "//span[text()='添加行']")
    private WebElement addRow;

    @FindBy(xpath = "//span[text()='添加图表']")
    private WebElement addChart;

    @FindBy(xpath = "//span[text()='添加图表']/ancestor::li")
    private WebElement addChartItem;

    public WebElement getAddChartItem() {
        return addChartItem;
    }

    @FindBy(xpath = "//span[text()='添加事件列表']")
    private WebElement addEvent;

    @FindBy(xpath = "//span[text()='添加过滤项']")
    private WebElement addFilter;

    @FindBy(xpath = "//*[@yotta-test='dashboard-add_input-menu_item']")
    private WebElement addInput;

    @FindBy(xpath = "//div[@class='el-form-item dynamic-search-btn']//span")
    private WebElement searchInputButton;

    @FindBy(xpath = "//*[@name='title']")
    private WebElement inputSettingTitle;

    @FindBy(xpath = "//span[text()='文本输入']")
    private WebElement inputSettingType;

    @FindBy(xpath = "//span[text()='时间范围']")
    private WebElement timeRangee;

    @FindBy(xpath = "//span[text()='设为全局时间']")
    private WebElement setGlobalTimeRange;

    @FindBy(xpath = "//span[text()='全局时间']/following-sibling::div//i[contains(@class,'anticon css-ifnfqv')][2]")
    private WebElement deleteIcon;

    @FindBy(xpath = "//label[contains(text(),'搜索内容')]/following-sibling::div//textarea")
    private WebElement searchInput;

    @FindBy(xpath = "//label[contains(text(),'标题')]/following-sibling::div//input[@class='el-input__inner']")
    private List<WebElement> titleList;

    @FindBy(xpath = "//div[@class='control']/following-sibling::span")
    private WebElement labelName;

    @FindBy(className = "yw-tab-header-content")
    private WebElement header;

    @FindBy(className = "circular")
    private WebElement circular;

    @FindBy(xpath = "//a[contains(text(),'UIautotest')]")
    private WebElement uiautotest;

    @FindBy(xpath = "//span[contains(text(),' 测试市')]")
    private WebElement ceshishi;

    @FindBy(xpath = "//a[contains(text(),'测试标签页移出')]")
    private WebElement testMoveTag;

//    @FindBy(className = "icon-tianjiatubiao_icon")
//    private WebElement addTag;

    @FindBy(xpath = "//span[text()='单选']")
    private WebElement radio;

    @FindBy(xpath = "//span[text()='多选']")
    private WebElement multiSelect;

    @FindBy(xpath = "//input[@placeholder='请输入选项值']")
    private WebElement choiceValue;

    @FindBy(xpath = "//input[@placeholder='请输入']")
    private WebElement filterValue;

    @FindBy(xpath = "//*[@placeholder='请输入趋势图名称']")
    private WebElement trendName;

    @FindBy(xpath = "//span[contains(text(),'仪表盘所用趋势图')]")
    private WebElement dashboardTrend;

    @FindBy(xpath = "//span[contains(text(),'仪表盘1669所用趋势图')]")
    private WebElement dashboardTrend1669;

    @FindBy(className = "icon-gengduopeizhi")
    private WebElement chartSetting;

    @FindBy(tagName = "table")
    private List<WebElement> tableList;

    @FindBy(xpath = "//textarea[@yotta-test='dashboard-general_config_query-textarea']")
    private WebElement spl;

    @FindBy(xpath = "(//*[@class='el-dialog__body']/following-sibling::div//button/span[contains(text(),'确定')])[last()]")
    private WebElement settingEnsure;

    @FindBy(xpath = "//div[text()='仪表盘所用趋势图']/following-sibling::div[1]/*[@class='anticon css-ifnfqv'][2]")
    private WebElement deleteChart;

    @FindBy(xpath = "//div[text()='是否删除图表?']/ancestor::div[@class='el-dialog el-dialog--tiny']//button")
    private WebElement ensureDeleteChart;

    @FindBy(xpath = "//div[@class='settings-content']//i")
    private WebElement fieldValue;

    @FindBy(className = "widget-chart-settings-content")
    private WebElement content;

    @FindBy(className = "icon-gengduopeizhi")
    private WebElement config;

    @FindBy(tagName = "textarea")
    private WebElement textarea;

    @FindBy(xpath = "//span[text()='通用配置']")
    private WebElement configs;

    @FindBy(xpath = "//span[text()='高级编辑']")
    private WebElement edit;

    @FindBy(xpath = "//span[text()='恢复初始']")
    private WebElement recover;

    @FindBy(xpath = "//span[text()='钻取配置']")
    private WebElement drillSetting;

    @FindBy(xpath = "//span[contains(text(),'校验')]/ancestor::button/following-sibling::button")
    private WebElement ensureEdit;

    @FindBy(xpath = "//div[text()='仪表盘多Y轴图']/parent::div")
    private WebElement multiYaxisArea;

    @FindBy(xpath = "//div[text()='仪表盘区间图']/parent::div")
    private WebElement sectionChartArea;

    @FindBy(xpath = "//div[text()='仪表盘和弦图']/parent::div")
    private WebElement chordChart;

    @FindBy(xpath = "//div[text()='仪表盘饼状图']/parent::div")
    private WebElement dimensionChart;

    @FindBy(xpath = "//div[text()='仪表盘曲线图']/parent::div")
    private WebElement sequenceChart;

    @FindBy(xpath = "//*[@yotta-test='dashboard-chart_switch_table-icon']")
    private WebElement switchToTable;

    @FindBy(xpath = "//*[@yotta-test='dashboard-chart_download-icon']")
    private WebElement downloadTableIcon;

    @FindBy(xpath = "//*[name()='g'][contains(@class,'vx-axis-left')]")
    private WebElement sequenceChartYaxis;

    @FindBy(xpath = "//div[@class='vx-legend-item']/parent::div/parent::div[@class]/parent::div")
    private WebElement multiYaxisLegend;

    @FindBy(xpath = "//div[@class='vx-legend-item']/parent::div/parent::div/parent::div")
    private WebElement lineChartLegend;

    @FindBy(xpath = "//*[@yotta-test='dashboard-chart_title-dom']")
    private WebElement trendTitle;

    @FindBy(xpath = "//span[text()='second'][@class='main']")
    private WebElement main;

    @FindBy(xpath = "//div[@x-placement]")
    private WebElement remarkInfo;

    @FindBy(xpath = "//*[@class='img iconfont icon-beizhu_icon']")
    private WebElement remark;

    @FindBy(className = "el-pagination__total")
    private WebElement totalPage;

    @FindBy(xpath = "(//*[text()='{'])")
    private WebElement input;

    @FindBy(xpath = "//li[contains(text(),'清空JSON')]")
    private WebElement cleanJson;

    //    @FindBy(id = "jsoneditor")
    @FindBy(className = "ace_text-input")
    private WebElement jsonEditor;

    @FindBy(className = "el-icon-loading")
    private WebElement iconLoading;

    @FindBy(xpath = "//*[@yotta-test='dashboard-new_filter_value-select']/div")
    private WebElement defaultValueIcon;

    @FindBy(xpath = "//td[@data-col-name='a_']")
    private WebElement singleChartFieldA;

    @FindBy(className = "yw-single-chart-static")
    private WebElement singleChartStatic;

    @FindBy(className = "widget-chartType-selection-popover")
    private WebElement selectionPopover;

    @FindBy(xpath = "(//*[name()='text'])[text()]")
    private WebElement xaxisField;

    @FindBy(xpath = "//div[@class='el-dialog__wrapper yw-modal-plain yw-selection-modal dialog-fade-leave-active dialog-fade-leave-to']")
    private WebElement fadingLeave;

    @FindBy(xpath = "//span[contains(text(),'生成')]")
    private WebElement generate;

    @FindBy(className = "ant-progress-line")
    private WebElement progress;

    @FindBy(xpath = "//span[text()='添加颜色范围']")
    private WebElement addColourRange;

    @FindBy(xpath = "//span[text()='61']")
    private WebElement numberOf61;

    @FindBy(xpath = "//span[text()='404']")
    private WebElement numberOf404;

    @FindBy(className = "chart-color-selector-trigger")
    private WebElement colorTrigger;

    @FindBy(xpath = "(//span[contains(@style,'background: rgb(37, 155, 36);')])[last()]")
    private WebElement green;

    @FindBy(className = "single-chart-background-base")
    private WebElement BackgroundColour;

    @FindBy(className = "main")
    private WebElement mainTitle;

    @FindBy(className = "yw-single-chart-container")
    private WebElement chartContainer;

    @FindBy(tagName = "table")
    private WebElement table;

    @FindBy(tagName = "thead")
    private WebElement tableHeader;

    @FindBy(xpath = "//i[@class='el-icon-check el-icon--right']")
    private WebElement checkRight;

    @FindBy(xpath = "//div[@id='fullscreenAll']//label")
    private WebElement dropdownLink;

    @FindBy(xpath = "//div[@class='ant-modal-body']//i/ancestor::div")
    private WebElement message;

    @FindBy(xpath = "//span[contains(@class,'yotta-icon-TooltipOutlined')]")
    private WebElement describe;

    @FindBy(xpath = "//div[text()='测试描述']")
    private WebElement describeText;

    @FindBy(xpath = "//div[text()='demorpcservice.demo']")
    private WebElement callChainText;

    @FindBy(xpath = "//div[text()='demorpcservice.demo']")
    private WebElement secondCallChainText;

    @FindBy(xpath = "//div[text()='显示详情']")
    private WebElement showDetails;

    @FindBy(xpath = "//div[text()='demorpcservice.demo']")
    private WebElement foldIcon;

    @FindBy(xpath = "//div[text()='mould1rpcservice.demoformould1']")
    private WebElement callChainTextChildNode;

    @FindBy(xpath = "(//div[text()='binnaryannotations'])[2]/parent::div/parent::div")
    private WebElement callChainDetails;

    @FindBy(xpath = "//div[text()='第一行']/preceding-sibling::div/span[1]")
    private WebElement editRowIcon;

    @FindBy(xpath = "//div[text()='首行']/preceding-sibling::div/span[2]")
    private WebElement deleteRowIcon;

    @FindBy(xpath = "//div[@id='fullscreenAll']/div/div/span[last()]")
    private WebElement deleteNoNameRowIcon;

    @FindBy(xpath = "//div[text()='首行']")
    private WebElement firstRow;

    @FindBy(xpath = "//div[text()='中国']")
    private WebElement chinaDadio;

    @FindBy(xpath = "(//*[text()='2']/parent::*)[1]")
    private WebElement chinaPoint;

    @FindBy(xpath = "//div[text()='首行']/following-sibling::div//span[text()='innerFilter']")
    private WebElement innerInputFilter;

    @FindBy(xpath = "//div[text()='首行']/following-sibling::div//div[text()='测试行事件']")
    private WebElement rowEventName;

    @FindBy(xpath = "//div[text()='行布局趋势图1']/following-sibling::div[1]/i")
    private WebElement moreXuanTing;

    @FindBy(xpath = "//div[text()='行布局趋势图2']/following-sibling::div[1]//span[@class='yotta-icon yotta-icon-DotEmblemOutlined']")
    private WebElement moreXuanTing2;

    @FindBy(xpath = "//div[text()='行布局趋势图2']/following-sibling::div[1]/i[3]")
    private WebElement deleteTrend2;

    @FindBy(xpath = "//div[text()='行布局趋势图1']/following-sibling::div//span[@class='yotta-icon yotta-icon-DeleteFilled']")
    private WebElement deleteTrend1;

    @FindBy(xpath = "//div[text()='行布局趋势图1']")
    private WebElement trendOne;

    @FindBy(xpath = "//div[text()='行布局趋势图2']")
    private WebElement trendTwo;

    @FindBy(xpath = "//div[text()='行布局趋势图3']")
    private WebElement trendThree;

    @FindBy(xpath = "//span[text()='删除']")
    private WebElement chartDelete;

    @FindBy(xpath = "//span[text()='操作']")
    private WebElement operate;

    @FindBy(xpath = "//span[text()='phplib/xiaomi/Model/Device/Event.php:451']")
    private WebElement jsonCallerText;

    @FindBy(xpath = "//span[text()='江苏']")
    private WebElement jiangsu;

    @FindBy(xpath = "//span[text()='上海市']")
    private WebElement  shanghai;

    @FindBy(xpath = "//span[text()='成都市 ']")
    private WebElement  chengdushi;

    @FindBy(xpath = "(//span[text()='成都市'])[last()]")
    private WebElement  chengDuShi;

    @FindBy(xpath = "//div[@class='yotta-select-menu']//span[text()='成都市']")
    private WebElement chengdushiList;

    @FindBy(xpath = "(//*[name()='rect'])[3]")
    private WebElement zhutiao;

    @FindBy(xpath = "(//*[name()='text'])[text()='64.20.177.254']")
    private WebElement ipZifu;

    @FindBy(xpath = "//span[text()='64.20.177.254']")
    private WebElement ip254;

    @FindBy(xpath = "(//*[text()='1']/parent::*)[last()]")
    private WebElement taiwan;

    @FindBy(xpath = "(//*[text()='1']/parent::*)[1]")
    private WebElement neimenggu;

    @FindBy(xpath = "(//*[name()='text'])[text()='内蒙古']")
    private WebElement neimengguText;

    @FindBy(xpath = "(//*[name()='text'])[text()='通辽市']")
    private WebElement tongliaoshiText;

    @FindBy(xpath = "(//*[name()='text'])[text()='64.20.177.254']/preceding-sibling::*")
    private WebElement partOfPie;

    @FindBy(xpath = "(//*[name()='tspan'])[text()='2 柱']")
    private WebElement multiYminValue;

    @FindBy(xpath = "(//*[name()='tspan'])[text()='0.2M 柱']")
    private WebElement multiYmaxValue;

    @FindBy(xpath = "//span[text()='36.46.208.22']")
    private WebElement tableRow22;

    @FindBy(xpath = "//table/tbody/tr[1]/td[2]/div")
    private WebElement tableRowResplen;

    @FindBy(xpath = "//div[text()='钻取变量单值']/following-sibling::div[last()]/div/div[last()]/div/span")
    private WebElement singleValue;

    @FindBy(xpath = "//div[text()='仪表盘单值' and @yotta-test='dashboard-chart_title-dom']/following-sibling::div[last()]//span[1]")
    private WebElement dashboardSingleValue;

    @FindBy(xpath = "//span[text()='thumbs-up:']/parent::div/parent::div")
    private WebElement singleValueDiv;

    @FindBy(xpath = "//div[text()='钻取变量单值value']/following-sibling::div[last()]/div/div[last()]/div/span")
    private WebElement singleValue1;

    @FindBy(xpath = "//div[@yotta-test='dashboard-drilldown_type-select']//div[@class='yotta-select-selection']")
    private WebElement drillAction; //钻取类型

    @FindBy(xpath = "//div[@yotta-test='dashboard-drilldown_map_province-select']//div[@class='yotta-select-selection']")
    private WebElement provinceDrillAction; //省下钻字段

    @FindBy(xpath = "//div[@yotta-test='dashboard-drilldown_map_city-select']//div[@class='yotta-select-selection']")
    private WebElement cityDrillAction; //市下钻字段

    @FindBy(xpath = "//textarea[@yotta-test='dashboard-drilldown_custom_url-textarea']")
    private WebElement url;

    @FindBy(xpath = "//div[text()='自定义']")
    private WebElement custom;

    @FindBy(xpath = "//span[contains(@class,'yotta-date-time-picker-text')]")
    private WebElement dateEditor;

    @FindBy(xpath = "//*[@yotta-test='dashboard-drilldown_tab_target_tab-cascader']")
    private WebElement targetTag;

    @FindBy(className = "el-cascader-menu")
    private List<WebElement> menuList;

    @FindBy(xpath = "//label[contains(text(),'目标参数')]/following-sibling::div/div")
    private WebElement targetParam;

    @FindBy(xpath = "(//ul[@class='ant-select-dropdown-menu-item-group-list'])[1]")
    private WebElement inputGroup;

    @FindBy(xpath = "//div[text()='=']//span")
    private WebElement paramValue;

    @FindBy(xpath = "//*[@yotta-test='dashboard-drilldown_filter_value-select']")
    private WebElement paramValue1;

    @FindBy(className = "is-multiple")
    private WebElement paramDropdown;

    @FindBy(xpath = "//span[text()='${click.value2}']")
    private WebElement clickValue;

    @FindBy(xpath = "//span[text()='${click.value}']")
    private WebElement clickValue1;

    @FindBy(xpath = "//span[text()='${start},${end}']")
    private WebElement startEnd;

    @FindBy(xpath = "//*[@yotta-test='dashboard-drilldown_filter_add-input']")
    private WebElement newCreat;

    @FindBy(xpath = "//*[@yotta-test='dashboard-drilldown_filter_action-select']")
    private WebElement optionItems;

    @FindBy(xpath = "//*[@yotta-test='dashboard-drilldown_filter_token-input']")
    private WebElement tokenInput;

    @FindBy(xpath = "(//input[@class='ant-input'])[not(@placeholder)]/following-sibling::div")
    private WebElement optionFilterValue;

    @FindBy(xpath = "//input[@yotta-test='dashboard-filter_value-input']")
    private WebElement geoCity;

    @FindBy(xpath = "(//div[@class='yotta-event-list-body']/div/div[@class='yotta-dropdown event-action-icon-dropdown']/span)[1]")
    private WebElement eventOperate;

    @FindBy(xpath = "(//div[@class='event-item']/span)[1]")
    private WebElement iconRight;

    @FindBy(xpath = "//span[text()='apache.geo.city:']/following-sibling::span/span/span")
    private WebElement cityTd;

    @FindBy(xpath = "//*[@yotta-test='dashboard-filter_value-select']/div")
    private WebElement filterDropdown;

    @FindBy(xpath = "//span[text()='filter']")
    private WebElement filterName;

    @FindBy(xpath = "//span[text()='time']")
    private WebElement filterTime;

    @FindBy(xpath = "//span[text()='全局时间']")
    private WebElement timeName;

    @FindBy(xpath = "(//span[text()='000000001203094955'])[2]")
    private WebElement entry;

    @FindBy(xpath = "//span[text()='filter']/following-sibling::span")
    private WebElement filterSetting;

    @FindBy(xpath = "(//a[@class='item-menu-btn iconfont icon-shanchuxuanting_icon'])[last()]")
    private WebElement filterDelete;

    @FindBy(xpath = "//span[contains(text(),'删除过滤项')]/ancestor::div[@class='el-dialog el-dialog--tiny']//button")
    private WebElement ensureDeleteFilter;

    @FindBy(xpath = "//span[contains(text(),'删除输入项')]/ancestor::div[@class='el-dialog el-dialog--tiny']//button")
    private WebElement ensureDeleteInput;

    @FindBy(xpath = "//span[text()='单选']/ancestor::label")
    private WebElement singleChoice;

    @FindBy(xpath = "//span[text()='filter']/ancestor::div/following-sibling::div/input")
    private WebElement filterInput;

    @FindBy(xpath = "//span[text()='南京市']")
    private WebElement nanjingshi;

    @FindBy(xpath = "//div[@class='yotta-select-menu']//span[text()='南京市']")
    private WebElement nanjingshiList;

    @FindBy(xpath = "//div[text()='南京市']")
    private WebElement nanJing;

    @FindBy(xpath = "//div[text()='成都市']")
    private WebElement chengDu;

    @FindBy(xpath = "//div[text()='缺少动态字段值']")
    private WebElement tipOfLack;

    @FindBy(xpath = "//div[text()='请填写查询语句']")
    private WebElement splOfLack;

    @FindBy(xpath = "//div[@class='yotta-message-content']")
    private WebElement noticeMessage;

    @FindBy(xpath = "//p[text()='缺少选中的字段']")
    private WebElement lackField;

    @FindBy(xpath = "//div[text()='该选项为必填项不能为空']")
    private WebElement emptyNotice;

    @FindBy(xpath = "//div[text()='无效标识 包含（.）']")
    private WebElement errorContainPoin;

    @FindBy(xpath = "//div[text()='请填写查询语句']")
    private WebElement errorNoSpl;

    @FindBy(xpath = "//p[text()='搜索语句须为stats类型']")
    private WebElement errorSpl;

    @FindBy(xpath = "//*[@yotta-test='dashboard-filter_value-select']/div")
    private WebElement filterDropDown1;

    @FindBy(xpath = "//th//span[text()='appname']/following-sibling::input")
    private WebElement appname;

    @FindBy(xpath = "//label[contains(text(),'预览')]/following-sibling::input")
    private WebElement preview;

    @FindBy(xpath = "//*[@yotta-test='dashboard-download_name-input']")
    private WebElement downloadFileName;

    @FindBy(xpath = "//div[text()='仪表盘return']/following-sibling::div//table")
    private WebElement returnList;

    @FindBy(xpath = "//div[contains(text(),'仪表盘workflow')]/following-sibling::div//table")
    private List<WebElement> workflowList;

    @FindBy(xpath = "//div[@class='yotta-modal-body']/div/p[contains(text(),'下载任务出错')]")
    private WebElement duplicateName;

    @FindBy(xpath = "//span[text()='在搜索中打开']")
    private WebElement openInSearch;

    @FindBy(xpath = "//span[text()='24']")
    private WebElement countNum;

    @FindBy(xpath = "//div[@id='fullscreenAll']//div[@id]/div")
    private WebElement customTitle;

    @FindBy(name = "trendDescription")
    private WebElement chartDesc;

    @FindBy(xpath = "//*[@yotta-test='dashboard-general_config_condition_token-select']/div")
    private WebElement showFilterConfig;

    @FindBy(xpath = "//div[@name='tokenId']/div/span[@class='yotta-select-selection-icon']/span")
    private WebElement cleanShowFilterConfig;

    @FindBy(xpath = "//*[@yotta-test='dashboard-general_config_condition_sign-select']/div")
    private WebElement showCondition;

    @FindBy(xpath = "//div[@name='condition']/div/span[@class='yotta-select-selection-icon']/span")
    private WebElement cleanShowConditio;

    @FindBy(xpath = "//*[@yotta-test='dashboard-general_config_condition_value-input']")
    private WebElement showValue;

    @FindBy(xpath = "//div[text()='请补全展示条件']")
    private WebElement tipErrorShowCondition;

    @FindBy(className = "icon-fanyeqishangjiantou")
    private WebElement eventIcon;

    @FindBy(xpath = "//span[text()='仪表盘测试事件列表']")
    private WebElement event;

    @FindBy(xpath = "//span[text()='appname']")
    private WebElement eventAppname;

    @FindBy(xpath = "//span[text()='实时查看']")
    private WebElement realTime;

    @FindBy(xpath = "//span[text()='配置字段提取']")
    private WebElement createConfig;

    @FindBy(xpath = "//span[text()='添加到知识库']")
    private WebElement addKnowledge;

    @FindBy(xpath = "//div[@class='yotta-dropdown-menu']/ul")
    private WebElement addChartDropdown;

    @FindBy(xpath = "(//i[@class='anticon css-ifnfqv'])/*")
    private List<WebElement> iconList;

    @FindBy(xpath = "(//div[@class='yotta-dropdown'])[1]/span/span")
    private WebElement AddIcon;

    @FindBy(xpath = "//*[@yotta-test='dashboard-tab_config-dropdown']/span")
    private WebElement settingIcon;

    @FindBy(xpath = "//*[@yotta-test='dashboard-chart_setting-dom']")
    private WebElement settingChart;

    @FindBy(xpath = "(//ul[contains(@class,'yotta-menu')])[1]/li")
    private List<WebElement> liList;

    @FindBy(xpath = "//*[@yotta-test='dashboard-tab_list-dropdown']/span")
    private WebElement tagIcon;

    @FindBy(xpath = "//*[@yotta-test='dashboard-new_tab-menu_item']")
    private WebElement addTag;

    @FindBy(xpath = "//*[@yotta-test='dashboard-tab_list-dropdown']/span")
    private WebElement tagPageName;

    @FindBy(xpath = "//a[text()='第二个标签']")
    private WebElement secondTag;

    @FindBy(xpath = "//div[text()='暂无数据']")
    private WebElement noData;

    @FindBy(className = "vx-group")
    private WebElement pieData;

    @FindBy(xpath = "//span[text()='保存']/preceding-sibling::input")
    private WebElement tagInput;

    @FindBy(xpath = "//span[text()='保存']")
    private WebElement saveTagInput;

    @FindBy(xpath = "//div[@class='ant-select-selection-selected-value']")
    private WebElement timeForRatio;

    @FindBy(xpath = "(//div[@class='ant-select-selection-selected-value'])[2]")
    private WebElement DrillActionText;

    @FindBy(xpath = "(//div[contains(@id, 'fullscreen')])[2]")
    private WebElement singleValueExhibition;

    @FindBy(xpath = "//input[@yotta-test='dashboard-filter_dashboard-input']")
    private WebElement searchDashInput;

    public WebElement getSearchDashInput() {
        return searchDashInput;
    }

    @FindBy(xpath = "//input[@yotta-test='dashboard-nav_filter-input']")
    private WebElement searchTagInput;

    @FindBy(xpath = "//a[text()='first']")
    private WebElement firstTag;

    @FindBy(xpath = "(//div[@class='yotta-tree-node']//span[text()])[last()]")
    private WebElement lastTag;

    @FindBy(xpath = "//span[contains(text(),'first')]")
    private WebElement first;

    @FindBy(xpath = "//span[text()='新建标签页']")
    private WebElement creatNewTag;
    public WebElement getCreatNewTag() {
        return creatNewTag;
    }

    @FindBy(xpath = "//a[text()='Delete']/following-sibling::*[@yotta-test='dashboard-delete_tab-dom']")
    private WebElement deleteNewTag;

//    @FindBy(xpath = "//span[text()='新建标签页']/preceding-sibling::ul/li[2]")
    @FindBy(xpath = "//span[text()='新建标签页']/parent::li/preceding-sibling::div/li[2]//input")
    private WebElement inputforTag;

    @FindBy(xpath = "//a[text()='forDelete']/following-sibling::span[1]")
    private WebElement editTag;

    @FindBy(xpath = "//label[text()='所有时间']/following-sibling::i[4]")
    private WebElement forthIcon;

    @FindBy(xpath = "//a[text()='testSearch']")
    private WebElement testSearch;

    @FindBy(xpath = "//*[@yotta-test='dashboard-dashboard_list-dropdown']/span")
    private WebElement dashboardIcon;

    @FindBy(xpath = "//span[text()='UIautotest']")
    private WebElement uiAutoTest;

    @FindBy(xpath = "//li[text()='FirstAutoTest']")
    private WebElement firstAutoTest;

    @FindBy(xpath = "//span[@class='ant-dropdown-trigger']")
    private WebElement currentDashboard;

    @FindBy(xpath = "//div[text()='返回列表']")
    private WebElement returnToList;

    @FindBy(xpath = "(//span[@class='yotta-select-selection-icon'])[last()]")
    private WebElement joinRow;

    @FindBy(xpath = "//span[text()='L2: ']")
    private WebElement line2;

    @FindBy(xpath = "//span[text()='L1: 首行']")
    private WebElement line1;

    @FindBy(xpath = "//span[text()='appname:']")
    private WebElement hoverElement;

    @FindBy(xpath = "//input[@yotta-test='dashboard-new_tab_name-input']")
    private WebElement tagName;
    public WebElement getTagName() { return tagName; }

    @FindBy(xpath = "//span[contains(text(),'插入图表')]/following-sibling::span/input")
    private WebElement chartForAdd;

    @FindBy(xpath = "//span[contains(text(),'行布局')]/preceding-sibling::span")
    private WebElement rowLayout;

    @FindBy(className = "ant-spin-dot")
    private WebElement spinDot;

    @FindBy(xpath = "//span[text()='标识']/ancestor::div/following-sibling::div//input")
    private WebElement filterToken;

    @FindBy(id = "filter_textValue")
    private WebElement filterDefaultValue;

    @FindBy(xpath = "//*[@yotta-test='dashboard-new_filter_row-select']/div")
    private WebElement filterJoinRow;

    @FindBy(xpath = "//div[text()='快捷选项']")
    private WebElement shortcut;

    @FindBy(xpath = "//*[@class='yotta-cascader-menu'][last()]")
    private WebElement dashboardMenu;

    @FindBy(xpath = "//*[@class='yotta-dropdown-menu'][last()]")
    private WebElement chartDropdown;

    @FindBy(xpath = "//span[contains(@class,'yotta-icon-ChartSquareFilled')]")
    private WebElement chartType;

    @FindBy(xpath = "(//span[contains(@class,'yotta-icon-ChartSquareFilled')])[2]")
    private WebElement secondChartType;

    @FindBy(xpath = "//div[contains(@class,'table')]//ancestor::div[contains(@class,'_3G8kJ778TGi99RkoVXOccV')]/preceding-sibling::div[contains(@class,'config')]//span[@yotta-test='dashboard-chart_type-dom']")
    private WebElement lastChartType;

    @FindBy(xpath = "//*[@yotta-test='dashboard-delete_chart-icon']")
    private WebElement delete;

    @FindBy(xpath = "//div[text()='仪表盘单值']/following-sibling::div/label")
    private WebElement timeRangeDanzhi;

    @FindBy(xpath = "//label[text()='本月']/following-sibling::i[4]")
    private WebElement deleteForTable;

    @FindBy(id = "fullscreenAll")
    private WebElement fullScreen;

    @FindBy(className = "ace_text-layer")
    private WebElement textLayer;

    @FindBy(id = "ace-nav")
    private WebElement textAce;

    @FindBy(xpath = "//input[@yotta-test='dashboard-add_chart_filter_name-input']")
    private WebElement searchChartInput;

    @FindBy(xpath = "(//*[@yotta-test='dashboard-filter_value-select']/div)[last()]")
    private WebElement lastFilter;

    @FindBy(xpath = "//span[text()='AutoTest_副本']")
    private WebElement autotestCopy;

    @FindBy(xpath = "//*[@yotta-test='table_chart-table_color-select']/div")
    private WebElement chartEditorColor;

    @FindBy(xpath = "//*[@yotta-test='table_chart-font_style-select']/div")
    private WebElement chartFontStyle;

    @FindBy(xpath = "//*[@yotta-test='table_chart-alignment-select']/div")
    private WebElement chartAlignment;

    @FindBy(xpath = "//*[@yotta-test='table_chart-default_values_color-radio']")
    private WebElement colorValueDefault;

    @FindBy(xpath = "//*[@yotta-test='table_chart-auto_values_color-radio']")
    private WebElement colorValueRandom;

    @FindBy(xpath = "//*[@yotta-test='table_chart-define_values_color-radio']")
    private WebElement colorValueCustom;

    @FindBy(xpath = "//span[text()='添加值颜色']/parent::button")
    private WebElement addValueColor;

    @FindBy(xpath = "//span[text()='添加范围颜色']/parent::button")
    private WebElement addRangeColor;

    @FindBy(xpath = "//span[text()='值']/following-sibling::input")
    private WebElement firstValueColor;

    @FindBy(xpath = "//label[text()='下限值']/following-sibling::input")
    private WebElement lowerLimitValue;

    @FindBy(xpath = "//label[text()='中值']/following-sibling::input")
    private WebElement medianValue;

    @FindBy(xpath = "//label[text()='上限值']/following-sibling::input")
    private WebElement upperLimitValue;

    @FindBy(xpath = "//label[text()='字体颜色：']/following-sibling::div//span[@class='css-trkpwz']")
    private WebElement chartFontColor;

    @FindBy(xpath = "//label[text()='字体颜色：']/following-sibling::div//div[text()='Hex']/preceding-sibling::input")
    private WebElement chartFontColorValue;

    @FindBy(xpath = "//label[text()='列宽度：']/following-sibling::div//input")
    private WebElement chartColumnWidth;

    @FindBy(xpath = "//span[text()='南京市']/ancestor::td/following-sibling::td//div[@class='shadow-box']")
    private WebElement valueOfNanjingDefault;

    @FindBy(xpath = "//span[text()='南京市']/ancestor::td/following-sibling::td/div")
    private WebElement valueOfNanjing;

    @FindBy(xpath = "//span[text()='确定']/parent::button")
    private WebElement chartEditorEnsure;

    @FindBy(xpath = "//span[text()='南京市']/ancestor::td/following-sibling::td")
    private WebElement valueOfNanjingTd;

    @FindBy(xpath = "//span[text()='深圳市']/ancestor::td/following-sibling::td/div")
    private WebElement valueOfShenzhenTd;

    @FindBy(xpath = "//span[text()='南京市']/ancestor::td/following-sibling::td//span")
    private WebElement valueOfNanjingTdText;

    @FindBy(xpath = "//div[text()='仪表盘表格样式']/parent::div")
    private WebElement chartStyleTable;

    @FindBy(xpath = "(//span[contains(@yotta-test,'setting')]//ancestor::div[contains(@class,'config')]/following-sibling::div[contains(@class,'action')]//span[contains(@yotta-test,'refresh')])[last()]")
    private WebElement refreshChart;

    public WebElement getRefreshChart() {
        return refreshChart;
    }

    public WebElement getAutotestCopy() {
        return autotestCopy;
    }

    public WebElement getLastFilter() {
        lastFilter.click();
        return super.getLastDropdownList();
    }

    public WebElement getShowCondition() {
        showCondition.click();
        return super.getLastDropdownList();
    }

    public WebElement getShowFilterConfig() {
        showFilterConfig.click();
        return super.getLastDropdownList();
    }

    public WebElement getOptionItems() {
        optionItems.click();
        return super.getLastDropdownList();
    }

    public WebElement getOptionFilterValue() {
        optionFilterValue.click();
        return super.getLastDropdownList();
    }

    public WebElement getCheckbox(String name) {
        return webDriver.findElement(By.xpath("//span[text()='" + name + "']/ancestor::label"));
    }

    public WebElement getSearchChartInput() {
        return searchChartInput;
    }

    public WebElement getAddFilter() {
        return addFilter;
    }

    public WebElement getShowValue() {
        return showValue;
    }

    public WebElement getCleanShowFilterConfig() {
        return cleanShowFilterConfig;
    }

    public WebElement getCleanShowConditio() {
        return cleanShowConditio;
    }

    public WebElement getTipErrorShowCondition() {
        return tipErrorShowCondition;
    }

    public WebElement getMoreConfig() {
        return moreConfig;
    }

    public WebElement getMoreConfigs() {
        return moreConfigs;
    }

    public WebElement getAddInput() {
        return addInput;
    }

    public WebElement getInputSettingType() {
        return inputSettingType;
    }

    public WebElement getTimeRangee() {
        return timeRangee;
    }

    public WebElement getTimeRangeDanzhi() {
        return timeRangeDanzhi;
    }

    public WebElement getSetGlobalTimeRange() {
        return setGlobalTimeRange;
    }

    public WebElement getAddEvent() {
        return addEvent;
    }

    public WebElement getAddChart() {
        return addChart;
    }

    public WebElement getAddRow() {
        return addRow;
    }

    public WebElement getTextLayer() {
        return textLayer;
    }

    public WebElement getTextAce() {
        return textAce;
    }

    public WebElement getEditRowIcon() { return editRowIcon; }

    public WebElement getDeleteRowIcon() { return deleteRowIcon; }

    public WebElement getDeleteNoNameRowIcon() { return deleteNoNameRowIcon; }

    public WebElement getFirstRow() { return firstRow; }

    public WebElement getInnerInputFilter() { return innerInputFilter; }

    public WebElement getRowEventName() { return rowEventName; }

    public WebElement getMoreXuanTing() { return moreXuanTing; }

    public WebElement getMoreXuanTing2() { return moreXuanTing2; }

    public WebElement getDeleteTrend2() { return deleteTrend2; }

    public WebElement getDeleteTrend1() { return deleteTrend1; }

    public WebElement getTrendOne() { return trendOne; }

    public WebElement getTrendTwo() { return trendTwo; }

    public WebElement getTrendThree() { return trendThree; }

    public WebElement getChartDelete() { return chartDelete; }

    public WebElement getFullScreen() {
        return fullScreen;
    }

    public WebElement getChartType() {
        return chartType;
    }

    public WebElement getSecondChartType() {
        return secondChartType;
    }

    public WebElement getLastChartType() {
        return lastChartType;
    }

    public WebElement getSaveAsReport() {
        return saveAsReport;
    }

    public WebElement getSaveAs() {
        return saveAs;
    }

    public WebElement getChartDropdown() {
        return chartDropdown;
    }

    @Override
    public WebElement getErrorMessage() {
        return errorMessage;
    }

    public WebElement getShortcut() {
        return shortcut;
    }

    public WebElement getSpinDot() {
        return spinDot;
    }

    public WebElement getEventOperate() {
        return eventOperate;
    }

    public WebElement getHoverElement() {
        return hoverElement;
    }

    public WebElement getReturnToList() {
        return returnToList;
    }

    public WebElement getUIAutoTest() {
        return uiAutoTest;
    }

    public WebElement getCeshishi() {
        return ceshishi;
    }

    public WebElement getFirstAutoTest() {
        return firstAutoTest;
    }

    public WebElement getCurrentDashboard() {
        return currentDashboard;
    }

    public WebElement getDashboardIcon() {
        return dashboardIcon;
    }

    public WebElement getTestSearch() {
        return testSearch;
    }

    public WebElement getFirstTag() {
        return firstTag;
    }

    public WebElement getLastTag() {
        return lastTag;
    }

    public WebElement getFirst() {
        return first;
    }

    public WebElement getEditTag() {
        return editTag;
    }

    public WebElement getForthIcon() {
        return forthIcon;
    }

    public WebElement getDeleteNewTag() {
        return deleteNewTag;
    }

    public WebElement getInputforTag() {
        return inputforTag;
    }

    public WebElement getSearchTagInput() {
        return searchTagInput;
    }

    public WebElement getNoData() {
        return noData;
    }

    public WebElement getPieData() {
        return pieData;
    }

    public WebElement getSaveTagInput() {
        return saveTagInput;
    }

    public WebElement getTimeForRatio() {
        return timeForRatio;
    }

    public WebElement getDrillActionText() {
        return DrillActionText;
    }

    public WebElement getSingleValueExhibition() {
        return singleValueExhibition;
    }

    public WebElement getTagInput() {
        return tagInput;
    }

    public WebElement getTagIcon() {
        return tagIcon;
    }

    public WebElement getEditLayout() {
        return this.getLi("编辑布局");
    }

    public WebElement getRemoveTag() {
        return this.getLi("移出标签页");
    }

    public WebElement getCopyTag() {
        return this.getLi("复制标签页");
    }

    public WebElement getSuperEdit() {
        return this.getLi("高级编辑");
    }

    public WebElement getManualRefresh() {
        return this.getLi("手动刷新");
    }

    public WebElement getAutoRefresh() {
        return this.getLi("自动刷新");
    }

    public List<WebElement> getLiList() {
        return liList;
    }

    public WebElement getNightMode() {
        return getSwitchButton("夜间模式");
    }

    public WebElement getOpenEdit() {
        return getSwitchButton("启用编辑项");
    }

    public WebElement getShowFilter() {
        return getSwitchButton("显示过滤项");
    }

    public WebElement getFilterAutoRefresh() {
        return getSwitchButton("过滤输入项自动更新");
    }

    //添加趋势图的确定按钮
    @FindBy(xpath = "//div[@class='Yt5JX-42Xe_Kz4p92ocJI']/button")
    private WebElement ensureAddTrend;

    private WebElement getSwitchButton(String name) {
        String xpath = "//span[text()='" + name + "']/following-sibling::label";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getDeleteIcon() {
        return deleteIcon;
    }

    public WebElement getAddIcon() {
        return AddIcon;
    }

    public WebElement getSettingIcon() {
        return settingIcon;
    }

    public WebElement getSettingChart() {
        return settingChart;
    }

    public WebElement getType() {
        return iconList.get(4);
    }

    public WebElement getSetting() {
        return iconList.get(5);
    }

    public WebElement getDelete() {
        return delete;
    }

    public WebElement getDeleteForTable() {
        return deleteForTable;
    }

    public WebElement getCreateConfig() {
        return createConfig;
    }

    public WebElement getAddKnowledge() {
        return addKnowledge;
    }

    public WebElement getRealTime() {
        return realTime;
    }

    public WebElement getEventAppname() {
        return eventAppname;
    }

    public WebElement getEvent() {
        return event;
    }

    public WebElement getEventIcon() {
        return eventIcon;
    }

    public WebElement getChartDesc() {
        return chartDesc;
    }

    public WebElement getCustomTitle() {
        return customTitle;
    }

    public WebElement getCountNum() {
        return countNum;
    }

    public WebElement getOpenInSearch() {
        return openInSearch;
    }

    public List<WebElement> getWorkflowList() {
        return workflowList;
    }

    public WebElement getReturnList() {
        return returnList;
    }

    public WebElement getEntry() {
        return entry;
    }

    public WebElement getPreview() {
        return preview;
    }

    public WebElement getDownloadFileName() {
        return downloadFileName;
    }

    public WebElement getDuplicateName() {
        return duplicateName;
    }

    public WebElement getMultiSelect() {
        return multiSelect;
    }

    public WebElement getEnsureDeleteInput() {
        return ensureDeleteInput;
    }

    public WebElement getAppname() {
        return appname;
    }

    public WebElement getFilterInput() {
        return filterInput;
    }

    public WebElement getFilterDropDown1() {
        return filterDropDown1;
    }

    public WebElement getSingleChoice() {
        return singleChoice;
    }

    public WebElement getEnsureDeleteFilter() {
        return ensureDeleteFilter;
    }

    public WebElement getFilterDelete() {
        return filterDelete;
    }

    public WebElement getFilterSetting() {
        return filterSetting;
    }

    public WebElement getFilterName() {
        return filterName;
    }

    public WebElement getFilterTime() {
        return filterTime;
    }

    public WebElement getTimeName() {
        return timeName;
    }

    @FindBy(xpath = "//*[@yotta-test='dashboard-apply_filter-button']")
    private WebElement update;

    public WebElement getUpdate() {
        return update;
    }

    public WebElement getFilterDropdown() {
        filterDropdown.click();
        return super.getLastDropdownList();
    }

    public WebElement getCityTd() {
        return cityTd;
    }

    public WebElement getIconRight() {
        return iconRight;
    }

    public WebElement getGeoCity() {
        return geoCity;
    }

    public WebElement getClickValue() {
        return clickValue;
    }

    public WebElement getClickValue1() {
        return clickValue1;
    }

    public WebElement getStartEnd() {
        return startEnd;
    }

    public WebElement getNewCreat() {
        return newCreat;
    }

    public WebElement getTokenInput() {
        return tokenInput;
    }

    public WebElement getParamDropdown() {
//        return paramDropdown;
        return super.getLastDropdownList();
    }

    public WebElement getParamValue() {
        return paramValue;
    }

    public WebElement getParamValue1() {
        paramValue1.click();
        return super.getLastDropdownList();
    }

    public WebElement getInputSettingTitle() {
        return inputSettingTitle;
    }

    public WebElement getInputGroup() {
        return inputGroup;
    }

    public WebElement getTargetParam() {
        return targetParam;
    }

    public WebElement getNanjingshi() { return nanjingshi; }

    public WebElement getNanjingshiList() { return nanjingshiList; }

    public WebElement getNanjing() { return nanJing; }

    public WebElement getChengdu() { return chengDu; }

    public WebElement getTipOfLack() { return tipOfLack; }

    public WebElement getSplOfLack() { return splOfLack; }

    public WebElement getNoticeMessage() {
        return noticeMessage;
    }

    public WebElement getLackField() {
        return lackField;
    }

    public WebElement getEmptyNotice() {
        return emptyNotice;
    }

    public WebElement getErrorContainPoin() {
        return errorContainPoin;
    }

    public WebElement getErrorNoSpl() {
        return errorNoSpl;
    }

    public WebElement getErrorSpl() {
        return errorSpl;
    }

    public WebElement getDashboardMenu() {
        return dashboardMenu;
    }

    public WebElement getTagMenu() {
        return menuList.get(1);
    }

    public WebElement getTargetTag() {
        return targetTag;
    }

    public WebElement getDateEditor() {
        return dateEditor;
    }

    public WebElement getDashboardTrend1669() {
        return dashboardTrend1669;
    }

    // 获取今天按钮
    @FindBy(xpath = "//*[@yotta-test='date_time_picker-select_shortcut_今天-dom']")
    private WebElement today;

    public WebElement getToday() {
        return today;
    }

    public WebElement getYesterday() {
        return GetTime.getTime(webDriver, "Yesterday");
    }

    @FindBy(xpath = "//*[@yotta-test='date_time_picker-select_shortcut_所有时间-dom']")
    private WebElement wholeTime;

    @FindBy(xpath = "//*[@yotta-test='date_time_picker-select_shortcut_最近7天-dom']")
    private WebElement recentSevenDay;

    @FindBy(xpath = "//div[text()='最近7天']")
    private WebElement recentSevenDay1;

    public WebElement getCustom() {
        return custom;
    }

    public WebElement getUrl() {
        return url;
    }

    public WebElement getDrillAction() {
        drillAction.click();
        return super.getLastDropdownList();
    }

    public WebElement getProvinceDrillAction() {
        provinceDrillAction.click();
        return super.getLastDropdownList();
    }

    public WebElement getCityDrillAction() {
        cityDrillAction.click();
        return super.getLastDropdownList();
    }

    public WebElement getDrillSetting() {
        return drillSetting;
    }

    public WebElement getJsonCallerText() {
        return jsonCallerText;
    }

    public WebElement getJiangsu() {
        return jiangsu;
    }

    public WebElement getShanghai() {
        return shanghai;
    }

    public WebElement getChengdushi() {
        return chengdushi;
    }

    public WebElement getChengDuShi() {
        return chengDuShi;
    }

    public WebElement getChengdushiList() {
        return chengdushiList;
    }

    public WebElement getZhutiao() {
        return zhutiao;
    }

    public WebElement getIpZifu() {
        return ipZifu;
    }

    public WebElement getIp254() {
        return ip254;
    }

    public WebElement getNeimenggu() {
        return neimenggu;
    }

    public WebElement getNeimengguText() {
        return neimengguText;
    }

    public WebElement getTongliaoshiText() {
        return tongliaoshiText;
    }

    public WebElement getTaiwan() {
        return taiwan;
    }

    public WebElement getPartOfPie() {
        return partOfPie;
    }

    public WebElement getMultiYminValue() {
        return multiYminValue;
    }

    public WebElement getMultiYmaxValue() {
        return multiYmaxValue;
    }

    public WebElement getTableRow22() {
        return tableRow22;
    }

    public WebElement getTableRowResplen() {
        return tableRowResplen;
    }

    public WebElement getSingleValue() {
        return singleValue;
    }

    public WebElement getDashboardSingleValue() {
        return dashboardSingleValue;
    }

    public WebElement getSingleValueDiv() {
        return singleValueDiv;
    }

    public WebElement getSingleValue1() {
        return singleValue1;
    }

    public WebElement getDescribeText() {
        return describeText;
    }

    public WebElement getCallChainText() {
        return callChainText;
    }

    public WebElement getSecondCallChainText() {
        return secondCallChainText;
    }

    public WebElement getShowDetails() {
        return showDetails;
    }

    public WebElement getFoldIcon() {
        return foldIcon;
    }

    public WebElement getCallChainTextChildNode() {
        return callChainTextChildNode;
    }

    public WebElement getCallChainDetails() {
        return callChainDetails;
    }

    public WebElement getDescribe() {
        return describe;
    }

    public WebElement getMessage() {
        return message;
    }

    public WebElement getSearch() {
        return super.getButton("搜 索");
    }

    public WebElement getSearchLoading() {
        return super.getContainsTextButton("搜索中");
    }

    public WebElement getDropdownLink() {
        return dropdownLink;
    }

    public WebElement getCheckRight() {
        return checkRight;
    }

    public WebElement getTableHeader() {
        return tableHeader;
    }

    public WebElement getTable() {
        return table;
    }

    public WebElement getRecover() {
        return recover;
    }

    public WebElement getChartContainer() {
        return chartContainer;
    }

    public WebElement getMainTitle() {
        return mainTitle;
    }

    public WebElement getBackgroundColour() {
        return BackgroundColour;
    }

    public WebElement getGreen() {
        return green;
    }

    public WebElement getColorTrigger() {
        return colorTrigger;
    }

    public WebElement getBackground() {
        return this.getTagText("背景");
    }

    public WebElement getText() {
        return this.getTagText("字体");
    }

    public WebElement getStartColour() {
        return super.findInputByPlaceholder("开始");
    }

    public WebElement getEndColour() {
        return super.findInputByPlaceholder("结束");
    }

    public WebElement getAddColourRange() {
        return addColourRange;
    }

    public WebElement getNumberOf61() {
        return numberOf61;
    }

    public WebElement getNumberOf404() {
        return numberOf404;
    }

    public WebElement getRange() {
        return this.getTagText("按区间");
    }

    public WebElement getExhibition() {
        return this.getTagText("展示");
    }

    public WebElement getIcon() { return this.getTagText("图标"); }

    public WebElement getValue() { return this.getTagText("数值"); }

    public WebElement getRegion() {
        return this.getTagText("区域");
    }

    public WebElement getChinaDadio() { return chinaDadio; }

    public WebElement getChinaPoint() { return chinaPoint; }

    public WebElement getProgress() {
        return progress;
    }

    public WebElement getFadingLeave() {
        return fadingLeave;
    }

    public WebElement getSelectionPopover() {
        return selectionPopover;
    }

    public WebElement getSingle() {
        return this.getChart("single");
    }

    private WebElement getChart(String chartName) {
        return webDriver.findElement(By.xpath("(//div[@class='option-img " + chartName + "'])[last()]"));
    }

    public WebElement getSingleChartStatic() {
        return singleChartStatic;
    }

    public WebElement getSingleChartFieldA() {
        return singleChartFieldA;
    }

    public WebElement getChartEditor() {
        return chartEditor;
    }

    public WebElement getChartEditorNumber() {
        return chartEditorNumber;
    }

    public WebElement getIconLoading() {
        return iconLoading;
    }

    public WebElement getTestMoveTag() {
        return testMoveTag;
    }

    public WebElement getJsonEditor() {
        webDriver.findElement(By.id("jsoneditor")).click();
        return jsonEditor;
    }

    public WebElement getCleanJson() {
        return cleanJson;
    }

    public WebElement getOperate() {
        return operate;
    }

    public WebElement getInput() {
        return input;
    }

    public WebElement getTotalPage() {
        return totalPage;
    }

    public WebElement getRemark() {
        return remark;
    }

    public WebElement getRemarkInfo() {
        return remarkInfo;
    }

    public WebElement getMain() {
        return main;
    }

    public WebElement getTrendTitle() {
        return trendTitle;
    }

    public WebElement getCheck() {
        return super.getButton("校验");
    }

    public WebElement getMultiYaxisArea() {
        return multiYaxisArea;
    }

    public WebElement getSectionChartArea() {
        return sectionChartArea;
    }

    public WebElement getChordChart() {
        return chordChart;
    }

    public WebElement getDimensionChart() {
        return dimensionChart;
    }

    public WebElement getSequenceChart() {
        return sequenceChart;
    }

    public WebElement getSwitchToTable() {
        return switchToTable;
    }

    public WebElement getDownloadTableIcon() {
        return downloadTableIcon;
    }

    public WebElement getSequenceChartYaxis() {
        return sequenceChartYaxis;
    }

    public WebElement getMultiYaxisLegend() {
        return multiYaxisLegend;
    }

    public WebElement getLineChartLegend() {
        return lineChartLegend;
    }

    public WebElement getEnsureEdit() {
        return ensureEdit;
    }

    public WebElement getEdit() {
        return edit;
    }

    public WebElement getTextarea() {
        return textarea;
    }

    public WebElement getConfig() {
        return config;
    }

    public WebElement getContent() {
        return content;
    }

    public WebElement getXaxisField() {
        return xaxisField;
    }

    public WebElement getGenerate() {
        return generate;
    }

    public WebElement getFieldValue() {
        fieldValue.click();
        return getLastDropdownList();
    }

    public WebElement getEnsureDeleteChart() {
        return ensureDeleteChart;
    }

    public WebElement getDeleteChart() {
        return deleteChart;
    }

    public WebElement getSettingEnsure() {
        return settingEnsure;
    }

    public WebElement getSpl() {
        return spl;
    }

    public WebElement getConfigs() {
        return configs;
    }

    public WebElement getWholeTime() {
        return this.getDateButton(wholeTime);
    }

    public WebElement getRecentSevenDay() {
        return this.getDateButton(recentSevenDay);
    }

    public WebElement getRecentSevenDay1() {
        return this.getDateButton(recentSevenDay1);
    }

    public List<WebElement> getTableList() {
        return tableList;
    }

    public WebElement getChartSetting() {
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(chartSetting));
        return chartSetting;
    }

    public WebElement getDashboardTrend() {
        return dashboardTrend;
    }

    public WebElement getTrendName() {
        return trendName;
    }

    public WebElement getRadio() {
        return radio;
    }

    public WebElement getAddTag() {
        return addTag;
    }

    public WebElement getTagPageName() {
        return tagPageName;
    }

    public WebElement getSecondTag() { return secondTag; }

    public WebElement getUIautotest() {
        return uiautotest;
    }

    public WebElement getCircular() {
        return circular;
    }

    public WebElement getHeader() {
        return header;
    }

    public WebElement getLabelName() {
        return labelName;
    }

    public WebElement getInputTitle() {
        return titleList.get(titleList.size() - 1);
    }

    public WebElement getSearchInputButton() {
        return searchInputButton;
    }

    // 获取本月按钮
    public WebElement getThisMonth() {
        return GetTime.getTime(webDriver, "ThisMonth");
    }

    public WebElement getTimeRange() {
        return super.getInputElement("搜索时间");
    }

    public WebElement getDefaultDropdownList() {
        defaultValueIcon.click();
        return super.getLastDropdownList();
    }


    @FindBy(xpath = "//*[@yotta-test='dashboard-new_filter_field_value-input']")
    private WebElement dynamicField;

    public WebElement getDynamicField() {
        return dynamicField;
    }

    public WebElement getSearchInput() {
        return searchInput;
    }

    public WebElement getAddChoiceValueButton() {
        return addChoiceValueButton;
    }

    public WebElement getInputType() {
        inputType.click();
        return super.getLastDropdownList();
    }

    public WebElement getHighJsonEditor() {
        return highJsonEditor;
    }

    public WebElement getFilterTitle() {
        return getInput("标题");
    }

    public WebElement getChoiceValue() {
        return choiceValue;
    }

    public WebElement getFilterValue() {
        return filterValue;
    }

    public WebElement getFilterToken() {
        return getInput("标识");
    }

//    public WebElement getFilterToken() {
//        return filterToken;
//    }

    public WebElement getFilterField() {
        return getInput("过滤字段");
    }

    public WebElement getFilterDefaultValue() {
        return getInput("默认值");
    }

//    public WebElement getFilterDefaultValue() {
//        return filterDefaultValue;
//    }

    public WebElement getFilterJoinRow() {
        return filterJoinRow;
    }

    public WebElement getPrefix() {
        return getInput("标识前缀");
    }

    public WebElement getPrefixValue() {
        return getInput("标识值前缀");
    }

    public WebElement getSuffixValue() {
        return getInput("标识值后缀");
    }

    public WebElement getSuffix() {
        return getInput("标识后缀");
    }

    public WebElement getSeparate() {
        return getInput("分隔符");
    }

    public WebElement getEventList() {
        return addChartDropdown;
    }

    public WebElement getAddEventButton() {
        return addEventButton;
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getDeleteTag() {
        return deleteTag;
    }


    public WebElement getDeleteTime() {
        return deleteTime;
    }

    public WebElement getEditTime() {
        return editTime;
    }

    public WebElement getDeleteTimeTag() { return deleteTimeTag; }

    public WebElement getRecoverTag() {
        return recoverTag;
    }

    public WebElement getMoveoutTag() {
        return moveoutTag;
    }

    public WebElement getDropDownLinkButton() {
        return dropDownLinkButton;
    }

    public WebElement getCloseTag() {
        return closeTag;
    }

    public WebElement getDropdownList() {
        return dropdownList;
    }

    public WebElement getSwitchButton() {
        return switchButton;
    }

    public WebElement getTab() {
        return tabList.get(tabList.size() - 1);
    }

    public List<WebElement> getCheckBox() {
        return checkBox;
    }

    public WebElement getSaveAsReportButton() {
        return saveAsReportButton;
    }

    public WebElement getNightModeButton() {
        return nightModeButton;
    }

    public WebElement getFullScreenButton() {
        return fullScreenButton;
    }

    public WebElement getAddButton() {
        return addButton;
    }

    public WebElement getMoveButton() {
        return moveButton;
    }

    public WebElement getRefreshButton() {
        return refreshButton;
    }

    public WebElement getClickableButton() {
        return clickableButton;
    }

    public WebElement getFilter() {
        return filter;
    }

    public WebElement getEventName() {
        return getNewInputElement("名称");
    }

    public WebElement getChartForAdd() { return chartForAdd; }

    public WebElement getRowLayout() { return rowLayout; }

    public WebElement getJoinRow() { return joinRow; }

    public WebElement getLine2() { return line2; }

    public WebElement getLine1() { return line1; }

    public WebElement getEnsureCreateTagButton() {
        return super.getButton("确定");
    }

    public WebElement getEnsureErrorSplButton() { return ensureErrorSplButton; }

    public WebElement getListForBang() { return listForBang; }

    public WebElement getColorValueDefault() { return colorValueDefault; }

    public WebElement getColorValueRandom() { return colorValueRandom; }

    public WebElement getColorValueCustom() { return colorValueCustom; }

    public WebElement getAddValueColor() { return addValueColor; }

    public WebElement getAddRangeColor() { return addRangeColor; }

    public WebElement getFirstValueColor() { return firstValueColor; }

    public WebElement getLowerLimitValue() { return lowerLimitValue; }

    public WebElement getMedianValue() { return medianValue; }

    public WebElement getUpperLimitValue() { return upperLimitValue; }

    public WebElement getChartFontColor() { return chartFontColor; }

    public WebElement getChartFontColorValue() { return chartFontColorValue; }

    public WebElement getChartColumnWidth() { return chartColumnWidth; }

    public WebElement getValueOfNanjing() { return valueOfNanjing; }

    public WebElement getValueOfNanjingDefault() { return valueOfNanjingDefault; }

    public WebElement getChartEditorEnsure() { return chartEditorEnsure; }

    public WebElement getValueOfNanjingTd() { return valueOfNanjingTd; }

    public WebElement getValueOfShenzhenTd() { return valueOfShenzhenTd; }

    public WebElement getValueOfNanjingTdText() { return valueOfNanjingTdText; }

    public WebElement getChartStyleTable() { return chartStyleTable; }

    public WebElement getEnsureMoveTagButton() { return ensureList.get(4); }

    public WebElement getEnsureDeleteTagButton() { return ensureList.get(6); }

    public WebElement getEnsureCreateFilter() { return ensureList.get(8); }

    public WebElement getEnsureCreateInput() { return ensureList.get(9); }

    public WebElement getChartTitle() { return this.getInput("图表标题"); }

    public WebElement getEnsure() { return super.getButton("确定"); }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[contains(text(),'" + name + "')]/following-sibling::div//input"));
    }

    public WebElement getLastDropdownList() {
        String className = "el-select-dropdown__list";
        List<WebElement> list = webDriver.findElements(By.className(className));
        WebElement lastDropdownList = list.get(list.size() - 1);
        if (lastDropdownList.getAttribute("style").contains("display: none;")) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", lastDropdownList);
        }
        WebElement li = lastDropdownList.findElement(By.xpath(".//li"));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(li));
        return lastDropdownList;
    }

    private WebElement getTagText(String text) {
        return webDriver.findElement(By.xpath("//div[contains(text(),'" + text + "')]"));
    }

    private WebElement getNewInputElement(String name) {
        String xpath = "//span[contains(text(),'" + name + "')]/following-sibling::input";
        return webDriver.findElement(By.xpath(xpath));
    }

    private WebElement getLi(String name) {
        String xpath = "//span[text()='" + name + "']/ancestor::li";
        return webDriver.findElement(By.xpath(xpath));
    }

    private WebElement getInput(String name) {
        String xpath = "//label[text()='" + name + "']/ancestor::div/following-sibling::div//input";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getChartEditorColor() {
        chartEditorColor.click();
        return super.getLastDropdownList();
    }

    public WebElement getChartFontStyle() {
        chartFontStyle.click();
        return super.getLastDropdownList();
    }

    public WebElement getChartAlignment() {
        chartAlignment.click();
        return super.getLastDropdownList();
    }

    public WebElement getOpenDrilldown() {
        return getSwitchButton("启用钻取");
    }

    public WebElement getOpenShowCondition() {
        return getSwitchButton("启用展示条件");
    }

    public WebElement getEnsureAddTrend() {
        return super.getButton("确定");
    }

    /**
     * 获取时间控件上的按钮
     *
     * @param webElement 按钮元素
     * @return
     */
    private WebElement getDateButton(WebElement webElement) {
        ExpectedCondition expectedCondition = ExpectedConditions.elementToBeClickable(webElement);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, expectedCondition);
        WebElement e = webElement;
        ConstructPageFactoryWithName c = new ConstructPageFactoryWithName();
        c.constructPageFactoryWithName("splSearch." + parentPageName);
        return e;
    }

    @FindBy(xpath = "//*[@yotta-test='dashboard-new_filter_search-button']")
    private WebElement searchFilterButton;

    public WebElement getSearchFilterButton() {
        return searchFilterButton;
    }

    @FindBy(xpath = "//*[@yotta-test='dashboard-chart_more_config-dropdown']/span/span")
    private WebElement moreChartConfigs;

    public WebElement getMoreChartConfigs() {
        return moreChartConfigs;
    }

    @FindBy(xpath = "//*[@class='yotta-select-selection-icon']/span")
    private WebElement cleanDatevalue;

    public WebElement getCleanDatevalue() {
        return cleanDatevalue;
    }

    @FindBy(xpath = "//li[text()='chart']")
    private WebElement tagChart;

    public WebElement getTagChart() {
        return tagChart;
    }

    @FindBy(xpath = "//li[text()='事件操作']")
    private WebElement eventOpera;

    public WebElement getEventOpera() {
        return eventOpera;
    }

    @FindBy(xpath = "//li[text()='testSearch']")
    private WebElement tagTestSearch;

    public WebElement getTagTestSearch() {
        return tagTestSearch;
    }

    @FindBy(xpath = "//li[text()='钻取跳转']")
    private WebElement tagPageZuanqu;

    public WebElement getTagPageZuanqu() {
        return tagPageZuanqu;
    }

    @FindBy(xpath = "//li[text()='仪表盘事件操作']")
    private WebElement tagPageEvent;

    public WebElement getTagPageEvent() {
        return tagPageEvent;
    }

    @FindBy(xpath = "//li[text()='FirstAutoTest']")
    private WebElement tagPageFirst;

    public WebElement getTagPageFirst() {
        return tagPageFirst;
    }

    @FindBy(xpath = "//span[text()='city']")
    private WebElement cityTargetParam;

    public WebElement getCityTargetParam() {
        return cityTargetParam;
    }

    @FindBy(xpath = "//span[text()='globalTimeRange']")
    private WebElement globalTimeRange;

    public WebElement getGlobalTimeRange() {
        return globalTimeRange;
    }

    @FindBy(xpath = "//*[text()='实时滚动刷新']/parent::label")
    private WebElement actualTimeRefresh;

    public WebElement getActualTimeRefresh() {
        return actualTimeRefresh;
    }

    @FindBy(xpath = "//*[@yotta-test='dashboard-new_filter_value-date_time_picker']")
    private WebElement filterDateEditor;

    public WebElement getFilterDateEditor() {
        return filterDateEditor;
    }

    @FindBy(xpath = "//th//*[text()='appname']")
    private WebElement tabelAppname;

    public WebElement getTabelAppname() {
        return tabelAppname;
    }

    @FindBy(xpath = "//*[text()='山东']")
    private WebElement shanDong;

    public WebElement getShanDong() {
        return shanDong;
    }

    @FindBy(xpath = "//*[@id='search-copy-2']/parent::*")
    private WebElement backIcon;

    public WebElement getBackIcon() {
        return backIcon;
    }


}
