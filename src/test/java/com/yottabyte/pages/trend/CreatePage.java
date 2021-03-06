package com.yottabyte.pages.trend;

import com.yottabyte.pages.DateEditorPage;
import com.yottabyte.pages.EditorPage;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import org.openqa.selenium.Dimension;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

/**
 * @author sunxj
 * modified by Kate
 * can be used for creating trends, for editing charts on the search page
 */
public class CreatePage extends EditorPage {
    public CreatePage(WebDriver driver) {
        super(driver);
        //webDriver.manage().window().setPosition(new Point(0, 0));
        driver.manage().window().setSize(new Dimension(1200,900));
    }

    @FindBy(xpath = "//div[@id='spl-chart']")
    private WebElement statisticalChart;

    @FindBy(xpath = "//span[text()='保存为']")
    private WebElement saveAs;

    @FindBy(xpath = "//span[@yotta-test='trend-dataset_query-tag']/span")
    private WebElement dataSetPosition;

    // with bubbles
    @FindBy(xpath = "//*[text()='124']/parent::*[name()='g']")
    private WebElement countryChina;

    @FindBy(xpath = "//*[text()='46']/parent::*[name()='g']")
    private WebElement provinceJiangsu;

    @FindBy(xpath = "//*[text()='POST']/preceding-sibling::*")
    private WebElement clickPOST;

    @FindBy(xpath = "//*[text()='北京']/preceding-sibling::*[name()='circle']")
    private WebElement clickBeijing;

    @FindBy(xpath = "(//span[text()='行数']/preceding-sibling::div/input)[last()]")
    private WebElement rowNum;

    @FindBy(xpath = "(//span[text()='列数']/preceding-sibling::div/input)[last()]")
    private WebElement columnNum;

    @FindBy(xpath = "((//label[contains(text(),'资源标签')][last()])/ancestor::div/following-sibling::div)[1]")
    private WebElement groupField;

    @FindBy(xpath = "((//label[contains(text(),'所属应用')][last()])/ancestor::div/following-sibling::div)[1]")
    private WebElement appField;

    @FindBy(xpath = "(//div[@yotta-test='chartgui-color-dom'])[last()]")
    private WebElement addColor;

    @FindBy(xpath = "(//span[contains(@class,'yotta-tag-close')])[1]")
    private WebElement deleteFirst;

    @FindBy(xpath = "(//span[contains(@class,'yotta-tag-close')])[last()]")
    private WebElement deleteLast;

    // Labels
    @FindBy (xpath = "//span[text()='标签']/ancestor::div/following-sibling::div//label[1]")
    private WebElement firstLabel;

    @FindBy (xpath = "//span[text()='标签']/ancestor::div/following-sibling::div//label[2]")
    private WebElement secondLabel;

    @FindBy (xpath = "//span[text()='标签']/ancestor::div/following-sibling::div//label[3]")
    private WebElement thirdLabel;

    @FindBy (xpath = "//span[text()='标签']/ancestor::div/following-sibling::div//label[4]")
    private WebElement forthLabel;

    @FindBy(xpath = "(//input[@value='china'])[last()]")
    private WebElement selectChina;

    @FindBy(xpath = "(//input[@value='jiangsu'])[last()]")
    private WebElement selectJiangsu;

    @FindBy(xpath = "(//input[@value='world'])[last()]")
    private WebElement selectWorld;

    @FindBy(xpath = "//div[contains(@class,'yotta-checkbox-group')]")
    private WebElement checkBox;

//--------------------------------------------
//Table Pencil ---------------------------------------

    @FindBy(xpath = "(//span[@yotta-test='table_chart-edit-icon'])[last()]")
    private WebElement pencil;

    @FindBy(xpath = "(//span[@yotta-test='table_chart-edit-icon'])[1]")
    private WebElement pencilFirst;

    @FindBy(xpath = "//span[text()='表格样式设置']/ancestor::div[contains(@class,'table-color-setting')]")
    private WebElement colorPanel;

    @FindBy(xpath = "//label[contains(text(),'表格颜色')]/following-sibling::div//span[@class='yotta-select-selection-value']")
    private WebElement selectedValueColorType;

    @FindBy(xpath = "//label[text()='预设置']/following-sibling::span")
    private WebElement selectColor;

    @FindBy(xpath = "//img[contains(@src,'/3.') and contains(@src,'.png')]/ancestor::a")
    private WebElement continuity;

    @FindBy(xpath = "//img[contains(@src,'/4.') and contains(@src,'.png')]/ancestor::a")
    private WebElement discrete;

    @FindBy(xpath = "//label[text()='下限值']/following-sibling::input")
    private WebElement lowerLimitValue;

