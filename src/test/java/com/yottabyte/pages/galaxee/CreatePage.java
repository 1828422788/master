package com.yottabyte.pages.galaxee;

import com.yottabyte.pages.EditorPage;
import com.yottabyte.utils.GetTime;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

/**
 * @author sunxj
 */
public class CreatePage extends EditorPage {
    public CreatePage(WebDriver driver) {
        super(driver);
//        driver.manage().window().setPosition(new Point(0,0));
        driver.manage().window().fullscreen();
    }

    @FindBy(xpath = "//div/input[@placeholder='请输入可视化应用名称']")
    private WebElement name;

    @FindBy(xpath = "(//span[contains(text(),'确定')][not(@class)]/ancestor::button)[2]")
    private WebElement ensureT;

    @FindBy(xpath = "(//span[contains(text(),'取消')][not(@class)]/ancestor::button)[2]")
    private WebElement cancelT;

    @FindBy(xpath = "//div[@class='el-message-box__message']/p[text()='操作成功']")
    private WebElement oprateSuccess;

    @FindBy(xpath = "//div[@class='el-message-box__message']/p[text()='删除成功！']")
    private WebElement deleteSuccess;

    @FindBy(xpath = "(//div[@class='screenshot'])[2]")
    private WebElement bank;

    @FindBy(xpath = "//li[contains(text(),'地图')]")
    private WebElement map;

    @FindBy(xpath = "//li[contains(text(),'指标')]")
    private WebElement index;

    @FindBy(xpath = "//li[contains(text(),'文字')]")
    private WebElement word;

    @FindBy(xpath = "//li[contains(text(),'装饰')]")
    private WebElement decorate;

    @FindBy(xpath = "//li[contains(text(),'其他')]")
    private WebElement other;

    @FindBy(className = "linechart")
    private WebElement line;

    @FindBy(xpath = "//li[text()='双轴折线图']")
    private WebElement line2y;

    @FindBy(className = "barchart")
    private WebElement bar;

    @FindBy(xpath = "//li[text()='玫瑰图']")
    private WebElement rose;

    @FindBy(className = "barcharthorizontal")
    private WebElement barHorizontal;

    @FindBy(className = "sunburstchart")
    private WebElement sunburst;

    @FindBy(xpath = "//li[text()='饼图']")
    private WebElement pie;

    @FindBy(xpath = "//div[text()='数据']")
    private WebElement data;

    @FindBy(xpath = "//div[contains(text(),'银行运维')]")
    private WebElement bankTemplate;

    @FindBy(xpath = "//div[contains(text(),'模版test')]")
    private WebElement templateTest;

    @FindBy(xpath = "//div[contains(text(),'银行运维')]/parent::div[@class='info']/following-sibling::div[@class='delete']/i[@class]")
    private WebElement bankTemplateDelete;

    @FindBy(xpath = "//div[contains(text(),'模版test')]/parent::div[@class='info']/following-sibling::div[@class='delete']/i[@class]")
    private WebElement templateDelete;

   // @FindBy(xpath = "(//span[contains(text(),'搜索')][not(@class)])[last()]")
   @FindBy(xpath = "//button[@class='el-button yw-searchbar__append el-button--default']/span[contains(text(),'搜索')]")
    private WebElement search;

    @FindBy(xpath = "(//span[contains(text(),'更新')][not(@class)])[last()]")
    private WebElement update;

    @FindBy(className = "download")
    private WebElement download;

    @FindBy(className = "delete")
    private WebElement delete;

    @FindBy(xpath = "//li[text()='散点图']")
    private WebElement scatter;

    @FindBy(xpath = "(//span[contains(text(),'确定')][not(@class)])[last()]")
    private WebElement ensureDelete;

    @FindBy(xpath = "//p[text()='请正确填写大屏名称！']")
    private WebElement tipOfCreat;

    @FindBy(xpath = "(//span[contains(text(),'确定')]/parent::button)[last()]")
    private WebElement tipOfEnsure;

    @FindBy(className = "percentchart")
    private WebElement percent;

    @FindBy(className = "el-upload--text")
    private WebElement upload;

    @FindBy(xpath = "//textarea[contains(@class, 'textarea-icon-padding')]")
    private WebElement splInput;

    @FindBy(xpath = "//i[@class='iconfont icon-shangyi_icon']")
    private WebElement upMove;

    @FindBy(xpath = "//i[@class='iconfont icon-xiayi_icon']")
    private WebElement downMove;

    @FindBy(xpath = "//i[@class='iconfont icon-yidaodingbu_icon']")
    private WebElement upMoveToTop;

    @FindBy(xpath = "//i[@class='iconfont icon-yidaodibu_icon']")
    private WebElement downMoveToBottom;


    @FindBy(xpath = "//div[text()='交互']")
    //   @FindBy(xpath = "//div[@class='el-tabs__nav']/div[text()='样式']")
    private WebElement interactive;

    @FindBy(xpath = "//div[text()='图表尺寸位置']")
    private WebElement position;

    @FindBy(xpath = "//div[text()='图表尺寸位置']/i")
    private WebElement chartPosition;

    @FindBy(className = "icon-youjiantou1")
    private WebElement rightArrow;

    @FindBy(className = "left-fixed_right-auto")
    private WebElement preview;

//    @FindBy(xpath = "(//input[@class='el-color-dropdown__value'])[last()]")
//    private WebElement colorInput;

//    @FindBy(xpath = "//label[contains(text(),'背景颜色')]/following-sibling::div")
//    private WebElement pageBackgroundColor;

//    public WebElement getPageBackgroundColor() { return this.colorInput("页面设置", "背景颜色"); }

    @FindBy(xpath = "//div[@class='preview']")
    private WebElement pageBackground;

    @FindBy(xpath = "//div[@class='sp-container sp-light sp-alpha-enabled sp-clear-enabled sp-palette-buttons-disabled']//div[@class='sp-button-container sp-cf']/button[text()='choose']")
    private WebElement ensureColor;

    @FindBy(xpath = "//label[contains(text(),'平滑')]/following-sibling::label")
    private WebElement smooth;

    @FindBy(xpath = "(//label[contains(text(),'平滑')]/following-sibling::label)[2]")
    private WebElement secondSmooth;

    @FindBy(xpath = "//label[contains(text(),'区域')]/following-sibling::label")
    private WebElement area;

    @FindBy(xpath = "(//label[contains(text(),'区域')]/following-sibling::label)[2]")
    private WebElement secondArea;

    @FindBy(className = "icon-zuojiantou1")
    private WebElement leftArrow;

    @FindBy(className = "left")
    private WebElement leftPart;

    @FindBy(xpath = "(//div[text()='数据系列']/following-sibling::div//label[contains(text(),'类型')]//following-sibling::div//i)[2]")
    private WebElement secondSeriesType;

    @FindBy(xpath = "(//div[text()='数据系列']/following-sibling::div//label[contains(text(),'粗细')]/following-sibling::div//input)[1]")
    private WebElement firstSeriesBold;

    @FindBy(xpath = "(//div[text()='数据系列']/following-sibling::div//label[contains(text(),'粗细')]/following-sibling::div//input)[2]")
    private WebElement secondSeriesBold;

    @FindBy(xpath = "//label[text()='堆叠']/following-sibling::label[@class='el-switch setting-switch']")
    private WebElement pile;

    @FindBy(xpath = "//input[@placeholder='请选择快捷时间或时间范围']")
    private WebElement dateEditor;

    @FindBy(xpath = "(//div//label[contains(text(),'切分字段')]//following-sibling::div//i)[last()]")
    private WebElement lastDivideField;

    @FindBy(className = "chart-color-selector")
    private WebElement colorSelector;

    @FindBy(xpath = "(//span[@class='chart-color-block'])[6]")
    private WebElement green;

//    @FindBy(xpath = "//div[text()='单环颜色']/following-sibling::div//label/following-sibling::div//span[@class='el-color-picker__color-inner']")
//    private WebElement monocycleColor;

    @FindBy(className = "arcbarchart")
    private WebElement arcBar;


    @FindBy(xpath = "(//div[text()='极坐标系']/following-sibling::div//label[contains(text(),'中心纬度,经度')]/following-sibling::div//input)[2]")
    private WebElement polarYaxis;

    @FindBy(className = "chinamap2d")
    private WebElement chinaMap;

    //@FindBy(xpath = "//label[contains(text(),'区域颜色')]/following-sibling::div//span[@class='el-color-picker__color-inner']")
    @FindBy(xpath = "//label[contains(text(),'区域颜色')]/following-sibling::div")
    private WebElement areaColor;

    @FindBy(xpath = "//label[contains(text(),'文本颜色')]/following-sibling::div//span[@class='el-color-picker__color-inner']")
    private WebElement textColor;
    public WebElement getTextColor(){return this.colorInput("地图", "文本颜色");}


//    标注色(起)
      public WebElement getMarkColor1(){return this.colorInput("地图", "标注色(起)");}
//    标注色(中)
    public WebElement getMarkColor2(){return this.colorInput("地图", "标注色(中)");}
//    标注色(止)
    public WebElement getMarkColor3(){return this.colorInput("地图", "标注色(止)");}

    @FindBy(xpath = "//label[contains(text(),'字体颜色')]/following-sibling::div//span[@class='el-color-picker__color-inner']")
    private WebElement wordColor;

    @FindBy(xpath = "//label[contains(text(),'标注颜色')]/following-sibling::div//span[@class='el-color-picker__color-inner']")
    private WebElement markColor;


    @FindBy(xpath = "//label[text()='正常']/following-sibling::div//input")
    private List<WebElement> mapInputList;

    @FindBy(xpath = "(//div[contains(text(),'地图')])/i")
    private WebElement mapHeader;

    @FindBy(xpath = "//li[text()='世界地图']")
    private WebElement world;


    @FindBy(className = "heatmap")
    private WebElement heatmap;

    @FindBy(className = "attackmap")
    private WebElement attackmap;

    @FindBy(className = "globelabel")
    private WebElement globelabel;

    @FindBy(xpath = "//li[text()='攻击图3D']")
    private WebElement attack3d;

//    @FindBy(className = "flipNumber")
    @FindBy(xpath = "//li[text()='数值翻牌器']")
    private WebElement flipNumber;

    @FindBy(className = "status")
    private WebElement status;

//    @FindBy(className = "title")
    @FindBy(xpath = "//li[contains(text(),'标题')]")
    private WebElement title;

    @FindBy(xpath = "//li[contains(text(),'表格')]")
    private WebElement table;

    @FindBy(className = "el-color-picker__color-inner")
    private WebElement colorInner;

//    @FindBy(className = "table")
//    private WebElement table;

    @FindBy(xpath = "//label[contains(text(),'背景颜色')]/following-sibling::div//div[@class='el-color-picker__trigger']")
    private WebElement tableHeaderBgColor;

    @FindBy(xpath = "//div[text()='列配置']/following-sibling::div//label[contains(text(),'列宽')]/following-sibling::div//input")
    private List<WebElement> columnsWidth;

    @FindBy(xpath = "//div[text()='标号']")
    private WebElement orderNum;

    @FindBy(xpath = "//div[text()='apache.clientip']")
    private WebElement itemApacheClientip;

    @FindBy(xpath = "(//label[contains(text(),'标号')]/following-sibling::label)[1]")
    private WebElement tableOrderNum;

    @FindBy(xpath = "//label[contains(text(),'标号重复滚动')]/following-sibling::label/div[@class='el-switch__label el-switch__label--left']")
    private WebElement tableOrderNumRoll;

    @FindBy(xpath = "//span[text()='6']")
    private WebElement orderNumSix;

    @FindBy(xpath = "//div[text()='count()']")
    private WebElement count;

    @FindBy(xpath = "//div[@class='panel-style-setting table-color-setting-modal']//div[@class='el-tab-pane'][not(@style='display: none;')]//label[contains(text(),'颜色')]/following-sibling::div//i")
    private WebElement countColor;

    @FindBy(className = "el-icon-down")
    private List<WebElement> colorSettingList;

