package com.yottabyte.pages.galaxee;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.GetTime;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

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

    @FindBy(className = "line")
    private WebElement line;

    @FindBy(className = "line2Y")
    private WebElement line2y;

    @FindBy(className = "bar")
    private WebElement bar;

    @FindBy(className = "range")
    private WebElement range;

    @FindBy(className = "rose")
    private WebElement rose;

    @FindBy(className = "barHorizontal")
    private WebElement barHorizontal;

    @FindBy(className = "sunburst")
    private WebElement sunburst;

    @FindBy(className = "pie")
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

    @FindBy(className = "scatter")
    private WebElement scatter;

    @FindBy(xpath = "(//span[contains(text(),'确定')][not(@class)])[last()]")
    private WebElement ensureDelete;

    @FindBy(className = "percent")
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

    @FindBy(className = "arcBar")
    private WebElement arcBar;

    @FindBy(xpath = "(//label[text()='图表尺寸']/following-sibling::div//input)[1]")
    private WebElement width;

    @FindBy(xpath = "(//label[text()='图表尺寸']/following-sibling::div//input)[2]")
    private WebElement height;

    @FindBy(xpath = "(//label[text()='图表位置']/following-sibling::div//input)[1]")
    private WebElement chartXaxis;

    @FindBy(xpath = "(//label[text()='图表位置']/following-sibling::div//input)[2]")
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

    @FindBy(xpath = "(//div[contains(text(),'地图')])[2]")
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

    @FindBy(className = "flipNumber")
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

    @FindBy(className = "liquidfill")
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

    @FindBy(className = "chord")
    private WebElement chord;

    @FindBy(xpath = "//span[contains(@style,'background: rgb(233, 30, 99);')]")
    private WebElement red;

    @FindBy(className = "force")
    private WebElement force;

    @FindBy(className = "sankey")
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
}
