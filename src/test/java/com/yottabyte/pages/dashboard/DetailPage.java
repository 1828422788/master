package com.yottabyte.pages.dashboard;

import com.yottabyte.pages.EditorPage;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.ConstructPageFactoryWithName;
import com.yottabyte.utils.GetTime;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

/**
 * @author sunxj
 */
public class DetailPage extends EditorPage {
    public DetailPage(WebDriver driver) {
        super(driver);
        driver.manage().window().setSize(new Dimension(1920, 1080));
    }

    @FindBy(xpath = "(//span[@aria-label='Ellipsis'])[1]")
    private WebElement tableEditor1;

    @FindBy(xpath = "(//span[@aria-label='Ellipsis'])[2]")
    private WebElement tableEditor2;

    @FindBy(className = "yotta-dropdown-menu" )
    private WebElement tableEditorList;

    @FindBy(xpath = "//span[@aria-label='Visibility']")
    private WebElement hiddenColumns;

    @FindBy(className = "control-panel-content")
    private WebElement filter;

    @FindBy(xpath = "//input[@yotta-test='dashboard-add_events_name-input']")
    private WebElement eventName;

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
    private WebElement errorMessage;

    @FindBy(xpath = "(//span[text()='全局时间']/following-sibling::i)[last()]")
    private WebElement deleteTimeTag;

    @FindBy(xpath = "//*[@yotta-test='dashboard-filter_setting-icon']")
    private WebElement editTime;

    @FindBy(xpath = "//*[@yotta-test='dashboard-add_item-dropdown']/span/span")
    private WebElement addEventButton;

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

    @FindBy(xpath = "//label[contains(text(),'搜索内容')]/following-sibling::div//textarea")
    private WebElement searchInput;

    @FindBy(xpath = "//div[@class='control']/following-sibling::span")
    private WebElement labelName;

    @FindBy(xpath = "//a[contains(text(),'UIautotest')]")
    private WebElement uiautotest;

    @FindBy(xpath = "//a[contains(text(),'测试标签页移出')]")
    private WebElement testMoveTag;

    @FindBy(xpath = "//span[text()='单选']")
    private WebElement radio;

    @FindBy(xpath = "//span[text()='多选']")
    private WebElement multiSelect;

    @FindBy(xpath = "//input[@placeholder='请输入选项值']")
    private WebElement choiceValue;

    @FindBy(xpath = "//input[@yotta-test='dashboard-filter_value-input']")
    private WebElement filterValue;

    @FindBy(xpath = "//*[@placeholder='请输入趋势图名称']")
    private WebElement trendName;

    @FindBy(tagName = "table")
    private List<WebElement> tableList;

    @FindBy(xpath = "//textarea[contains(@yotta-test,'query-textarea')]")
    private WebElement spl;

    @FindBy(className = "widget-chart-settings-content")
    private WebElement content;

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

    @FindBy(xpath = "//div[text()='仪表盘多Y轴图' and @yotta-test='dashboard-chart_title-dom']/parent::div")
    private WebElement multiYaxisArea;

    @FindBy(xpath = "//div[text()='仪表盘区间图' and @yotta-test='dashboard-chart_title-dom']/parent::div")
    private WebElement sectionChartArea;

    @FindBy(xpath = "//div[text()='仪表盘和弦图' and @yotta-test='dashboard-chart_title-dom']/parent::div")
    private WebElement chordChart;

    @FindBy(xpath = "//div[text()='仪表盘饼状图' and @yotta-test='dashboard-chart_title-dom']/parent::div")
    private WebElement dimensionChart;

    @FindBy(xpath = "//div[text()='仪表盘曲线图' and @yotta-test='dashboard-chart_title-dom']/parent::div")
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

    @FindBy(xpath = "(//*[text()='{'])")
    private WebElement input;

    @FindBy(xpath = "//li[contains(text(),'清空JSON')]")
    private WebElement cleanJson;

    @FindBy(className = "ace_text-input")
    private WebElement jsonEditor;

    @FindBy(xpath = "//*[@yotta-test='dashboard-new_filter_value-select']/div")
    private WebElement defaultValueIcon;

    @FindBy(xpath = "(//*[name()='text'])[text()]")
    private WebElement xaxisField;

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

    @FindBy(tagName = "table")
    private WebElement table;

    @FindBy(tagName = "thead")
    private WebElement tableHeader;