    @FindBy(xpath = "//label[text()='中值']/following-sibling::input")
    private WebElement middleValue;

    @FindBy(xpath = "//label[text()='上限值']/following-sibling::input")
    private WebElement upperLimitValue;

    @FindBy(xpath = "//input[@value='max']/ancestor::div[1]/label/input")
    private WebElement intervalInput;

    @FindBy(xpath="(//*[contains(@class,'color-picker-inner')])[last()-1]")
    private WebElement changeColor;

    @FindBy(xpath="//div[contains(@class,'yotta-color-palette-input')]//input")
    private WebElement colorCode;

    @FindBy(xpath = "//input[@value='min']/ancestor::div[2]/span[contains(@class,'icon-Delete')]")
    private WebElement deleteFirstInterval;

    @FindBy(xpath = "//input[@value='min']/ancestor::div[2]/following-sibling::div[1]/span[contains(@class,'icon-Delete')]")
    private WebElement deleteSecondInterval;

    @FindBy(xpath = "//input[@value='max']/ancestor::div[2]/preceding-sibling::div[1]/span[contains(@class,'icon-Delete')]")
    private WebElement deleteLastInterval;

    @FindBy(xpath = "(//span[text()='值']/following-sibling::input)[last()]")
    private WebElement inputValue;

    @FindBy(xpath = "(//span[text()='值']/ancestor::div[1]/span[contains(@class,'icon-Delete')])[last()]")
    private WebElement deleteLastValue;

    @FindBy(xpath = "(//label[contains(text(),'字体颜色')]/following-sibling::div//*[contains(@class,'color-picker')])[2]")
    private WebElement changeFontColor;

    @FindBy(xpath = "//div[contains(@class,'yotta-color-palette-input')]//input")
    private WebElement fontColor;

    @FindBy(xpath = "//label[contains(text(),'对齐方式')]/following-sibling::div//span[contains(@class,'yotta-select-selection-value')]")
    private WebElement selectedAlignment;

    @FindBy(xpath = "//span[text()='使用千分隔符']/ancestor::label//input")
    private WebElement thousandSeparatorCheckbox;

//----------------------------------------------------
// other ----------------------------

    @FindBy(className = "CodeMirror-code")
    private WebElement searchInput;

    @FindBy(className = "yotta-date-time-picker")
    private WebElement dateEditor;

    @FindBy(xpath = "//label[text()='每个分片取样']/ancestor::div/following-sibling::div//input")
    private WebElement fenPianQuYang;

    @FindBy(xpath = "(//input[@value='horizontal']/following-sibling::span)[last()]")
    private WebElement horizontal;

    @FindBy(xpath = "//input[@value='left']")
    private WebElement left;

    @FindBy(xpath = "//input[@value='right']/ancestor::label")
    private WebElement right;

    @FindBy(xpath = "//input[@value='vertical']")
    private WebElement vertical;

    @FindBy(className = "yotta-message-content")
    private WebElement message;

    @FindBy(className = "_1JjlGgMGUnJmBrqR_9PZl8")
    private WebElement successMessage;

    @FindBy(xpath = "//div[@yotta-test='dialog-content-dom']")
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

    @FindBy(xpath = "//div[text()='无']")
    private WebElement noneExample;

    @FindBy(xpath = "(//div[text()='柱状外右侧'])[last()]")
    private WebElement rightPosition;

    @FindBy(xpath = "(//input[@class='el-input__inner'])[last()]")
    private WebElement label;

    @FindBy(xpath = "(//p[text()='+ 添加'])[last()] | (//*[name()='svg' and @data-icon='AddCircle']/ancestor::span[1])")
    private WebElement addField;

    @FindBy(className = "table")
    private WebElement table;

    @FindBy(xpath = "//span[text()='图标名称']/ancestor::div/following-sibling::div[1]//input")
    private WebElement iconName;

    @FindBy(xpath = "//span[text()='搜索配置']")
    private WebElement searchConfig;

    @FindBy(xpath = "//span[contains(@class,'close-icon')]")
    private WebElement closeWindow;

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

    @FindBy(xpath = "(//span[text()='世界'])[last()]")
    private WebElement world;

    @FindBy(xpath = "(//span[text()='中国'])[last()]")
    private WebElement china;

    @FindBy(xpath = "(//span[text()='江苏'])[last()]")
    private WebElement jiangsu;

    @FindBy(xpath = "(//span[text()='内蒙古'])[last()]")
    private WebElement neimeng;

    @FindBy(xpath = "(//span[contains(text(),'添加颜色区间')]/ancestor::div[1]/preceding-sibling::div//input)[last()-1]")
    private WebElement minRange;

