package com.yottabyte.pages.galaxee;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.GetTime;
import com.yottabyte.utils.WaitForElement;
import org.assertj.core.internal.cglib.asm.$ClassReader;
import org.junit.Test;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.security.cert.X509Certificate;
import java.util.List;

/**
 * @author sunxj
 */
public class CreatePage extends PageTemplate {
    public CreatePage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "el-input__inner")
    private WebElement name;

    @FindBy(xpath = "(//div[@class='screenshot'])[2]")
    private WebElement bank;

    @FindBy(xpath = "//li[contains(text(),'图表')]")
    private WebElement chart;

    @FindBy(xpath = "//li[contains(text(),'地图')]")
    private WebElement map;

    @FindBy(xpath = "//li[contains(text(),'指标')]")
    private WebElement index;

    @FindBy(xpath = "//li[contains(text(),'文字')]")
    private WebElement word;

    @FindBy(xpath = "//li[contains(text(),'其他')]")
    private WebElement other;

    @FindBy(className = "linechart")
    private WebElement line;

    @FindBy(className = "linechart2y")
    private WebElement line2y;

    @FindBy(className = "barchart")
    private WebElement bar;

    @FindBy(className = "rangechart")
    private WebElement range;

    @FindBy(className = "rosechart")
    private WebElement rose;

    @FindBy(className = "barcharthorizontal")
    private WebElement barHorizontal;

    @FindBy(className = "sunburstchart")
    private WebElement sunburst;

    @FindBy(className = "piechart")
    private WebElement pie;

    @FindBy(xpath = "//div[text()='数据']")
    private WebElement data;

    @FindBy(xpath = "(//span[contains(text(),'搜索')][not(@class)])[last()]")
    private WebElement search;

    @FindBy(xpath = "(//span[contains(text(),'更新')][not(@class)])[last()]")
    private WebElement update;

    @FindBy(className = "download")
    private WebElement download;

    @FindBy(className = "delete")
    private WebElement delete;

    @FindBy(className = "scatterchart")
    private WebElement scatter;

    @FindBy(xpath = "(//span[contains(text(),'确定')][not(@class)])[last()]")
    private WebElement ensureDelete;

    @FindBy(className = "percentchart")
    private WebElement percent;

    @FindBy(className = "el-upload--text")
    private WebElement upload;

    @FindBy(className = "textarea-icon-padding")
    private WebElement splInput;

    @FindBy(xpath = "//div[text()='样式']")
    private WebElement style;

    @FindBy(xpath = "//div[text()='图表尺寸位置']")
    private WebElement position;

    @FindBy(xpath = "//div[text()='图表尺寸位置']/i")
    private WebElement chartPosition;

    @FindBy(className = "icon-youjiantou1")
    private WebElement rightArrow;

    @FindBy(className = "left-fixed_right-auto")
    private WebElement preview;

    @FindBy(xpath = "(//input[@class='el-color-dropdown__value'])[last()]")
    private WebElement colorInput;

    @FindBy(xpath = "(//button[@class='el-color-dropdown__btn'])[last()]")
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

    @FindBy(xpath = "//div[text()='单环颜色']/following-sibling::div//label/following-sibling::div//span[@class='el-color-picker__color-inner']")
    private WebElement monocycleColor;

    @FindBy(className = "arcbarchart")
    private WebElement arcBar;

    @FindBy(xpath = "(//label[text()='图表尺寸']/following-sibling::div//input)[1]")
    private WebElement width;

    @FindBy(xpath = "(//label[text()='图表尺寸']/following-sibling::div//input)[2]")
    private WebElement height;

    //@FindBy(xpath = "(//label[text()='图表位置']/following-sibling::div//input)[1]")
    @FindBy(xpath = "(//label[text()='图表位移']/following-sibling::div//input)[1]")
    private WebElement chartXaxis;

   // @FindBy(xpath = "(//label[text()='图表位置']/following-sibling::div//input)[2]")
    @FindBy(xpath = "(//label[text()='图表位移']/following-sibling::div//input)[2]")
    private WebElement chartYaxis;

    @FindBy(xpath = "(//div[text()='极坐标系']/following-sibling::div//label[contains(text(),'中心纬度,经度')]/following-sibling::div//input)[2]")
    private WebElement polarYaxis;

    @FindBy(className = "chinamap2d")
    private WebElement chinaMap;

    @FindBy(xpath = "//label[contains(text(),'区域颜色')]/following-sibling::div//span[@class='el-color-picker__color-inner']")
    private WebElement areaColor;

    @FindBy(xpath = "//label[contains(text(),'边界颜色')]/following-sibling::div//span[@class='el-color-picker__color-inner']")
    private WebElement boundaryColor;

    @FindBy(xpath = "//label[contains(text(),'字体颜色')]/following-sibling::div//span[@class='el-color-picker__color-inner']")
    private WebElement wordColor;

    @FindBy(xpath = "//label[contains(text(),'标注颜色')]/following-sibling::div//span[@class='el-color-picker__color-inner']")
    private WebElement markColor;

    @FindBy(xpath = "//label[contains(text(),'事件颜色')]/following-sibling::div//span[@class='el-color-picker__color-inner']")
    private WebElement eventColor;

    @FindBy(xpath = "//label[text()='正常']/following-sibling::div//input")
    private List<WebElement> mapInputList;

    @FindBy(xpath = "(//div[contains(text(),'地图')])/i")
    private WebElement mapHeader;

    @FindBy(className = "worldmap2d")
    private WebElement world;

    @FindBy(className = "heatmap")
    private WebElement heatmap;

    @FindBy(className = "attackmap")
    private WebElement attackmap;

    @FindBy(className = "globelabel")
    private WebElement globelabel;

    @FindBy(className = "attack3d")
    private WebElement attack3d;