    @FindBy(xpath = "//div[@id='fullscreenAll']//label")
    private WebElement dropdownLink;

    @FindBy(xpath = "//span[@yotta-test='dashboard-chart_description-icon']")
    private WebElement describe;

    @FindBy(xpath = "//div[text()='测试描述']")
    private WebElement describeText;

    @FindBy(xpath = "//div[text()='demorpcservice.demo']/parent::div")
    private WebElement callChainText;

    @FindBy(xpath = "//div[text()='demorpcservice.demo']")
    private WebElement secondCallChainText;

    @FindBy(xpath = "//div[text()='元数据']")
    private WebElement showDetails;

    @FindBy(xpath = "//div[text()='demorpcservice.demo']/preceding-sibling::div")
    private WebElement foldIcon;

    @FindBy(xpath = "//div[text()='mould1rpcservice.demoformould1']")
    private WebElement callChainTextChildNode;

    @FindBy(xpath = "//div[text()='元数据']//ancestor::div[contains(@class,'yotta-tabs-top')]/parent::div")
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

    @FindBy(xpath = "//div[text()='行布局趋势图1']/following::div[@yotta-test='dashboard-chart_more_config-dropdown']//*[@aria-label]")
    private WebElement moreXuanTing;

    @FindBy(xpath = "//div[text()='行布局趋势图2']/following::div[@yotta-test='dashboard-chart_more_config-dropdown']//*[@aria-label]")
    private WebElement moreXuanTing2;

    @FindBy(xpath = "//div[text()='行布局趋势图2']/following-sibling::div//span[@yotta-test='dashboard-delete_chart-icon']")
    private WebElement deleteTrend2;

    @FindBy(xpath = "//div[text()='行布局趋势图1']/following-sibling::div//span[@yotta-test='dashboard-delete_chart-icon']")
    private WebElement deleteTrend1;

    @FindBy(xpath = "//div[text()='行布局趋势图1']")
    private WebElement trendOne;

    @FindBy(xpath = "//div[text()='行布局趋势图2']")
    private WebElement trendTwo;

    @FindBy(xpath = "//div[text()='行布局趋势图3']")
    private WebElement trendThree;

    @FindBy(xpath = "//span[text()='操作']")
    private WebElement operate;

    @FindBy(xpath = "//span[text()='phplib/xiaomi/Model/Device/Event.php:451']")
    private WebElement jsonCallerText;

    @FindBy(xpath = "(//*[name()='rect'and @height=22])")
    private WebElement zhutiao;

    @FindBy(xpath = "(//*[name()='rect' and @height>22 and @clip-path and (@fill='#A114F9' or @fill='#F80050')])[last()]")
    private WebElement zhutiao2;

    @FindBy(xpath = "(//*[name()='text'])[text()='64.20.177.254']")
    private WebElement ipZifu;

    @FindBy(xpath = "//span[text()='64.20.177.254']")
    private WebElement ip254;

    @FindBy(xpath = "(//*[text()='1']/parent::*[name()='g'])[last()]")
    private WebElement taiwan;

    @FindBy(xpath = "(//*[text()='1']/parent::*[name()='g'])[1]")
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

    @FindBy(xpath = "//div[text()='钻取变量单值']/following-sibling::div[last()]/div/div[last()]//span")
    private WebElement singleValue;

    @FindBy(xpath = "//div[text()='仪表盘单值' and @yotta-test='dashboard-chart_title-dom']/following-sibling::div[last()]//span[1]")
    private WebElement dashboardSingleValue;

    @FindBy(xpath = "//span[text()='thumbs-up:']/parent::div/parent::div")
    private WebElement singleValueDiv;

    @FindBy(xpath = "//div[contains(@class,'single')]//span[contains(text(),':')]")
    private WebElement singleValue1;

    @FindBy(xpath = "//div[@yotta-test='dashboard-drilldown_type-select']//div[contains(@class,'yotta-select-selection')]")
    private WebElement drillAction; //钻取类型

    @FindBy(xpath = "//div[@yotta-test='dashboard-drilldown_map_province-select']//div[contains(@class,'yotta-select-selection')]")
    private WebElement provinceDrillAction; //省下钻字段

    @FindBy(xpath = "//div[@yotta-test='dashboard-drilldown_map_city-select']//div[contains(@class,'yotta-select-selection')]")
    private WebElement cityDrillAction; //市下钻字段

