package com.yottabyte.pages.galaxee;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.GetTime;
import cucumber.api.java.en_lol.WEN;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

/**
 * @author lina
 */
public class NewCreatePage extends PageTemplate {
    public NewCreatePage(WebDriver driver) {
        super(driver);
//        driver.manage().window().setPosition(new Point(0,0));
        driver.manage().window().fullscreen();
    }

    @FindBy(className = "el-input__inner")
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


    @FindBy(xpath = "//span[@class='yotta-icon yotta-icon-CollectionAlternative']")
    private WebElement module;
    public WebElement getModule(){
        return module;
    }
    @FindBy(xpath = "//span[@class='yotta-icon yotta-icon-LayerAlternative']")
    private WebElement coverage;
    public WebElement getCoverage(){
        return coverage;
    }


    @FindBy(xpath = "//span[@class='yotta-icon yotta-icon-ChartAlternative']")
    private WebElement chart;

    @FindBy(xpath = "//span[@class='yotta-icon yotta-icon-LocationAlternative']")
    private WebElement map;



    @FindBy(xpath = "//span[@class='yotta-icon yotta-icon-TextAlternative']")
    private WebElement index;


    @FindBy(xpath = "//li[contains(text(),'装饰')]")
    private WebElement decorate;

    @FindBy(xpath = "//span[@class='yotta-icon yotta-icon-MediaAlternative']")
    private WebElement media;

    @FindBy(className = "barcharthorizontal")
    private WebElement barHorizontal;

    @FindBy(className = "sunburstchart")
    private WebElement sunburst;

    @FindBy(xpath = "//div[@class='_1HFHZfX1Ew247R3-chlq5v']")
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
   @FindBy(xpath = "//button[@yotta-test='search_bar-submit-button']")
    private WebElement search;

    @FindBy(xpath = "(//span[contains(text(),'更新')][not(@class)])[last()]")
    private WebElement update;

    @FindBy(className = "download")
    private WebElement download;

    @FindBy(className = "delete")
    private WebElement delete;

    @FindBy(xpath = "(//span[contains(text(),'确定')][not(@class)])[last()]")
    private WebElement ensureDelete;

    @FindBy(xpath = "//p[text()='请正确填写大屏名称！']")
    private WebElement tipOfCreat;

    @FindBy(xpath = "(//span[contains(text(),'确定')]/parent::button)[last()]")
    private WebElement tipOfEnsure;

    @FindBy(className = "el-upload--text")
    private WebElement upload;

    @FindBy(xpath = "//pre[@class=' CodeMirror-line ']")
    private WebElement splInput;

    @FindBy(xpath = "//div[@class='msX9obOpSfvFUiokS9us-']/span[@aria-label='MoveUpAlternative']")
    private WebElement upMove;

    @FindBy(xpath = "//div[@class='msX9obOpSfvFUiokS9us-']/span[@aria-label='MoveDownAlternative']")
    private WebElement downMove;

    @FindBy(xpath = "//div[@class='msX9obOpSfvFUiokS9us-']/span[@aria-label='MoveTopAlternative']")
    private WebElement upMoveToTop;

    @FindBy(xpath = "//div[@class='msX9obOpSfvFUiokS9us-']/span[@aria-label='MoveBottomAlternative']")
    private WebElement downMoveToBottom;

    @FindBy(xpath = "//span[@class='yotta-icon yotta-icon-SettingAlternative']")
  //   @FindBy(xpath = "//div[@class='el-tabs__nav']/div[text()='样式']")
     private WebElement style;

    @FindBy(xpath = "//div[text()='交互']")
    //   @FindBy(xpath = "//div[@class='el-tabs__nav']/div[text()='样式']")
    private WebElement interactive;

    @FindBy(xpath = "//div[text()='图表尺寸位置']")
    private WebElement position;

    @FindBy(xpath = "//div[@class='_2xOZiuGdxIFOwiQSkgfyAx']")
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

    @FindBy(xpath = "//div[@id='canvas']")
    private WebElement pageBackground;

    @FindBy(xpath = "//div[@class='sp-container sp-light sp-alpha-enabled sp-clear-enabled sp-palette-buttons-disabled']//div[@class='sp-button-container sp-cf']/button[text()='choose']")
    private WebElement ensureColor;

    @FindBy(xpath = "//label[contains(text(),'平滑')]/following-sibling::label")
    private WebElement smooth;

    @FindBy(xpath = "(//label[contains(text(),'平滑')]/following-sibling::label)[2]")
    private WebElement secondSmooth;


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

    @FindBy(xpath = "//span[@placeholder='请选择快捷时间或时间范围']")
    private WebElement dateEditor;

    @FindBy(xpath = "(//div//label[contains(text(),'切分字段')]//following-sibling::div//i)[last()]")
    private WebElement lastDivideField;


    @FindBy(xpath = "(//span[@class='chart-color-block'])[6]")
    private WebElement green;

//    @FindBy(xpath = "//div[text()='单环颜色']/following-sibling::div//label/following-sibling::div//span[@class='el-color-picker__color-inner']")
//    private WebElement monocycleColor;

    @FindBy(className = "arcbarchart")
    private WebElement arcBar;

    @FindBy(xpath = "(//div[text()='极坐标系']/following-sibling::div//label[contains(text(),'中心纬度,经度')]/following-sibling::div//input)[2]")
    private WebElement polarYaxis;

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

    @FindBy(className = "heatmap")
    private WebElement heatmap;

    @FindBy(className = "attackmap")
    private WebElement attackmap;

    @FindBy(className = "globelabel")
    private WebElement globelabel;

    @FindBy(xpath = "//li[text()='攻击图3D']")
    private WebElement attack3d;

    @FindBy(className = "status")
    private WebElement status;

    @FindBy(xpath = "//span[@class='yotta-icon yotta-icon-TableAlternative']")
    private WebElement table;
    public WebElement getKeyValueTable(){
        return getDivText("键值表格");
    }

    @FindBy(className = "el-color-picker__color-inner")
    private WebElement colorInner;


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


    @FindBy(xpath = "//span[text()='水波动画']/../../div[2]//span[@class='yotta-switch-input']")
    private WebElement waterWaveSwitch;

    @FindBy(xpath = "//span[text()='显示边框']/../../div[2]//span[@class='yotta-switch-input']")
    private WebElement outerFrameSwitch;
    @FindBy(xpath = "//span[text()='数据抖动修正']/../../div[2]//span[@class='yotta-switch-input']")
    private WebElement DataJitterCorrection;
    public WebElement getDataJitterCorrection(){
        return DataJitterCorrection;
    }
    @FindBy(xpath = "//span[text()='开启动画']/../../div[2]//span[@class='yotta-switch-input']")
    private WebElement OpenAnimation;
    public WebElement getOpenAnimation(){
        return OpenAnimation;
    }

    @FindBy(className = "chordchart")
    private WebElement chord;

    @FindBy(xpath = "//span[contains(@style,'background: rgb(233, 30, 99);')]")
    private WebElement red;

    @FindBy(className = "sankeychart")
    private WebElement sankey;

    @FindBy(className = "fullscreen")
    private WebElement fullscreen;

    @FindBy(className = "frame")
    private WebElement frame;

    @FindBy(className = "clocktime")
    private WebElement clocktime;

    @FindBy(xpath = "//div[@class='yotta-table-chart-container']")
    private WebElement searchTip;

    @FindBy(xpath = "//span[@aria-label='CloseOutlined']")
    private WebElement closeData;
    public WebElement getCloseData(){
        return closeData;
    }

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

    @FindBy(xpath = "//span[@aria-label='PresentationAlternative']")
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