//    @FindBy(className = "flipNumber")
    @FindBy(xpath = "//li[text()='数值翻牌器']")
    private WebElement flipNumber;

    @FindBy(className = "status")
    private WebElement status;

    @FindBy(className = "title")
    private WebElement title;

    @FindBy(className = "el-color-picker__color-inner")
    private WebElement colorInner;

    @FindBy(className = "table")
    private WebElement table;

    @FindBy(xpath = "//label[contains(text(),'背景颜色')]/following-sibling::div//div[@class='el-color-picker__trigger']")
    private WebElement tableHeaderBgColor;

    @FindBy(xpath = "//div[text()='列配置']/following-sibling::div//label[contains(text(),'列宽')]/following-sibling::div//input")
    private List<WebElement> columnsWidth;

    @FindBy(xpath = "//div[text()='标号']")
    private WebElement orderNum;

    @FindBy(xpath = "//div[text()='count()']")
    private WebElement count;

    @FindBy(xpath = "//div[@class='panel-style-setting table-color-setting-modal']//div[@class='el-tab-pane'][not(@style='display: none;')]//label[contains(text(),'颜色')]/following-sibling::div//i")
    private WebElement countColor;

    @FindBy(className = "el-icon-down")
    private List<WebElement> colorSettingList;

    @FindBy(xpath = "(//div[@class='divergent-list'])[2]//img")
    private WebElement color1;

    @FindBy(xpath = "//div[@class='panel-style-setting table-color-setting-modal']//div[@class='el-tab-pane'][not(@style='display: none;')]//label[contains(text(),'风格')]/following-sibling::div//i")
    private WebElement numberStyle;

    @FindBy(className = "liquidfillchart")
    private WebElement liquidfill;

    @FindBy(xpath = "//label[contains(text(),'水波动画')]/following-sibling::label")
    private WebElement waterWaveSwitchLabel;

    @FindBy(xpath = "//label[contains(text(),'显示')]/following-sibling::label")
    private WebElement outerFrameSwitch;

    @FindBy(xpath = "//label[contains(text(),'水波内颜色')]/following-sibling::div//div[@class='el-color-picker__trigger']")
    private WebElement tagColorInWaterWave;

    @FindBy(xpath = "//label[contains(text(),'水波外颜色')]/following-sibling::div//div[@class='el-color-picker__trigger']")
    private WebElement tagColorOutWaterWave;

    @FindBy(xpath = "(//label[contains(text(),'颜色')]/following-sibling::div//div[@class='el-color-picker__trigger'])[last()]")
    private WebElement waterWaveColor;

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

    @FindBy(xpath = "//div[@class='panel-search-option']/div/button/span")
    private WebElement dataSearch;

    public WebElement getDataSearch() {
        return dataSearch;
    }

    public WebElement getMapDropdown() {
        return mapDropdown;
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
        return waterWaveColor;
    }

    public WebElement getWaterWaveColorHeader() {
        return this.header("水波颜色");
    }

    public WebElement getTagColorInWaterWave() {
        return tagColorInWaterWave;
    }

    public WebElement getTagColorOutWaterWave() {
        return tagColorOutWaterWave;
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

    public WebElement getNumberWidth() {
        return columnsWidth.get(0);
    }

    public WebElement getFieldWidth1() {
        return columnsWidth.get(1);
    }

    public WebElement getColumnConfig() {
        return this.header("列配置");
    }

    public WebElement getRowNumber() {
        return this.input("单元格", "显示行数");
    }

    public WebElement getCellFrameBold() {
        return this.input("单元格", "边框粗细");
    }

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
        return tableHeaderBgColor;
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

    public WebElement getTable() {
        return table;
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
        return this.dropdownList("翻牌器", "缩略比例");
    }

    public WebElement getFlipBackgroundStyle() {
        return this.dropdownList("翻牌器", "背景样式");
    }

    public WebElement getPrefix() {
        return this.input("翻牌器", "前缀");
    }

    public WebElement getSuffix() {
        return this.input("翻牌器", "后缀");
    }

    public WebElement getFlipWordBold() {
        return this.dropdownList("翻牌器", "字体粗细");
    }

    public WebElement getFlipWordSize() {
        return this.input("翻牌器", "字体大小");
    }

    public WebElement getFlipWord() {
        return this.dropdownList("翻牌器", "字体");
    }

    public WebElement getFlip() {
        return this.header("翻牌器");
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
        return eventColor;
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
        return markColor;
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
        return wordColor;
    }

    public WebElement getMarkType() {
        return this.dropdownList("地图", "标注类型");
    }

    public WebElement getAreaColor() {
        return areaColor;
    }

    public WebElement getBoundaryColor() {
        return boundaryColor;
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
        return this.colorPicker("角度轴", "");
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
        return this.colorPicker("半径轴", "");
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
        return monocycleColor;
    }

    public WebElement getMonocycle() {
        return this.header("单环颜色");
    }

    public WebElement getTitleColor() {
        return this.colorPicker("标题", "");
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

    public WebElement getRange() {
        return range;
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
        return this.colorPicker("图例", "");
    }

    public WebElement getExample() {
        return this.header("图例");
    }

    public WebElement getLayout() {
        return this.header("布局");
    }

    public WebElement getDataSeries() {
        return this.header("数据系列");
    }

    public WebElement getTitleSize() {
        return this.input("标题", "字号");
    }

    public WebElement getYaxisWordColor() {
        return this.colorPicker("y轴", "文本");
    }

    public WebElement getTagWordColor() {
        return this.colorPicker("标签", "");
    }

    public WebElement getYaxisWordSize() {
        return this.input("y轴", "字号");
    }

    public WebElement getTagWordSize() {
        return this.input("标签", "字号");
    }

    public WebElement getExampleWordSize() {
        return this.input("图例", "字体大小");
    }

    public WebElement getXaxisSeparator() {
        return this.switchButton("x轴");
    }

    public WebElement getYaxisSeparator() {
        return this.switchButton("y轴");
    }

    public WebElement getXaxisAngle() {
        return this.dropdownList("x轴", "角度");
    }

    public WebElement getYaxisAngle() {
        return this.dropdownList("y轴", "角度");
    }

    public WebElement getXaxisShift() {
        return this.input("x轴", "位移");
    }

    public WebElement getYaxisShift() {
        return this.input("y轴", "位移");
    }

    public WebElement getXaxisWordBold() {
        return this.dropdownList("x轴", "字体粗细");
    }

    public WebElement getYaxisWordBold() {
        return this.dropdownList("y轴", "字体粗细");
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

    public WebElement getLayoutTop() {
        return this.input("布局", "顶部");
    }

    public WebElement getLayoutBottom() {
        return this.input("布局", "底部");
    }

    public WebElement getLayoutLeft() {
        return this.input("布局", "左侧");
    }

    public WebElement getLayoutRight() {
        return this.input("布局", "右侧");
    }

    public WebElement getEnsureColor() {
        return ensureColor;
    }

    public WebElement getColorInput() {
        return colorInput;
    }

    public WebElement getXaxisWordColor() {
        return this.colorPicker("x轴", "文本");
    }

    public WebElement getXaxisWordSize() {
        return this.input("x轴", "字号");
    }

    public WebElement getXaxisHeader() {
        return this.header("x轴");
    }

    public WebElement getYaxisHeader() {
        return this.header("y轴");
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
        return width;
    }

    public WebElement getHeight() {
        return height;
    }

    public WebElement getChartXaxis() {
        return chartXaxis;
    }

    public WebElement getChartYaxis() {
        return chartYaxis;
    }

    public WebElement getStyle() {
        return style;
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

    public WebElement getDelete() {
        return delete;
    }

    public WebElement getDownload() {
        return download;
    }

    public WebElement getSearchTip() {
        return searchTip;
    }

    public WebElement getSuccessMessage() {
        return super.getErrorMessage();
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

    public WebElement getFirstYaxis() {
        return this.dropdownList("", "Y轴1");
    }

    public WebElement getSecondYaxis() {
        return this.dropdownList("", "Y轴2");
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

    public WebElement getChart() {
        return chart;
    }

    public WebElement getBank() {
        return bank;
    }

    public WebElement getName() {
        return name;
    }

    public WebElement getCreate() {
        return super.getButton("创建");
    }

    public WebElement getEnsure() {
        return super.getContainsTextButton("确定");
    }

    public WebElement getSave() {
        return super.getButton("保存");
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
    @FindBy(xpath = "//span[text()='发布']")
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
    @FindBy(xpath = "//li[text()='中国地图II']")
    private WebElement ChineseMapTwo;
    public WebElement getChineseMapTwo(){return ChineseMapTwo;}
    //中国地图二->样式->名称颜色
    @FindBy(xpath = "//label[contains(text(),'名称颜色')]/following-sibling::div")
    private WebElement ChineseMapTwoNameColor;
    public WebElement getChineseMapTwoNameColor(){return ChineseMapTwoNameColor;}
    //中国地图二->样式->数值颜色
     @FindBy(xpath = "//label[contains(text(),'数值颜色')]/following-sibling::div")
    private WebElement ChineseMapTwoNumberColor;
    public WebElement getChineseMapTwoNumberColor(){return ChineseMapTwoNumberColor;}
    //中国地图二->样式->边框宽度
    @FindBy(xpath = "//label[contains(text(),'边框宽度')]/following-sibling::div/input")
    private WebElement borderWidth;
    public WebElement getBorderWidth(){return borderWidth;}
    //边框颜色
    @FindBy(xpath = "//label[contains(text(),'边框颜色')]/following-sibling::div")
    private WebElement borderColor;
    public WebElement getBorderColor(){return borderColor;}
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
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[2]/div[1]/div[1]")
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
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[2]/div[2]/div/div[2]/div[1]/i")
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

    //指标中的top3
    @FindBy(xpath ="//li[text()='Top3']")
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
    public WebElement getTop3numberTypefaceColor(){return Top3numberTypefaceColor;}
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
    @FindBy(xpath = "//li[text()='百分比']")
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
      public WebElement getText_fontColor(){return text_fontColor;}
      //字体粗细
      public WebElement getPercentageWordBold() {
        return this.dropdownList("百分比", "字体粗细");
    }
    //图表
      //图表颜色
      @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div/div[2]/div[2]/div")
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
      @FindBy(xpath = "//li[text()='提示牌']")
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
      @FindBy(xpath = "//li[text()='实体']")
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
    @FindBy(xpath = "//li[text()='流程线']")
    private WebElement flowLine;
     public WebElement getFlowLine(){return flowLine;}


     //样式中的流程线
     @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[1]/i")
     private WebElement styleFlowLine;
     public WebElement getStyleFlowLine(){return styleFlowLine;}
     //流程线颜色
     @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[1]/div")
     private WebElement flowLineColor;
     public WebElement getFlowLineColor(){return flowLineColor;}
     //流程线粗细
     @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[2]/div/input")
     private WebElement flowLineCoarseness;
     public WebElement getFlowLineCoarseness(){return flowLineCoarseness;}
    //角度
     @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[3]/div/input")
     private WebElement angle;
     public WebElement getAngle(){return angle;}
     //标注颜色
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[4]/div")
     private WebElement taggingColor;
     public WebElement getTaggingColor(){return taggingColor;}
    //标注大小
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[5]/div/input")
    private WebElement taggingSize;
     public WebElement getTaggingSize(){return taggingSize;}

//齿轮组合
    //其他中的齿轮组合
    @FindBy(xpath = "//li[text()='齿轮组合']")
    private WebElement gearCombination;
   public WebElement getGearCombination(){return gearCombination;}
   //样式中的齿轮组合
    @FindBy(xpath = "//div[text()='齿轮组合']/i")
    private WebElement styleGearCombination;
    public WebElement getStyleGearCombination(){return styleGearCombination;}
    //光环颜色
      @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[1]/div")
      private WebElement haloColor;
      public WebElement getHaloColor(){ return haloColor;}
      //背景颜色
      @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[2]/div")
      private WebElement backgroundColor;
      public WebElement getBackgroundColor(){
          return backgroundColor;
      }
      //显示图层1
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[3]/label[2]")
    private WebElement showLayerOne;
      public WebElement getShowLayerOne(){return showLayerOne;}
     //显示图层2
      @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[4]/label[2]")
      private WebElement showLayerTwo;
      public WebElement getShowLayerTwo(){return showLayerTwo;}
      //显示图层3
      @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[5]/label[2]")
      private WebElement showLayerThree;
      public WebElement getShowLayerThree(){return showLayerThree;}

//时间器
    //其他中的时间器
    @FindBy(xpath = "//li[text()='时间器']")
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
      @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[2]/div")
      private WebElement clockFontColor;
      public WebElement getClockFontColor(){return clockFontColor;}
     //字体粗细
     public WebElement getClockWordBold() {
         return this.dropdownList("时间器", "字体粗细");
     }
     //对齐方式
    public WebElement getClockHorizontal(){return this.dropdownList("时间器","对齐");}
    //时间格式
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[5]/div")
    private WebElement timeFormat;
      public WebElement getTimeFormat(){
          timeFormat.click();
          return getLastDropdownList();
      }

//视频流
    //其他中的视频流
    @FindBy(xpath = "//li[text()='视频流']")
    private WebElement videoFlow;
      public WebElement getVideoFlow(){return videoFlow;}
      //样式中的视频流
    @FindBy(xpath = "//div[text()='视频流']/i")
    private WebElement styleVideoFlow;
      public WebElement getStyleVideoFlow(){return styleVideoFlow;}
      //样式中的视频地址
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[2]/div[2]/div/div/div/input")
    private WebElement videoAddress;
      public WebElement getVideoAddress(){return videoAddress;}


//边框
    //样式中的边框
    @FindBy(xpath = "//div[text()='边框']/i")
    private WebElement styleFrame;
      public WebElement getStyleFrame(){return styleFrame;}
      //样式选择下拉框
      @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div/div/div/div")
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
      @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[1]/div/input")
      private WebElement gridPercentFontSize;
      public WebElement getGridPercentFontSize(){return gridPercentFontSize;}
    //行高
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[2]/div/input")
    private WebElement rowHeight;
      public WebElement getRowHeight(){return rowHeight;}
    //字体颜色
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[3]/div/div/span[1]/span")
   private WebElement gridFontColor;
      public WebElement getGridFontColor(){return gridFontColor;}
    //栅格间隙
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[4]/div/input")
    private WebElement gridClearance;
      public WebElement getGridClearance(){return gridClearance;}
    //栅格颜色
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[5]/div")
    private WebElement gridColor;
      public WebElement getGridColor(){return gridColor;}
    //标题
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[6]/div/input")
    private WebElement gridTitle;
      public WebElement getGridTitle(){return gridTitle;}

      //栅格百分图之数据-搜索-类别
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div[1]/div")
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
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div/div/div[1]/div")
    private WebElement chartStartColor;
      public WebElement getChartStartColor(){
          chartStartColor.click();
          return this.getLastDropdownList();
      }
      @FindBy(xpath = "/html/body/div[8]/div/div[1]/ul/li[8]/span")
      private WebElement yellow;
      public WebElement getYellow(){return yellow;}
    //字体类型
   @FindBy(xpath = "//label[contains(text(),'字体类型')]/parent::div/div")
    private WebElement fontType;
      public WebElement getFontType(){
          fontType.click();
          return this.getLastDropdownList();
      }
      //字体最大字号
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div/div/div[3]/div/input")
    private WebElement maxFont;
      public WebElement getMaxFont(){
          return maxFont;
      }

      //字符云图-数据-搜索-数值字段
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div[1]/div")
    private WebElement cloudDataSearchNumber;
      public WebElement getCloudDataSearchNumber(){
          cloudDataSearchNumber.click();
          return getLastDropdownList();
      }
      //字符云图-数据-搜索-切分字段
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div[2]/div")
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
      @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div/div/div[2]/div/input")
     private WebElement radarFontSize;
      public WebElement getRadarFontSize(){return radarFontSize;}
    //颜色
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div/div/div[3]/div")
    private WebElement radarColor;
      public WebElement getRadarColor(){return radarColor;}
    //字体粗细
    public WebElement getRadarWordBold() {
        return this.dropdownList("雷达图", "字体粗细");
    }
    //区域边框颜色
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div/div/div[5]/div")
    private WebElement areaBorderColor;
      public WebElement getAreaBorderColor(){return areaBorderColor;}
    //区域颜色
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div/div/div[6]/div")
    private WebElement radarAreaColor;
      public WebElement getRadarAreaColor(){return radarAreaColor;}
    //辐射线颜色
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div/div/div[7]/div")
    private WebElement radarLineColor;
      public WebElement getRadarLineColor(){return radarLineColor;}
      //分割线颜色
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div/div/div[8]/div")
    private WebElement splitLineColor;
      public WebElement getSplitLineColor(){return splitLineColor;}
    //雷达图占比大小
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div[2]/div[2]/div[2]/div/div/div[9]/div/input")
    private WebElement proportionOfRadarChart;
      public WebElement getProportionOfRadarChart(){return proportionOfRadarChart;}

      //雷达图-数据-搜索-名称字段
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div[1]/div")
    private WebElement radarNameFile;
      public WebElement getRadarNameFile(){
          radarNameFile.click();
          return this.getLastDropdownList();
      }
    //雷达图-数据-搜索-数值字段
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div[2]/div")
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
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[1]/div/input")
    private WebElement percent3dName;
      public WebElement getPercent3dName(){return percent3dName;}
    //名称字号
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[2]/div/input")
    private WebElement percent3dNameFontSize;
      public WebElement getPercent3dNameFontSize(){return percent3dNameFontSize;}
    //名称颜色
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[3]/div")
    private WebElement percent3dNameColor;
      public WebElement getPercent3dNameColor(){return percent3dNameColor;}
    //数值字号
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[4]/div/input")
    private WebElement numberFontSize;
      public WebElement getNumberFontSize(){return numberFontSize;}
    //数值颜色
  //  @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[3]/div[2]/div/div/div[5]/div")
    @FindBy(xpath = "//label[contains(text(),'数值颜色')]/following-sibling::div")
    private WebElement numberColor;
      public WebElement getNumberColor(){return numberColor;}

      //数据-搜索-类别
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div[1]/div")
      private WebElement percent3dDataSearchCategory;
      public WebElement getPercent3dDataSearchCategory(){
          percent3dDataSearchCategory.click();
          return this.getLastDropdownList();
      }
      //值范围
    //正常最小值
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div[3]/div[1]/div/div[1]/input")
    private WebElement normalMin;
      public WebElement getNormalMin(){return normalMin;}
    //正常最大值
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div[3]/div[1]/div/div[2]/input")
    private WebElement normalMax;
      public WebElement getNormalMax(){return normalMax;}

    //异常最小值
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div[3]/div[2]/div/div[1]/input")
    private WebElement abnormalMin;
      public WebElement getAbnormalMin(){return abnormalMin;}
    //异常最大值
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div[3]/div[2]/div/div[2]/input")
    private WebElement abnormalMax;
      public WebElement getAbnormalMax(){return abnormalMax;}
    //严重最小值
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div[3]/div[3]/div/div[1]/input")
    private WebElement seriousMin;
      public WebElement getSeriousMin(){return seriousMin;}
    //严重最大值
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div[3]/div[3]/div/div[2]/input")
    private WebElement seriousMax;
      public WebElement getSeriousMax(){return seriousMax;}

//环形柱图
    @FindBy(xpath = "//li[text()='环形柱图']")
    private WebElement circularCylinderChart;
      public WebElement getCircularCylinderChart(){return circularCylinderChart;}
     //样式中的图表
    @FindBy(xpath = "//div[text()='图表']/i")
    private WebElement styleCirCylChart;
      public WebElement getStyleCirCylChart(){return styleCirCylChart;}
    //文本字体大小
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[2]/div[2]/div[2]/div/div/div[2]/div/input")
   private WebElement textFontSize;
      public WebElement getTextFontSize(){return textFontSize;}
    //文本字体颜色
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[2]/div[2]/div[2]/div/div/div[3]/div")
    private WebElement textFontColor;
      public WebElement getTextFontColor(){return textFontColor;}
    //文本字体粗细
    public WebElement getTextWordBold() {
        return this.dropdownList("图表", "字体粗细");
    }
    //环柱渐变色1
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[2]/div[2]/div[2]/div/div/div[8]/div")
    private WebElement gradation1;
      public WebElement getGradation1(){return gradation1;}
    //环柱渐变色2
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[2]/div[2]/div[2]/div/div/div[9]/div")
    private WebElement gradation2;
      public WebElement getGradation2(){return gradation2;}
    //环柱渐变色3
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[1]/div/div[2]/div[2]/div[2]/div/div/div[10]/div")
    private WebElement gradation3;
      public WebElement getGradation3(){return gradation3;}

    //环形柱图-数据-搜索-标签
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[3]/div/div")
    private WebElement dataSearchLabel;
      public WebElement getDataSearchLabel(){
          dataSearchLabel.click();
          return this.getLastDropdownList();
      }
    //环形柱图-数据-搜索-值
    @FindBy(xpath = "//*[@id=\"big_v_edit\"]/div[2]/div/div/div[3]/div/div[3]/div/div/div/div[2]/div[2]/div[4]/div/div")
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
      public WebElement getFontColor(){return fontColor;}
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
    @FindBy(xpath = "//label[contains(text(),'字体颜色')]/following-sibling::div")
    private WebElement rollHistFontColor;
      public WebElement getRollHistFontColor(){return rollHistFontColor;}
      //字体粗细
      public WebElement getRollHistWordBold() {
          return this.dropdownList("滚动柱形图", "字体粗细");
      }
      //图表颜色1
      @FindBy(xpath = "//label[contains(text(),'颜色 1')]/following-sibling::div")
      private WebElement chartColor1;
      public WebElement getChartColor1(){return chartColor1;}
      //图表颜色2
     @FindBy(xpath = "//label[contains(text(),'颜色 2')]/following-sibling::div")
    private WebElement chartColor2;
      public WebElement getChartColor2(){return chartColor2;}


//轮播列表
    @FindBy(xpath = "//li[text()='轮播列表']")
   private WebElement listOfTurns;
      public WebElement getListOfTurns(){return listOfTurns;}
      //样式中的轮播列表
    @FindBy(xpath = "//div[text()='轮播列表']/i")
    private WebElement styleListOfTurns;
      public WebElement getStyleListOfTurns(){return styleListOfTurns;}
      //字体大小
      public WebElement getListOfTurnsWordSize() {
          return this.input("轮播列表", "字体大小");
      }
    //序号颜色
    @FindBy(xpath = "//label[contains(text(),'序号颜色')]/following-sibling::div")
    private WebElement serialNumberColor;
      public WebElement getSerialNumberColor(){return serialNumberColor;}
      //背景颜色
       @FindBy(xpath = "//label[contains(text(),'背景颜色')]/following-sibling::div")
        private WebElement listOfTurnsBackgroundColor;
      public WebElement getListOfTurnsBackgroundColor(){return listOfTurnsBackgroundColor;}
      //内容颜色
      @FindBy(xpath = "//label[contains(text(),'内容颜色')]/following-sibling::div")
    private WebElement contentColor;
      public WebElement getContentColor(){return contentColor;}
    //字体粗细
    public WebElement getListOfTurnsWordBold() {
        return this.dropdownList("轮播列表", "字体粗细");
    }


//水平胶囊
    @FindBy(xpath = "//li[text()='水平胶囊']")
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
      @FindBy(xpath = "//label[contains(text(),'字体颜色')]/following-sibling::div")
      private WebElement capsuleFontColor;
      public WebElement getCapsuleFontColor(){return capsuleFontColor;}
      //字体粗细
     public WebElement getCapsuleWordBold(){return this.dropdownList("水平胶囊","字体粗细");}
     //条高比
     @FindBy(xpath = "//label[contains(text(),'条高比')]/following-sibling::div//input[@class='el-input__inner']")
    private WebElement aspectRatio;
      public WebElement getAspectRatio(){return aspectRatio;}
      //条颜色
      @FindBy(xpath = "//label[contains(text(),'条颜色')]/following-sibling::div")
      private WebElement aspectColor;
      public WebElement getAspectColor(){return aspectColor;}

//综合列表
    @FindBy(xpath = "//li[text()='综合列表']")
    private WebElement comprehensiveList;
      public WebElement getComprehensiveList(){return comprehensiveList;}
      //样式中的综合列表
    @FindBy(xpath = "//div[text()='综合列表']/i")
    private WebElement styleComprehensiveList;
      public WebElement getStyleComprehensiveList(){return styleComprehensiveList;}
     //标题颜色
    @FindBy(xpath = "//label[contains(text(),'标题颜色')]/following-sibling::div")
    private WebElement listTitleColor;
      public WebElement getListTitleColor(){return listTitleColor;}

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
    @FindBy(xpath = "//label[contains(text(),'背景颜色1')]/following-sibling::div")
    private WebElement backgroundColor1;
      public WebElement getBackgroundColor1(){return backgroundColor1;}
      //背景颜色2
    @FindBy(xpath = "//label[contains(text(),'背景颜色2')]/following-sibling::div")
    private WebElement backgroundColor2;
      public WebElement getBackgroundColor2(){return backgroundColor2;}
      //背景颜色3
    @FindBy(xpath = "//label[contains(text(),'背景颜色3')]/following-sibling::div")
    private WebElement backgroundColor3;
      public WebElement getBackgroundColor3(){return backgroundColor3;}

//滚动列表三
    @FindBy(xpath = "//li[text()='滚动列表III']")
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

    //网络下拉菜单
    @FindBy(xpath = "//li[contains(text(),'网络')]/ul")
    private WebElement netDropdown;
    public WebElement getNetDropdown(){return netDropdown;}


    //其他下拉菜单
    @FindBy(xpath = "//li[contains(text(),'其他')]/ul")
    private WebElement otherDropdown;
    public WebElement getOtherDropdown(){return otherDropdown;}

}