    @FindBy(xpath = "//textarea[@yotta-test='dashboard-drilldown_custom_url-textarea']")
    private WebElement url;

    @FindBy(xpath = "//div[text()='自定义']")
    private WebElement custom;

    @FindBy(xpath = "//span[contains(@class,'yotta-date-time-picker-text')]")
    private WebElement dateEditor;

    @FindBy(xpath = "//*[@yotta-test='dashboard-drilldown_tab_target_tab-cascader']")
    private WebElement targetTag;

    @FindBy(xpath = "//label[contains(text(),'目标参数')]/following-sibling::div/div")
    private WebElement targetParam;

    @FindBy(xpath = "//div[text()='=']//span")
    private WebElement paramValue;

    @FindBy(xpath = "//span[text()='${click.value2}']")
    private WebElement clickValue;

    @FindBy(xpath = "//span[text()='${click.value}']")
    private WebElement clickValue1;

    @FindBy(xpath = "//span[text()='${start},${end}']")
    private WebElement startEnd;

    @FindBy(xpath = "//*[@yotta-test='dashboard-drilldown_filter_add-input']")
    private WebElement addDrilldownFilter;

    @FindBy(xpath = "//*[@yotta-test='dashboard-drilldown_filter_action-select']")
    private WebElement optionItems;

    @FindBy(xpath = "//input[@yotta-test='dashboard-filter_value-input']")
    private WebElement geoCity;

    @FindBy(xpath = "//div[contains(@class,'filter')]/div[1]")
    private WebElement firstFilterElement;

    @FindBy(xpath = "//input[@yotta-test='dashboard-new_filter_width-number_input']")
    private WebElement filterWidth;

    @FindBy(xpath = "//input[@yotta-test='dashboard-new_filter_width-number_input']/following-sibling::span//*[@aria-label='Up']")
    private WebElement increaseWidth;

    @FindBy(xpath = "//input[@yotta-test='dashboard-new_filter_width-number_input']/following-sibling::span//*[@aria-label='Down']")
    private WebElement decreaseWidth;

    @FindBy(xpath = "(//div[@class='yotta-event-list-body']//div[contains(@class,'event-action-icon-dropdown')]/span)[1]")
    private WebElement eventOperate;

    @FindBy(xpath = "(//div[@class='event-item']/span)[1]")
    private WebElement iconRight;

    @FindBy(xpath = "//span[text()='apache.geo.city:']/following-sibling::span/span/span")
    private WebElement cityTd;

    @FindBy(xpath = "//*[@yotta-test='dashboard-filter_value-select']/div")
    private WebElement filterDropdown;

    @FindBy(xpath = "//*[@yotta-test='dashboard-filter_value-select']//input")
    private WebElement filterDropdownInput;

    @FindBy(xpath = "//span[text()='filter']")
    private WebElement filterName;

    @FindBy(xpath = "//span[text()='time']")
    private WebElement filterTime;

    @FindBy(xpath = "//span[text()='全局时间']")
    private WebElement timeName;

    @FindBy(xpath = "//span[contains(text(),'16:33:25')]/ancestor::tr//span[text()='000000001203094955']")
    private WebElement entry;

    @FindBy(xpath = "//span[text()='filter']/following-sibling::span")
    private WebElement filterSetting;

    @FindBy(xpath = "//span[text()='单选']/ancestor::label")
    private WebElement singleChoice;

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

    @FindBy(xpath = "//span[text()='在搜索中打开']")
    private WebElement openInSearch;

    @FindBy(xpath = "//span[text()='24']")
    private WebElement countNum;

    @FindBy(xpath = "//div[@yotta-test='dashboard-chart_title-dom']")
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

    @FindBy(xpath = "//*[@yotta-test='dashboard-tab_config-dropdown']/span")
    private WebElement settingIcon;

    @FindBy(xpath = "//*[@yotta-test='dashboard-chart_setting-dom']")
    private WebElement settingChart;

    @FindBy(xpath = "(//ul[contains(@class,'yotta-menu')])[1]/li")
    private List<WebElement> liList;

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

    @FindBy(xpath = "//input[@yotta-test='dashboard-nav_filter-input']")
    private WebElement searchTagInput;

    @FindBy(xpath = "//*[@yotta-test='dashboard-nav_expand-icon']")
    private WebElement showDashboards;

