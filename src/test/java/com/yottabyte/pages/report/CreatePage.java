package com.yottabyte.pages.report;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.GetTime;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.*;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

import java.util.List;


public class CreatePage extends PageTemplate {

    public CreatePage(WebDriver driver) {
        super(driver);
        driver.manage().window().setSize(new Dimension(1200,900));
    }

    @FindBy(className = "_1JjlGgMGUnJmBrqR_9PZl8")
    private WebElement successMessage;

    @FindBy(className = "_1JjlGgMGUnJmBrqR_9PZl8")
    private WebElement message;

    @FindBy(xpath = "//span[@aria-label='CloseCircleFilled']/ancestor::div[1]/following-sibling::div[@class='yotta-dialog-content']//p")
    private WebElement errorMessage;

    @FindBy(xpath = "//label[text()='运行用户']/following-sibling::div//input")
    private WebElement runningUser;

    @FindBy(xpath = "//label[text()='报表分组']/following-sibling::div//input[@class='el-input__inner']")
    private WebElement reportGroup;

    @FindBy(xpath = "//li[@yotta-test='report-item_1-menu']")
    private WebElement li;

    @FindBy(className = "ant-collapse-header")
    private WebElement topoTitle;

    @FindBy(xpath = "//div[@yotta-test='report-email-select']//div[@class='yotta-select-selection']")
    private WebElement emailInput;

    @FindBy(xpath = "//div[@yotta-test='report-email-select']//input")
    private WebElement emailField;

    public WebElement getEmailField(){
        emailInput.click();
        return emailField;
    }

    @FindBy(xpath = "(//div[@class='el-scrollbar'])[last()]")
    private WebElement scrollbar;

    @FindBy(xpath = "//input[@yotta-test='report-email_subject-input']/following-sibling::div")
    private WebElement subjectNote;

    @FindBy(xpath = "//div[@yotta-test='report-trend_selector-dropdown']//span[text()]")
    private WebElement chartList;  //添加趋势图

    @FindBy(className = "yotta-dropdown-menu")
    private WebElement chartDropdownList;

    @FindBy(xpath = "//span[text()='最近十次执行时间']/ancestor::div[1]/following-sibling::div")
    private WebElement parseResult;

    @FindBy(xpath = "//div[@yotta-test='report-year_day-select' or @yotta-test='report-month-select' or @yotta-test='report-week-select']//div[@class='yotta-select-selection']")
    private WebElement day;

    @FindBy(xpath = "//span[text()='crontab']")
    private WebElement crontabButton;

    @FindBy(xpath = "(//i[@class='el-collapse-item__header__arrow el-icon-arrow-right'])[last()]")
    private WebElement arrow;

    @FindBy(xpath = "(//button[@class='el-button btn-submit el-button--primary'])[last()]")
    private WebElement saveTrend;

    @FindBy(xpath = "(//div[@class='popover-setting-content'])[last()]")
    private WebElement settingContent;

    @FindBy(xpath = "//label[text()='参数设置']")
    private WebElement parameterSetting;

    @FindBy(xpath = "((//span[text()='编辑']/ancestor::button[contains(@yotta-test,'report-edit_')])[last()]) | (//label[@name='operate_edit']/*)")
    private WebElement editButton;

    @FindBy(className = "ant-collapse-header")
    private WebElement trendTitle;

    @FindBy(xpath = "(//label[contains(text(),'图表类型')]/following-sibling::span//i)[last()]")
    private WebElement chartType;

    @FindBy(xpath = "//span[text()='布局设计']/ancestor::div/following-sibling::div//span[text()='1']")
    private WebElement badge1;

    @FindBy(xpath = "//span[text()='布局设计']/ancestor::div/following-sibling::div//span[text()='2']")
    private WebElement badge2;

    @FindBy(xpath = "//span[text()='布局设计']/ancestor::div/following-sibling::div//span[text()='3']")
    private WebElement badge3;

    @FindBy(xpath = "//span[text()='布局设计']/ancestor::div/following-sibling::div//span[text()='4']")
    private WebElement badge4;