    @FindBy(xpath = "//span[text()='背景颜色']/../..//input")
    private WebElement pageBackgroundColor;
    public WebElement getPageBackgroundColor() { return pageBackgroundColor; }

    @FindBy(xpath = "//span[text()='屏幕大小']/../..//div[@class='_1gs26iKzGCQvxx6BcWspN3']/div[2]//input")
    private WebElement ScreenHidth;
    public WebElement getScreenHidth() { return ScreenHidth; }

//    @FindBy(xpath = "//input[@value='页面设置']//ancestor::div[@class='_3THzRCdOcKS-tY5zQlLXSL _6f2Nt4huRGMZUgMsUle8F']")
    @FindBy(xpath = "//span[@aria-label='PublishAlternative']")
    private WebElement DaPing;
    public WebElement getDaPing() { return DaPing; }




    @FindBy(xpath = "//span[text()='屏幕大小']/../..//div[@class='_1gs26iKzGCQvxx6BcWspN3']/div[1]//input")
    private WebElement ScreenWidth;
    public WebElement getScreenWidth() { return ScreenWidth; }
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
        return this.layoutList1("背景图");
    }
    public WebElement getCircleAngle(){
        return this.layoutList1("圆角");
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
        return this.getDivText("单张图片");
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

    public WebElement getMedia() {
        return media;
    }

    public WebElement getFullscreen() {
        return fullscreen;
    }

    public WebElement getSankey() {
        return sankey;
    }

    public WebElement getRepulsionFactor() {
        return this.input("斥力因子", "斥力因子倍数");
    }

    public WebElement getRepulsionFactorHeader() {
        return this.getDivText("斥力因子");
    }

    public WebElement getForce() {
        return this.getChartList("力图");
    }
    public WebElement getIndicatorComparisonPie(){
        return this.getChartList("指标对比饼图");
    }

    public WebElement getRed() {
        return red;
    }

    public WebElement getChord() {
        return chord;
    }

    public WebElement getWaterWaveColor() {
        return this.input("水波", "水波颜色");
    }

    public WebElement getWaterWave() {
        return this.getDivText("水波");
    }

    public WebElement getTagColorInWaterWave() {
        return this.input("标签", "水波内颜色");
    }

    public WebElement getTagColorOutWaterWave() {
        return this.input("标签", "水波外颜色");
    }

    public WebElement getOuterFrameSwitch() {
        return outerFrameSwitch;
    }

    public WebElement getLiquidShape() {
        return this.dropdownList("样式", "形状");
    }
    public WebElement getArrangementMode(){
        return this.dropdownList("全局","排列方式");
    }


    public WebElement getWaterWaveSwitch() {
        return waterWaveSwitch;
    }


    public WebElement getLiquidfill() {
        return this.getChartList("水球图");
    }
    public WebElement getActionPattern(){
        return this.dropdownList("动画","动画模式");
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
        return this.input("全局", "表格行数");
    }

    public WebElement getCellFrameBold() {
        return this.input("单元格", "边框粗细");
    }
    public WebElement getTableHeadFrameBold(){return this.input("表头","边框粗细");}

    public WebElement getCellBold() {
        return this.dropdownList("文本样式", "文字粗细");
    }
    public WebElement getCellWordColor(){
        return input("文本样式","字体颜色");
    }

    public WebElement getTableCell() {
        return this.getDivText("单元格");
    }
    public WebElement getSpace() {
        return this.getDivText("间距");
    }
    public WebElement getAboutSpacing(){
        return this.input("间距","左右间距");
    }
    public WebElement getUpDownSpacing(){
        return this.input("间距","上下间距");
    }

    public WebElement getCellWordSize() {
        return this.input("文本样式", "字号");
    }

    public WebElement getTableHeaderBgColor() {
        return this.input("表头", "背景颜色");
    }

    public WebElement getTableHeaderBold() {
        return this.dropdownList("文本样式", "文字粗细");
    }

    public WebElement getTableHeaderWordSize() {
        return this.input("文本样式", "字号");
    }
    public WebElement getTableHeaderWordColor(){
        return this.input("文本样式","字体颜色");
    }
    public WebElement getOddNumberLineBg(){
        return this.input("行配置","奇数行背景色");
    }
    public WebElement getRowOddNumberLineBg(){
        return this.input("行","奇数行背景色");
    }
    public WebElement getEvenNumberLineBg(){
        return this.input("行配置","偶数行背景色");
    }
    public WebElement getRowEvenNumberLineBg(){
        return this.input("行","偶数行背景色");
    }

    public WebElement getSerialColumnBg(){
        return this.input("序号列","背景颜色");
    }
    public WebElement getSerialWidthRatio(){
        return this.input("序号列","列宽占比(%)");
    }
    public WebElement getSerialRadiusRatio(){
        return this.input("序号列","半径占比(%)");
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
        return this.getDivText("通用标题");
    }

    public WebElement getTable() {
        return table;
    }

    public WebElement getContent() {
        return this.input("", "内容");
    }

    public WebElement getStatus() {
        return status;
    }

    public WebElement getFlipScaling() {
        return this.dropdownList("翻转", "缩略比例");
    }

    public WebElement getFlipBackground() {
        return this.input("数字", "背景色");
    }

    public WebElement getPrefix() {
        return this.getDivText("前缀");
    }
    public WebElement getNumber1() {
        return this.getDivText("数字");
    }
    public WebElement getPrefixText() {
        return this.input2("前缀","内容");
    }
    public WebElement getNumberSpacing() {
        return this.input("数字","数字间隔");
    }
    public WebElement getRoundCorner() {
        return this.input("数字","圆角");
    }
    public WebElement getDecimalPlaces() {
        return this.input("数字","小数点位数");
    }
    public WebElement getFixedWidth() {
        return this.input("数字","定宽");
    }
    public WebElement getSuffix() {
        return this.getDivText("后缀");
    }

    public WebElement getSuffixText() {
        return this.input2("后缀","内容");
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
        return this.getDivText("数字翻牌器");
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
        return this.getDataMapping("source");
    }

    public WebElement getWeightField() {
        return this.getDataMapping("size");
    }

    public WebElement getTargetField() {
        return this.getDataMapping("target");
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

    public WebElement getWorld3D() {
        return this.getDivText("3D世界地图");
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
        return this.input("边线选项", "边线颜色");
    }
    public WebElement getBoundaryWidth() {
        return this.input("边线选项", "宽度");
    }
    public WebElement getDiaphaneity() {
        return this.input("边线选项", "透明度");
    }

    public WebElement getMapArea() {
        return this.dropdownList("地图", "区域");
    }

    public WebElement getMapHeader() {
        return mapHeader;
    }

    public WebElement getMapName() {
        return this.dropdownList("", "名称");
    }

    public WebElement getMap() {
        return map;
    }

    public WebElement getChinaMap3D() {
        return this.getDivText("3D中国地图");
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
        return this.getDivText("标题");
    }
    public WebElement getDoubleDealer() {
        return this.getDivText("翻牌器");
    }

    public WebElement getPercent() {
        return getDivText("环图");
    }

    public WebElement getScatter() {
        return this.getChartList("基本散点图");
    }
    public WebElement getBubble() {
        return this.getChartList("气泡图");
    }

    public WebElement getScatterShape(){
        return this.getScatterShapeList("散点形状");
   }
    public WebElement getBubbleShape(){
        return this.getScatterShapeList("气泡形状");
    }
    public WebElement getBubbleSizeMin(){
        return this.layoutList("最小");
    }
    public WebElement getBubbleSizeMax(){
        return this.layoutList("最大");
    }


    public WebElement getScatterShapeList(String name){
        String xpath;
        xpath="//span[text()='"+name+"']/../../div[2]//span[@class='yotta-select-selection-icon']";
        WebElement element =webDriver.findElement(By.xpath(xpath));
        element.click();
        return getScatterShapeList1();
   }
    public WebElement getValuesWordBold(){
        return this.dropdownList("值标签","文字粗细");
    }

    public WebElement getValuesWordSize(){
        return this.input("值标签","文字大小");
    }
    public WebElement getValueWordColor(){
        return this.input("值标签","文字颜色");
    }


    public WebElement getScatterShapeList1(){
       return webDriver.findElement(By.xpath("//div[@class='yotta-select-menu css-4lmpwu _9QXI6KSC6JSMJj1lDs7ru']"));

   }

   public WebElement getScatterSize(){
        return this.layoutList("散点大小");
   }
   public WebElement getCapsuleWidth(){
        return this.layoutList("自定义柱宽");
   }
   public WebElement getStrokeThickness(){
        return this.layoutList("描边粗细");
   }
   public WebElement getStrokeColor(){
        return this.layoutList("描边颜色");
   }
   public WebElement getCreaseSmoothness(){
        return this.layoutList("折线平滑度");
   }
   public WebElement getFillTransparency(){
        return this.layoutList("填充透明度");
   }
   public WebElement getSmoothness(){
        return this.input("折线","平滑度");
   }
   public WebElement getAreaFillColor(){
        return this.input("折线","面积填充色");
   }
    public WebElement getCylindricalColor(){
        return this.input("柱子","柱形颜色");
    }


    public WebElement getPie() {
        return getDivText("基本饼状图");
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

    public WebElement getGreen() {
        return green;
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
        return this.getDivText("标签");
    }



    public WebElement getDivideField() {
        return this.getDataMapping("name");
    }
    public WebElement getDivideFieldText(){
        return this.getDataFieldText("name");
    }

    public WebElement getDataField() {
        return this.getDataMapping("value");
    }
    public WebElement getDataFieldText1(){
        return this.getDataFieldText("value");
    }
    public WebElement getDataSearchLabel() {
        return this.getDataMapping("label");
    }
    public WebElement getDataLabelText(){
        return this.getDataFieldText("label");
    }
    public WebElement getSourceFieldText(){
        return this.getDataFieldText("source");
    }
    public WebElement getWeightFieldText(){
        return this.getDataFieldText("size");
    }
    public WebElement getTargetFieldText(){
        return this.getDataFieldText("target");
    }




    public WebElement getRose() {
        return this.getChartList("玫瑰图");
    }

    public WebElement getRecentSevenDay() {
        return GetTime.getTime(webDriver, "RecentSevenDay");
    }

    public WebElement getTwoDays() {
        return GetTime.getTime(webDriver, "TwoDays");
    }

    public WebElement getWholeTime() {
        return GetTime.getTime(webDriver, "WholeTime");
    }

    public WebElement getDateEditor() {
        return dateEditor;
    }

    public WebElement getRange() {
        return this.getChartList("区间图");
    }

    public WebElement getPile() {
        return pile;
    }

    public WebElement getBar() {
        return this.getChartList("基本柱状图");
    }
    public WebElement getWaterFallBar() {
        return this.getChartList("瀑布图");
    }

    public WebElement getGroupBar(){
        return this.getChartList("分组柱状图");
    }
    public WebElement getCascadeHistogram(){
        return this.getChartList("层叠柱状图");
    }
    public WebElement getHorizontalCascadeHistogram(){
        return this.getChartList("水平层叠柱状图");
    }
    public WebElement getHorizontalGroupBar(){
        return this.getChartList("水平分组柱状图");
    }
    public WebElement getIntervalRangeBar(){
        return this.getChartList("区间范围柱状图");
    }
    public WebElement getBrokenLineBar(){
        return this.getChartList("折线柱状图");
    }
    public WebElement getPercentageBar(){
        return this.getChartList("百分比柱状图");
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
        return this.getChartList("双轴折线图");
    }

    private WebElement getChartList(String name){
        return webDriver.findElement(By.xpath("//div[@class='_2OFVe00_WK8zQIqYxyflYf']/div/div/div[1]/div[2]/div/div/div[contains(text(),'"+name+"')]"));
    }
    private WebElement getTableList(String name){
        return webDriver.findElement(By.xpath("//div[@class='_2OFVe00_WK8zQIqYxyflYf']//div[text()='"+name+"']"));
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
        return getChartList("区域图") ;
    }

    public WebElement getDataSeriesBold() {
        return this.input("数据系列", "粗细");
    }

    public WebElement getDecimalPlaces1() {
        return this.layoutList("小数点位数");
    }
    public WebElement getInnerRadius() {
        return this.layoutList("内半径");
    }
    public WebElement getPieBgFill() {
        return this.layoutList("饼图填充底色");
    }
    public WebElement getRadius(){
        return this.input("角度轴","半径");
    }
    public WebElement getRadius1(){
        return this.layoutList("半径");
    }

    public WebElement getInitialAngleMig(){
        return this.input("角度轴","起始角度偏移");
    }

    public WebElement getOuterRadius() {
        return this.layoutList("外半径");
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
        return this.input("图例", "文字颜色");
    }

    public WebElement getDivText(String name){
        return webDriver.findElement(By.xpath("//div[text()='"+name+"']"));
    }
    public WebElement getExample() {
        return this.getDivText("图例");
    }
    public WebElement getValueLabels() {
        return this.getDivText("值标签");
    }
    public WebElement getGraphicAttribute() {
        return this.getDivText("图形属性");
    }
    public WebElement getFanCon() {
        return this.getDivText("扇形配置");
    }
    public WebElement getTable1() {
        return this.getDivText("表格");
    }
    public WebElement getBorderLines() {
        return this.getDivText("边框线");
    }
    public WebElement getBorderLinesColor(){
        return this.input("边框线","线条颜色");
    }
    public WebElement getBorderLinesThickness(){
        return this.input("边框线","线条粗细");
    }

    public WebElement getLiquidfillStyle() {
        return this.getDivText("样式");
    }
    public WebElement getDiagram() {
        return this.getDivText("图表");
    }
    public WebElement getDataSeries() {
        return this.getDivText("数据系列");
    }
    public WebElement getSeriesFirst() {
        return this.getDivText("系列一");
    }
    public WebElement getSeriesSecond() {
        return this.getDivText("系列二");
    }

    public WebElement getListOfTurnsAllStyles() {
        return this.getDivText("全局");
    }
    public WebElement getGlobalCon() {
        return this.getDivText("全局配置");
    }
    public WebElement getListOfTurnsAction() {
        return this.getDivText("动画");
    }
    public WebElement getTableHeader() {
        return this.getDivText("表头");
    }
    public WebElement getTableColumn() {
        return this.getDivText("列");
    }
    public WebElement getTableRow() {
        return this.getDivText("行");
    }
    public WebElement getPieProperty() {
        return this.getDivText("饼图属性");
    }
    public WebElement getPercentagePortion() {
        return this.getDivText("中间百分比部分");
    }

    public WebElement getRollHistogramAllStyles(){
        return this.getDivText("全局样式");
    }
    public WebElement getCameraRotation(){
        return this.getDivText("相机旋转");
    }
    public WebElement getCameraCenter(){
        return this.getDivText("相机中心");
    }
    public WebElement getFillSet(){
        return this.getDivText("填充设置");
    }
    public WebElement getFillColor4(){
        return this.getDivText("填充颜色");
    }
    public WebElement getLineOptions(){
        return this.getDivText("边线选项");
    }
    public WebElement getColumnCutOffLine() {
        return this.getTextStyle("列","分割线");
    }
    public WebElement getRowCutOffLine() {
        return this.getTextStyle("行","分割线");
    }


    public WebElement getFirstColumn() {
        return this.getDivText("第一列");
    }
    public WebElement getSecondColumn() {
        return this.getDivText("第二列");
    }

    public WebElement getInitialAngleOffset(){
        return this.input("图表","起始角度偏移");
    }
    public WebElement getRadius2(){
        return this.input("图表","半径");
    }
    public WebElement getSeriesFirstColor(){
        return this.input("系列一","颜色");
    }
    public WebElement getSeriesSecondColor(){
        return this.input("系列二","颜色");
    }

    public WebElement getHoriaontalDirection(){
        return this.input("相机旋转","水平方向");
    }
    public WebElement getVerticalDirection(){
        return this.input("相机旋转","垂直方向");
    }
    public WebElement getLongitude(){
        return this.input("相机中心","经度");
    }
    public WebElement getLatitude(){
        return this.input("相机中心","纬度");
    }
    public WebElement getCameraDistance(){
        return this.input("全局配置","相机距离");
    }
    public WebElement getMinColor(){
        return this.input("填充颜色","最小值颜色");
    }
    public WebElement getMaxColor(){
        return this.input("填充颜色","最大值");
    }
    public WebElement getNoData(){
        return this.input("填充颜色","无数据");
    }
    public WebElement getBackFace(){
        return this.input("填充颜色","背面");
    }
    public WebElement getWidthPercentage(){
        return this.input("列","宽度百分比");
    }
    public WebElement getColumnCutOffLineColor(){
        return this.input("分割线","线条颜色");
    }
    public WebElement getColumnCutOffLineThickness(){
        return this.input("分割线","线条粗细");
    }
    public WebElement getFirstColumnBg(){
        return this.input2("第一列","背景颜色");
    }
    public WebElement getSecondColumnBg(){
        return this.input2("第二列","背景颜色");
    }
    public WebElement getFirstColumnTextAlign(){
        return this.dropdownList3("第一列","文本对齐");
    }
    public WebElement getSecondColumnTextAlign(){
        return this.dropdownList3("第二列","文本对齐");
    }

    @FindBy(xpath = "//div[text()='表头']//ancestor::div[contains(@class,'yotta-collapse')]/div/div[2]//div[text()='文本样式']")
    private WebElement textStyle;
    public WebElement getTextStyle() {
        return textStyle;
    }
    public WebElement getLineCon() {
        return this.getDivText("行配置");
    }
    public WebElement getSerialColumn() {
        return this.getDivText("序号列");
    }
    @FindBy(xpath = "//div[text()='自定义列']")
    private WebElement defineLine;
    public WebElement getDefineLine() {
        return defineLine;
    }
    public WebElement getDefineFileName(){
        return this.input("自定义列","列字段名");
    }
    public WebElement getTone(){
        return this.input("扇形配置","色值");
    }
    public WebElement getCirleTextStyle(){
        return this.getDivText("文本样式");
    }
    public WebElement getBackgroundStyle(){
        return this.getDivText("背景样式");
    }

    public WebElement getDefineShowName(){
        return this.input("自定义列","列显示名");
    }
    public WebElement getDefineWidthRatio(){
        return this.input("自定义列","列宽占比(%)");
    }
    public WebElement getDefineWordSize(){
        return this.input("自定义列","字号");
    }
    public WebElement getDefineWordBold(){
        return this.dropdownList("自定义列","文字粗细");
    }
    public WebElement getTextAlignMent(){
        return this.dropdownList("自定义列","文本对齐");
    }
    public WebElement getDefineWordColor(){
        return this.input("自定义列","字体颜色");
    }
    public WebElement getCircleWorldSize(){
        return this.input("文本样式","文字大小");
    }
    public WebElement getCircleWorldSize1(){
        return this.input3("标题","文本样式","字号");
    }
    public WebElement getCircleWorldSize2(){
        return this.input3("数字","文本样式","字号");
    }

    public WebElement getCircleWorleBold(){
        return this.dropdownList("文本样式","文字粗细");
    }
    public WebElement getCircleWorleBold1(){
        return this.dropdownList4("标题","文本样式","文字粗细");
    }
    public WebElement getCircleWorleBold2(){
        return this.dropdownList4("数字","文本样式","文字粗细") ;
    }
    public WebElement getCircleWorldColor(){
        return this.input("文本样式","文字颜色");
    }
    public WebElement getCircleWorldColor1(){
        return this.input3("标题","文本样式","字体颜色");
    }
    public WebElement getFirstColumnBold(){
        return this.dropdownList4("第一列","文本样式","文字粗细");
    }
    public WebElement getSecondColumnBold(){
        return this.dropdownList4("第二列","文本样式","文字粗细");
    }

    public WebElement getFirstColumnWordSize(){
        return this.input3("第一列","文本样式","字号");
    }
    public WebElement getSecondColumnWordSize(){
        return this.input3("第二列","文本样式","字号");
    }
    public WebElement getFirstColumnWordColor(){
        return this.input3("第一列","文本样式","字体颜色");
    }
    public WebElement getSecondColumnWordColor(){
        return this.input3("第二列","文本样式","字体颜色");
    }
    public WebElement getCircleWorldColor2(){
        return this.input3("数字","文本样式","字体颜色");
    }
    public WebElement getBackgroundColor(){
        return this.input("背景样式","背景颜色");
    }
    public WebElement getAngleRounded(){
        return this.input("背景样式","圆角");
    }
    public WebElement getBorderThickness(){
        return this.input("背景样式","边框粗细");
    }
    public WebElement getBorderColor1(){
        return this.input("背景样式","边框颜色");
    }
    public WebElement getBorderStyle(){
        return this.dropdownList("背景样式","边框样式");
    }

    public WebElement getSerialTextStyle() {
        return this.getTextStyle("序号列","文本样式");
    }
    public WebElement getCirleTextStyle1() {
        return this.getTextStyle("标题","文本样式");
    }
    public WebElement getTableHeaderTextStyle() {
        return this.getTextStyle("表头","文本样式");
    }
    public WebElement getFirstColumnTextStyle() {
        return this.getTextStyle("第一列","文本样式");
    }
    public WebElement getSecondColumnTextStyle() {
        return this.getTextStyle("第二列","文本样式");
    }
    public WebElement getCirleTextStyle2() {
        return this.getTextStyle("数字","文本样式");
    }
    public WebElement getTextStyle(String title,String name){
        String xpath;
        xpath="//div[text()='"+title+"']/../../../..//div[text()='"+name+"']";
        return webDriver.findElement(By.xpath(xpath));
    }
    @FindBy(xpath = "//div[contains(text(),'图表')]")
    private WebElement layout;
    public WebElement getLayout() {
        return layout;
    }

    public WebElement getNumber(){return this.header("数值");}
    //柱图中的数值
    public WebElement getNumberWordSize() {
        return this.input("数值", "字体大小");
    }
    public WebElement getNumberWordBold() {
        return this.dropdownList("数值", "字体粗细");
    }


    public WebElement getTitleSize() {
        return this.input("标题", "字号");
    }

    public WebElement getYaxisWordColor() {
        return this.colorPicker("y轴", "文本");
    }

    public WebElement getTagWordColor() {
        return this.input("标签", "颜色");
    }
    public WebElement getTagWordColor1() {
        return this.input("标签", "文字颜色");
    }
    public WebElement getTagWordColor2(){
        return this.input3("折线","标签","文字颜色");
    }
    public WebElement getTagWordColor3(){
        return this.input3("柱子","标签","文字颜色");
    }
 /*   @FindBy(xpath = "//div[text()='y轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='轴标签']//ancestor::div[@class='yotta-collapse'][1]/div/div[2]/div/div[3]//input")
    private WebElement yaxisWordSize;*/
    public WebElement getYaxisWordSize() {
        return this.input("轴标签","文字大小");
    }

  /*  @FindBy(xpath = "//div[text()='z轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='轴标签']//ancestor::div[@class='yotta-collapse'][1]/div/div[2]/div/div[3]//input")
    private WebElement zaxisWordSize;*/
    public WebElement getZaxisWordSize() {
        return this.input("轴标签","文字大小");
    }

    public WebElement getAxisWordSize() {
        return this.input("轴标签","文字大小");
    }


    public WebElement getTagWordSize() {
        return this.input("标签", "字体大小");
    }
    public WebElement getTagWordSize1() {
        return this.input("标签", "文字大小");
    }
    public WebElement getTagWordSize2(){
        return this.input3("折线","标签","文字大小");
    }
    public WebElement getTagWordSize3(){
        return this.input3("柱子","标签","文字大小");
    }


    public WebElement getExampleWordSize() {
        return this.input("图例", "文字大小");
    }


    @FindBy(xpath = "//div[text()='x轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='网格线']/../../div[1]//span")
    private WebElement xaxisEyes;
    public WebElement getXaxisEyes() {
        return xaxisEyes;
    }


    @FindBy(xpath = "//div[text()='y轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='网格线']/../../div[1]//span")
    private WebElement yaxisEyes;
    public WebElement getYaxisEyes() {
        return yaxisEyes;
    }

    @FindBy(xpath = "//div[text()='z轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='网格线']/../../div[1]//span")
    private WebElement zaxisEyes;
    public WebElement getZaxisEyes() {
        return zaxisEyes;
    }

    @FindBy(xpath = "//div[text()='背景样式']/../div[1]//span")
    private WebElement BackgroundEyes;
    public WebElement getBackgroundEyes() {
        return BackgroundEyes;
    }





//    @FindBy(xpath = "//div[text()='x轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='轴标签']//ancestor::div[@class='yotta-collapse'][1]/div/div[2]/div/div[5]//input")
//    private WebElement xaxisAngle;
    public WebElement getXaxisAngle() {
        return this.input("轴标签","标签旋转角度");
    }


 /*   @FindBy(xpath = "//div[text()='y轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='轴标签']//ancestor::div[@class='yotta-collapse'][1]/div/div[2]/div/div[5]//input")
    private WebElement yaxisAngle;*/
    public WebElement getYaxisAngle() {
        return this.input("轴标签","标签旋转角度");
    }


 /*   @FindBy(xpath = "//div[text()='z轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='轴标签']//ancestor::div[@class='yotta-collapse'][1]/div/div[2]/div/div[5]//input")
    private WebElement zaxisAngle;*/
    public WebElement getZaxisAngle() {
        return this.input("轴标签","标签旋转角度");
    }

    public WebElement getXaxisWordBold() {
        return this.getWordBold("x轴","轴标签","文字粗细");
    }

    public WebElement getYaxisWordBold() {
        return this.getWordBold("y轴","轴标签","文字粗细");
    }
    public WebElement getZaxisWordBold() {
        return this.getWordBold("z轴","轴标签","文字粗细");
    }
    public WebElement getAxisWordBold(){
        return this.dropdownList("轴标签","文字粗细");
    }

    private WebElement getWordBold(String type,String title,String name ){
        String xpath;
        xpath="//div[text()='"+type+"']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='"+title+"']//ancestor::div[@class='yotta-accordion css-fsemuw yotta-accordion-expanded'][1]//span[text()='"+name+"']/../../div[2]";
        WebElement element=webDriver.findElement(By.xpath(xpath));
        element.click();
        return getWordBoldlist();
    }
    public WebElement getWordBoldlist(){
        return webDriver.findElement(By.xpath("//div[@class='yotta-select-menu css-4lmpwu _9QXI6KSC6JSMJj1lDs7ru']"));
    }

    public WebElement getExampleWordBold() {
        return this.dropdownList("图例", "文字粗细");
    }
    public WebElement getTagWordBold() {
        return this.dropdownList("标签", "文字粗细");
    }
    public WebElement getTagWordBold2(){
        return this.dropdownList4("折线","标签","文字粗细");
    }
    public WebElement getTagWordBold3(){
        return this.dropdownList4("柱子","标签","文字粗细");
    }
    @FindBy(xpath = "(//span[text()='居中'])[last()]")
    private WebElement exampleOnMiddle;
    public WebElement getExampleOnMiddle(){
        return exampleOnMiddle;
    }
    @FindBy(xpath = "(//span[text()='顶部'])[last()]")
    private WebElement exampleOnTop;
    public WebElement getExampleOnTop(){
        return exampleOnTop;
    }

    public WebElement getExampleHorizontalSpacing(){
        return this.input("图例","水平间距");
    }

    public WebElement getLayoutTop() {
        return this.layoutList("顶部");
    }
    public WebElement getLayoutBottom() {
        return this.layoutList("底部");
    }
    public WebElement getLayoutLeft() {
        return this.layoutList("左侧");
    }
    public WebElement getLayoutRight() {
        return this.layoutList("右侧");
    }
    private WebElement layoutList(String title) {
        String xpath = "//span[contains(text(),'"+title+"')]/../../div[2]/div/input";
        return webDriver.findElement(By.xpath(xpath));
    }
    private WebElement layoutList1(String title) {
        String xpath = "//span[contains(text(),'"+title+"')]/../../div//input";
        return webDriver.findElement(By.xpath(xpath));
    }
    public WebElement getQuJian() {
        return this.getDivText("区间");
    }

    public WebElement getBarStyle() {
        return this.getDivText("柱图样式");
    }


    public WebElement getLayoutColor() {
        return this.layoutList("颜色");
    }
    public WebElement getBarColor(){
        return this.layoutList("背景颜色");
    }

    @FindBy(xpath = "//div[text()='图例']/../div[1]//span")
    private WebElement exampleEyes;
    public WebElement getExampleEyes() {
        return exampleEyes;
    }
    @FindBy(xpath = "//div[text()='标签']/../div[1]//span")
    private WebElement tagEyes;
    public WebElement getTagEyes() {
        return tagEyes;
    }

    @FindBy(xpath = "//div[text()='折线']//ancestor::div[@class='yotta-collapse css-191z2e5'][1]//div[text()='标签']/../div[1]//span")
    private WebElement tagEyes1;
    public WebElement getTagEyes1() {
        return tagEyes1;
    }
    @FindBy(xpath = "//div[text()='柱子']//ancestor::div[@class='yotta-collapse css-191z2e5'][1]//div[text()='标签']/../div[1]//span")
    private WebElement tagEyes2;
    public WebElement getTagEyes2() {
        return tagEyes2;
    }
    @FindBy(xpath = "//div[text()='折线']//ancestor::div[@class='yotta-collapse css-191z2e5'][1]//div[text()='标签']")
    private WebElement tag1;
    public WebElement getTag1() {
        return tag1;
    }
    @FindBy(xpath = "//div[text()='柱子']//ancestor::div[@class='yotta-collapse css-191z2e5'][1]//div[text()='标签']")
    private WebElement tag2;
    public WebElement getTag2() {
        return tag2;
    }



    public WebElement getValues(){
        return this.getDivText("值标签");
    }
    @FindBy(xpath = "//div[text()='值标签']/../div[1]//span")
    private WebElement valuesEyes;
    public WebElement getValuesEyes() {
        return valuesEyes;
    }
    @FindBy(xpath = "//div[text()='网格线']/../div[1]//span")
    private WebElement axisEyes;
    public WebElement getAxisEyes() {
        return axisEyes;
    }




    public WebElement getEnsureColor() {
        return ensureColor;
    }

    public WebElement getPageBackground() {
        return pageBackground;
    }

    @FindBy(xpath = "//div[contains(text(),'系列')]")
    private WebElement series;
    public WebElement getSeries(){
        return series;
    }

    public WebElement getSeriesOne(){
        return this.getDivText("系列1");
    }

    public WebElement getSeriesTwo(){
        return this.getDivText("系列2");
    }
    public WebElement getSeriesThree(){
        return this.getDivText("系列3");
    }
    @FindBy(xpath = "//div[text()='自定义列']/..//span[@aria-label='DeleteAlternative']")
    private WebElement deleteSeries;
    public WebElement getDeleteSeries(){
        return deleteSeries;
    }

    @FindBy(xpath = "//span[text()='面积填充色']/../..//input")
    private WebElement fillColor;
    public WebElement getFillColor(){
        return fillColor;
    }

    @FindBy(xpath = "//span[text()='颜色']/../..//input")
    private WebElement fillColor1;
    public WebElement getFillColor1(){
        return fillColor1;
    }

    @FindBy(xpath = "//span[text()='标题内容']/../..//input")
    private WebElement titleText;
    public WebElement getTitleText(){return titleText;}
    public WebElement getSeriesOfName(){return this.input("折线","系列名");}
    public WebElement getSeriesOfName1(){return this.input("柱子","系列名");}


    @FindBy(xpath = "//span[text()='填充']/../..//input")
    private WebElement fillColor2;
    public WebElement getFillColor2(){
        return fillColor2;
    }

    @FindBy(xpath = "//span[text()='描边颜色']/../..//input")
    private WebElement fillColor3;
    public WebElement getFillColor3(){
        return fillColor3;
    }

    @FindBy(xpath = "//span[text()='边宽']/../..//input")
    private WebElement hemWidth;
    public WebElement getHemWidth(){
        return hemWidth;
    }

    @FindBy(xpath = "//span[text()='折线颜色']/../..//input")
    private WebElement lineColor1;
    public WebElement getLineColor1(){
        return lineColor1;
    }

    @FindBy(xpath = "//span[text()='折线粗细']/../..//input")
    private WebElement lineThickness;
    public WebElement getLineThickness(){
        return lineThickness;
    }

    public WebElement getLineType(){
        String xpath;
        xpath="//span[text()='折线类型']/../../div[2]";
        WebElement element=webDriver.findElement(By.xpath(xpath));
        element.click();
        return getLastDropdownList();
    }

    @FindBy(xpath = "//span[text()='散点填充色']/../..//input")
    private WebElement scatterFillColor;
    public WebElement getScatterFillColor(){
        return scatterFillColor;
    }
    @FindBy(xpath = "//span[text()='系列名']/../..//input")
    private WebElement SeriexText;
    public WebElement getSeriexText(){
        return SeriexText;
    }

    public WebElement getSeriesStyle(){
        return this.getDivText("折线样式");
    }
    public WebElement getBrokenLine(){
        return this.getDivText("折线");
    }
    public WebElement getPillar(){
        return this.getDivText("柱子");
    }
    @FindBy(xpath = "//span[text()='粗细']/../../div[2]//input")
    private WebElement seriesOneBold;
    public WebElement getSeriesOneBold(){
        return seriesOneBold;
    }

    @FindBy(xpath = "//div[contains(text(),'坐标轴')]")
    private WebElement axes;
    public WebElement getAxes(){
        return axes;
    }

    @FindBy(xpath = "//div[text()='x轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='轴标题']/../../div[1]//span")
    private WebElement xeyes;
    public WebElement getXEyes(){
        return xeyes;
    }

    @FindBy(xpath = "//div[text()='x轴']//ancestor::div[contains(@class,'yotta-collapse')]/div/div[2]//div[text()='轴标签']")
    private WebElement xlable;
    public WebElement getXlable(){
        return xlable;
    }

    @FindBy(xpath = "//div[text()='y轴']//ancestor::div[contains(@class,'yotta-collapse')]/div/div[2]//div[text()='轴标签']")
    private WebElement ylable;
    public WebElement getYlable(){
        return ylable;
    }

    @FindBy(xpath = "//div[text()='z轴']//ancestor::div[contains(@class,'yotta-collapse')]/div/div[2]//div[text()='轴标签']")
    private WebElement zlable;
    public WebElement getZlable(){
        return zlable;
    }
    public WebElement getAxisLabels(){
        return this.getDivText("轴标签");
    }


    public WebElement getXColorInput() {
        return this.input("轴标签","文字颜色");
    }

//    @FindBy(xpath = "//div[text()='y轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='轴标签']//ancestor::div[@class='yotta-collapse'][1]/div/div[2]/div/div[4]//input")
//    private WebElement yColorInput;
    public WebElement getYColorInput() {
        return this.input("轴标签","文字颜色");
    }

//    @FindBy(xpath = "//div[text()='z轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='轴标签']//ancestor::div[@class='yotta-collapse'][1]/div/div[2]/div/div[4]//input")
//    private WebElement zColorInput;
    public WebElement getZColorInput() {
        return this.input("轴标签","文字颜色");
    }
    public WebElement getAxisWordColor() {
        return this.input("轴标签","文字颜色");
    }


    public WebElement getXaxisWordColor() {
        return this.colorPicker("x轴", "文本");
    }

    public WebElement getXaxisWordSize() {
        return this.input("轴标签","文字大小");
    }
    public WebElement getXaxisHeader() {
        return this.getDivText("x轴");
    }
    public WebElement getYaxisHeader() {
        return this.getDivText("y轴");
    }
    public WebElement getZaxisHeader() {
        return this.getDivText("z轴");
    }
    public WebElement getAngleShaftHeader() {
        return this.getDivText("角度轴");
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

    public WebElement getWidth() {
        return this.layoutList("宽度");
    }

    public WebElement getHeight() {
        return this.layoutList("高度");
    }

    public WebElement getChartXaxis() {
        return this.layoutList("x轴");
    }

    public WebElement getChartYaxis() {
        return this.layoutList("y轴");
    }
    public WebElement getTitleName() {
        return this.layoutList1("标题名");
    }
    public WebElement getTextInterval() {
        return this.layoutList1("文字间隔");
    }



    public WebElement getStyle() {
        return style;
    }

    public WebElement getInteractive() {
        return interactive;
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
    @FindBy(xpath = "//span[text()='垂直']")
    private WebElement VerticalButton;
    public WebElement getVerticalButton() {
        return VerticalButton;
    }

    @FindBy(xpath = "//div[@class='yotta-message-manager']//span[text()='保存当前大屏成功']")
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
        return this.getDataMapping("x");
    }

    public WebElement getYaxis() {
        return this.getDataMapping("y");
    }

    public WebElement getDataMapping(String name){
        return webDriver.findElement(By.xpath("//td[text()='"+name+"']/../td[2]//input"));
    }


    public WebElement getLineYaxis(){return this.dropdownList("","线Y轴");}

    public WebElement getFirstYaxis() {
        return this.getDataMapping("y");
    }

    public WebElement getSecondYaxis() {
        return this.getDataMapping("z");
    }
    public WebElement getSecYaxis(){
        return this.getDataMapping("s");
    }
    public WebElement getRaxis(){
        return this.getDataMapping("r");
    }
    public WebElement getYaxis1(){
        return this.getDataMapping("y1");
    }
    public WebElement getYaxis2(){
        return this.getDataMapping("y2");
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

//    配置x轴字段内容
    public WebElement getXaxisField() {
        return this.getDataMapping("x");
    }

    public WebElement getXaxisFieldText() {
        return this.getDataFieldText("x");
    }
    public WebElement getRaxisFieldText() {
        return this.getDataFieldText("r");
    }
    public WebElement getYaxis1FieldText() {
        return this.getDataFieldText("y1");
    }
    public WebElement getYaxis2FieldText() {
        return this.getDataFieldText("y2");
    }


    public WebElement getDataFieldText(String name){
        return webDriver.findElement(By.xpath("//td[text()='"+name+"']/../td[3]//span"));
    }

//    配置最大值字段
    public WebElement getUpperField() {
        return this.getDataMapping("u");
    }
    public WebElement getUpperFieldText() {
        return this.getDataFieldText("u");
    }

    //    配置最小值字段
    public WebElement getLowerField() {
        return this.getDataMapping("l");
    }
    public WebElement getLowerFieldText() {
        return this.getDataFieldText("l");
    }

    public WebElement getFirstYaxisFieldText(){
        return this.getDataFieldText("y");
    }
    public WebElement getSecondYaxisFieldText(){
        return this.getDataFieldText("z");
    }
    public WebElement getYaxisFieldText(){
        return this.getDataFieldText("y");
    }

    @FindBy(xpath = "//th[text()='状态']")
    private WebElement conFinish;
    public WebElement getConFinish() {
        return conFinish;
    }

    public WebElement getSearch() {
        return search;
    }

    public WebElement getData() {
        return data;
    }

    public WebElement getLine() {
        return this.getChartList("基本折线图");
    }
    public WebElement getChart() {
        return chart;
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

    @FindBy(xpath = "//span[@class='yotta-icon yotta-icon-SaveAlternative']")
    private WebElement save;
    public WebElement getSave() {
        return save;
    }
    @FindBy(xpath = "//span[@class='yotta-icon yotta-icon-PublishAlternative']")
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
            xpath = "//div[text()='" + title + "']//ancestor::div[@class='yotta-accordion css-fsemuw yotta-accordion-expanded'][1]//span[text()='" + name + "']/../../div[2]//input";
        }
        return webDriver.findElement(By.xpath(xpath));
    }
    private WebElement input1(String flag,String title, String name) {
        String xpath;
        xpath = "//div[text()='"+flag+"']//ancestor::div[@class='yotta-collapse css-191z2e5']//div[text()='"+title+"']//ancestor::div[@class='yotta-accordion css-fsemuw yotta-accordion-expanded']//span[text()='"+name+"']/../../div[2]//input";
        return webDriver.findElement(By.xpath(xpath));
    }
    private WebElement input2(String title, String name) {
        String xpath;
        if ("".equals(title)) {
            xpath = "//label[contains(text(),'" + name + "')]/following-sibling::div//input";
        } else {
            xpath = "//div[text()='" + title + "']/../../../..//span[text()='" + name + "']/../../div[2]//input";
        }
        return webDriver.findElement(By.xpath(xpath));
    }
    private WebElement input3(String flag,String title, String name) {
        String xpath;
        xpath = "//div[text()='"+flag+"']/../../../..//div[text()='" + title + "']/../../../..//span[text()='" + name + "']/../../div[2]//input";
        return webDriver.findElement(By.xpath(xpath));
    }

    private WebElement dropdownList(String title, String name) {
        String xpath;
        xpath="//div[text()='"+title+"']//ancestor::div[@class='yotta-accordion css-fsemuw yotta-accordion-expanded'][1]//span[text()='"+name+"']/../../div[2]";
        WebElement element=webDriver.findElement(By.xpath(xpath));
        element.click();
        return getLastDropdownList();
    }


    private WebElement dropdownList1(String flag,String title, String name) {
        String xpath;
        xpath = "//div[text()='"+flag+"']//ancestor::div[@class='yotta-collapse']//div[text()='" + title + "']//ancestor::div[@class='yotta-accordion-header']/..//span[text()='" + name + "']/../../div[2]//span[@aria-label='PlusDownOutlined']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        element.click();
        return getLastDropdownList();
    }
    private WebElement dropdownList2() {
        String xpath;
        xpath = "//div[text()='数字']/../../../..//div[text()='文本样式']/../../../..//span[text()='文字粗细']/../../div[2]//span[@aria-label='PlusDownOutlined']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        element.click();
        return getLastDropdownList();
    }
    private WebElement dropdownList3(String title, String name) {
        String xpath;
        xpath = "//div[text()='" + title + "']/../../../..//span[text()='" + name + "']/../../div[2]//span[@aria-label='PlusDownOutlined']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        element.click();
        return getLastDropdownList();
    }
    private WebElement dropdownList4(String flag,String title, String name) {
        String xpath;
        xpath = "//div[text()='"+flag+"']/../../../..//div[text()='" + title + "']/../../../..//span[text()='" + name + "']/../../div[2]//span[@aria-label='PlusDownOutlined']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        element.click();
        return getLastDropdownList();
    }
    public WebElement getLastDropdownList() {
        return webDriver.findElement(By.xpath("//div[@class='yotta-select-menu css-4lmpwu _9QXI6KSC6JSMJj1lDs7ru']"));
    }
    private WebElement switchButton(String title) {
        String xpath = "//div[text()='" + title + "']/following-sibling::div//label[@class='el-switch setting-switch']";
        return webDriver.findElement(By.xpath(xpath));
    }

    private WebElement header(String name) {
        String xpath = "//div[text()='" + name + "'][@class='el-collapse-item__header']";
        return webDriver.findElement(By.xpath(xpath));
    }


    @FindBy(xpath = "//span[text()='配置数据']")
    private WebElement dataCon;
    public WebElement getDataCon(){
        return dataCon;
    }
    @FindBy(xpath = "//span[text()='数据配置']")
    private WebElement conData;
    public WebElement getConData(){
        return conData;
    }
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

    //开启更新
    @FindBy(xpath = "//span[text()='自动更新请求']/..//input")
    private WebElement updateData;
    public WebElement getUpdateData(){return updateData;}
    //数据中的更新频率
   @FindBy(xpath = "//span[text()='自动更新请求']//ancestor::div[@class='E-c-fc5T-ivKbFJwpGPzQ']//div[@class='_21Qvy1ek7PmjT0oBy2UWRr']//input")
    private WebElement updateFrequency;
    public WebElement getUpdateFrequency(){return updateFrequency;}

    //数据源类型

    public WebElement getDataSourceType(){
         return this.getDataDownList("数据源类型");
    }
    private WebElement getDataDownList(String title){
        String xpath;
        xpath="//span[text()='"+title+"']/..//span[@class='yotta-select-selection-icon']";
        WebElement element =webDriver.findElement(By.xpath(xpath));
        element.click();
        return getLastDataDownList();
    }
    private WebElement getLastDataDownList(){
        return webDriver.findElement(By.xpath("//div[@class='yotta-select-menu css-4lmpwu']"));
    }
    //静态数据
    @FindBy(xpath = "//span[text()='静态数据']")
    private WebElement statisticsData;
    public WebElement getStatisticsData(){return statisticsData;}


    //右侧图层的第一个选择按钮
   @FindBy(xpath = "//div[@id='layer-wrapper']/div[1]//div[@class='YrCHylZ1ZJSosX_3yNAqH']")
    private WebElement pictureOne;
    public WebElement getPictureOne(){return pictureOne;}

    //右侧图层的第二个选择按钮
    @FindBy(xpath = "//div[@id='layer-wrapper']/div[2]//div[@class='YrCHylZ1ZJSosX_3yNAqH']")
    private WebElement pictureTwo;
    public WebElement getPictureTwo(){return pictureTwo;}
    //右侧图层的第三个选择按钮
    @FindBy(xpath = "//div[@id='layer-wrapper']/div[3]//div[@class='YrCHylZ1ZJSosX_3yNAqH']")
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
      public WebElement getRadarChart(){return this.getChartList("雷达图");}
      public WebElement getPercent3dChart(){return this.getDivText("单值百分比图");}


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
      public WebElement getCircularCylinderChart(){return this.getChartList("环形柱图");}
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

     //滚动频率
      public WebElement getRollF(){return this.input("动画","轮播间隔");}

      //数据-搜索-名称
    public WebElement getScrollBarSearchName() {
        return this.dropdownList("", "名称");
    }
    //数据-搜索-数值字段
    public WebElement getScrollBarSearchNumber() {
        return this.dropdownList("", "数值字段");
    }


//滚动柱形图
      public WebElement getRollHistogram(){return getTableList("轮播列表柱形图");}
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


      public WebElement getListOfTurns(){return this.getTableList("轮播列表");}
      //样式中的轮播列表
      //字体大小
      public WebElement getListOfTurnsWordSize() {
          return this.input("滚动列表", "字体大小");
      }
    //序号颜色
      public WebElement getSerialNumberColor(){return this.colorInput("滚动列表", "序号颜色");}

    public WebElement getSerialNumberColor2(){return this.colorInput("滚动列表II", "序号颜色");}
      public WebElement getTextAlign(){
          return this.dropdownList("表头","文本对齐");
      }

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


      public WebElement getHorizontalCapsule(){return this.getChartList("水平胶囊柱状图");}

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


    @FindBy(xpath = "//div[@class='_3-xtsRE7klLSZ0ANG7j3NH']")
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

    public WebElement getLineColor(){return this.input("轴线", "颜色");}

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
    public WebElement getHeadHeight(){return this.input("表头","表头杭高(%)");}

//    内边距
    @FindBy(xpath = "//label[contains(text(),'内边距')]/following-sibling::div/input")
    private WebElement padding;
    public WebElement getPadding(){return padding;}
//   显示行数
    @FindBy(xpath = "//label[contains(text(),'显示行数')]/following-sibling::div/input")
    private WebElement showRows;
    public WebElement getShowRows(){return showRows;}


//数值翻牌器
    //字体颜色
    @FindBy(xpath = "//label[contains(text(),'字体颜色')]/following-sibling::div")
    private WebElement numberFontColor;
    public WebElement getNumberFontColor(){return this.colorInput("翻转", "字体颜色");}

    //字体粗细
    public WebElement getFlipNumberWordBold(){return this.dropdownList("翻转","字体粗细");}
    //对齐方式
    public WebElement getFlipNumberHorizontal(){return this.dropdownList("翻牌器","对齐方式");}
    public WebElement getFlipSpacing(){return this.input("全局","间距");}
    @FindBy(xpath = "//span[text()='前缀-数字']/../..//input")
    private WebElement BeforeSpacing;
    public WebElement getBeforeSpacing(){return BeforeSpacing;}

    @FindBy(xpath = "//span[text()='数字-后缀']/../..//input")
    private WebElement AfterSpacing;
    public WebElement getAfterSpacing(){return AfterSpacing;}

    public WebElement getGridLines(){
        return this.getDivText("网格线");
    }
    public WebElement getDividingLineColor(){
        return this.input("网格线","颜色");
    }
    public WebElement getDividingLineBold(){
        return this.input("网格线","粗细");
    }


// 柱图-X轴-网格线
//    网格线元素
    @FindBy(xpath = "//div[text()='x轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='网格线']")
    private WebElement xgridlines;
        public WebElement getXgridlines(){
            return xgridlines;
        }
    //颜色
  /*  @FindBy(xpath = "//div[text()='x轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='网格线']//ancestor::div[@class='yotta-collapse'][1]//input")
    private WebElement xDividingLineColor;*/
    public WebElement getXDividingLineColor(){return this.input("网格线","颜色");}
    //类型
    public WebElement getXDividingLineType(){
        return this.dropdownList("折线样式","类型");
//        return xDividingLineType;
    }



    //折线样式颜色
    @FindBy(xpath = "//span[text()='填充色']/../../div[2]//input")
    private WebElement tcolor;
    public WebElement getTcolor(){
        return tcolor;
    }

    //折线样式颜色
    @FindBy(xpath = "//span[text()='颜色']/../../div[2]//input")
    private WebElement zcolor;
    public WebElement getZcolor(){
        return zcolor;
    }

    public WebElement getZcolor2(){
        return this.input("折线样式","填充色");
    }



    //数据点标记
    @FindBy(xpath = "//div[text()='数据点标记']")
    private WebElement dataBuild;
    public WebElement getDataBuild(){
        return dataBuild;
    }
    //数据点形状
    public WebElement getDataStyle(){
        return this.dropdownList("数据点标记","数据点形状");
    }
    //数据点大小
    @FindBy(xpath = "//span[text()='数据点大小']/../../div[2]//input")
    private WebElement dataSize;
    public WebElement getDataSize(){
        return dataSize;
    }


    //轴线
    @FindBy(xpath = "//div[text()='x轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='轴线']")
    private WebElement xaxesLines;
    public WebElement getXaxesLines(){
        return xaxesLines;
    }
/*    @FindBy(xpath = "//div[text()='x轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='轴线']//ancestor::div[@class='yotta-collapse'][1]//input")
    private WebElement xLineColor;*/
    public WebElement getXLineColor(){return this.input("轴线","颜色");}

    //轴线
    @FindBy(xpath = "//div[text()='角度轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='轴线']")
    private WebElement axesLines;
    public WebElement getAxesLines(){
        return axesLines;
    }



// 柱图-Y轴-网格线
//    网格线元素
    @FindBy(xpath = "//div[text()='y轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='网格线']")
    private WebElement ygridlines;
        public WebElement getYgridlines(){
            return ygridlines;
        }
    //颜色
/*    @FindBy(xpath = "//div[text()='y轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='网格线']//ancestor::div[@class='yotta-collapse'][1]//input")
    private WebElement yDividingLineColor;*/
    public WebElement getYDividingLineColor(){return this.input("网格线","颜色");}


    //轴线
    @FindBy(xpath = "//div[text()='y轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='轴线']")
    private WebElement yaxesLines;
    public WebElement getYaxesLines(){
        return yaxesLines;
    }
  /*  @FindBy(xpath = "//div[text()='y轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='轴线']//ancestor::div[@class='yotta-collapse'][1]//input")
    private WebElement yLineColor;*/
    public WebElement getYLineColor(){return this.input("轴线","颜色");}


//    z轴轴线
    @FindBy(xpath = "//div[text()='z轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='轴线']")
    private WebElement zaxesLines;
    public WebElement getZaxesLines(){
        return zaxesLines;
    }
 /*   @FindBy(xpath = "//div[text()='z轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='轴线']//ancestor::div[@class='yotta-collapse'][1]//input")
    private WebElement zLineColor;*/
    public WebElement getZLineColor(){return this.input("轴线","颜色");}

    //    网格线元素
    @FindBy(xpath = "//div[text()='z轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='网格线']")
    private WebElement zgridlines;
    public WebElement getZgridlines(){
        return zgridlines;
    }
    /*//颜色
    @FindBy(xpath = "//div[text()='z轴']//ancestor::div[contains(@class,'yotta-collapse')]//div[text()='网格线']//ancestor::div[@class='yotta-collapse'][1]//input")
    private WebElement zDividingLineColor;*/
    public WebElement getZDividingLineColor(){return this.input("网格线","颜色");}

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