    @FindBy(xpath = "//div[@yotta-test='dashboard-nav_tab-dropdown']//span[text()='testSearch']")
    private WebElement firstTag;

    @FindBy(xpath = "(//div[@class='yotta-tree-node']//span[text()])[last()]")
    private WebElement lastTag;

    @FindBy(xpath = "(//span[@aria-label='FolderOpen']/ancestor::div[1]//*[@yotta-test])[1]")
    private WebElement lastDashboard;

    @FindBy(xpath = "//div[@class='yotta-tree-node']//span[text()='first']")
    private WebElement first;

    @FindBy(xpath = "//span[text()='新建标签页']")
    private WebElement createNewTag;

    public WebElement getCreateNewTag() {
        return createNewTag;
    }

    @FindBy(xpath = "//span[text()='设为默认']")
    private WebElement setAsDefault;

    public WebElement getSetAsDefault() {
        return setAsDefault;
    }

    @FindBy(xpath = "//span[text()='删除']")
    private WebElement deleteNewTag;

    @FindBy(xpath = "//input[@yotta-test='dashboard-tab_name-input']")
    private WebElement inputforTag;
    public WebElement getInputforTag() {
        return inputforTag;
    }

    @FindBy(xpath = "//span[text()='编辑']")
    private WebElement editTag;

    @FindBy(xpath = "//label[text()='所有时间']/following-sibling::i[4]")
    private WebElement forthIcon;

    @FindBy(xpath = "//*[@yotta-test='dashboard-dashboard_list-dropdown']/span")
    private WebElement dashboardIcon;

    @FindBy(xpath = "//span[@aria-label='FolderOpen']/parent::span//following-sibling::span//*[@yotta-test='dashboard-nav_dashboard-dom']")
    private WebElement currentDashboard;

    @FindBy(xpath = "//button[@yotta-test='dashboard-back_to_list-button']")
    private WebElement returnToList;

    @FindBy(xpath = "//span[text()='appname:']")
    private WebElement hoverElement;

    @FindBy(xpath = "//input[@yotta-test='dashboard-new_tab_name-input']")
    private WebElement tagName;

    public WebElement getTagName() {
        return tagName;
    }

    public WebElement getNewRowName() {
        return getYottaInput("dashboard-new_row_name-input");
    }

    public WebElement getEditRowName() {
        return getYottaInput("dashboard-edit_row_name-input");
    }

    @FindBy(xpath = "//span[contains(text(),'行布局')]/preceding-sibling::span")
    private WebElement rowLayout;

    @FindBy(xpath = "//span[text()='标识']/ancestor::div/following-sibling::div//input")
    private WebElement filterToken;

    @FindBy(id = "filter_textValue")
    private WebElement filterDefaultValue;

    @FindBy(xpath = "//div[text()='快捷选项']")
    private WebElement shortcut;

    @FindBy(xpath = "//*[@class='yotta-cascader-menu'][last()]")
    private WebElement dashboardMenu;

    @FindBy(xpath = "//*[@class='yotta-dropdown-menu'][last()]")
    private WebElement chartDropdown;

    @FindBy(xpath = "//span[contains(@class,'yotta-icon-ChartSquare')]")
    private WebElement chartType;

    @FindBy(xpath = "(//span[contains(@class,'yotta-icon-ChartSquare')])[2]")
    private WebElement secondChartType;

    @FindBy(xpath = "//div[contains(@class,'table')]//parent::div/preceding-sibling::div[contains(@class,'config')]//span[@yotta-test='dashboard-chart_type-dom']")
    private WebElement lastChartType;

    @FindBy(xpath = "//*[@yotta-test='dashboard-delete_chart-icon']")
    private WebElement delete;

    @FindBy(xpath = "//div[text()='仪表盘单值']/following-sibling::div/label")
    private WebElement timeRangeDanzhi;

    @FindBy(xpath = "//label[text()='本月']/following-sibling::i[4]")
    private WebElement deleteForTable;

    @FindBy(xpath = "//div[@yotta-test='dashboard-chart_title-dom']/parent::div")
    private WebElement fullScreen;

    @FindBy(className = "ace_text-layer")
    private WebElement textLayer;

    @FindBy(id = "ace-nav")
    private WebElement textAce;

    @FindBy(xpath = "//input[@yotta-test='dashboard-add_chart_filter_name-input']")
    private WebElement searchChartInput;

