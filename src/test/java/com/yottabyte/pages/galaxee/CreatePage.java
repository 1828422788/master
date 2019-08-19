package com.yottabyte.pages.galaxee;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.GetTime;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

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

    @FindBy(className = "download")
    private WebElement download;

    @FindBy(className = "delete")
    private WebElement delete;

    @FindBy(xpath = "(//span[contains(text(),'确定')][not(@class)])[last()]")
    private WebElement ensureDelete;

    @FindBy(className = "el-upload--text")
    private WebElement upload;

    @FindBy(className = "textarea-icon-padding")
    private WebElement splInput;

    @FindBy(xpath = "//div[text()='样式']")
    private WebElement style;

    @FindBy(xpath = "//div[text()='图表尺寸位置']")
    private WebElement position;

    @FindBy(xpath = "//div[@class='panel-size-input el-input']/input")
    private List<WebElement> inputList;

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
        return super.getLastDropdownList();
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
        return super.getLastDropdownList();
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
        return inputList.get(0);
    }

    public WebElement getHeight() {
        return inputList.get(1);
    }

    public WebElement getChartXaxis() {
        return inputList.get(2);
    }

    public WebElement getChartYaxis() {
        return inputList.get(3);
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
        return super.getContainsTextButton("搜索中");
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
        String xpath = "//div[text()='" + title + "']/following-sibling::div//label[contains(text(),'" + name + "')]/following-sibling::div//input";
        return webDriver.findElement(By.xpath(xpath));
    }

    private WebElement dropdownList(String title, String name) {
        String xpath;
        if ("".equals(title)) {
            xpath = "//div/following-sibling::div//label[contains(text(),'" + name + "')]//following-sibling::div//i";
        } else {
            xpath = "//div[text()='" + title + "']/following-sibling::div//label[contains(text(),'" + name + "')]//following-sibling::div//i";
        }
        WebElement element = webDriver.findElement(By.xpath(xpath));
        element.click();
        return super.getLastDropdownList();
    }

    private WebElement switchButton(String title) {
        String xpath = "//div[text()='" + title + "']/following-sibling::div//label[@class='el-switch setting-switch']";
        return webDriver.findElement(By.xpath(xpath));
    }

    private WebElement header(String name) {
        String xpath = "//div[contains(text(),'" + name + "')]";
        return webDriver.findElement(By.xpath(xpath));
    }
}