    @FindBy(xpath = "(//div[@class='divergent-list'])[2]//img")
    private WebElement color1;

    @FindBy(xpath = "//span[text()='时间']/following-sibling::i")
    private WebElement timeDelete;

    @FindBy(xpath = "//span[text()='成功率']/following-sibling::i")
    private WebElement passRatioDelete;

    @FindBy(xpath = "//div[@class='panel-style-setting table-color-setting-modal']//div[@class='el-tab-pane'][not(@style='display: none;')]//label[contains(text(),'风格')]/following-sibling::div//i")
    private WebElement numberStyle;

    @FindBy(className = "liquidfillchart")
    private WebElement liquidfill;

    @FindBy(xpath = "//label[contains(text(),'水波动画')]/following-sibling::label")
    private WebElement waterWaveSwitchLabel;

    @FindBy(xpath = "//label[contains(text(),'显示')]/following-sibling::label")
    private WebElement outerFrameSwitch;

//    @FindBy(xpath = "//label[contains(text(),'水波内颜色')]/following-sibling::div//div[@class='el-color-picker__trigger']")
//    private WebElement tagColorInWaterWave;

//    @FindBy(xpath = "//label[contains(text(),'水波外颜色')]/following-sibling::div//div[@class='el-color-picker__trigger']")
//    private WebElement tagColorOutWaterWave;

//    @FindBy(xpath = "(//label[contains(text(),'颜色')]/following-sibling::div//div[@class='el-color-picker__trigger'])[last()]")
//    private WebElement waterWaveColor;

    @FindBy(className = "chordchart")
    private WebElement chord;

    @FindBy(xpath = "//span[contains(@style,'background: rgb(233, 30, 99);')]")
    private WebElement red;

    @FindBy(className = "forcechart")
    private WebElement force;

    @FindBy(className = "sankeychart")
    private WebElement sankey;

    @FindBy(className = "fullscreen")
    private WebElement fullscreen;

    @FindBy(className = "picture")
    private WebElement picture;

    @FindBy(className = "frame")
    private WebElement frame;

    @FindBy(className = "clocktime")
    private WebElement clocktime;

    @FindBy(xpath = "//div[@class='searching-tip']/span")
    private WebElement searchTip;

    @FindBy(xpath = "//label[contains(text(),'字体颜色')]/following-sibling::div//div[@class='el-color-picker__trigger']")
    private WebElement timeWordColor;

    @FindBy(xpath = "//div[contains(text(),'galaxeeTest')]")
    private WebElement galaxeeTest;

    @FindBy(xpath = "(//ul[@class='dropdown'])[last()]")
    private WebElement lastUlList;

    @FindBy(xpath = "//li[contains(text(),'地图')]/ul")
    private WebElement mapDropdown;

    @FindBy(xpath = "//li[contains(text(),'图表')]/ul")
    private  WebElement chartDropdown;

    @FindBy(xpath = "//div[@class='back']")
    private  WebElement backGalaxee;

    @FindBy(xpath = "(//div[text()='列配置']/following-sibling::div//label[contains(text(),'风格')]//following-sibling::div//i)[2]")
    private  WebElement styleColumnConfig;

    @FindBy(xpath = "(//div[text()='列配置']/following-sibling::div//label[contains(text(),'颜色')]//following-sibling::div//i)[1]")
    private  WebElement colorColumnConfig;

    @FindBy(xpath = "//span[text()='自定义']")
    private  WebElement customConfig;

    @FindBy(xpath = "(//span[text()='值'])[3]")
    private  WebElement colorValue;

    @FindBy(xpath = "(//span[text()='范围'])[3]")
    private  WebElement colorRange;

    @FindBy(xpath = "(//span[text()='梯度'])[3]")
    private  WebElement colorGradient;

    @FindBy(xpath = "//span[text()='添加值颜色']")
    private  WebElement addValueColor;

    @FindBy(xpath = "//span[text()='添加范围颜色']")
    private  WebElement addRangeColor;

    @FindBy(xpath = "//div[@class='preset-btn-container']/label[contains(text(),'预设置')]/following-sibling::span")
    private  WebElement colorPreConfig;

    @FindBy(xpath = "//div[@class='sequential-list']/label[contains(text(),'连续')]")
    private  WebElement preConfigSeries;

    @FindBy(xpath = "//div[@class='divergent-list']/label[contains(text(),'离散')]")
    private  WebElement preConfigSpread;

    @FindBy(xpath = "//input[@placeholder='Please input']")
    private WebElement columnValue;

    @FindBy(xpath = "//div[@class='color-picker']/following-sibling::a")
    private WebElement valueColorDelete;

    @FindBy(xpath = "//div[@class='panel-search-option']/div/button/span")
    private WebElement dataSearch;

    @FindBy(xpath = "//div[contains(text(),'页面设置')]/following-sibling::div//label[contains(text(),'背景颜色')]/following-sibling::div//span[@class='sp-original-input-container']//input")
    private WebElement pageBackgroundColor;
    public WebElement getPageBackgroundColor() { return pageBackgroundColor; }

    public WebElement getDataSearch() {
        return dataSearch;
    }

    public WebElement getBackGalaxee() {
        return backGalaxee;
    }

    public WebElement getMapDropdown() {
        return mapDropdown;
    }

    public WebElement getChartDropdown() {
        return chartDropdown;
    }

    public WebElement getUpMove() {
        return upMove;
    }

    public WebElement getDownMove() {
        return downMove;
    }

    public WebElement getUpMoveToTop() {
        return upMoveToTop;
    }

    public WebElement getDownMoveToBottom() {
        return downMoveToBottom;
    }

    public WebElement getLastUlList() {
        return lastUlList;
    }

    public WebElement getGalaxeeTest() {
        return galaxeeTest;
    }

    public WebElement getTimeWordColor() {
        return timeWordColor;
    }

    public WebElement getSinglePicture() {
        return this.header("单张图片");
    }

    public WebElement getPellucidity() {
        return this.input("全局样式", "透明度");
    }

    public WebElement getOverallStyle() {
        return this.header("全局样式");
    }

    public WebElement getTimeMachine() {
        return this.header("时间器");
    }

    public WebElement getPicture() {
        return picture;
    }

    public WebElement getFrame() {
        return frame;
    }

    public WebElement getClocktime() {
        return clocktime;
    }

    public WebElement getDecorate() {
        return decorate;
    }

    public WebElement getOther() {
        return other;
    }

    public WebElement getFullscreen() {
        return fullscreen;
    }

    public WebElement getSankey() {
        return sankey;
    }

    public WebElement getRepulsionFactor() {
        return this.input("斥力因子倍数", "斥力因子倍数");
    }

    public WebElement getRepulsionFactorHeader() {
        return this.header("斥力因子倍数");
    }

    public WebElement getForce() {
        return force;
    }

    public WebElement getRed() {
        return red;
    }

    public WebElement getChord() {
        return chord;
    }

    public WebElement getWaterWaveColor() {
        return this.colorInput("水波颜色", "颜色");
    }

    public WebElement getWaterWaveColorHeader() {
        return this.header("水波颜色");
    }

    public WebElement getTagColorInWaterWave() {
        return this.colorInput("标签", "水波内颜色");
    }

    public WebElement getTagColorOutWaterWave() {
        return this.colorInput("标签", "水波外颜色");
    }

    public WebElement getOuterFrameSwitch() {
        return outerFrameSwitch;
    }

    public WebElement getOuterFrame() {
        return this.header("外边框");
    }

    public WebElement getLiquidShape() {
        return this.dropdownList("形状", "形状");
    }

    public WebElement getLiquidShapeHeader() {
        return this.header("形状");
    }

    public WebElement getWaterWaveSwitchLabel() {
        return waterWaveSwitchLabel;
    }

    public WebElement getWaterWavePainting() {
        return this.header("水波动画");
    }

    public WebElement getLiquidfill() {
        return liquidfill;
    }

    public WebElement getNumberStyle() {
        numberStyle.click();
        return getLastDropdownList();
    }

    public WebElement getColor1() {
        return color1;
    }

    public WebElement getCountColorSetting() {
        return colorSettingList.get(1);
    }

    public WebElement getCountColor() {
        countColor.click();
        return getLastDropdownList();
    }

    public WebElement getCount() {
        return count;
    }

    public WebElement getOrderNum() {
        return orderNum;
    }

    public WebElement getItemApacheClientip() {
        return itemApacheClientip;
    }

    public WebElement getNumberWidth() {
        return columnsWidth.get(0);
    }

    public WebElement getFieldWidth1() {
        return columnsWidth.get(1);
    }

    public WebElement getColumnConfig() {
        return this.header("列配置");
    }

    public WebElement getTableOrderNum() {
        return tableOrderNum;
    }

    public WebElement getTableOrderNumRoll() {
        return tableOrderNumRoll;
    }

    public WebElement getOrderNumSix() {
        return orderNumSix;
    }

    public WebElement getCustomConfig() {
        return customConfig;
    }

    public WebElement getAddValueColor() {
        return addValueColor;
    }

    public WebElement getAddRangeColor() {
        return addRangeColor;
    }

    public WebElement getColorPreConfig() {
        return colorPreConfig;
    }

    public WebElement getPreConfigSeries() {
        return preConfigSeries;
    }

    public WebElement getPreConfigSpread() {
        return preConfigSpread;
    }

    public WebElement getColumnValue() {
        return columnValue;
    }

    public WebElement getValueColorDelete() {
        return valueColorDelete;
    }

    public WebElement getStyleColumnConfig() {
        styleColumnConfig.click();
        return getLastDropdownList();
    }

    public WebElement getColorValue() { return colorValue; }

    public WebElement getColorRange() { return colorRange; }

    public WebElement getColorGradient() { return colorGradient; }

    public WebElement getColorColumnConfig() {
//        colorColumnConfig.click();
        return colorColumnConfig;
    }

    public WebElement getRowNumber() {
        return this.input("单元格", "显示行数");
    }

    public WebElement getCellFrameBold() {
        return this.input("单元格", "边框粗细");
    }
    public WebElement getTableHeadFrameBold(){return this.input("表头","边框粗细");}

    public WebElement getCellBold() {
        return this.dropdownList("单元格", "字体粗细");
    }

    public WebElement getTableCell() {
        return this.header("单元格");
    }

    public WebElement getCellWordSize() {
        return this.input("单元格", "字号");
    }

    public WebElement getTableHeaderBgColor() {
        return this.colorInput("表头", "背景颜色");
    }

    public WebElement getTableHeaderBold() {
        return this.dropdownList("表头", "字体粗细");
    }

    public WebElement getTableHeaderWordSize() {
        return this.input("表头", "字号");
    }

    public WebElement getTableHeader() {
        return this.header("表头");
    }

    public WebElement getDataItem() {
        return this.dropdownList("", "数据项");
    }

    public WebElement getTimeDelete() {
        return timeDelete;
    }

    public WebElement getPassRatioDelete() {
        return passRatioDelete;
    }

    public WebElement getTitleWordBold() {
        return this.dropdownList("", "字体粗细");
    }

    public WebElement getColorInner() {
        return colorInner;
    }

    public WebElement getWordSize() {
        return this.input("", "字体大小");
    }

    public WebElement getTitleAngle() {
        return this.input("", "角度");
    }

    public WebElement getTitleImg() {
        return title;
    }

    public WebElement getTable() {
        return table;
    }

    public WebElement getContent() {
        return this.input("", "内容");
    }

    public WebElement getWord() {
        return word;
    }

    public WebElement getStatus() {
        return status;
    }

    public WebElement getFlipScaling() {
        return this.dropdownList("翻转", "缩略比例");
    }

    public WebElement getFlipBackgroundStyle() {
        return this.dropdownList("翻转", "背景样式");
    }

    public WebElement getPrefix() {
        return this.input("翻转", "前缀");
    }

    public WebElement getSuffix() {
        return this.input("翻转", "后缀");
    }

    public WebElement getFlipWordBold() {
        return this.dropdownList("翻转", "字体粗细");
    }

    public WebElement getFlipWordSize() {
        return this.input("翻转", "字体大小");
    }