    @FindBy(xpath = "//label[contains(text(),'资源标签')]/ancestor::div/following-sibling::div//span[@class='yotta-tag-content']")
    private WebElement chosenTag;

    @FindBy(xpath = "//label[contains(text(),'运行用户')]/ancestor::div[1]/following-sibling::div//span[@class='yotta-select-selection-value']")
    private WebElement selectedUser;

    @FindBy(xpath = "//div[contains(@yotta-test,'report-container-collapse')]//div[contains(@class,'yotta-accordion')][last()]//span[contains(@class,'text')]")
    private WebElement chosenTrendLast;

    @FindBy(xpath = "//div[contains(@yotta-test,'report-container-collapse')]//div[contains(@class,'yotta-accordion')][1]//span[contains(@class,'text')]")
    private WebElement chosenTrendFirst;

    @FindBy(xpath = "(//div[contains(@yotta-test,'report-container-collapse')]//span[@aria-label='CloseCircleFilled'])[last()]")
    private WebElement lastTrendDelete;

    @FindBy(xpath = "(//div[contains(@yotta-test,'report-container-collapse')]//span[@aria-label='CloseCircleFilled'])[1]")
    private WebElement firstTrendDelete;

    @FindBy(xpath = "(//div[contains(@yotta-test,'report-container-collapse')]//span[@aria-label='ToTopOutlined'])[last()]")
    private WebElement lastTrendUpTop;

    @FindBy(xpath = "(//div[contains(@yotta-test,'report-container-collapse')]//span[@aria-label='ToBottomOutlined'])[1]")
    private WebElement firstTrendDownBottom;

    @FindBy(xpath = "(//div[contains(@yotta-test,'report-container-collapse')]//span[@aria-label='MoveUpFilled'])[last()]")
    private WebElement lastTrendUp;

    @FindBy(xpath = "(//div[contains(@yotta-test,'report-container-collapse')]//span[@aria-label='MoveDownFilled'])[1]")
    private WebElement firstTrendDown;

    @FindBy(xpath = "//span[contains(text(),'描述')]/following-sibling::p")
    private WebElement trendDescription;

    @FindBy(xpath = "//span[contains(text(),'搜索内容')]/following-sibling::p")
    private WebElement trendSpl;

    @FindBy(xpath = "//span[contains(text(),'数据集')]/following-sibling::p")
    private WebElement trendData;

    @FindBy(xpath = "//span[contains(text(),'统计类型')]/following-sibling::p")
    private WebElement trendChart;

    @FindBy(xpath = "//input[@yotta-test='report-name-input' and @name='trendName']")
    private WebElement trendNameField;

    @FindBy(xpath = "//input[@yotta-test='report-description-input']")
    private WebElement trendDescribeField;

    @FindBy(xpath = "(//div[contains(@style,'background-color: rgb(161, 20, 249);')])[last()]")
    private WebElement purple;

    @FindBy(xpath = "(//div[contains(@style,'background-color: rgb(248, 0, 80);')])[last()]")
    private WebElement red;

    @FindBy(xpath = "(//div[contains(@style,'background-color: rgb(251, 173, 8);')])[last()]")
    private WebElement orange;

    @FindBy(xpath = "(//div[contains(@style,'background-color: rgb(50, 194, 125);')])[last()]")
    private WebElement green;

    @FindBy(xpath = "(//div[contains(@style,'background-color: rgb(179, 198, 92);')])[last()]")
    private WebElement lightGreen;

    @FindBy(xpath = "(//div[contains(@style,'background-color: rgb(251, 227, 16);')])[last()]")
    private WebElement yellow;

    @FindBy(xpath = "(//div[contains(@style,'background-color: rgb(72, 87, 175);')])[last()]")
    private WebElement darkBlue;

    @FindBy(className = "chart-gui-field-color-box")
    private WebElement addColor;