    @FindBy(xpath = "(//span[contains(text(),'添加颜色区间')]/ancestor::div[1]/preceding-sibling::div//input)[last()]")
    private WebElement maxRange;

    @FindBy(className = "chart-setting-popover")
    private WebElement settingPopover;

    @FindBy(xpath = "(//span[contains(text(),'纬度')])[last()]/following-sibling::div//input")
    private WebElement centerLatitude;

    @FindBy(xpath = "(//span[contains(text(),'经度')])[last()]/following-sibling::div//input")
    private WebElement centerLongitude;

    @FindBy(xpath = "(//span[contains(text(),'来源名称')])[last()]/following-sibling::input")
    private WebElement mapName;

    @FindBy(xpath = "(//span[contains(text(),'URL')])[last()]/following-sibling::input")
    private WebElement mapURL;

    @FindBy(xpath = "(//span[contains(text(),'Subdomains')])[last()]/following-sibling::input")
    private WebElement subdomains;

    @FindBy(xpath = "//*[@class='leaflet-control-layers-toggle']")
    private WebElement mapSettings;

    @FindBy(xpath = "//span[contains(text(),'min(apache.resp_len)')]")
    private WebElement deleteMin;

    @FindBy(xpath = "(//div[@class='img iconfont icon-shanchuxuanting_icon'])[last()]")
    private WebElement delete;

    @FindBy(xpath = "(//*[text()='深圳市'])[last()]")
    private WebElement shenZhen;

    @FindBy(xpath = "(//*[text()='405'])[last()]")
    private WebElement status405;

    @FindBy(xpath = "(//span[@yotta-test='search-dataset_resize_handler-dom']) | (//*[text()='图表配置'])")
    private WebElement hideElement;

    @FindBy(xpath = "//*[local-name()='g' and @class='vx-group']/ancestor::div[1]")
    private WebElement chart;

    @FindBy(xpath = "//*[@yotta-test='trend-trend_app-select']/div")
    private WebElement appDropdownIcon;

    @FindBy(xpath = "(//span[@yotta-test='dashboard-chart_setting-dom'])[last()]")
    private WebElement setting;

    @FindBy(xpath = "//div[text()='Y轴 2']")
    private WebElement yaxisTwo;

    @FindBy(xpath = "(//span[text()='字段值：'])[2]/parent::div/following-sibling::div//i")
    private WebElement dataValue2;

    @FindBy(xpath = "(//span[text()='字段配置 3']/parent::div/parent::div/following-sibling::div//div[@class='ant-select-selection__rendered'])[1]")
    private WebElement fieldThreeValue;

    @FindBy(xpath = "(//span[text()='字段配置 3']/parent::div/parent::div/following-sibling::div//div[@class='ant-select-selection__rendered'])[2]")
    private WebElement fieldThreeType;

    @FindBy(xpath = "(//div[@class='ant-popover-inner-content'])[2]")
    private WebElement settingContent;

    @FindBy(xpath = "//input[@placeholder='展示字号']")
    private WebElement wordSize;

    @FindBy(xpath = "//span[text()='行数']/preceding-sibling::input")
    private WebElement layoutRow;

    @FindBy(xpath = "//span[text()='列数']/preceding-sibling::input")
    private WebElement layoutColumn;

    @FindBy(xpath = "//input[@placeholder='max']/following-sibling::div")
    private WebElement rangeColor;

    @FindBy(xpath = "(//span[text()='类型：'])[last()]/ancestor::div/following-sibling::div")
    private WebElement typeDropdown;

    @FindBy(className = "yotta-search-control-text")
    private WebElement searchStatus;

    @FindBy(xpath = "//*[@cy='24']")
    private WebElement chartElement;

    @FindBy(xpath = "(//div[@class = 'yotta-slider-knob'])[last()]")
    private WebElement sliderHandle;

    @FindBy(xpath = "(//tr/td[2]/div)[1]")
    private WebElement cell;

    @FindBy(xpath = "(//tr[2]/td[2]//div[@class='shadow-box'])[1]")
    private WebElement cell2;

    @FindBy(xpath = "//*[text()='提示']/ancestor::div/following-sibling::div//p")
    private WebElement prompt;

    @FindBy(className = "ant-message-notice")
    private WebElement notice;

    @FindBy(className = "yotta-dialog-title")
    private WebElement confirmMessage;

    @FindBy(xpath = "(//label[contains(text(),'资源标签')][last()])/ancestor::div/following-sibling::div//input")
    private WebElement tagInput;

    @FindBy(xpath = "(//span[@class='yotta-select-option-label'])[1]")
    private WebElement selectAddedTag;