    public WebElement getFlipWord() {
        return this.dropdownList("翻转", "字体");
    }

    public WebElement getFlip() {
        return this.header("翻转");
    }

    public WebElement getType() {
        return this.dropdownList("", "类别");
    }

    public WebElement getFlipNumber() {
        return flipNumber;
    }

    public WebElement getIndex() {
        return index;
    }

    public WebElement getAttack3d() {
        return attack3d;
    }

    public WebElement getGlobelabelMapHeader() {
        return this.header("地图");
    }

    public WebElement getGlobelabel() {
        return globelabel;
    }

    public WebElement getScaling() {
        return this.input("地图", "缩放");
    }

    public WebElement getEventColor() {
        return this.colorInput("地图", "事件颜色");
    }

    public WebElement getSourceLatitude() {
        return this.dropdownList("", "源纬度");
    }

    public WebElement getSourceLongitude() {
        return this.dropdownList("", "源经度");
    }

    public WebElement getTargetLatitude() {
        return this.dropdownList("", "目标纬度");
    }

    public WebElement getTargetLongitude() {
        return this.dropdownList("", "目标经度");
    }

    public WebElement getSourceField() {
        return this.dropdownList("", "来源字段");
    }

    public WebElement getWeightField() {
        return this.dropdownList("", "权重字段");
    }

    public WebElement getTargetField() {
        return this.dropdownList("", "目标字段");
    }

    public WebElement getTime() {
        return this.dropdownList("", "时间");
    }

    public WebElement getMeasureValue() {
        return this.dropdownList("", "量度值");
    }

    public WebElement getAttackmap() {
        return attackmap;
    }

    public WebElement getHeatmap() {
        return heatmap;
    }

    public WebElement getMarkColor() {
        return this.colorInput("地图", "标注颜色");
    }

    public WebElement getUpdate() {
        return update;
    }

    public WebElement getWorld() {
        return world;
    }

    public WebElement getNormalFromInput() {
        return mapInputList.get(0);
    }

    public WebElement getNormalToInput() {
        return mapInputList.get(1);
    }

    public WebElement getUnusualFromInput() {
        return mapInputList.get(2);
    }

    public WebElement getUnusualToInput() {
        return mapInputList.get(3);
    }

    public WebElement getSeriousFromInput() {
        return mapInputList.get(4);
    }

    public WebElement getSeriousToInput() {
        return mapInputList.get(5);
    }

    public WebElement getMapWordBold() {
        return this.dropdownList("地图", "字体粗细");
    }

    public WebElement getScale() {
        return this.input("地图", "缩放");
    }

    public WebElement getMapWordSize() {
        return this.input("地图", "字体大小");
    }

    public WebElement getWordColor() {
        return this.colorInput("地图", "字体颜色");
    }

    public WebElement getMarkType() {
        return this.dropdownList("地图", "标注类型");
    }

    public WebElement getAreaColor() {
        return this.colorInput("地图", "区域颜色");
    }

    public WebElement getBoundaryColor() {
        return this.colorInput("地图", "边界颜色");
    }

    public WebElement getMapArea() {
        return this.dropdownList("地图", "区域");
    }

    public WebElement getMapHeader() {
        return mapHeader;
    }

    public WebElement getNameField() {
        return this.dropdownList("", "名称字段");
    }

    public WebElement getMapName() {
        return this.dropdownList("", "名称");
    }

    public WebElement getMap() {
        return map;
    }

    public WebElement getChinaMap() {
        return chinaMap;
    }

    public WebElement getPolarRadius() {
        return this.input("极坐标系", "半径");
    }

    public WebElement getPolarYaxis() {
        return polarYaxis;
    }

    public WebElement getPolarXaxis() {
        return this.input("极坐标系", "中心纬度,经度");
    }

    public WebElement getPolarCoordinates() {
        return this.header("极坐标系");
    }

    public WebElement getAngleAxisBold() {
        return this.dropdownList("角度轴", "字体粗细");
    }

    public WebElement getAngleAxisColor() {
        return this.colorInput("角度轴", "颜色");
    }

    public WebElement getAngleAxisSize() {
        return this.input("角度轴", "字号");
    }

    public WebElement getAngleAxisHeader() {
        return this.header("角度轴");
    }

    public WebElement getRadiusAxisAngle() {
        return this.dropdownList("半径轴", "角度");
    }

    public WebElement getRadiusAxisBold() {
        return this.dropdownList("半径轴", "字体粗细");
    }

    public WebElement getRadiusAxisColor() {
        return this.colorInput("半径轴", "颜色");
    }

    public WebElement getRadiusAxisSize() {
        return this.input("半径轴", "字号");
    }

    public WebElement getRadialAxis() {
        return this.dropdownList("", "径向轴");
    }

    public WebElement getAngleAxis() {
        return this.dropdownList("", "角度轴");
    }

    public WebElement getRadiusAxis() {
        return this.header("半径轴");
    }

    public WebElement getArcBar() {
        return arcBar;
    }

    public WebElement getMonocycleColor() {
        return this.colorInput("单环颜色", "颜色");
    }

    public WebElement getMonocycle() {
        return this.header("单环颜色");
    }

    public WebElement getTitleColor() {
        return this.colorInput("标题", "颜色");
    }

    public WebElement getTitle() {
        return this.header("标题");
    }

    public WebElement getPercent() {
        return percent;
    }

    public WebElement getScatter() {
        return scatter;
    }

    public WebElement getPie() {
        return pie;
    }

    public WebElement getBankTemplate() {
        return bankTemplate;
    }

    public WebElement getTemplateTest() {
        return templateTest;
    }

    public WebElement getBankTemplateDelete() {
        return bankTemplateDelete;
    }

    public WebElement getTemplateDelete() {
        return templateDelete;
    }

    public WebElement getChartWordSize() {
        return this.input("图表颜色标签", "标签字号");
    }

    public WebElement getGreen() {
        return green;
    }

    public WebElement getColorSelector() {
        return colorSelector;
    }

    public WebElement getChartTag() {
        return this.header("图表颜色标签");
    }

    public WebElement getSunburst() {
        return sunburst;
    }

    public WebElement getLastDivideField() {
        lastDivideField.click();
        return getLastDropdownList();
    }

    public WebElement getBarHorizontal() {
        return barHorizontal;
    }

    public WebElement getTag() {
        return this.header("标签");
    }

    public WebElement getRadius() {
        return this.header("半径");
    }

    public WebElement getDivideField() {
        return this.dropdownList("", "切分字段");
    }

    public WebElement getDataField() {
        return this.dropdownList("", "数值字段");
    }

    public WebElement getRose() {
        return rose;
    }

    public WebElement getRecentSevenDay() {
        return GetTime.getTime(webDriver, "RecentSevenDay");
    }

    public WebElement getTwoDays() {
        return GetTime.getTime(webDriver, "TwoDays");
    }

    public WebElement getDateEditor() {
        return dateEditor;
    }

    public WebElement getPile() {
        return pile;
    }

    public WebElement getBar() {
        return bar;
    }

    public WebElement getSecondSmooth() {
        return secondSmooth;
    }

    public WebElement getSecondArea() {
        return secondArea;
    }

    public WebElement getFirstSeriesBold() {
        return firstSeriesBold;
    }

    public WebElement getSecondSeriesBold() {
        return secondSeriesBold;
    }

    public WebElement getSecondSeriesType() {
        secondSeriesType.click();
        return this.getLastDropdownList();
    }

    public WebElement getLine2y() {
        return line2y;
    }

    public WebElement getLeftPart() {
        return leftPart;
    }

    public WebElement getLeftArrow() {
        return leftArrow;
    }

    public WebElement getGroup() {
        return this.dropdownList("", "分组");
    }

    public WebElement getAddGroup() {
        return super.getButton("添加分组");
    }

    public WebElement getAddLine(){return super.getButton("添加 Line");}

    public WebElement getAdd() {
        return super.getButton("+添加");
    }

    public WebElement getSmooth() {
        return smooth;
    }

    public WebElement getArea() {
        return area;
    }

    public WebElement getDataSeriesBold() {
        return this.input("数据系列", "粗细");
    }

    public WebElement getInnerRadius() {
        return this.input("半径", "内半径(%)");
    }

    public WebElement getOuterRadius() {
        return this.input("半径", "外半径(%)");
    }

    public WebElement getTagBold() {
        return this.dropdownList("标签", "字体粗细");
    }

    public WebElement getDataSeriesType() {
        return this.dropdownList("数据系列", "类型");
    }

    public WebElement getDataSeriesColor() {
        return this.colorPicker("数据系列", "折线");
    }

    public WebElement getExampleColor() {
        return this.colorInput("图例", "颜色");
    }

    public WebElement getExample() {
        return this.header("图例");
    }





    public WebElement getExampleWordBold() {
        return this.dropdownList("图例", "字体粗细");
    }

    public WebElement getExampleHorizontal() {
        return this.dropdownList("图例", "水平位置");
    }

    public WebElement getExampleVertical() {
        return this.dropdownList("图例", "垂直位置");
    }


    public WebElement getEnsureColor() {
        return ensureColor;
    }

    public WebElement getPageBackground() {
        return pageBackground;
    }



    public WebElement getPreview() {
        return preview;
    }

    public WebElement getRightArrow() {
        return rightArrow;
    }

    public WebElement getChartPosition() {
        return chartPosition;
    }


    public WebElement getInteractive() {
        return interactive;
    }

    public WebElement getPosition() {
        return position;
    }

    public WebElement getSplInput() {
        return splInput;
    }

    public WebElement getUpload() {
        return upload;
    }

    public WebElement getEnsureDelete() {
        return ensureDelete;
    }

    public WebElement getTipOfCreat() {
        return tipOfCreat;
    }

    public WebElement getTipOfEnsure() {
        return tipOfEnsure;
    }

    public WebElement getDelete() {
        return delete;
    }

    public WebElement getDownload() {
        return download;
    }

    public WebElement getSearchTip() {
        return searchTip;
    }

  /*  public WebElement getSuccessMessage() {
        return super.getErrorMessage();
    }*/

   // public WebElement getSuccessMessage(){return super.getSuccessMessage();}

    @FindBy(xpath = "//div[@class='el-message-box__message']/p[text()='保存成功']")
    private WebElement successMessage;
    @Override
    public WebElement getSuccessMessage() {
        return successMessage;
    }

    @FindBy(xpath = "//p[text()='操作成功]")
    private WebElement successOperate;
    public WebElement getSuccessOperate() {
        return successOperate;
    }

    public WebElement getSaveAsTemplate() {
        return super.getButton("保存为模版");
    }

    public WebElement getXaxis() {
        return this.dropdownList("", "X轴");
    }

    public WebElement getYaxis() {
        return this.dropdownList("", "Y轴");
    }

    public WebElement getLineYaxis(){return this.dropdownList("","线Y轴");}

    public WebElement getFirstYaxis() {
        return this.dropdownList("", "Y轴1");
    }

    public WebElement getSecondYaxis() {
        return this.dropdownList("", "Y轴2");
    }

    public WebElement getColumnName(){return this.dropdownList("","名称");}

    public WebElement getColumnValue1() {
        return this.dropdownList("", "值 1");
    }

    public WebElement getColumnValue2() {
        return this.dropdownList("", "值 2");
    }

    public WebElement getTimeField() {
        return this.dropdownList("", "时间字段");
    }

    public WebElement getValueField() {
        return this.dropdownList("", "数值字段");
    }

    public WebElement getXaxisField() {
        return this.dropdownList("", "横坐标字段");
    }

    public WebElement getActualField() {
        return this.dropdownList("", "实际值字段");
    }

    public WebElement getForecastField() {
        return this.dropdownList("", "预测值字段");
    }

    public WebElement getUpperField() {
        return this.dropdownList("", "上限字段");
    }

    public WebElement getLowerField() {
        return this.dropdownList("", "下限字段");
    }

    public WebElement getSearch() {
        return search;
    }

    public WebElement getData() {
        return data;
    }

    public WebElement getLine() {
        return line;
    }

