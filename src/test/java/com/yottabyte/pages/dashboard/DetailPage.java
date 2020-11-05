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
    }

    @FindBy(className = "el-loading-mask")
    private WebElement loading;

    @FindBy(xpath = "//span[contains(text(),'确定')]")
    private List<WebElement> ensureList;

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

    @FindBy(xpath = "//div[@class='ant-modal-body']//span[text()='确定']/ancestor::button")
    private WebElement ensureErrorSplButton;

    @FindBy(xpath = "//div[@class='ant-checkbox-group']//span[@class='ant-checkbox']")
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

    @FindBy(className = "ant-message-success")
    private WebElement successMessage;

    @FindBy(className = "ant-message-error")
    private WebElement errorMessage;

    @FindBy(xpath = "(//span[text()='全局时间']/following-sibling::i)[last()]")
    private WebElement deleteTimeTag;

    @FindBy(xpath = "(//span[text()='filter']/following-sibling::i)[last()]")
    private WebElement deleteTag;

    @FindBy(xpath = "(//span[text()='time']/following-sibling::i)[1]")
    private WebElement editTime;

    @FindBy(xpath = "(//span[text()='time']/following-sibling::i)[last()]")
    private WebElement deleteTime;

    @FindBy(xpath = "//i[@class='anticon css-ifnfqv ant-dropdown-trigger']")
    private WebElement addEventButton;

    @FindBy(className = "yw-dropdown-menu")
    private List<WebElement> eventList;

    @FindBy(xpath = "//div[@id='filter_type']//i")
    private WebElement inputType;

    @FindBy(xpath = "//span[text()='添加']")
    private WebElement addChoiceValueButton;

    @FindBy(xpath = "//span[text()='添加行']")
    private WebElement addRow;

    @FindBy(xpath = "//span[text()='添加图表']")
    private WebElement addChart;

    @FindBy(xpath = "//span[text()='添加图表']/ancestor::li")
    private WebElement addChartItem;

    @FindBy(xpath = "//span[text()='添加事件列表']")
    private WebElement addEvent;

    @FindBy(xpath = "//span[text()='添加过滤项']")
    private WebElement addFilter;

    @FindBy(xpath = "//span[text()='添加输入项']")
    private WebElement addInput;

    @FindBy(xpath = "//div[@class='el-form-item dynamic-search-btn']//span")
    private WebElement searchInputButton;

    @FindBy(xpath = "//*[@id='filter_title']")
    private WebElement inputSettingTitle;

    @FindBy(xpath = "//div[text()='文本输入']")
    private WebElement inputSettingType;

    @FindBy(xpath = "//li[text()='时间范围']")
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

    @FindBy(xpath = "//li[contains(text(),' 测试市')]")
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

    @FindBy(xpath = "//textarea[@class='ant-input']")
    private WebElement spl;

    @FindBy(xpath = "(//*[@class='el-dialog__body']/following-sibling::div//button/span[contains(text(),'确定')])[last()]")
    private WebElement settingEnsure;

    @FindBy(xpath = "//div[text()='仪表盘所用趋势图']/following-sibling::div//*[@class='anticon css-ifnfqv'][2]")
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

    @FindBy(xpath = "//div[text()='404']/ancestor::div[contains(@class,'sc-AxirZ')]")
    private WebElement multiYaxisLegend;

    @FindBy(xpath = "//div[@id='fullscreenAll']//div[@id]/div[1]")
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

    @FindBy(xpath = "//span[contains(text(),'默认值')]/ancestor::div/following-sibling::div//div[@id]")
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

    @FindBy(xpath = "(//div[@id='fullscreenAll']//div[@id]/div/following-sibling::div)[2]/i")
    private WebElement describe;

    @FindBy(xpath = "//div[text()='测试描述']")
    private WebElement describeText;

    @FindBy(xpath = "//div[text()='第一行']/preceding-sibling::div/i[1]")
    private WebElement editRowIcon;

    @FindBy(xpath = "//div[text()='首行']/preceding-sibling::div/i[2]")
    private WebElement deleteRowIcon;

    @FindBy(xpath = "//div[@id='fullscreenAll']/div/div/i[last()]")
    private WebElement deleteNoNameRowIcon;

    @FindBy(xpath = "//div[text()='首行']")
    private WebElement firstRow;

    @FindBy(xpath = "//div[text()='中国']")
    private WebElement chinaDadio;

    @FindBy(xpath = "//div[text()='首行']/following-sibling::div//span[text()='innerFilter']")
    private WebElement innerInputFilter;

    @FindBy(xpath = "//div[text()='首行']/following-sibling::div//div[text()='测试行事件']")
    private WebElement rowEventName;

    @FindBy(xpath = "//div[text()='行布局趋势图1']/following-sibling::div[1]/i")
    private WebElement moreXuanTing;

    @FindBy(xpath = "//div[text()='行布局趋势图2']/following-sibling::div[1]/i[2]")
    private WebElement moreXuanTing2;

    @FindBy(xpath = "//div[text()='行布局趋势图2']/following-sibling::div[1]/i[3]")
    private WebElement deleteTrend2;

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

    @FindBy(xpath = "//span[text()='江苏']")
    private WebElement jiangsu;

    @FindBy(xpath = "//span[text()='上海市']")
    private WebElement  shanghai;

    @FindBy(xpath = "//span[text()='成都市 ']")
    private WebElement  chengdushi;

    @FindBy(xpath = "//span[text()='成都市']")
    private WebElement  chengDuShi;

    @FindBy(xpath = "//li[text()='成都市']")
    private WebElement  chengdushiList;

    @FindBy(xpath = "(//*[name()='rect'])[3]")
    private WebElement zhutiao;

    @FindBy(xpath = "(//*[name()='text'])[text()='64.20.177.254']")
    private WebElement ipZifu;

    @FindBy(xpath = "(//*[name()='circle'])[last()]")
    private WebElement taiwan;

    @FindBy(xpath = "(//*[name()='circle'])[1]")
    private WebElement neimenggu;

    @FindBy(xpath = "(//*[name()='text'])[text()='64.20.177.254']/preceding-sibling::*")
    private WebElement partOfPie;

    @FindBy(xpath = "//span[text()='36.46.208.22']")
    private WebElement tableRow22;

    @FindBy(xpath = "//table/tbody/tr[1]/td[2]")
    private WebElement tableRowResplen;

    @FindBy(xpath = "//div[text()='钻取变量单值']/following-sibling::div[last()]/div/div[last()]/div/span")
    private WebElement singleValue;

    @FindBy(xpath = "//div[text()='钻取变量单值value']/following-sibling::div[last()]/div/div[last()]/div/span")
    private WebElement singleValue1;

    @FindBy(xpath = "//label[text()='点击图表时']/following-sibling::div[@class='ant-select ant-select-enabled']")
    private WebElement drillAction;

    @FindBy(xpath = "//label[contains(text(),'自定义URL')]/following-sibling::textarea")
    private WebElement url;

    @FindBy(xpath = "//div[text()='自定义']")
    private WebElement custom;

    @FindBy(xpath = "(//input[@placeholder='请选择时间'])[last()]")
    private WebElement dateEditor;

    @FindBy(className = "ant-cascader-picker")
    private WebElement targetTag;

    @FindBy(className = "el-cascader-menu")
    private List<WebElement> menuList;

    @FindBy(xpath = "//label[contains(text(),'目标参数')]/following-sibling::div")
    private WebElement targetParam;

    @FindBy(xpath = "(//ul[@class='ant-select-dropdown-menu-item-group-list'])[1]")
    private WebElement inputGroup;

    @FindBy(xpath = "//div[text()='=']//i")
    private WebElement paramValue;

    @FindBy(xpath = "//div[text()='=']/div[2]//i")
    private WebElement paramValue1;

    @FindBy(className = "is-multiple")
    private WebElement paramDropdown;

    @FindBy(xpath = "//span[text()='${click.value2}']")
    private WebElement clickValue;

    @FindBy(xpath = "//span[text()='${click.value}']")
    private WebElement clickValue1;

    @FindBy(xpath = "//span[text()='${start},${end}']")
    private WebElement startEnd;

    @FindBy(xpath = "//span[text()='+ 新建']/ancestor::button")
    private WebElement newCreat;

    @FindBy(xpath = "(//input[@class='ant-input'])[not(@placeholder)]/preceding-sibling::div")
    private WebElement optionItems;

    @FindBy(xpath = "(//input[@class='ant-input'])[not(@placeholder)]")
    private WebElement tokenInput;

    @FindBy(xpath = "(//input[@class='ant-input'])[not(@placeholder)]/following-sibling::div")
    private WebElement optionFilterValue;

    @FindBy(xpath = "//div[contains(@class,'yw-filter-container')]//input[@class='ant-input']")
    private WebElement geoCity;

    @FindBy(xpath = "(//i[contains(@class,'ant-dropdown-trigger')][contains(@class,'anticon css-ifnfqv')])[4]")
    private WebElement eventOperate;

    @FindBy(xpath = "//span[text()='事件列表']/ancestor::div/following-sibling::div//i")
    private WebElement iconRight;

    @FindBy(xpath = "//span[text()='apache.geo.city']/following-sibling::span/pre/span")
    private WebElement cityTd;

    @FindBy(className = "ant-select-selection")
    private WebElement filterDropdown;

    @FindBy(xpath = "//span[text()='filter']")
    private WebElement filterName;

    @FindBy(xpath = "//span[text()='time']")
    private WebElement filterTime;

    @FindBy(xpath = "//span[text()='全局时间']")
    private WebElement timeName;

    @FindBy(xpath = "(//span[text()='000000001203094955'])[2]")
    private WebElement entry;

    @FindBy(xpath = "//span[text()='filter']/following-sibling::i")
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

    @FindBy(xpath = "//li[text()='南京市']")
    private WebElement nanjingshiList;

    @FindBy(xpath = "//div[text()='南京市']")
    private WebElement nanJing;

    @FindBy(xpath = "//div[text()='成都市']")
    private WebElement chengDu;

    @FindBy(xpath = "//div[text()='缺少动态字段值']")
    private WebElement tipOfLack;

    @FindBy(xpath = "//div[text()='请填写查询语句']")
    private WebElement splOfLack;

    @FindBy(xpath = "//div[@class='ant-message-notice']//span")
    private WebElement noticeMessage;

    @FindBy(xpath = "//p[text()='缺少选中的字段']")
    private WebElement lackField;

    @FindBy(xpath = "//div[text()='无效标识 包含（.）']")
    private WebElement errorContainPoin;

    @FindBy(xpath = "//div[text()='请填写查询语句']")
    private WebElement errorNoSpl;

    @FindBy(xpath = "//p[text()='搜索语句须为stats类型']")
    private WebElement errorSpl;

    @FindBy(xpath = "//span[text()='filter']/ancestor::div/following-sibling::div//input")
    private WebElement filterDropDown1;

    @FindBy(xpath = "//th[text()='appname']")
    private WebElement appname;

    @FindBy(xpath = "//label[contains(text(),'预览')]/following-sibling::div")
    private WebElement preview;

    @FindBy(xpath = "//th[text()='EPORT_ID']/ancestor::table")
    private WebElement returnList;

    @FindBy(xpath = "//div[contains(text(),'仪表盘workflow')]/following-sibling::div//table")
    private List<WebElement> workflowList;

    @FindBy(xpath = "//span[text()='在搜索中打开']")
    private WebElement openInSearch;

    @FindBy(xpath = "//span[text()='24']")
    private WebElement countNum;

    @FindBy(xpath = "//div[@id='fullscreenAll']//div[@id]/div")
    private WebElement customTitle;

    @FindBy(id = "filter_trendDescription")
    private WebElement chartDesc;

    @FindBy(xpath = "//div[text()='请选择输入项']/ancestor::div[@class='ant-select-selection__rendered']")
    private WebElement showFilterConfig;

    @FindBy(xpath = "//div[text()='请选择输入项']/ancestor::div[@class='ant-select-selection__rendered']/following-sibling::span[@class='ant-select-selection__clear']")
    private WebElement cleanShowFilterConfig;

    @FindBy(xpath = "//div[text()='请选择条件']/ancestor::div[@class='ant-select-selection__rendered']")
    private WebElement showCondition;

    @FindBy(xpath = "//div[text()='请选择条件']/ancestor::div[@class='ant-select-selection__rendered']/following-sibling::span[@class='ant-select-selection__clear']")
    private WebElement cleanShowConditio;

    @FindBy(xpath = "//input[@placeholder='请输入值']")
    private WebElement showValue;

    @FindBy(xpath = "//div[text()='请补全展示条件']")
    private WebElement tipErrorShowCondition;

    @FindBy(className = "icon-fanyeqishangjiantou")
    private WebElement eventIcon;

    @FindBy(xpath = "//li[text()='仪表盘测试事件列表']")
    private WebElement event;

    @FindBy(xpath = "//span[text()='appname']")
    private WebElement eventAppname;

    @FindBy(xpath = "//li[text()='实时查看']")
    private WebElement realTime;

    @FindBy(xpath = "//li[text()='配置字段提取']")
    private WebElement createConfig;

    @FindBy(xpath = "//li[text()='添加到知识库']")
    private WebElement addKnowledge;

    @FindBy(xpath = "//div[@class='ant-dropdown ant-dropdown-placement-bottomLeft']/ul")
    private WebElement addChartDropdown;

    @FindBy(xpath = "(//i[@class='anticon css-ifnfqv'])/*")
    private List<WebElement> iconList;

    @FindBy(xpath = "(//i[@class='anticon css-ifnfqv ant-dropdown-trigger'])[1]")
    private WebElement AddIcon;

    @FindBy(xpath = "(//i[@class='anticon css-ifnfqv ant-dropdown-trigger'])[2]")
    private WebElement settingIcon;

    @FindBy(xpath = "(//i[@class='anticon css-ifnfqv ant-dropdown-trigger'])[3]")
    private WebElement settingChart;

    @FindBy(xpath = "(//ul[contains(@class,'ant-dropdown-menu')])[1]/li")
    private List<WebElement> liList;

    @FindBy(xpath = "//span[text()='/']/following-sibling::span")
    private WebElement tagIcon;

    @FindBy(xpath = "//span[text()='新建标签页']")
    private WebElement addTag;

    @FindBy(xpath = "//div[text()='暂无数据']")
    private WebElement noData;

    @FindBy(className = "vx-group")
    private WebElement pieData;

    @FindBy(xpath = "//span[text()='保存']/preceding-sibling::input")
    private WebElement tagInput;

    @FindBy(xpath = "//span[text()='保存']")
    private WebElement saveTagInput;

    @FindBy(xpath = "//input[@placeholder='请输入关键字']")
    private WebElement searchTagInput;

    @FindBy(xpath = "//a[text()='first']")
    private WebElement firstTag;

    @FindBy(xpath = "(//span[text()='新建标签页']/preceding-sibling::ul/li)[last()]//a")
    private WebElement lastTag;

    @FindBy(xpath = "//span[contains(text(),'first')]")
    private WebElement first;

    @FindBy(xpath = "//span[text()='新建标签页']")
    private WebElement creatNewTag;

    @FindBy(xpath = "//a[text()='Delete']/following-sibling::span[2]")
    private WebElement deleteNewTag;