    @FindBy(xpath = "//label[contains(text(),'资源标签')]/ancestor::div/following-sibling::div//span[@class='yotta-tag-content']")
    private WebElement selectedTag;

    @FindBy(xpath = "//label[contains(text(),'所属应用')]/ancestor::div/following-sibling::div//span[@class='yotta-select-selection-value']")
    private WebElement selectedApp;

    @FindBy(xpath = "//label[contains(text(),'资源标签')]/ancestor::div/following-sibling::div//span[@class='yotta-tag-content']/following-sibling::span")
    private WebElement deleteTag;

    @FindBy(xpath = "//span[@aria-label='CloseCircleFilled']")
    private WebElement closeIcon;

    @FindBy(xpath = "(//span[text()='列信息']/ancestor::div[1]/following-sibling::div//span[contains(@class,'yotta-select-selection-icon-arrow')])[last()]")
    private WebElement infoColumnIcon;

    @FindBy(xpath = "//*[name()='rect' and @class='vx-bar']/following-sibling::*[contains(@style,'font-size: 12px')]")
    private WebElement sankeyElement;

    @FindBy(xpath = "//*[(contains(text(),'200') or contains(text(),'/') or contains(text(),'GET')) and name()='text']/following-sibling::*[name()='circle']")
    private WebElement chordElement;

    @FindBy(xpath = "//*[contains(@style,'cubic-bezier')]/following-sibling::*[contains(@style,'font-size: 9px')]")
    private WebElement forceElement;

    @FindBy(xpath = "//*[@class='vx-group' and name()='g']/*[text()='南京市' and name()='text']")
    private WebElement wordcloudElement;

    @FindBy(xpath = "//*[@class='vx-group']/*[@class='vx-line-radial']")
    private WebElement radarElement;

    @FindBy(xpath = "//*[contains(@id,'funnel')]")
    private WebElement funnelElement;

    @FindBy(xpath = "//*[@class='vx-circle']/following-sibling::*//*[contains(@class,'vx-area-closed')]")
    private WebElement liquidfillElement;

    @FindBy(xpath = "//*[@class='vx-group']/*[contains(@fill,'rgb(211, 17, 33)') or contains(@fill,'rgb(253, 144, 62)') or contains(@fill,'rgb(255, 231, 148)')]")
    private WebElement matrixheatmapElement;

    @FindBy(xpath = "//div[contains(@class,'bar')]/ancestor::div[1]/following-sibling::div[2]//div[contains(@class,'bar')]")
    private WebElement chainTableElement;

    @FindBy(xpath = "//div[contains(@id,'tracing')]//canvas")
    private WebElement chainTreeElement;

    @FindBy(xpath = "//div[contains(@id,'sequence')]")
    private WebElement sequenceElement;

    @FindBy(xpath = "//*[@class='vx-group']//*[contains(@id,endArrow) or contains(@id,startArrow)]")
    private WebElement networkNodeElement;

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

    @FindBy(xpath = "//*[@class='vx-group']/*[contains(@font-size,'12')]/preceding-sibling::*[name()='rect']")
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

    @FindBy(xpath = "//*[@stroke-linecap='round' and @fill!='#000']")
    private WebElement geostatsmapElement;

    @FindBy(xpath = "(//div[contains(@class,'help-text')])[1]")
    private WebElement tipText;

    @FindBy(xpath = "//*[text()='表格样式设置']")
    private WebElement colorPopover;

    @FindBy(xpath = "//*[name()='g']//*[name()='svg'][1]")
    private WebElement backToChart;

    @FindBy(xpath = "//*[@class='bottom-axis']//*[name()='text']")
    private WebElement bottomAxisLabel;

    @FindBy(xpath = "//*[name()='rect']//following-sibling::*[name()='text']")
    private WebElement valueLabel;

    @FindBy(xpath = "(//span[text()='标签方向'])[last()]/ancestor::div[1]/following-sibling::div//div[contains(@class,'yotta-select-selection')]")
    private WebElement labelOrientation;

    //axis
    @FindBy(xpath = "//*[contains(@class,'vx-axis')][1]//*[contains(@class,'vx-axis-label')]")
    private WebElement fieldAxis_1;

    @FindBy(xpath = "//*[contains(@class,'vx-axis')][2]//*[contains(@class,'vx-axis-label')]")
    private WebElement fieldAxis_2;

    @FindBy(xpath = "//*[contains(@class,'vx-axis')][3]//*[contains(@class,'vx-axis-label')]")
    private WebElement fieldAxis_3;

    @FindBy(xpath = "//*[contains(@class,'vx-legend')]/parent::div/parent::div")
    private WebElement legend;