    public WebElement getBank() {
        return bank;
    }

    public WebElement getName() {
        return name;
    }

    public WebElement getEnsureT() {
        return ensureT;
    }

    public WebElement getCancelT() {
        return cancelT;
    }

    public WebElement getDeleteSuccess() {
        return deleteSuccess;
    }

    public WebElement getOprateSuccess() {
        return oprateSuccess;
    }

    public WebElement getCreate() {
        return super.getButton("创建项目");
    }

    public WebElement getEnsure() {
        return super.getContainsTextButton("确定");
    }

    public WebElement getCancel() {
        return super.getContainsTextButton("取消");
    }

    public WebElement getSave() {
        return super.getButton("保存");
    }

    @FindBy(xpath = "//span[text()='发布']/parent::button")
    private WebElement release;
    public WebElement getRelease() {
        return release;
    }

    private WebElement colorPicker(String title, String name) {
        String xpath;
        if ("".equals(name)) {
            xpath = "//div[text()='" + title + "']/following-sibling::div//label/ancestor::div/following-sibling::div//span[@class='el-color-picker__color-inner']";
        } else {
            xpath = "//div[text()='" + title + "']/following-sibling::div//label[text()='" + name + "']/ancestor::div/following-sibling::div//span[@class='el-color-picker__color-inner']";
        }
        return webDriver.findElement(By.xpath(xpath));
    }

    private WebElement colorInput(String title, String name) {
        String xpath;
        if ("".equals(name)) {
            xpath = "//div[text()='" + title + "']/following-sibling::div//label/ancestor::div/following-sibling::div//span[@class='el-color-picker__color-inner']";
        } else {
            xpath = "//div[text()='" + title + "']/following-sibling::div//label[contains(text(),'" + name + "')]/following-sibling::div//span[@class='sp-original-input-container']//input";
        }
        return webDriver.findElement(By.xpath(xpath));
    }

    private WebElement input(String title, String name) {
        String xpath;
        if ("".equals(title)) {
            xpath = "//label[contains(text(),'" + name + "')]/following-sibling::div//input";
        } else {
            xpath = "//div[text()='" + title + "']/following-sibling::div//label[contains(text(),'" + name + "')]/following-sibling::div//input";
        }
        return webDriver.findElement(By.xpath(xpath));
    }

    private WebElement dropdownList(String title, String name) {
        String xpath;
        if ("".equals(title)) {
            xpath = "//label[contains(text(),'" + name + "')]//following-sibling::div//i[@class='el-input__icon el-icon-arrow-up']";
        } else {
            xpath = "//div[text()='" + title + "']/following-sibling::div//label[contains(text(),'" + name + "')]//following-sibling::div//i";
        }
        WebElement element = webDriver.findElement(By.xpath(xpath));
        element.click();
        return getLastDropdownList();
    }

    public WebElement getLastDropdownList() {
        return webDriver.findElement(By.xpath("(//ul[@class='el-scrollbar__view el-select-dropdown__list'])[last()]"));
    }

    private WebElement switchButton(String title) {
        String xpath = "//div[text()='" + title + "']/following-sibling::div//label[@class='el-switch setting-switch']";
        return webDriver.findElement(By.xpath(xpath));
    }

    private WebElement header(String name) {
        String xpath = "//div[text()='" + name + "'][@class='el-collapse-item__header']";
        return webDriver.findElement(By.xpath(xpath));
    }


@FindBy(xpath = "//label[contains(text(),'数据源类型')]")
private WebElement dataType;
    public WebElement getDataType(){return dataType;}




//author-jnd
    //发布
   // @FindBy(xpath = "//span[text()='发布']")
    @FindBy(xpath = "//button[@class='el-button el-button--text']/span[text()='发布']")
    private WebElement fabu;
    public WebElement getFabu(){return fabu;}
    //全局样式
    @FindBy(xpath = "//div[text()='全局样式']/i")
    private WebElement globalStyle;
    public WebElement getGlobalStyle(){return globalStyle;}
    //全局样式中的名称输入框
    @FindBy(xpath = "//label[text()='名称']/ancestor::div//following-sibling::div//input[@class='el-input__inner']")
    private WebElement globalStyleName;
    public WebElement getGlobalStyleName(){return globalStyleName;}
    //背景动画
    @FindBy(xpath = "//label[contains(text(),'背景动画')]/following-sibling::label")
    private WebElement backgroundAuto;
    public WebElement getBackgroundAuto(){return backgroundAuto;}
    //中国地图二
    @FindBy(xpath = "//li[text()='中国地图II']/i")
    private WebElement ChineseMapTwo;
    public WebElement getChineseMapTwo(){return ChineseMapTwo;}
    //中国地图二->样式->名称颜色
    public WebElement getChineseMapTwoNameColor(){return this.colorInput("地图", "名称颜色");}
    //中国地图二->样式->数值颜色
    public WebElement getChineseMapTwoNumberColor(){return this.colorInput("地图", "数值颜色");}
    //中国地图二->样式->边框宽度
    @FindBy(xpath = "//label[contains(text(),'边框宽度')]/following-sibling::div/input")
    private WebElement borderWidth;
    public WebElement getBorderWidth(){return borderWidth;}
    //边框颜色
    @FindBy(xpath = "//label[contains(text(),'边框颜色')]/following-sibling::div")
    private WebElement borderColor;
    public WebElement getBorderColor(){return this.colorInput("地图", "边框颜色");}

    public WebElement getTableHeaderBorderColor() {
        return this.colorInput("表头", "边框颜色");
    }
    //中国地图二-数据-搜索-类别
    @FindBy(xpath = "//label[text()='类别']/following-sibling::div")
    private WebElement ChineseMapTwoDataSearchCategory;
    public WebElement getChineseMapTwoDataSearchCategory(){
        ChineseMapTwoDataSearchCategory.click();
        return this.getLastDropdownList();
    }
    //中国地图二-数据-搜索-值
    @FindBy(xpath = "//label[text()='值']/following-sibling::div")
    private WebElement ChineseMapTwoDataSearchValue;
    public WebElement getChineseMapTwoDataSearchValue(){
        ChineseMapTwoDataSearchValue.click();
        return this.getLastDropdownList();
    }



    //攻击图3D II
    @FindBy(xpath = "//li[text()='攻击图3D II']")
    private WebElement attackMapThreeDTwo;
    public WebElement getAttackMapThreeDTwo(){return attackMapThreeDTwo;}

    //数据中的更新频率
   @FindBy(xpath = "//div[@class='panel-search-cycle']/div/input[@class='el-input__inner']")
    private WebElement updateFrequency;
    public WebElement getUpdateFrequency(){return updateFrequency;}

    //数据源类型
    @FindBy(xpath = "//label[@class='data-type-label']/following-sibling::div[1]//i[@class]")
    private WebElement dataSourceType;
    public WebElement getDataSourceType(){
         return dataSourceType;
    }
    //静态数据
    @FindBy(xpath = "//span[text()='静态数据']")
    private WebElement statisticsData;
    public WebElement getStatisticsData(){return statisticsData;}
    //绑定搜索
    @FindBy(xpath = "//span[text()='绑定搜索']")
    private WebElement bindingSearch;
    public WebElement getBindingSearch(){return bindingSearch;}
//其他->搜索控件
    @FindBy(xpath = "//li[text()='搜索']")
    private WebElement otherSearch;
    public WebElement getOtherSearch(){return otherSearch;}

    //数据源类型-绑定搜索，搜索框
    @FindBy(xpath = "//div[@class='bind-search-title']/following-sibling::div//i[@class]")
    private WebElement bindingSearchChoose;
    public WebElement getBindingSearchChoose(){return bindingSearchChoose;}
    //选择绑定搜索
    @FindBy(xpath = "//ul[@class='el-scrollbar__view el-select-dropdown__list']/li[2]/span[contains(text(),'search_widget')]")
    private WebElement search_widget;
    public WebElement getSearch_widget(){return search_widget;}


    //右侧图层的第一个选择按钮
   @FindBy(xpath = "//div[contains(text(),'图层')]/parent::div/ul/li[1]")
    private WebElement pictureOne;
    public WebElement getPictureOne(){return pictureOne;}
    //右侧图层的第二个选择按钮
    @FindBy(xpath = "//div[contains(text(),'图层')]/parent::div/ul/li[2]")
    private WebElement pictureTwo;
    public WebElement getPictureTwo(){return pictureTwo;}
    //右侧图层的第三个选择按钮
    @FindBy(xpath = "//div[contains(text(),'图层')]/parent::div/ul/li[3]")
    private WebElement pictureThree;
    public WebElement getPictureThree(){return pictureThree;}

    //指标中的top3
    @FindBy(xpath ="//li[text()='Top3']/i")
    private WebElement Top3;
    public WebElement getTop3(){return Top3;}
    //样式-top3
    @FindBy(xpath = "//div[text()='Top3']/i")
    private WebElement styleTop3;
    public WebElement getStyleTop3(){return styleTop3;}
    //奖牌大小
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[2]/div/input")
    private WebElement medalSize;
    public WebElement getMedalSize(){return medalSize;}
    //名称字体大小
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[4]/div/input")
    private WebElement nameTypefaceSize;
    public WebElement getNameTypefaceSize(){return nameTypefaceSize;}
 //数值
    //数值字体大小
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[6]/div/input")
    private  WebElement numberTypefaceSize;
    public WebElement getNumberTypefaceSize(){return numberTypefaceSize;}
   //数值字体颜色
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[7]/div")
    private WebElement Top3numberTypefaceColor;
    public WebElement getTop3numberTypefaceColor(){return this.colorInput("Top3", "字体颜色");}
    //数值字体粗细
    public WebElement getTop3WordBold() {
        return this.dropdownList("Top3", "字体粗细");
    }
    //单位
    @FindBy(xpath = "//label[contains(text(),'单位')]/following-sibling::label")
    private WebElement danWei;
    public WebElement getDanWei(){return danWei;}

//Top3-数据-搜索
    //名称
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div[1]/div")
    private WebElement dataSearchName;
    public WebElement getDataSearchName(){
        dataSearchName.click();
        return this.getLastDropdownList();
    }
    //数值字段
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div[2]/div")
    private WebElement dataSearchNumber;
    public WebElement getDataSearchNumber(){
        dataSearchNumber.click();
        return this.getLastDropdownList();
    }

//百分比
    //指标中的百分比
    @FindBy(xpath = "//li[text()='百分比']/i")
    private WebElement percentage;
    public WebElement getPercentage(){return percentage;}
    //百分比的样式
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div[2]/div[2]/div[1]/i")
    private WebElement stylePercentage;
    public WebElement getStylePercentage(){return stylePercentage;}
    //文本
      //文本字体大小
      @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div/div[1]/div[2]/div/input")
      private WebElement text_fontSize;
      public WebElement getText_fontSize(){return text_fontSize;}
      //文本字体颜色
      @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div/div[1]/div[3]/div")
      private WebElement text_fontColor;
      public WebElement getText_fontColor(){return this.colorInput("百分比", "字体颜色");}
      //字体粗细
      public WebElement getPercentageWordBold() {
        return this.dropdownList("百分比", "字体粗细");
    }
    //图表
      //图表颜色
//      @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div/div[2]/div[2]/div")
      @FindBy(xpath = "//div[text()='百分比']/following-sibling::div//label[text()='图表']/parent::div/following-sibling::div//span[@class='sp-original-input-container']//input")
      private WebElement chartColor;
      public WebElement getChartColor(){return chartColor;}
      //图表高度
      @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div/div[3]/div/input")
      private WebElement chartHeight;
      public WebElement getChartHeight(){return chartHeight;}
 //百分比-数据-搜索-数值字段
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div/div")
    private WebElement percentageSearchNumber;
      public WebElement getPercentageSearchNumber(){
          percentageSearchNumber.click();
          return this.getLastDropdownList();
      }


//揭示牌
    //指标-揭示牌
      @FindBy(xpath = "//li[text()='提示牌']/i")
      private WebElement tipsCard;
      public WebElement getTipsCard(){return tipsCard;}
      //样式-提示牌
     @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div[2]/div[2]/div[1]/i")
     private WebElement styleTipsCard;
      public WebElement getStyleTipsCard(){return styleTipsCard;}
      //样式-提示牌-标题
      @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div/div/div[1]/div/input")
      private WebElement styleTipsCardTiTle;
      public WebElement getStyleTipsCardTiTle(){return styleTipsCardTiTle;}
      //样式-提示牌-缩放
      @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div/div/div[2]/div/input")
      private WebElement styleTipsCardZoom;
      public WebElement getStyleTipsCardZoom(){return styleTipsCardZoom;}