    // Labels
    @FindBy (xpath = "//span[text()='标签']/ancestor::div/following-sibling::div//label[1]")
    private WebElement firstLabel;

    @FindBy (xpath = "//span[text()='标签']/ancestor::div/following-sibling::div//label[2]")
    private WebElement secondLabel;

    @FindBy (xpath = "//span[text()='标签']/ancestor::div/following-sibling::div//label[3]")
    private WebElement thirdLabel;

    @FindBy (xpath = "//span[text()='标签']/ancestor::div/following-sibling::div//label[4]")
    private WebElement forthLabel;

    @FindBy(xpath = "(//p[text()='+ 添加'])[last()] | (//*[name()='svg' and @data-icon='AddCircleOutlined']/ancestor::span[1])")
    private WebElement addField;

    @FindBy(xpath = "(//*[text()='中国'])/ancestor::span")
    private WebElement selectChina;

    @FindBy(xpath = "(//*[text()='江苏'])/ancestor::span")
    private WebElement selectJiangsu;

    @FindBy(xpath = "(//*[text()='世界'])/ancestor::span")
    private WebElement selectWorld;

    @FindBy(xpath = "//label[text()='报表类型']/following-sibling::div//div[@class='ant-select-selection-selected-value']")
    private WebElement defaultReportType;

    @FindBy(xpath = "(//div[@class = 'yotta-slider-knob'])[last()]")
    private WebElement sliderHandle;

    @FindBy(xpath = "//a[@aria-label='选择趋势图']/span")
    private WebElement chartListWord;

    @FindBy(xpath = "//input[@placeholder='选择趋势图']")
    private WebElement chartListInput;

    @FindBy(xpath = "//span[text()='定时']//ancestor::div[1]/following-sibling::span[@aria-label='QuestionCircleOutlined']")
    private WebElement executionTip;

    @FindBy(xpath = "//div[@class='yotta-tooltip-content']")
    private WebElement executionTipElement;

    @FindBy(xpath = "//div[@class='_1rpZECB9i9v8h6IEUve_yK']")
    private WebElement resultMessage;

    @FindBy(xpath = "((//div[contains(@class,'help-text')])[1]) | (//div[@class='_1JeVvK6jBB88_F6voAZyhi'])")
    private WebElement tipText;

    public WebElement getTipText() {
        return tipText;
    }