    public WebElement getLegend() {
        return legend;
    }

    public WebElement getFieldAxis_1() {
        return fieldAxis_1;
    }

    public WebElement getFieldAxis_2() {
        return fieldAxis_2;
    }

    public WebElement getFieldAxis_3() {
        return fieldAxis_3;
    }

    public WebElement getMaxAxis_1() {
        return getAxisRange("1","last()");
    }

    public WebElement getMaxAxis_2() {
        return getAxisRange("2","last()");
    }

    public WebElement getMaxAxis_3() {
        return getAxisRange("3","last()");
    }

    public WebElement getMinAxis_1() {
        return getAxisRange("1","1");
    }

    public WebElement getMinAxis_2() {
        return getAxisRange("2","1");
    }

    public WebElement getMinAxis_3() {
        return getAxisRange("3","1");
    }

    public WebElement getAxisRange(String axisNum, String pos) {
        String xpath = "//*[contains(@class,'vx-axis')][" + axisNum + "]//*[contains(@class,'tick') and name()='g'][" + pos + "]";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getValueLabel() {
        return valueLabel;
    }

    public WebElement getBottomAxisLabel() {
        return bottomAxisLabel;
    }

    public WebElement getBackToChart() {
        return backToChart;
    }

    public WebElement getColorPopover() {
        return colorPopover;
    }

    public WebElement getTipText() {
        return tipText;
    }

    public WebElement getGeostatsmapElement() {
        return geostatsmapElement;
    }

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

    public WebElement getNetworkNodeElement() {
        return networkNodeElement;
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

    public WebElement getCloseIcon() {
        return closeIcon;
    }

    public WebElement getInfoColumnIcon() {
        return infoColumnIcon;
    }

    public WebElement getConfirmMessage() {
        return confirmMessage;
    }

    public WebElement getNotice() {
        return notice;
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

    public WebElement getSearchStatus() throws InterruptedException {
        Thread.sleep(1000);
        return searchStatus;
    }

    public WebElement getTypeDropdown() {
        typeDropdown.click();
        return getLastDropdownList();
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

    public WebElement getSaveAsTrend() {
        saveAs.click();
        return getElementWithText("趋势图");
    }

    public WebElement getSaveAsSchedule() {
        saveAs.click();
        return getElementWithText("定时任务");
    }

    public WebElement getProvinceJiangsu() {
        return provinceJiangsu;
    }

    public WebElement getWordSize() {
        return wordSize;
    }

    public WebElement getSettingContent() {
        return settingContent;
    }

    public WebElement getYaxisTwo() {
        return yaxisTwo;
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

    public WebElement getCountryChina() {
        return countryChina;
    }

    public WebElement getChart() {
        return statisticalChart;
    }

    public WebElement getStatisticalChart() {
        return statisticalChart;
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

    public WebElement getRowNum() {
        return rowNum;
    }

    public WebElement getColumnNum(){
        return columnNum;
    }

    public WebElement getShenZhen() {
        return shenZhen;
    }

    public WebElement getStatus405() {
        return status405;
    }

    public WebElement getHideElement() {
        hideElement.click();
        return hideElement;
    }

    public WebElement getLightGreen() {
        return lightGreen;
    }

    public WebElement getDeleteFirst() {
        return deleteFirst;
    }

    public WebElement getDeleteLast() {
        return deleteLast;
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

    public WebElement getMapSettings() {
        return mapSettings;
    }

    public WebElement getDeleteMin() {
        return deleteMin;
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

    public WebElement getNeimeng() {
        return neimeng;
    }

    public WebElement getSelectChina() {
        return selectChina;
    }

    public WebElement getWorld() {
        return world;
    }

    public WebElement getChina() {
        return china;
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
        return getYottaTab("序列");
    }

    public WebElement getDimension() {
        return getYottaTab("维度");
    }

    public WebElement getConnection() {
        return getYottaTab("关系");
    }

    public WebElement getCompound() {
        return getYottaTab("复合");
    }

    public WebElement getMap() {
        return getYottaTab("地图");
    }

    public WebElement getOther() {
        return getYottaTab("其他");
    }

    public WebElement getXaxis() {
        return getYottaTab("X轴");
    }

    public WebElement getYaxis() {
        return getYottaTab("Y轴");
    }

    public WebElement getGroup() {
        return getYottaTab("分组");
    }

    public WebElement getFacet() {
        return getYottaTab("分面");
    }

    public WebElement getExample() {
        return getYottaTab("图例");
    }

    public WebElement getExhibition() {
        return getYottaTab("展示");
    }

    public WebElement getBubble() {
        return getYottaTab("气泡");
    }

    public WebElement getValue() {
        return getYottaTab("数值");
    }

    public WebElement getDivide() {
        return getYottaTab("切分");
    }

    public WebElement getSource() {
        return getYottaTab("来源");
    }

    public WebElement getTarget() {
        return getYottaTab("目标");
    }

    public WebElement getWeight() {
        return getYottaTab("权重");
    }

    public WebElement getRegion() {
        return getYottaTab("区域");
    }

    public WebElement getGoingDown() {
        return getYottaTab("下钻");
    }

    public WebElement getGeneral() {
        return getYottaTab("常规");
    }

    public WebElement getTile() {
        return getYottaTab("平铺");
    }

    public WebElement getIcon() {
        return getYottaTab("图标");
    }

    public WebElement getSecondTitle() {
        return getYottaTab("二级标题");
    }

    public WebElement getCompare() {
        return getYottaTab("对比");
    }

    public WebElement getMark() {
        return getYottaTab("标记");
    }

    public WebElement getIndicator() {
        return getYottaTab("指示器");
    }

    public WebElement getTime() {
        return getYottaTab("时间");
    }

    public WebElement getInfo() {
        return getYottaTab("信息");
    }

    public WebElement getIndicators() {
        return getYottaTab("指标");
    }

    public WebElement getTimeSequence() {
        return getYottaTab("时序");
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

    public WebElement getSegmentsNumber() {
        return getInputSetting("展示前N项");
    }

    public WebElement getRatioInnerToOuter(){
        return getInputSetting("内环占外环比");
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

    public WebElement getSparkline() {
        return getSwitchElement("使用sparkline");
    }

//--Dropdown elements

    public WebElement getFieldValue() {
        return getDropdownElement("字段值");
    }

    public WebElement getTypeChartField() {
        return getDropdownElement("类型");
    }

    public WebElement getNumericField() {
        return getDropdownElement("数值字段");
    }

    public WebElement getFieldLongitude() {
        return getDropdownElement("经度");
    }

    public WebElement getFieldLatitude() {
        return getDropdownElement("纬度");
    }

    public WebElement getContrastTime() {
        return getDropdownElement("对比时间");
    }

    public WebElement getFunction() {
        return getDropdownElement("函数");
    }

    public WebElement getStartTime() {
        return getDropdownElement("开始时间");
    }

    public WebElement getInfoField() {
        return getDropdownElement("属性信息");
    }

    public WebElement getInfoColumn() {
        return getDropdownElement("列信息");
    }

    public WebElement getShowLabel() {
        return getDropdownElement("标签展示");
    }

    public WebElement getLabelLocation() {
        return getDropdownElement("标签位置");
    }

    public WebElement getChartOrientation() {
        return getDropdownElement("图表方向");
    }

    public WebElement getLabelOrientation() {
        try{
            Thread.sleep(700);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        ClickEvent.clickUnderneathButton(labelOrientation);
        return this.getLastDropdownList();
    }

    public WebElement getValueLabelOrientation() {
        return getDropdownElement("数值标签方向");
    }

    public WebElement getPrecision() {
        return getDropdownElement("数据精度");
    }

    public WebElement getDisplayField() {
        return getDropdownElement("展示字段");
    }

    public WebElement getParentId() {
        return getDropdownElement("父id");
    }

    public WebElement getChildId() {
        return getDropdownElement("子id");
    }

    public WebElement getKeepTime() {
        return getDropdownElement("持续时间");
    }

    public WebElement getDataCircleLayer() {
        return getDropdownElement("数据圆圈图层");
    }

    public WebElement getHeatmapLayer() {
        return getDropdownElement("热力图图层");
    }

    public WebElement getPredict() {
        return getDropdownElement("预测值");
    }

    public WebElement getActual() {
        return getDropdownElement("实际值");
    }

    public WebElement getOutlier() {
        return getDropdownElement("异常值");
    }

    public WebElement getTopLimit() {
        return getDropdownElement("上限");
    }

    public WebElement getLowerLimit() {
        return getDropdownElement("下限");
    }

    public WebElement getBubbleSize() {
        return getDropdownElement("气泡大小");
    }

    public WebElement getCity() {
        return getDropdownElement("市级下钻");
    }

    public WebElement getProvince() {
        return getDropdownElement("省级下钻");
    }

    public WebElement getSparklineField() {
        return getDropdownElement("sparkline-x轴字段");
    }

    public WebElement getTracingType() {
        return getDropdownElement("展示类型");
    }

    public WebElement getDisplayedOnChart() {
        return getDropdownElement("图中展示");
    }

//--Element with a text

    public WebElement getType() {
        return getElementWithText("类型");
    }

    public WebElement getSettings() {
        return getElementWithText("设置");
    }

    public WebElement getOpenChina() {
        return getElementWithText("中国");
    }

    public WebElement getOpenJiangsu() {
        return getElementWithText("江苏");
    }

    public WebElement getUnitPositionBefore() {
        return getElementWithText("前面");
    }

    public WebElement getUnitPositionAfter() {
        return getElementWithText("后面");
    }

    public WebElement getTestDataset() {
        return getDatasetWithName("test");
    }

    public WebElement getDataset_1() {
        return getDatasetWithName("dataset_1");
    }

    public WebElement getDataset_2() {
        return getDatasetWithName("dataset_2");
    }

    public WebElement getDatasetChart() {
        return getDatasetWithName("数据集-1");
    }

    public WebElement getAllResources() {
        return getDatasetWithName("all_");
    }

    public WebElement getSuccessCreate() {
        return getElementWithText("新建成功");
    }

    public WebElement getSuccessUpdate() {
        return getElementWithText("更新成功");
    }

    public WebElement getSavedSearch() {
        return getElementWithText("已存搜索");
    }

    public WebElement getAscendingOrder() {
        return getElementWithText("升序");
    }

    public WebElement getDescendingOrder() {
        return getElementWithText("降序");
    }

    public WebElement getBottomPosition() {
        return getElementWithText("底部");
    }

    public WebElement getBackground() {
        return getElementWithText("背景");
    }

    public WebElement getFont() {
        return getElementWithText("字体");
    }

    public WebElement getAccordingField() {
        return getElementWithText("按字段");
    }

    public WebElement getAccordingName() {
        return getElementWithText("按名称");
    }

    public WebElement getAccordingTrend() {
        return getElementWithText("按趋势");
    }

    public WebElement getAccordingArea() {
        return getElementWithText("按区间");
    }

    public WebElement getAbsolute() {
        return getElementWithText("绝对值");
    }

    public WebElement getPercent() {
        return getElementWithText("百分比");
    }

    public WebElement getDrillIn() {
        return getElementWithText("图内钻取");
    }

    public WebElement getDrillOut() {
        return getElementWithText("图外钻取");
    }

    public WebElement getFirstPosition() {
        rightPosition.click();
        return getElementWithText("a...");
    }

    public WebElement getSecondPosition() {
        rightPosition.click();
        return getElementWithText("...z");
    }

    public WebElement getThirdPosition() {
        rightPosition.click();
        return getElementWithText("a..z");
    }


//--Buttons

    public WebElement getReport() {
        return getYottaButtonByText("另存为报表");
    }

    public WebElement getAccelerate() {
        return getYottaButtonByText("趋势图加速");
    }

    public WebElement getAddRange() {
        return getButton("添加颜色区间");
    }

    public WebElement getGenerate() throws InterruptedException {
        Thread.sleep(1000);
        return getButton("生成");
    }

    public WebElement getNextButton() {
        return getButton("下一步");
    }

    public WebElement getBackButton() {
        return getButton("上一步");
    }

    public WebElement getComplete() {
        return super.getButton("完成");
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

    public WebElement getZhanKai() {
        return getButton("展开");
    }

    public WebElement getAddInterval() {
        return getButton("添加范围颜色");
    }

    public WebElement getDefaultColor() {
        return getYottaRadio("table_chart-default_values_color-radio");
    }

    public WebElement getAutoColor() {
        return getYottaRadio("table_chart-auto_values_color-radio");
    }

    public WebElement getCustomColor() {
        return getYottaRadio("table_chart-define_values_color-radio");
    }

    public WebElement getAddValue() {
        return getButton("添加值颜色");
    }

    public WebElement getAddIndicator() {
        getButton("添加指标").click();
        return getYottaTab("指标 1");
    }

    public WebElement getAddConfigFields() {
        return getButton("添加字段配置");
    }

//----

    public WebElement getEnsureButton() {
        return getContainsTextButton("确定");
    }

    public WebElement getCancelButton() {
        return getContainsTextButton("取消");
    }

    public WebElement getNameInput() {
        return getInputElement("name");
    }

    public WebElement getDescribeInput() {
        return getInputElement("description");
    }

    public WebElement getGroupDropdown() {
        return dropdownUtils.getDropdownListByLabel("分组");
    }

    public WebElement getToday() {
        return (new DateEditorPage(webDriver)).getToday();
    }

    public WebElement getYesterday() {
        return (new DateEditorPage(webDriver)).getYesterday();
    }

    public WebElement getThisWeek() {
        return (new DateEditorPage(webDriver)).getThisWeek();
    }

    public WebElement getThisMonth() {
        return (new DateEditorPage(webDriver)).getThisMonth();
    }

    public WebElement getLastWeek() {
        return (new DateEditorPage(webDriver)).getLastWeek();
    }

    public WebElement getLastMonth() {
        return (new DateEditorPage(webDriver)).getLastMonth();
    }

    public WebElement getOneDay() {
        return (new DateEditorPage(webDriver)).getOneDay();
    }

    public WebElement getTwoDays() {
        return (new DateEditorPage(webDriver)).getTwoDays();
    }

    public WebElement getSevenDays() {
        return (new DateEditorPage(webDriver)).getSevenDays();
    }

    public WebElement getWholeTime() {
        return (new DateEditorPage(webDriver)).getWholeTime();
    }

    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getErrorMessage() {
        return errorMessage;
    }

    public WebElement getMessage() {
        return message;
    }

    public WebElement getSearchInput() {
        return searchInput;
    }

    public WebElement getSetting() {
        return setting;
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

    public WebElement getRight() {
        return right;
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

    public WebElement getTable() {
        return table;
    }

    public WebElement getIconName() {
        return iconName;
    }

    public WebElement getAppDropdown() {
        appDropdownIcon.click();
        return dropdownUtils.getLastDropdownList();
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

    public WebElement getColorType() throws InterruptedException {
        Thread.sleep(1000);
        return dropdownUtils.getYottaDropdownList("table_chart-table_color-select"); //表格颜色
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

    public WebElement getDataSetPosition() {
        return dataSetPosition;
    }

    public WebElement getSearchConfig() {
        return searchConfig;
    }

    public WebElement getCloseWindow() {
        return closeWindow;
    }

// Table - pencil;-----------------

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

    public WebElement getFontStyle() throws InterruptedException {
        Thread.sleep(1000);
        return dropdownUtils.getYottaDropdownList("table_chart-font_style-select"); //字体样式
    }

    public WebElement getColumnWidth() {
        return getYottaInput("table_chart-col_width-input"); //列宽度
    }

    public WebElement getAlignment() throws InterruptedException {
        Thread.sleep(1000);
        return dropdownUtils.getYottaDropdownList("table_chart-alignment-select"); //对齐方式
    }

    public WebElement getSelectedAlignment() {
        return  selectedAlignment;
    }

    public WebElement getThousandSeparatorCheckbox() {
        return thousandSeparatorCheckbox;
    }

    public WebElement getPrecisionTable() {
        return dropdownUtils.getYottaDropdownList("table_chart-precision-select");
    }

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

    public WebElement getSelectedApp() {
        return selectedApp;
    }


    public WebElement getDeleteTag() {
        return deleteTag;
    }

    public WebElement getClickPOST() {
        return clickPOST;
    }

    public WebElement getClickBeijing() {
        return clickBeijing;
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//input[@name='" + name + "']"));
    }

    private WebElement getInputSetting(String name) {
        try{
            Thread.sleep(700);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return webDriver.findElement(By.xpath("(//span[text()='" + name + "']/ancestor::div[1]/following-sibling::div//input)[last()]"));
    }

    private WebElement getSwitchElement(String name) {
        return webDriver.findElement(By.xpath("//span[text()='" + name + "']/ancestor::div/following-sibling::div//label"));
    }

    private WebElement getDatasetWithName(String name) {
        return webDriver.findElement(By.xpath("//div[@yotta-test='trend-dataset_node-dom']//span[text()='" + name + "']"));
    }

    private WebElement getDropdownElement(String name) {
        try{
            Thread.sleep(700);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        WebElement element = webDriver.findElement(By.xpath("(//span[contains(text(),'" + name + "')])[last()]/ancestor::div[1]/following-sibling::div//div[contains(@class,'yotta-select-selection')]"));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return this.getLastDropdownList();
    }

    private WebElement getElementWithText(String name) {
        return webDriver.findElement(By.xpath("(//*[contains(text(),'" + name + "')])[last()]"));
    }

    private WebElement getChartButton(String chartName) {
        String xpath = "//p[text()='" + chartName + "']/ancestor::div/preceding-sibling::div[contains(@class,'yotta-chart-selector-avatar')]";
        return webDriver.findElement(By.xpath(xpath));
    }

    @FindBy(xpath = "//*[@yotta-test='trend-trend_app-select']/div")
    private WebElement beforeDeleteApp;

    public WebElement getBeforeDeleteApp() {
        return beforeDeleteApp;
    }

    @FindBy(xpath = "//span[@aria-label='CloseCircleFilled']")
    private WebElement deleteApp;

    public WebElement getDeleteApp() {
        return deleteApp;
    }
}