    @FindBy(xpath = "(//*[contains(@class,'yotta-select-option')])[last()]")
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

    @FindBy(xpath = "//label[text()='字体颜色：']/following-sibling::div//div[@class='color-picker-indicator']")
    private WebElement chartFontColor;

    @FindBy(xpath = "//span[contains(@class,'prefix')]/following-sibling::input")
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

    @FindBy(xpath = "//tr[1]/td[1]")
    private WebElement firstColumnFirstValue;

    @FindBy(xpath = "//tr[1]/td[2]")
    private WebElement secondColumnFirstValue;

    @FindBy(xpath = "//div[text()='仪表盘表格' and @yotta-test='dashboard-chart_title-dom']/parent::div")
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
        return lastFilter;
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

    public WebElement getMoreConfig() {
        return moreConfig;
    }

    public WebElement getMoreConfigs() {
        return moreConfigs;
    }

    public WebElement getAddInput() {
        return addInput;
    }

    public WebElement getTimeRangeDanzhi() {
        return timeRangeDanzhi;
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

    public WebElement getEditRowIcon() {
        return editRowIcon;
    }

    public WebElement getDeleteRowIcon() {
        return deleteRowIcon;
    }

    public WebElement getDeleteNoNameRowIcon() {
        return deleteNoNameRowIcon;
    }

    public WebElement getFirstRow() {
        return firstRow;
    }

    public WebElement getInnerInputFilter() {
        return innerInputFilter;
    }

    public WebElement getRowEventName() {
        return rowEventName;
    }

    public WebElement getMoreXuanTing() {
        return moreXuanTing;
    }

    public WebElement getMoreXuanTing2() {
        return moreXuanTing2;
    }

    public WebElement getDeleteTrend2() {
        return deleteTrend2;
    }

    public WebElement getDeleteTrend1() {
        return deleteTrend1;
    }

    public WebElement getTrendOne() {
        return trendOne;
    }

    public WebElement getTrendTwo() {
        return trendTwo;
    }

    public WebElement getTrendThree() {
        return trendThree;
    }

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

    public WebElement getEventOperate() {
        return eventOperate;
    }

    public WebElement getHoverElement() {
        return hoverElement;
    }

    public WebElement getReturnToList() {
        return returnToList;
    }

    public WebElement getCurrentDashboard() {
        return currentDashboard;
    }

    public WebElement getDashboardIcon() {
        return dashboardIcon;
    }

    public WebElement getShowDashboards() {
        return showDashboards;
    }

    public WebElement getFirstTag() {
        return firstTag;
    }

    public WebElement getLastTag() {
        return lastTag;
    }

    public WebElement getLastDashboard() {
        return lastDashboard;
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

    private WebElement getSwitchButton(String name) {
        String xpath = "//span[contains(text(),'" + name + "')]/following-sibling::label";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getSettingIcon() {
        return settingIcon;
    }

    public WebElement getSettingChart() {
        return settingChart;
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

    public WebElement getMultiSelect() {
        return multiSelect;
    }

    public WebElement getAppname() {
        return appname;
    }

    public WebElement getFilterInput() {
        return super.getYottaInput("dashboard-filter_value-input");
    }

    public WebElement getSingleChoice() {
        return singleChoice;
    }

    public WebElement getFilterSetting() {
        return super.getYottaSpan("dashboard-filter_setting-icon");
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

    public WebElement getFilterDropdownInput() {
        filterDropdown.click();
        return filterDropdownInput;
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

    public WebElement getFirstFilterElement() {
        return firstFilterElement;
    }

    public WebElement getFilterWidth() {
        return filterWidth;
    }

    public WebElement getIncreaseWidth() {
        return increaseWidth;
    }

    public WebElement getDecreaseWidth() {
        return decreaseWidth;
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

    public WebElement getAddDrilldownFilter() {
        return getYottaSpan("dashboard-drilldown_filter_add-input");
    }

    public WebElement getTokenInput() {
        return getYottaInput("dashboard-drilldown_filter_token-input");
    }

    public WebElement getParamValue() {
        return paramValue;
    }

    public WebElement getParameterValue() {
        return dropdownUtils.getYottaDropdownList("dashboard-drilldown_filter_value-select");
    }

    public WebElement getTargetParam() {
        return targetParam;
    }

    public WebElement getDashboardMenu() {
        return dashboardMenu;
    }

    public WebElement getTargetTag() {
        return targetTag;
    }

    public WebElement getDateEditor() {
        return dateEditor;
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

    public WebElement getZhutiao() {
        return zhutiao;
    }

    public WebElement getZhutiao2() {
        return zhutiao2;
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
    public WebElement getSearch() {
        return super.getButton("搜 索");
    }

    public WebElement getSearchLoading() {
        return super.getContainsTextButton("搜索中");
    }

    public WebElement getDropdownLink() {
        return dropdownLink;
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
        return super.getInputByPlaceholder("开始");
    }

    public WebElement getEndColour() {
        return super.getInputByPlaceholder("结束");
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

    public WebElement getIcon() {
        return this.getTagText("图标");
    }

    public WebElement getValue() {
        return this.getTagText("数值");
    }

    public WebElement getRegion() {
        return this.getTagText("区域");
    }

    public WebElement getChinaDadio() {
        return chinaDadio;
    }

    public WebElement getChinaPoint() {
        return chinaPoint;
    }

    public WebElement getProgress() {
        return progress;
    }

    public WebElement getSingle() {
        return this.getChart("single");
    }

    private WebElement getChart(String chartName) {
        return webDriver.findElement(By.xpath("(//div[@class='option-img " + chartName + "'])[last()]"));
    }

    public WebElement getTableEditor1() {
        try{
            Thread.sleep(700);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(tableEditor1));
        ClickEvent.clickUnderneathButton(tableEditor1);
        return tableEditorList;
    }

    public WebElement getTableEditor2() {
        try{
            Thread.sleep(700);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(tableEditor2));
        ClickEvent.clickUnderneathButton(tableEditor2);
        return tableEditorList;
    }

    public WebElement getHiddenColumns() {
        return hiddenColumns;
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

    public WebElement getContent() {
        return content;
    }

    public WebElement getXaxisField() {
        return xaxisField;
    }

    public WebElement getGenerate() {
        return generate;
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

    public WebElement getSecondTag() {
        return secondTag;
    }

    public WebElement getUIautotest() {
        return uiautotest;
    }

    public WebElement getLabelName() {
        return labelName;
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
        return getYottaInput("dashboard-new_filter_option_alias-input");
    }

    public WebElement getChoiceValue() {
        return choiceValue;
    }

    public WebElement getFilterValue() {
        return filterValue;
    }

    public WebElement getFilterToken() {
        return getYottaInput("dashboard-new_filter_token-input");
    }

    public WebElement getFilterField() {
        return getInput("过滤字段");
    }

    public WebElement getFilterDefaultValue() {
        return getInput("默认值");
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

    public WebElement getDeleteFilter() {
        return super.getYottaSpan("dashboard-delete_filter-icon");
    }

    public WebElement getEditTime() {
        return editTime;
    }

    public WebElement getDeleteTimeTag() {
        return deleteTimeTag;
    }

    public WebElement getMoveoutTag() {
        return moveoutTag;
    }

    public WebElement getFilter() {
        return filter;
    }

    public WebElement getEventName() {
        return eventName;
    }

    public WebElement getRowLayout() {
        return rowLayout;
    }

    public WebElement getListForBang() {
        return listForBang;
    }

    public WebElement getColorValueDefault() {
        return colorValueDefault;
    }

    public WebElement getColorValueRandom() {
        return colorValueRandom;
    }

    public WebElement getColorValueCustom() {
        return colorValueCustom;
    }

    public WebElement getAddValueColor() {
        return addValueColor;
    }

    public WebElement getAddRangeColor() {
        return addRangeColor;
    }

    public WebElement getFirstValueColor() {
        return firstValueColor;
    }

    public WebElement getLowerLimitValue() {
        return lowerLimitValue;
    }

    public WebElement getMedianValue() {
        return medianValue;
    }

    public WebElement getUpperLimitValue() {
        return upperLimitValue;
    }

    public WebElement getChartFontColor() {
        return chartFontColor;
    }

    public WebElement getChartFontColorValue() {
        return chartFontColorValue;
    }

    public WebElement getChartColumnWidth() {
        return chartColumnWidth;
    }

    public WebElement getValueOfNanjing() {
        return valueOfNanjing;
    }

    public WebElement getValueOfNanjingDefault() {
        return valueOfNanjingDefault;
    }

    public WebElement getChartEditorEnsure() {
        return chartEditorEnsure;
    }

    public WebElement getValueOfNanjingTd() {
        return valueOfNanjingTd;
    }

    public WebElement getValueOfShenzhenTd() {
        return valueOfShenzhenTd;
    }

    public WebElement getValueOfNanjingTdText() {
        return valueOfNanjingTdText;
    }

    public WebElement getFirstColumnFirstValue() {
        return firstColumnFirstValue;
    }

    public WebElement getSecondColumnFirstValue() {
        return secondColumnFirstValue;
    }

    public WebElement getChartStyleTable() {
        return chartStyleTable;
    }

    public WebElement getChartTitle() {
        return this.getInput("图表标题");
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[contains(text(),'" + name + "')]/following-sibling::div//input"));
    }

    private WebElement getTagText(String text) {
        return webDriver.findElement(By.xpath("//div[contains(text(),'" + text + "')]"));
    }

    private WebElement getNewInputElement(String name) {
        String xpath = "//span[contains(text(),'" + name + "')]/following-sibling::input";
        return webDriver.findElement(By.xpath(xpath));
    }

    private WebElement getLi(String name) {
        String xpath = "//span[contains(text(),'" + name + "')]/ancestor::li";
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

    @FindBy(xpath = "//input[@yotta-test='dashboard-toggle_row_condition-switch']/parent::span/parent::label")
    private WebElement newOpenShowCondition;
    private WebElement getNewOpenShowCondition() {
        return newOpenShowCondition;
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

    public WebElement getSearchFilterButton() {
        return super.getYottaButton("dashboard-new_filter_search-button");
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

    @FindBy(xpath = "(//div[@yotta-test='dashboard-nav_tab-dropdown']//span[text()='testSearch']) | (//li[contains(@class,'yotta-cascader-menu-item') and text()='testSearch'])")
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

    @FindBy(xpath = "(//*[@yotta-test='dashboard-filter_value-select']/div/div//span)[last()]")
    private WebElement lastFilterSpan;
    public WebElement getLastFilterSpan() {
        return lastFilterSpan;
    }

    @FindBy(xpath = "(//*[@yotta-test='dashboard-filter_value-select']/div/div//span/input)[last()]")
    private WebElement lastFilterInput;
    public WebElement getLastFilterInput() {
        return lastFilterInput;
    }

    @FindBy(xpath = "//input[@value='reference']/ancestor::label")
    private WebElement reference;
    public WebElement getReference() {
        return reference;
    }

    @FindBy(xpath = "//input[@value='clone']/ancestor::label")
    private WebElement clone;
    public WebElement getClone() {
        return clone;
    }

    @FindBy(xpath = "//*[@yotta-test='dashboard-collect-icon']")
    private WebElement addToCollection;
    public WebElement getAddToCollection() {
        return addToCollection;
    }

    @FindBy(xpath = "//*[@yotta-test='dashboard-cancel_collect-icon']")
    private WebElement cancelCollection;
    public WebElement getCancelCollection() {
        return cancelCollection;
    }

    @FindBy(xpath = "//div[@yotta-test='dashboard-dashboard_index-tree']")
    private WebElement dashboardList;
    public WebElement getDashboardList() {
        return dashboardList;
    }

    public WebElement getContextMenu() {
        return dropdownUtils.getParentElementOfMenuList();
    }

    public WebElement getDashboardName(String name) {
        return webDriver.findElement(By.xpath("//*[@yotta-test='dashboard-nav_dashboard-dom' and text()='" + name + "']"));
    }

    public WebElement getTabName(String name) {
        return webDriver.findElement(By.xpath("//*[@yotta-test='dashboard-nav_tab-dom']//span[text()='" + name + "']"));
    }

    public WebElement getAddItemMenu() {
        return dropdownUtils.getParentElementOfMenuListByXpath("//div[@yotta-test='dashboard-add_item-dropdown']/span");
    }

    public WebElement getFilterType() {
        return dropdownUtils.getYottaDropdownList("dashboard-new_filter_type-select");
    }

    public WebElement getRowMenu() {
        return dropdownUtils.getDropdownListbyPath("//div[@yotta-test='dashboard-add_chart_row-select' or @yotta-test='dashboard-new_filter_row-select' or @yotta-test='dashboard-add_events_row-select']//span");
    }

    public WebElement getDialogMessage() {
        return super.getYottaDiv("dashboard-confirm_content-dom");
    }
}