    public WebElement getResultMessage() {
        return resultMessage;
    }

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
        return getYottaTextarea("report-query-textarea");
    }

    public WebElement getTrendChartType() {
        return getYottaButton("report-chart-button");
    }

    public WebElement getApp() {
        return getYottaDropdownList("report-app-select"); //所属应用
    }

    public WebElement getTag() {
        return getYottaDropdownList("resource_tag-change_resource_tag-select"); //资源标签
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
        return parameterSetting; //参数设置
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

    public WebElement getName() {
        return getYottaInput("report-name-input");
    }

    public WebElement getDescribe() {
        return getYottaInput("report-description-input");
    }

    public WebElement getReportType() {
        return getYottaDropdownList("report-type-select");  //报表类型
    }

    public WebElement getEmailInput() {
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
        return getYottaInput("report-email_subject-input"); //邮件主题
    }

    public WebElement getSubjectNote() {
        return subjectNote;
    }

    public WebElement getPeriod() {
        return getYottaDropdownList("report-unit-select");
    }

    public WebElement getDay() {
        day.click();
        return this.getLastDropdownList();
    }

    public WebElement getMonth() {
        return getYottaDropdownList("report-year_month-select");
    }

    public WebElement getHour() {
        return getYottaInput("report-hour-input");
    }

    public WebElement getMinute() {
        return getYottaInput("report-minute-input");
    }

    public WebElement getNextButton() {
        return getYottaButtonByText("下一步");
    }

    public WebElement getBackButton() {
        return getYottaButtonByText("上一步");
    }

    public WebElement getFinishButton() {
        return getYottaButtonByText("完成");
    }

    public WebElement getEnsureButton() {
        return getYottaButtonByText("确定");
    }

    public WebElement getReturnButton() {
        return getYottaButtonByText("返回");
    }

    public WebElement getCancelButton() {
        return getYottaButtonByText("取消");
    }

    public WebElement getAddConfigFields() {
        return getButton("添加字段配置");
    }

    public WebElement getAddRange() {
        return getButton("添加颜色区间");
    }

    public WebElement getParse() {
        return getYottaButtonByText("点击解析");
    }

    public WebElement getSave() {
        return super.getButton("完成");
    }

    public WebElement getChartListButton() {
        return chartList;
    }

    public WebElement getChartList() {
        ClickEvent.clickUnderneathButton(chartList);
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(li));
        String className = "yotta-dropdown-menu";
        List<WebElement> list = webDriver.findElements(By.className(className));
        WebElement lastDropdownList = list.get(list.size() - 1);
        if (lastDropdownList.getAttribute("style").contains("display: none;")) {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='block';", lastDropdownList);
        }
        return lastDropdownList;
    }

    public WebElement getCrontab() {
        crontabButton.click();
        return getYottaInput("report-crontab-input");
    }

    public WebElement getParseResult() {
        return parseResult;
    }

    public WebElement getLayout1() {
        return getYottaDiv("report-layout1-dom");
    }

    public WebElement getLayout2() {
        return getYottaDiv("report-layout2-dom");
    }

    public WebElement getLayout3() {
        return getYottaDiv("report-layout3-dom");
    }

    public WebElement getLayout4() {
        return getYottaDiv("report-layout4-dom");
    }

    public WebElement getLayout5() {
        return getYottaDiv("report-layout5-dom");
    }

    public WebElement getLayout6() {
        return getYottaDiv("report-layout6-dom");
    }

    public WebElement getLayout7() {
        return getYottaDiv("report-layout7-dom");
    }

    public WebElement getLayout8() {
        return getYottaDiv("report-layout8-dom");
    }

    public WebElement getLineChart() {
        return getYottaDiv("chart_selector-change_type_line-dom");
    }

    public WebElement getAreaChart() {
        return getYottaDiv("chart_selector-change_type_area-dom");
    }

    public WebElement getColumnChart() {
        return getYottaDiv("chart_selector-change_type_column-dom");
    }

    public WebElement getScatterChart() {
        return getYottaDiv("chart_selector-change_type_scatter-dom");
    }

    public WebElement getPie() {
        return getYottaDiv("chart_selector-change_type_pie-dom");
    }

    public WebElement getRose() {
        return getYottaDiv("chart_selector-change_type_rose-dom");
    }

    public WebElement getBar() {
        return getYottaDiv("chart_selector-change_type_bar-dom");
    }

    public WebElement getSun() {
        return getYottaDiv("chart_selector-change_type_sunburst-dom");
    }

    public WebElement getChord() {
        return getYottaDiv("chart_selector-change_type_chord-dom");
    }

    public WebElement getSankey() {
        return getYottaDiv("chart_selector-change_type_sankey-dom");
    }

    public WebElement getForce() {
        return getYottaDiv("chart_selector-change_type_force-dom");
    }

    public WebElement getRangeline() {
        return getYottaDiv("chart_selector-change_type_rangeline-dom");
    }

    public WebElement getMultiaxis() {
        return getYottaDiv("chart_selector-change_type_multiaxis-dom");
    }

    public WebElement getHeatmap() {
        return getYottaDiv("chart_selector-change_type_heatmap-dom");
    }

    public WebElement getAttackmap() {
        return getYottaDiv("chart_selector-change_type_attackmap-dom");
    }

    public WebElement getRegionmap() {
        return getYottaDiv("chart_selector-change_type_regionmap-dom");
    }

    public WebElement getTable() {
        return getYottaDiv("chart_selector-change_type_table-dom");
    }

    public WebElement getSingle() {
        return getYottaDiv("chart_selector-change_type_single-dom");
    }

    public WebElement getLiquidfill() {
        return getYottaDiv("chart_selector-change_type_liquidfill-dom");
    }

    public WebElement getWordcloud() {
        return getYottaDiv("chart_selector-change_type_wordcloud-dom");
    }

    public WebElement getRadar() {
        return getYottaDiv("chart_selector-change_type_radar-dom");
    }

    public WebElement getFunnel() {
        return getYottaDiv("chart_selector-change_type_funnel-dom");
    }

    public WebElement getMatrixheatmap() {
        return getYottaDiv("chart_selector-change_type_matrixheatmap-dom");
    }

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

    public WebElement getFieldValue() {
        return getInputSetting("字段值");
    }

    public WebElement getNumericField() {
        return getInputSetting("数值字段");
    }

    public WebElement getFieldLongitude() {
        return getInputSetting("经度");
    }

    public WebElement getFieldLatitude() {
        return getInputSetting("纬度");
    }

    public WebElement getTopLimit() {
        return getInputSetting("上限");
    }

    public WebElement getLowerLimit() {
        return getInputSetting("下限");
    }

    public WebElement getProvince() {
        return getInputSetting("省级下钻");
    }

    public WebElement getCity() {
        return getInputElement("市级下钻");
    }

    public WebElement getPredict() {
        return getInputSetting("预测值");
    }

    public WebElement getActual() {
        return getInputSetting("实际值");
    }

    public WebElement getBubbleSize() {
        return getInputSetting("气泡大小");
    }

    public WebElement getTypeChartField() {
        return getDropdownElement("类型");
    }

    public WebElement getContrastTime() {
        return getDropdownElement("对比时间");
    }

    public WebElement getShowLabel() {
        return getDropdownElement("标签展示");
    }

    public WebElement getLabelLocation() {
        return getDropdownElement("标签位置");
    }

    public WebElement getPrecision() {
        return getDropdownElement("数据精度");
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

    public WebElement getFirstPosition() {
        getElementWithText("柱状外右侧").click();
        return getElementWithText("a...");
    }

    public WebElement getSecondPosition() {
        getElementWithText("柱状外右侧").click();
        return getElementWithText("...z");
    }

    public WebElement getThirdPosition() {
        getElementWithText("柱状外右侧").click();
        return getElementWithText("a..z");
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

    public WebElement getSelectJiangsu() {
        return selectJiangsu;
    }

    public WebElement getSelectWorld() {
        return selectWorld;
    }

    public WebElement getAddColor() {
        return addColor;
    }

    public WebElement getLightGreen() {
        return lightGreen;
    }

    public WebElement getYellow() {
        return yellow;
    }

    public WebElement getDarkBlue(){
        return darkBlue;
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

    public WebElement getSelectChina() {
        return selectChina;
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

    private WebElement getInput(String name) {
        String xpath = "//label[contains(text(),'" + name + "')]/following-sibling::input";
        return webDriver.findElement(By.xpath(xpath));
    }

    public WebElement getInputElement(String name) {
        return webDriver.findElement(By.xpath("//label[text()='" + name + "']/following-sibling::input"));
    }

    private WebElement getSwitchElement(String name) {
        return webDriver.findElement(By.xpath("//span[text()='" + name + "']/ancestor::div/following-sibling::div//label"));
    }

    private WebElement getInputSetting(String name) {
        return webDriver.findElement(By.xpath("(//span[contains(text(),'" + name + "')]/ancestor::div[1]/following-sibling::div//input[@yotta-test='chartgui-text-input'])[last()] "));
    }

    private WebElement getDropdownElement(String name) {
        WebElement element = webDriver.findElement(By.xpath("(//span[contains(text(),'" + name + "')])[last()]/ancestor::div[1]/following-sibling::div//div[@class='yotta-select-selection']"));
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.elementToBeClickable(element));
        ClickEvent.clickUnderneathButton(element);
        return this.getLastDropdownList();
    }

    private WebElement getElementWithText(String name) {
        return webDriver.findElement(By.xpath("(//*[contains(text(),'" + name + "')])[last()]"));
    }

}