     //数据
    //数值字段
      @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div/div")
      private WebElement tipsCardNumber;
      public WebElement getTipsCardNumber(){
          tipsCardNumber.click();
          return this.getLastDropdownList();
      }
      //阈值1
      @FindBy(xpath = "//label[text()='阈值 1']/following-sibling::div//input[@class='el-input__inner']")
      private WebElement thresholdOne;
      public WebElement getThresholdOne(){return thresholdOne;}
     //显示值1
      @FindBy(xpath = "//label[text()='显示值 1']/following-sibling::div//input[@class='el-input__inner']")
      private WebElement displayOne;
      public WebElement getDisplayOne(){return displayOne;}
      //提示语1
      @FindBy(xpath = "//label[text()='提示语 1']/following-sibling::div//input[@class='el-input__inner']")
      private WebElement tipsOne;
      public WebElement getTipsOne(){return tipsOne;}

      //阈值2
      @FindBy(xpath = "//label[text()='阈值 2']/following-sibling::div//input[@class='el-input__inner']")
      private WebElement thresholdTwo;
      public WebElement getThresholdTwo(){return thresholdTwo;}
      //显示值2
      @FindBy(xpath = "//label[text()='显示值 2']/following-sibling::div//input[@class='el-input__inner']")
      private WebElement displayTwo;
      public WebElement getDisplayTwo(){return displayTwo;}
      //提示语2
      @FindBy(xpath = "//label[text()='提示语 2']/following-sibling::div//input[@class='el-input__inner']")
      private WebElement tipsTwo;
      public WebElement getTipsTwo(){return tipsTwo;}



//网络
     @FindBy(xpath = "//li[contains(text(),'网络')]")
     private WebElement net;
      public WebElement getNet(){return net;}

    //网络中的实体
      @FindBy(xpath = "//li[text()='实体']/i")
      private WebElement entity;
      public WebElement getEntity(){return entity;}
      //样式中的实体
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[1]/i")
    private WebElement entityStyle;
      public WebElement getEntityStyle(){return entityStyle;}
      //实体-样式下拉框
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div/div")
    private WebElement entityStyleSelect;
     public WebElement getEntityStyleSelect(){
         entityStyleSelect.click();
         return this.getLastDropdownList();
     }
     //实体-数据-搜索的类别
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div[1]/div")
    private WebElement entitySearchCategory;
     public WebElement getEntitySearchCategory(){
         entitySearchCategory.click();
         return this.getLastDropdownList();
     }
     //实体-数据-值范围
    //正常开始值
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div[3]/div[1]/div/div[1]/input")
    private WebElement normalStart;
     public WebElement getNormalStart(){return normalStart;}
    //正常结束值
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div[3]/div[1]/div/div[2]/input")
    private WebElement normalEnd;
     public WebElement getNormalEnd(){return normalEnd;}
    //异常开始值
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div[3]/div[2]/div/div[1]/input")
    private WebElement abnormalStart;
     public WebElement getAbnormalStart(){return abnormalStart;}
    //异常结束值
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div[3]/div[2]/div/div[2]/input")
    private WebElement abnormalEnd;
     public WebElement getAbnormalEnd(){return abnormalEnd;}
    //严重开始值
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div[3]/div[3]/div/div[1]/input")
    private WebElement seriousStart;
     public WebElement getSeriousStart(){return seriousStart;}
    //严重结束值
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div[3]/div[3]/div/div[2]/input")
    private WebElement seriousEnd;
     public WebElement getSeriousEnd(){return seriousEnd;}


//流程线
    //网络中的流程线
    @FindBy(xpath = "//li[text()='流程线']/i")
    private WebElement flowLine;
     public WebElement getFlowLine(){return flowLine;}


     //样式中的流程线
     @FindBy(xpath = "//div[text()='流程线']/i")
     private WebElement styleFlowLine;
     public WebElement getStyleFlowLine(){return styleFlowLine;}
     //流程线大小
    @FindBy(xpath = "//label[contains(text(),'流程线大小')]/following-sibling::div/input")
    private WebElement flowLineSize;
     public WebElement getFlowLineSize(){return flowLineSize;}
    //流程线粗细
    @FindBy(xpath = "//label[contains(text(),'流程线粗细')]/following-sibling::div/input")
    private WebElement flowLineCoarseness;
    public WebElement getFlowLineCoarseness(){return flowLineCoarseness;}
     //流程线颜色
     @FindBy(xpath = "//label[contains(text(),'流程线颜色')]/following-sibling::div")
     private WebElement flowLineColor;
     public WebElement getFlowLineColor(){return this.colorInput("流程线", "流程线颜色");}
    //角度
    @FindBy(xpath = "//label[contains(text(),'角度')]/following-sibling::div/input")
     private WebElement angle;
     public WebElement getAngle(){return angle;}
     //标注颜色
     @FindBy(xpath = "//label[contains(text(),'标注颜色')]/following-sibling::div")
     private WebElement taggingColor;
     public WebElement getTaggingColor(){return this.colorInput("流程线", "标注颜色");}
    //标注大小
    @FindBy(xpath = "//label[contains(text(),'标注大小')]/following-sibling::div/input")
    private WebElement taggingSize;
     public WebElement getTaggingSize(){return taggingSize;}
     //弧线
     @FindBy(xpath = "//label[contains(text(),'弧线')]/following-sibling::label")
     private WebElement arcs;
     public WebElement getArcs(){return arcs;}
    //弧线翻转
    @FindBy(xpath = "//label[contains(text(),'弧线翻转')]/following-sibling::label")
    private WebElement arcsFlip;
     public WebElement getArcsFlip(){return arcsFlip;}

//齿轮组合
    //其他中的齿轮组合
    @FindBy(xpath = "//li[text()='齿轮组合']/i")
    private WebElement gearCombination;
   public WebElement getGearCombination(){return gearCombination;}
   //样式中的齿轮组合
    @FindBy(xpath = "//div[text()='齿轮组合']/i")
    private WebElement styleGearCombination;
    public WebElement getStyleGearCombination(){return styleGearCombination;}
    //光环颜色
      @FindBy(xpath = "//label[contains(text(),'光环颜色')]/following-sibling::div")
      private WebElement haloColor;
      public WebElement getHaloColor(){ return this.colorInput("齿轮组合", "光环颜色");}
      public WebElement getBackgroundColor(){
          return this.colorInput("齿轮组合", "背景颜色");
      }
      //显示图层1
      @FindBy(xpath = "//label[contains(text(),'显示图层 1')]/following-sibling::label")
    private WebElement showLayerOne;
      public WebElement getShowLayerOne(){return showLayerOne;}
     //显示图层2
     @FindBy(xpath = "//label[contains(text(),'显示图层 2')]/following-sibling::label")
     private WebElement showLayerTwo;
      public WebElement getShowLayerTwo(){return showLayerTwo;}
      //显示图层3
      @FindBy(xpath = "//label[contains(text(),'显示图层 3')]/following-sibling::label")
      private WebElement showLayerThree;
      public WebElement getShowLayerThree(){return showLayerThree;}

//时间器
    //其他中的时间器
    @FindBy(xpath = "//li[text()='时间器']/i")
    private WebElement clock;
      public WebElement getClock(){return clock;}
    //样式中的时间器
    @FindBy(xpath = "//div[text()='时间器']/i")
    private WebElement styleClock;
      public WebElement getStyleClock(){return styleClock;}
    //字体大小
    public WebElement getClockWordSize() {
        return this.input("时间器", "字体大小");
    }
      //字体颜色
      @FindBy(xpath = "//label[contains(text(),'字体颜色')]/following-sibling::div")
      private WebElement clockFontColor;
      public WebElement getClockFontColor(){return this.colorInput("时间器", "字体颜色");}
     //字体粗细
     public WebElement getClockWordBold() {
         return this.dropdownList("时间器", "字体粗细");
     }
     //对齐方式
    public WebElement getClockHorizontal(){return this.dropdownList("时间器","对齐");}
//    //分享给大屏
//    public WebElement getShareGalaxee() {
//        return this.dropdownList("", "分享给大屏");
//    }
    //时间格式
    @FindBy(xpath = "//label[contains(text(),'时间格式')]/following-sibling::div")
    private WebElement timeFormat;
      public WebElement getTimeFormat(){
          timeFormat.click();
          return getLastDropdownList();
      }
    //分享给大屏
    @FindBy(xpath = "//label[contains(text(),'分享给大屏')]/following-sibling::div")
    private WebElement shareGalaxee;
    public WebElement getShareGalaxeeDropDown(){
        shareGalaxee.click();
        return getLastDropdownList();
    }

//视频流
    //其他中的视频流
    @FindBy(xpath = "//li[text()='视频流']/i")
    private WebElement videoFlow;
      public WebElement getVideoFlow(){return videoFlow;}
      //样式中的视频流
    @FindBy(xpath = "//div[text()='视频流']/i")
    private WebElement styleVideoFlow;
      public WebElement getStyleVideoFlow(){return styleVideoFlow;}
      //样式中的视频地址
      @FindBy(xpath = "//label[contains(text(),'视频地址')]/following-sibling::div/input")
    private WebElement videoAddress;
      public WebElement getVideoAddress(){return videoAddress;}


//边框
    //样式中的边框
    @FindBy(xpath = "//div[text()='边框']/i")
    private WebElement styleFrame;
      public WebElement getStyleFrame(){return styleFrame;}
      //样式选择下拉框
      @FindBy(xpath = "//label[contains(text(),'样式')]/following-sibling::div")
      private WebElement  styleFrameSelect;
      public WebElement getStyleFrameSelect(){
          styleFrameSelect.click();
          return this.getLastDropdownList();
      }

//栅格百分图
    //图表中的栅格百分比
    @FindBy(xpath = "//li[text()='栅格百分图']")
    private WebElement gridPercentChart;
      public WebElement getGridPercentChart(){return gridPercentChart;}

     //样式中的栅格百分图
    @FindBy(xpath = "//div[text()='栅格百分图']/i")
    private WebElement styleGridPercentChart;
      public WebElement getStyleGridPercentChart(){return styleGridPercentChart;}
    //字号
      @FindBy(xpath = "//label[contains(text(),'字号')]/following-sibling::div/input")
      private WebElement gridPercentFontSize;
      public WebElement getGridPercentFontSize(){return gridPercentFontSize;}
    //行高
    @FindBy(xpath = "//label[contains(text(),'行高')]/following-sibling::div/input")
    private WebElement rowHeight;
      public WebElement getRowHeight(){return rowHeight;}
    //字体颜色
    @FindBy(xpath = "//label[contains(text(),'字体颜色')]/following-sibling::div")
   private WebElement gridFontColor;
      public WebElement getGridFontColor(){return this.colorInput("栅格百分图", "字体颜色");}
    //栅格间隙
    @FindBy(xpath = "//label[contains(text(),'栅格间隙')]/following-sibling::div/input")
    private WebElement gridClearance;
      public WebElement getGridClearance(){return gridClearance;}
    //栅格颜色
    @FindBy(xpath = "//label[contains(text(),'栅格颜色')]/following-sibling::div")
    private WebElement gridColor;
      public WebElement getGridColor(){return this.colorInput("栅格百分图", "栅格颜色");}
    //标题
    @FindBy(xpath = "//label[contains(text(),'标题')]/following-sibling::div/input")
    private WebElement gridTitle;
      public WebElement getGridTitle(){return gridTitle;}