//    @FindBy(xpath = "//span[text()='新建标签页']/preceding-sibling::ul/li[2]")
    @FindBy(xpath = "//span[text()='新建标签页']/preceding-sibling::ul/li[2]//input")
    private WebElement inputforTag;

    @FindBy(xpath = "//a[text()='forDelete']/following-sibling::span[1]")
    private WebElement editTag;

    @FindBy(xpath = "//a[text()='testSearch']")
    private WebElement testSearch;

    @FindBy(xpath = "//span[text()='/']/preceding-sibling::span")
    private WebElement dashboardIcon;

    @FindBy(xpath = "//li[text()='UIautotest']")
    private WebElement uiAutoTest;

    @FindBy(xpath = "//li[text()='FirstAutoTest']")
    private WebElement firstAutoTest;

    @FindBy(xpath = "//div[text()='返回列表']")
    private WebElement returnToList;

    @FindBy(xpath = "//div[text()='请选择要加入的行']")
    private WebElement joinRow;

    @FindBy(xpath = "//li[text()='L2: ']")
    private WebElement line2;

    @FindBy(xpath = "//li[text()='L1: 首行']")
    private WebElement line1;

    @FindBy(xpath = "//span[text()='appname:']")
    private WebElement hoverElement;

    @FindBy(xpath = "//span[contains(text(),'名称')]/following-sibling::span/input")
    private WebElement tagName;

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

    @FindBy(id = "filter_rowId")
    private WebElement filterJoinRow;

    @FindBy(xpath = "//div[text()='快捷选项']")
    private WebElement shortcut;

    @FindBy(xpath = "(//ul[@class='ant-cascader-menu'])[last()]")
    private WebElement dashboardMenu;

    @FindBy(xpath = "(//ul[@class='ant-dropdown-menu ant-dropdown-menu-light ant-dropdown-menu-root ant-dropdown-menu-vertical'])[last()]")
    private WebElement chartDropdown;

    @FindBy(xpath = "//label[text()='今天']/following-sibling::i")
    private WebElement chartType;

    @FindBy(xpath = "//label[text()='今天']/following-sibling::i[4]")
    private WebElement delete;

    @FindBy(xpath = "//div[text()='仪表盘单值']/following-sibling::div/label")
    private WebElement timeRangeDanzhi;

    @FindBy(xpath = "//label[text()='本月']/following-sibling::i[4]")
    private WebElement deleteForTable;

    @FindBy(id = "fullscreenAll")
    private WebElement fullScreen;

    @FindBy(className = "ace_text-layer")
    private WebElement textLayer;

    @FindBy(xpath = "//div[@class='ant-modal-body']//input[@class='ant-input']")
    private WebElement searchChartInput;

    @FindBy(xpath = "(//div[text()='请选择'])[last()]")
    private WebElement lastFilter;

    @FindBy(xpath = "//span[text()='AutoTest(副本)']")
    private WebElement autotestCopy;

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

    public WebElement getAddChartItem() {
        return addChartItem;
    }

    public WebElement getAddRow() {
        return addRow;
    }

    public WebElement getTextLayer() {
        return textLayer;
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

    public WebElement getCreatNewTag() {
        return creatNewTag;
    }

    public WebElement getEditTag() {
        return editTag;
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
        String xpath = "//span[text()='" + name + "']/following-sibling::button";
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
        return iconList.get(6);
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

    public WebElement getUpdate() {
        return super.getContainsTextButton("更新");
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
        return paramValue1;
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
    public WebElement getToday() {
        return GetTime.getTime(webDriver, "Today");
    }

    public WebElement getYesterday() {
        return GetTime.getTime(webDriver, "Yesterday");
    }

    @FindBy(xpath = "//button[text()='所有时间']")
    private WebElement wholeTime;

    @FindBy(xpath = "//button[text()='最近7天']")
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

    public WebElement getDrillSetting() {
        return drillSetting;
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

    public WebElement getNeimenggu() {
        return neimenggu;
    }

    public WebElement getTaiwan() {
        return taiwan;
    }

    public WebElement getPartOfPie() {
        return partOfPie;
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

    public WebElement getSingleValue1() {
        return singleValue1;
    }

    public WebElement getDescribeText() {
        return describeText;
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

    public WebElement getMultiYaxisLegend() {
        return multiYaxisLegend;
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

    public WebElement getDynamicField() {
        return this.getInput("动态字段值");
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
        return filterToken;
    }

    public WebElement getFilterField() {
        return getInput("过滤字段");
    }

    public WebElement getFilterDefaultValue() {
        return filterDefaultValue;
    }

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

    public WebElement getTagName() { return tagName; }

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
        String xpath = "//label[contains(text(),'" + name + "')]/following-sibling::input";
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

}