      //栅格百分图之数据-搜索-类别
      @FindBy(xpath = "//label[contains(text(),'类别')]/following-sibling::div")
    private WebElement gridDataSearchCategory;
      public WebElement getGridDataSearchCategory(){
        gridDataSearchCategory.click();
        return this.getLastDropdownList();
    }

//图表中的字符云图
   // @FindBy(xpath = "//li[text()='字符云图']")
    @FindBy(className = "wordcloudchart")
    private WebElement characterCloudChart;
      public WebElement getCharacterCloudChart(){return characterCloudChart;}

      //样式中的[图表颜色字体]
    @FindBy(xpath = "//div[text()='图表颜色字体']/i")
    private WebElement styleCloudChart;
      public WebElement getStyleCloudChart(){return styleCloudChart;}
     //图表起始颜色
     @FindBy(xpath = "//label[contains(text(),'图表起始颜色')]/following-sibling::div")
    private WebElement chartStartColor;
      public WebElement getChartStartColor(){
          chartStartColor.click();
          return this.getLastDropdownList();
      }
     @FindBy(xpath = "//span[@style='background: rgb(255, 235, 59);']")
      private WebElement yellow;
      public WebElement getYellow(){return yellow;}
    //字体类型
    @FindBy(xpath = "//label[contains(text(),'字体类型')]/following-sibling::div")
    private WebElement fontType;
      public WebElement getFontType(){
          fontType.click();
          return this.getLastDropdownList();
      }
      //字体最大字号
      @FindBy(xpath = "//label[contains(text(),'字体最大字号')]/following-sibling::div/input")
    private WebElement maxFont;
      public WebElement getMaxFont(){
          return maxFont;
      }

      //字符云图-数据-搜索-数值字段
      @FindBy(xpath = "//label[contains(text(),'数值字段')]/following-sibling::div")
    private WebElement cloudDataSearchNumber;
      public WebElement getCloudDataSearchNumber(){
          cloudDataSearchNumber.click();
          return getLastDropdownList();
      }
      //字符云图-数据-搜索-切分字段
      @FindBy(xpath = "//label[contains(text(),'切分字段')]/following-sibling::div")
    private WebElement cloudDataSearchSegmentation;
      public WebElement getCloudDataSearchSegmentation(){
          cloudDataSearchSegmentation.click();
          return getLastDropdownList();
      }


//雷达图
    //图表中的雷达图
      @FindBy(xpath = "//li[text()='雷达图']")
      private WebElement radarChart;
      public WebElement getRadarChart(){return radarChart;}

      //样式中的雷达图
    @FindBy(xpath = "//div[text()='雷达图']/i")
    private WebElement styleRadarChart;
      public WebElement getStyleRadarChart(){return styleRadarChart;}
      //字号
      @FindBy(xpath = "//label[contains(text(),'字号')]/following-sibling::div/input")
    private WebElement radarFontSize;
      public WebElement getRadarFontSize(){return radarFontSize;}
    //颜色
    @FindBy(xpath = "//label[contains(text(),'颜色')]/following-sibling::div")
    private WebElement radarColor;
      public WebElement getRadarColor(){return this.colorInput("雷达图", "颜色");}
    //字体粗细
    public WebElement getRadarWordBold() {
        return this.dropdownList("雷达图", "字体粗细");
    }
    //区域边框颜色
    @FindBy(xpath = "//label[contains(text(),'区域边框颜色')]/following-sibling::div")
    private WebElement areaBorderColor;
      public WebElement getAreaBorderColor(){return this.colorInput("雷达图", "区域边框颜色");}
    //区域颜色
    @FindBy(xpath = "//label[contains(text(),'区域颜色')]/following-sibling::div")
    private WebElement radarAreaColor;
      public WebElement getRadarAreaColor(){return this.colorInput("雷达图", "区域颜色");}
    //辐射线颜色
    @FindBy(xpath = "//label[contains(text(),'辐射线颜色')]/following-sibling::div")
    private WebElement radarLineColor;
      public WebElement getRadarLineColor(){return this.colorInput("雷达图", "辐射线颜色");}
      //分割线颜色
      @FindBy(xpath = "//label[contains(text(),'分割线颜色')]/following-sibling::div")
      private WebElement splitLineColor;
      public WebElement getSplitLineColor(){return this.colorInput("雷达图", "分割线颜色");}
    //雷达图占比大小
    @FindBy(xpath = "//label[contains(text(),'雷达图占比大小')]/following-sibling::div/input")
    private WebElement proportionOfRadarChart;
      public WebElement getProportionOfRadarChart(){return proportionOfRadarChart;}

      //雷达图-数据-搜索-名称字段
      @FindBy(xpath = "//label[contains(text(),'名称字段')]/following-sibling::div")
    private WebElement radarNameFile;
      public WebElement getRadarNameFile(){
          radarNameFile.click();
          return this.getLastDropdownList();
      }
    //雷达图-数据-搜索-数值字段
    @FindBy(xpath = "//label[contains(text(),'数值字段')]/following-sibling::div")
    private WebElement radarNumberFile;
      public WebElement getRadarNumberFile(){
          radarNumberFile.click();
          return this.getLastDropdownList();
      }





//占比图3D
    //图表中的占比图
    @FindBy(xpath = "//li[text()='占比图3D']")
    private WebElement percent3dChart;
      public WebElement getPercent3dChart(){return percent3dChart;}

      //样式中的占比图3D
    @FindBy(xpath = "//div[text()='占比图3D']/i")
    private WebElement stylePercent3dChart;
      public WebElement getStylePercent3dChart(){return stylePercent3dChart;}

      //名称
      @FindBy(xpath = "//label[contains(text(),'名称')]/following-sibling::div/input")
    private WebElement percent3dName;
      public WebElement getPercent3dName(){return percent3dName;}
    //名称字号
    @FindBy(xpath = "//label[contains(text(),'名称字号')]/following-sibling::div/input")
    private WebElement percent3dNameFontSize;
      public WebElement getPercent3dNameFontSize(){return percent3dNameFontSize;}
    //名称颜色
//    @FindBy(xpath = "//label[contains(text(),'名称颜色')]/following-sibling::div")
//    private WebElement percent3dNameColor;
      public WebElement getPercent3dNameColor(){return this.colorInput("占比图3D", "名称颜色");}
    //数值字号
    @FindBy(xpath = "//label[contains(text(),'数值字号')]/following-sibling::div/input")
    private WebElement numberFontSize;
      public WebElement getNumberFontSize(){return numberFontSize;}
    //数值颜色
    @FindBy(xpath = "//label[contains(text(),'数值颜色')]/following-sibling::div")
    private WebElement numberColor;
      public WebElement getNumberColor(){return this.colorInput("占比图3D", "数值颜色");}

      //数据-搜索-类别
      @FindBy(xpath = "//label[contains(text(),'类别')]/following-sibling::div")
      private WebElement percent3dDataSearchCategory;
      public WebElement getPercent3dDataSearchCategory(){
          percent3dDataSearchCategory.click();
          return this.getLastDropdownList();
      }
      //值范围
    //正常最小值
    @FindBy(xpath = "//label[text()='正常']/following-sibling::div/div/div[1]/input")
    private WebElement normalMin;
      public WebElement getNormalMin(){return normalMin;}
    //正常最大值
    @FindBy(xpath = "//label[text()='正常']/following-sibling::div/div/div[2]/input")
    private WebElement normalMax;
      public WebElement getNormalMax(){return normalMax;}

    //异常最小值
    @FindBy(xpath = "//label[text()='异常']/following-sibling::div/div/div[1]/input")
    private WebElement abnormalMin;
      public WebElement getAbnormalMin(){return abnormalMin;}
    //异常最大值
    @FindBy(xpath = "//label[text()='异常']/following-sibling::div/div/div[2]/input")
    private WebElement abnormalMax;
      public WebElement getAbnormalMax(){return abnormalMax;}
    //严重最小值
    @FindBy(xpath = "//label[text()='严重']/following-sibling::div/div/div[1]/input")
    private WebElement seriousMin;
      public WebElement getSeriousMin(){return seriousMin;}
    //严重最大值
    @FindBy(xpath = "//label[text()='严重']/following-sibling::div/div/div[2]/input")
    private WebElement seriousMax;
      public WebElement getSeriousMax(){return seriousMax;}

//环形柱图
    @FindBy(xpath = "//li[text()='环形柱图']/i")
    private WebElement circularCylinderChart;
      public WebElement getCircularCylinderChart(){return circularCylinderChart;}
     //样式中的图表
    @FindBy(xpath = "//div[text()='图表']/i")
    private WebElement styleCirCylChart;
      public WebElement getStyleCirCylChart(){return styleCirCylChart;}
    //文本字体大小
    @FindBy(xpath = "//label[contains(text(),'字体大小')]/following-sibling::div/input")
   private WebElement textFontSize;
      public WebElement getTextFontSize(){return textFontSize;}
    //文本字体颜色
//    @FindBy(xpath = "//label[contains(text(),'字体颜色')]/following-sibling::div")
//    private WebElement textFontColor;
      public WebElement getTextFontColor(){return this.colorInput("图表", "字体颜色");}
    //文本字体粗细
    public WebElement getTextWordBold() {
        return this.dropdownList("图表", "字体粗细");
    }
    //值阈Min
    public WebElement getThresholdMin() {
        return this.input("图表", "值阈Min");
    }
    //缓存值
    public WebElement getCacheValue() {
        return this.input("图表", "缓存值");
    }
    //环柱渐变色1
//    @FindBy(xpath = "//label[contains(text(),'渐变色1')]/following-sibling::div")
//    private WebElement gradation1;
      public WebElement getGradation1(){return this.colorInput("图表", "渐变色1");}
    //环柱渐变色2
//    @FindBy(xpath = "//label[contains(text(),'渐变色2')]/following-sibling::div")
//    private WebElement gradation2;
      public WebElement getGradation2(){return this.colorInput("图表", "渐变色2");}
    //环柱渐变色3
//    @FindBy(xpath = "//label[contains(text(),'渐变色3')]/following-sibling::div")
//    private WebElement gradation3;
      public WebElement getGradation3(){return this.colorInput("图表", "渐变色3");}

    //环形柱图-数据-搜索-标签
    @FindBy(xpath = "//label[contains(text(),'标签')]/following-sibling::div")
    private WebElement dataSearchLabel;
      public WebElement getDataSearchLabel(){
          dataSearchLabel.click();
          return this.getLastDropdownList();
      }
    //环形柱图-数据-搜索-值
   // @FindBy(xpath = "//label[contains(text(),'值')]/following-sibling::div")
   @FindBy(xpath = "//div[text()='环形柱图']/parent::div/div[4]/div/div")
    private WebElement dataSearchValue;
      public WebElement getDataSearchValue(){
          dataSearchValue.click();
          return this.getLastDropdownList();
      }

//滚动条形图
     //图表中的滚动条形图
     @FindBy(xpath = "//li[text()='滚动条形图']")
    private WebElement scrollBar;
      public WebElement getScrollBar(){return scrollBar;}
      //样式-滚动条形图
     @FindBy(xpath = "//div[text()='滚动条形图']/i")
    private WebElement styleScrollBar;
      public WebElement getStyleScrollBar(){return styleScrollBar;}
        //字体大小
        @FindBy(xpath = "//label[contains(text(),'字体大小')]/following-sibling::div//input[@class='el-input__inner']")
        private WebElement scrollBarFontSize;
      public WebElement getScrollBarFontSize(){return scrollBarFontSize;}
      //字体颜色
    @FindBy(xpath = "//label[contains(text(),'字体颜色')]/following-sibling::div")
    private WebElement fontColor;
      public WebElement getFontColor(){return this.colorInput("滚动条形图", "字体颜色");}
     //字体粗细
     public WebElement getScrollBarWordBold() {
         return this.dropdownList("滚动条形图", "字体粗细");
     }
      //样式-滚动
    @FindBy(xpath = "//div[text()='滚动']/i")
    private WebElement roll;
      public WebElement getRoll(){return roll;}
     //滚动频率
    @FindBy(xpath = "//label[contains(text(),'滚动频率')]/following-sibling::div//input[@class='el-input__inner']")
    private WebElement rollF;
      public WebElement getRollF(){return rollF;}

      //数据-搜索-名称
    public WebElement getScrollBarSearchName() {
        return this.dropdownList("", "名称");
    }
    //数据-搜索-数值字段
    public WebElement getScrollBarSearchNumber() {
        return this.dropdownList("", "数值字段");
    }


//滚动柱形图
    //图表中滚动柱形图
    @FindBy(xpath = "//li[text()='滚动柱形图']")
    private WebElement rollHistogram;
      public WebElement getRollHistogram(){return rollHistogram;}
      //样式中的滚动柱状图
    @FindBy(xpath = "//div[text()='滚动柱形图']/i")
    private WebElement styleRollHist;
      public WebElement getStyleRollHist(){return styleRollHist;
      }
      //字体大小
      public WebElement getRollHistWordSize() {
          return this.input("滚动柱形图", "字体大小");
      }
      //字体颜色
//    @FindBy(xpath = "//label[contains(text(),'字体颜色')]/following-sibling::div")
//    private WebElement rollHistFontColor;
      public WebElement getRollHistFontColor(){return this.colorInput("滚动柱形图", "字体颜色");}
      //字体粗细
      public WebElement getRollHistWordBold() {
          return this.dropdownList("滚动柱形图", "字体粗细");
      }
      //图表颜色1
//      @FindBy(xpath = "//label[contains(text(),'颜色 1')]/following-sibling::div")
//      private WebElement chartColor1;
      public WebElement getChartColor1(){return this.colorInput("滚动柱形图", "颜色 1");}
      //图表颜色2
//     @FindBy(xpath = "//label[contains(text(),'颜色 2')]/following-sibling::div")
//    private WebElement chartColor2;
      public WebElement getChartColor2(){return this.colorInput("滚动柱形图", "颜色 2");}


//滚动列表
    @FindBy(xpath = "//li[text()='滚动列表']")
   private WebElement listOfTurns;
      public WebElement getListOfTurns(){return listOfTurns;}
      //样式中的轮播列表
    @FindBy(xpath = "//div[text()='滚动列表']/i")
    private WebElement styleListOfTurns;
      public WebElement getStyleListOfTurns(){return styleListOfTurns;}
      //字体大小
      public WebElement getListOfTurnsWordSize() {
          return this.input("滚动列表", "字体大小");
      }
    //序号颜色
//    @FindBy(xpath = "//label[contains(text(),'序号颜色')]/following-sibling::div")
//    private WebElement serialNumberColor;
      public WebElement getSerialNumberColor(){return this.colorInput("滚动列表", "序号颜色");}

    public WebElement getSerialNumberColor2(){return this.colorInput("滚动列表II", "序号颜色");}
      //背景颜色
//       @FindBy(xpath = "//label[contains(text(),'背景颜色')]/following-sibling::div")
//        private WebElement listOfTurnsBackgroundColor;
      public WebElement getListOfTurnsBackgroundColor(){return this.colorInput("滚动列表", "背景颜色");}

    public WebElement getListOfTurnsBackgroundColor2(){return this.colorInput("滚动列表II", "背景颜色");}
      //内容颜色
//      @FindBy(xpath = "//label[contains(text(),'内容颜色')]/following-sibling::div")
//    private WebElement contentColor;
      public WebElement getContentColor(){return this.colorInput("滚动列表", "内容颜色");}

    public WebElement getContentColor2(){return this.colorInput("滚动列表II", "内容颜色");}
    //字体粗细
    public WebElement getListOfTurnsWordBold() {
        return this.dropdownList("滚动列表", "字体粗细");
    }


//水平胶囊
    @FindBy(xpath = "//li[text()='水平胶囊']/i")
    private WebElement horizontalCapsule;
      public WebElement getHorizontalCapsule(){return horizontalCapsule;}

      //样式中的水平胶囊
    @FindBy(xpath = "//div[text()='水平胶囊']/i")
    private WebElement styleHorizontalCapsule;
      public WebElement getStyleHorizontalCapsule(){return styleHorizontalCapsule;}
      //字体大小
      public WebElement getCapsuleWordSize() {
          return this.input("水平胶囊", "字体大小");
      }
      //字体颜色
//      @FindBy(xpath = "//label[contains(text(),'字体颜色')]/following-sibling::div")
//      private WebElement capsuleFontColor;
      public WebElement getCapsuleFontColor(){return this.colorInput("水平胶囊", "字体颜色");}
      //字体粗细
     public WebElement getCapsuleWordBold(){return this.dropdownList("水平胶囊","字体粗细");}
     //条高比
     @FindBy(xpath = "//label[contains(text(),'条高比')]/following-sibling::div//input[@class='el-input__inner']")
    private WebElement aspectRatio;
      public WebElement getAspectRatio(){return aspectRatio;}
      //条颜色
//      @FindBy(xpath = "//label[contains(text(),'条颜色')]/following-sibling::div")
//      private WebElement aspectColor;
      public WebElement getAspectColor(){return this.colorInput("水平胶囊", "条颜色");}

//3D柱图
    @FindBy(xpath = "//li[text()='3D柱图']")
    private WebElement column3D;
    public WebElement getColumn3D(){return column3D;}

    //样式中的3D柱图
    @FindBy(xpath = "//div[text()='3D柱图']/i")
    private WebElement styleColumn3D;
    public WebElement getStyleColumn3D(){return styleColumn3D;}
    //字体大小
    public WebElement getColumnWordSize() {
        return this.input("3D柱图", "字体大小");
    }
    //字体颜色
    public WebElement getColumnFontColor(){return this.colorInput("3D柱图", "字体颜色");}
    //轴颜色
    public WebElement getAxisColor(){return this.colorInput("3D柱图", "轴颜色");}
    //柱1颜色
    public WebElement getColumnOneColor(){return this.colorInput("3D柱图", "柱1颜色");}
    //柱2颜色
    public WebElement getColumnTwoColor(){return this.colorInput("3D柱图", "柱2颜色");}

//日历图
    @FindBy(xpath = "//li[text()='日历图']")
    private WebElement calendar;
    public WebElement getCalendar(){return calendar;}

    //样式中的日历图
    @FindBy(xpath = "//div[text()='日历图']/i")
    private WebElement styleCalendar;
    public WebElement getStyleCalendar(){return styleCalendar;}
    //字体大小
    public WebElement getCalendarTopMargin() {
        return this.input("日历图", "上边距");
    }
    //月份字号
    public WebElement getCalendarMonthSize() {
        return this.input("日历图", "月份字号");
    }
    //星期字号
    public WebElement getCalendarWeekSize() {
        return this.input("日历图", "星期字号");
    }
    //表格大小
    public WebElement getCalendarTableSize() {
        return this.input("日历图", "表格大小");
    }
    //月份颜色
    public WebElement getCalendarMonthColor(){return this.colorInput("日历图", "月份颜色");}
    //星期颜色
    public WebElement getCalendarWeekColor(){return this.colorInput("日历图", "星期颜色");}
    //标注颜色
    public WebElement getCalendarTaggingColor(){return this.colorInput("日历图", "标注颜色");}
    //背景颜色
    public WebElement getCalendarBackgroundColor(){return this.colorInput("日历图", "背景颜色");}


//综合列表
    @FindBy(xpath = "//li[text()='综合列表']/i")
    private WebElement comprehensiveList;
      public WebElement getComprehensiveList(){return comprehensiveList;}
      //样式中的综合列表
    @FindBy(xpath = "//div[text()='综合列表']/i")
    private WebElement styleComprehensiveList;
      public WebElement getStyleComprehensiveList(){return styleComprehensiveList;}
     //标题颜色
//    @FindBy(xpath = "//label[contains(text(),'标题颜色')]/following-sibling::div")
//    private WebElement listTitleColor;
      public WebElement getListTitleColor(){return this.colorInput("综合列表", "标题颜色");}
    //数值颜色
    public WebElement getListNumberColor(){return this.colorInput("综合列表", "数值颜色");}

    //条颜色
    public WebElement getListAspectColor(){return this.colorInput("综合列表", "条颜色");}

    //缩略比例
    @FindBy(xpath = "//label[contains(text(),'缩略比例')]/following-sibling::div")
    private WebElement abbRatio;
      public WebElement getAbbRatio(){
          abbRatio.click();
          return getLastDropdownList();
      }


//滚动列表二
    @FindBy(xpath = "//li[text()='滚动列表II']")
    private WebElement rollList2;
      public WebElement getRollList2(){return rollList2;}

    //样式中的滚动列表2
    @FindBy(xpath = "//div[text()='滚动列表II']/i")
    private WebElement styleRollList2;
      public WebElement getStyleRollList2(){return styleRollList2;}
      //字体大小
      public WebElement getRollList2WordSize() {
          return this.input("滚动列表II", "字体大小");
      }
    //字体粗细
    public WebElement getRollList2WordBold(){return this.dropdownList("滚动列表II","字体粗细");}
     //背景颜色1
//    @FindBy(xpath = "//label[contains(text(),'背景颜色1')]/following-sibling::div")
//    private WebElement backgroundColor1;
      public WebElement getBackgroundColor1(){return this.colorInput("滚动列表II", "背景颜色1");}
      //背景颜色2
//    @FindBy(xpath = "//label[contains(text(),'背景颜色2')]/following-sibling::div")
//    private WebElement backgroundColor2;
      public WebElement getBackgroundColor2(){return this.colorInput("滚动列表II", "背景颜色2");}
      //背景颜色3
//    @FindBy(xpath = "//label[contains(text(),'背景颜色3')]/following-sibling::div")
//    private WebElement backgroundColor3;
      public WebElement getBackgroundColor3(){return this.colorInput("滚动列表II", "背景颜色3");}

//滚动列表三
    @FindBy(xpath = "//li[text()='滚动列表III']/i")
    private WebElement rollList3;
      public WebElement getRollList3(){return rollList3;}
    //样式中的滚动列表3
    @FindBy(xpath = "//div[text()='滚动列表III']/i")
    private WebElement styleRollList3;
    public WebElement getStyleRollList3(){return styleRollList3;}
    //字体大小
    public WebElement getRollList3WordSize() {
        return this.input("滚动列表III", "字体大小");
    }
    //字体粗细
    public WebElement getRollList3WordBold(){return this.dropdownList("滚动列表III","字体粗细");}


    //指标的下拉菜单
    @FindBy(xpath = "//li[contains(text(),'指标')]/ul")
    private WebElement indexDropdown;
    public  WebElement getIndexDropdown(){return indexDropdown;}


    @FindBy(xpath = "//span[@class='yotta-icon yotta-icon-PresentationAlternative']")
    private WebElement back;
    public WebElement getBack() {
        return back;
    }

    //网络下拉菜单
    @FindBy(xpath = "//li[contains(text(),'网络')]/ul")
    private WebElement netDropdown;
    public WebElement getNetDropdown(){return netDropdown;}

    //文字下拉菜单
    @FindBy(xpath = "//li[contains(text(),'文字')]/ul")
    private WebElement wordDropdown;
    public WebElement getWordDropdown(){return wordDropdown;}

    // 装饰下拉菜单
    @FindBy(xpath = "//li[contains(text(),'装饰')]/ul")
    private WebElement decorateDropdown;
    public WebElement getDecorateDropdown(){return decorateDropdown;}

    //其他下拉菜单
    @FindBy(xpath = "//li[contains(text(),'其他')]/ul")
    private WebElement otherDropdown;
    public WebElement getOtherDropdown(){return otherDropdown;}

//动态卡片
    @FindBy(xpath = "//li[text()='动态卡片']/i")
    private WebElement dynamicCard;
    public WebElement getDynamicCard(){return dynamicCard;}

    @FindBy(xpath = "//div[text()='动态卡片']/i")
    private WebElement styleDynamicCard;
    public WebElement getStyleDynamicCard(){return styleDynamicCard;}

    @FindBy(xpath = "//label[contains(text(),'名称字体大小')]/following-sibling::div/input")
    private WebElement nameFontSize;
    public WebElement getNameFontSize(){return nameFontSize;}

    //名称字体粗细
    public WebElement getDynamicCardWordBold(){return this.dropdownList("动态卡片","名称字体粗细");}

    @FindBy(xpath = "//label[contains(text(),'名称颜色')]/following-sibling::div")
    private WebElement nameColor;
    public WebElement getNameColor(){return this.colorInput("动态卡片", "名称颜色");}

    @FindBy(xpath = "//label[contains(text(),'背景颜色')]/following-sibling::div")
    private WebElement backColor;
    public WebElement getBackColor(){return this.colorInput("动态卡片", "背景颜色");}

    public WebElement getNameColor2(){return this.colorInput("动态卡片II", "名称颜色");}

    public WebElement getBackColor2(){return this.colorInput("动态卡片II", "背景颜色");}

    @FindBy(xpath = "//label[contains(text(),'值字体大小')]/following-sibling::div/input")
    private WebElement valueFontSize;
    public WebElement getValueFontSize(){return valueFontSize;}

    //值字体粗细
    public WebElement getValueFontWordBold(){return this.dropdownList("动态卡片","值字体粗细");}

    @FindBy(xpath = "//label[contains(text(),'值颜色')]/following-sibling::div")
    private WebElement valueColor;
    public WebElement getValueColor(){return this.colorInput("动态卡片", "值颜色");}

    public WebElement getValueColor2(){return this.colorInput("动态卡片II", "值颜色");}

    @FindBy(xpath = "//label[contains(text(),'线宽度')]/following-sibling::div/input")
    private WebElement lineBold;
    public WebElement getLineBold(){return lineBold;}

    //   线颜色
    @FindBy(xpath = "//label[contains(text(),'线颜色')]/following-sibling::div")
    private WebElement lineColor;
    public WebElement getLineColor(){return this.colorInput("动态卡片", "线颜色");}

    public WebElement getLineColor2(){return this.colorInput("动态卡片II", "线颜色");}
   //    边框宽度
    @FindBy(xpath = "//label[contains(text(),'边框宽度')]/following-sibling::div/input")
    private WebElement bordWidth;
    public WebElement getBordWidth(){return bordWidth;}
   //    边框颜色
    @FindBy(xpath = "//label[contains(text(),'边框颜色')]/following-sibling::div")
    private WebElement bordColor;
    public WebElement getBordColor(){return this.colorInput("动态卡片", "边框颜色");}

    public WebElement getBordColor2(){return this.colorInput("动态卡片II", "边框颜色");}
   //    动画时长
    @FindBy(xpath = "//label[contains(text(),'动画时长')]/following-sibling::div/input")
    private WebElement dynamicTime;
    public WebElement getDynamicTime(){return dynamicTime;}
   //    动画停留
    @FindBy(xpath = "//label[contains(text(),'动画停留')]/following-sibling::div/input")
    private WebElement dynamicStop;
    public WebElement getDynamicStop(){return dynamicStop;}
   //    间距
    @FindBy(xpath = "//label[contains(text(),'间距')]/following-sibling::div/input")
    private WebElement spacing;
    public WebElement getSpacing(){return spacing;}

    //数据-搜索-名称
    @FindBy(xpath = "//div[text()='动态卡片']/following-sibling::div/following-sibling::div/div/div")
    private WebElement dynamicCardName;
    public WebElement  getDynamicCardName(){
        dynamicCardName.click();
        return this.getLastDropdownList();
    }
    //数据-搜索-数值字段
    @FindBy(xpath = "//label[contains(text(),'数值字段')]/following-sibling::div")
    private WebElement dynamicCardNumberFiled;
    public WebElement getDynamicCardNumberFiled(){
        dynamicCardNumberFiled.click();
        return this.getLastDropdownList();
    }

//动态卡片二
    @FindBy(xpath = "//li[text()='动态卡片II']/i")
    private WebElement dynamicCardTwo;
    public WebElement getDynamicCardTwo(){return dynamicCardTwo;}

    @FindBy(xpath = "//div[text()='动态卡片II']/i")
    private WebElement styleDynamicCardTwo;
    public WebElement getStyleDynamicCardTwo(){return styleDynamicCardTwo;}

    @FindBy(xpath = "//div[text()='动态卡片II']/following-sibling::div/following-sibling::div/div/div")
    private WebElement dynamicCardNameTwo;
    public WebElement  getDynamicCardNameTwo(){
        dynamicCardNameTwo.click();
        return this.getLastDropdownList();
    }

    //名称字体粗细
    public WebElement getDynamicCardTwoWordBold(){return this.dropdownList("动态卡片II","名称字体粗细");}
    //值字体粗细
    public WebElement getValueFontTwoWordBold(){return this.dropdownList("动态卡片II","值字体粗细");}

//标题控件中的对齐方式
public WebElement getTitleHorizontal(){return this.dropdownList("标题","对齐");}
//标题中的动画
   @FindBy(xpath = "//label[contains(text(),'角度')]/parent::div/following-sibling::div/label[contains(text(),'动画')]/following-sibling::label")
    private WebElement dynamic;
    public WebElement getDynamic(){return dynamic;}

    public WebElement getFontInput(){return this.colorInput("标题", "字体颜色");}

//表格
    //表头高度
    @FindBy(xpath = "//label[contains(text(),'表头高度')]/following-sibling::div/input")
    private WebElement headHeight;
    public WebElement getHeadHeight(){return headHeight;}
    //表头-颜色
    @FindBy(xpath = "//label[contains(text(),'颜色')]/following-sibling::div")
    private WebElement color;
    public WebElement getGridHeadColor(){return this.colorInput("表头", "颜色");}
//    内边距
    @FindBy(xpath = "//label[contains(text(),'内边距')]/following-sibling::div/input")
    private WebElement padding;
    public WebElement getPadding(){return padding;}
//   显示行数
    @FindBy(xpath = "//label[contains(text(),'显示行数')]/following-sibling::div/input")
    private WebElement showRows;
    public WebElement getShowRows(){return showRows;}

//单元格-颜色
     @FindBy(xpath = "//div[contains(text(),'单元格')]/following-sibling::div/div/div/div[2]/div")
     private WebElement tableColor;
    public WebElement getTableColor(){return this.colorInput("单元格", "颜色");}
//单元格-背景颜色
    @FindBy(xpath = "//div[contains(text(),'单元格')]/following-sibling::div/div/div/div[4]/div")
    private WebElement tableBgColor;
    public WebElement getTableBgColor(){return this.colorInput("单元格", "背景颜色");}
//单元格-边框颜色
    @FindBy(xpath = "//div[contains(text(),'单元格')]/following-sibling::div/div/div/div[6]/div")
    private WebElement tableFrameColor;
    public WebElement getTableFrameColor(){return this.colorInput("单元格", "边框颜色");}
//单元格-内边距
    @FindBy(xpath = "//div[contains(text(),'单元格')]/following-sibling::div/div/div/div[7]/div/input")
    private WebElement tablePadding;
    public WebElement getTablePadding(){
        return tablePadding;}
//单元格-显示行数
    @FindBy(xpath = "//div[contains(text(),'单元格')]/following-sibling::div/div/div/div[8]/div/input")
    private WebElement tableShowRow;
    public WebElement getTableShowRow(){return tableShowRow;}

//数值翻牌器
    //字体颜色
    @FindBy(xpath = "//label[contains(text(),'字体颜色')]/following-sibling::div")
    private WebElement numberFontColor;
    public WebElement getNumberFontColor(){return this.colorInput("翻转", "字体颜色");}

    //字体粗细
    public WebElement getFlipNumberWordBold(){return this.dropdownList("翻转","字体粗细");}
    //对齐方式
    public WebElement getFlipNumberHorizontal(){return this.dropdownList("翻转","对齐");}
    // 间距
    @FindBy(xpath = "//label[contains(text(),'间距')]/following-sibling::div/input")
    private WebElement flipSpacing;
    public WebElement getFlipSpacing(){return flipSpacing;}

// 柱图-Y轴-分割线
    //宽度
    @FindBy(xpath = "//div[text()='y轴']/following-sibling::div//label[contains(text(),'显示分割线')]/parent::div/following-sibling::div[1]//label[contains(text(),'宽度')]/following-sibling::div//input")
    private WebElement yDividingLineBold;
    public WebElement  getYDividingLineBold(){return yDividingLineBold;}
    //颜色
    @FindBy(xpath = "//div[text()='y轴']/following-sibling::div//label[contains(text(),'显示分割线')]/parent::div/following-sibling::div[2]//label[contains(text(),'颜色')]/following-sibling::div//span[@class='sp-original-input-container']//input")
    private WebElement yDividingLineColor;
    public WebElement getYDividingLineColor(){return yDividingLineColor;}
    //类型
    @FindBy(xpath = "//div[text()='y轴']/following-sibling::div//label[contains(text(),'显示分割线')]/parent::div/following-sibling::div[3]//label[contains(text(),'类型')]/following-sibling::div//input")
    private WebElement yDividingLineType;
    public WebElement getYDividingLineType(){
        yDividingLineType.click();
        return this.getLastDropdownList();
    }
//轴线
    @FindBy(xpath = "//div[text()='y轴']/following-sibling::div//label[contains(text(),'轴线')]/parent::div/following-sibling::div[1]//label[contains(text(),'颜色')]/following-sibling::div//span[@class='sp-original-input-container']//input")
    private WebElement yLineColor;
    public WebElement getYLineColor(){return yLineColor;}

    @FindBy(xpath = "//div[text()='y轴']/following-sibling::div//label[contains(text(),'轴线')]/parent::div/following-sibling::div[2]//label[contains(text(),'宽度')]/following-sibling::div//input")
    private WebElement yLineBold;
    public WebElement getYLineBold(){return yLineBold;}



//双轴折线图-Y轴1-分割线
    //宽度
    @FindBy(xpath = "//div[text()='y轴']/following-sibling::div//label[contains(text(),'yAxis1')]/parent::div/following-sibling::div[11]//label[contains(text(),'宽度')]/following-sibling::div//input")
    private WebElement y1DividingLineBold;
    public WebElement  getY1DividingLineBold(){return y1DividingLineBold;}
    //颜色
    @FindBy(xpath = "//div[text()='y轴']/following-sibling::div//label[contains(text(),'yAxis1')]/parent::div/following-sibling::div[12]//label[contains(text(),'颜色')]/following-sibling::div//span[@class='sp-original-input-container']//input")
    private WebElement y1DividingLineColor;
    public WebElement getY1DividingLineColor(){return y1DividingLineColor;}
    //类型
    @FindBy(xpath = "//div[text()='y轴']/following-sibling::div//label[contains(text(),'yAxis1')]/parent::div/following-sibling::div[13]//label[contains(text(),'类型')]/following-sibling::div//input")
    private WebElement y1DividingLineType;
    public WebElement getY1DividingLineType(){
        y1DividingLineType.click();
        return this.getLastDropdownList();
    }
    //轴线
    @FindBy(xpath = "//div[text()='y轴']/following-sibling::div//label[contains(text(),'yAxis1')]/parent::div/following-sibling::div[16]//label[contains(text(),'颜色')]/following-sibling::div//span[@class='sp-original-input-container']//input")
    private WebElement y1LineColor;
    public WebElement getY1LineColor(){return y1LineColor;}

    @FindBy(xpath = "//div[text()='y轴']/following-sibling::div//label[contains(text(),'yAxis1')]/parent::div/following-sibling::div[17]//label[contains(text(),'宽度')]/following-sibling::div//input")
    private WebElement y1LineBold;
    public WebElement getY1LineBold(){return y1LineBold;}





    @FindBy(xpath = "//div[text()='静态数据确认，接下来请配置展示字段']")
    private WebElement tipsText;
    public WebElement getTipsText(){return tipsText;}

    @FindBy(xpath = "//div[text()='静态数据确认，接下来请配置展示字段']/following-sibling::div")
    private WebElement tips;
    public WebElement getTips(){return tips;}




}
