package com.yottabyte.pages.trend;

import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class DragAndDropPage extends CreatePage {
    public DragAndDropPage(WebDriver driver) {
        super(driver);
        driver.manage().window().setSize(new Dimension(1500,900));
    }

    @FindBy(xpath = "//span[text()='查看SPL']")
    private WebElement checkSPL;

    @FindBy(xpath = "(//div[text()='查看SPL']/ancestor::div/following-sibling::div/div)[1]")
    private WebElement SPL;

    @FindBy(className = "ant-popover")
    private WebElement panel;

    @FindBy(className = "ant-modal-close")
    private WebElement closeSPL;

    @FindBy(xpath = "//div[@id='dimensions']/span/span/span")
    private WebElement elementInDimensions;

    @FindBy(xpath = "//div[@id='values']/span/span/span")
    private WebElement elementInValues;

    @FindBy(xpath = "//i[@title='同环比']")
    private WebElement compareButton;

    @FindBy(xpath = "//label[text()='同环比']/following-sibling::span/span")
    private WebElement compareField;

    @FindBy(xpath = "//span[text()='分桶粒度']/ancestor::div/following-sibling::input")
    private WebElement span;

    @FindBy(xpath = "//span[text()='最小分桶粒度']/ancestor::div/following-sibling::input")
    private WebElement minSpan;

    @FindBy(xpath = "//span[text()='分桶个数']/ancestor::div/following-sibling::input")
    private WebElement bins;


    //Charts --------------------------------------------------------------------------
    public WebElement getLine() {
        return getElementByTitle("曲线图");
    }

    public WebElement getArea() {
        return getElementByTitle("面积图");
    }

    public WebElement getScatter() {
        return getElementByTitle("散点图");
    }

    public WebElement getColumn() {
        return getElementByTitle("柱状图");
    }

    public WebElement Pie() {
        return getElementByTitle("饼状图");
    }

    public WebElement Rose() {
        return getElementByTitle("玫瑰图");
    }

    public WebElement Bar() {
        return getElementByTitle("条形图");
    }

    public WebElement Chord() {
        return getElementByTitle("和弦图");
    }

    public WebElement Sankey() {
        return getElementByTitle("桑基图");
    }

    public WebElement Force() {
        return getElementByTitle("力图");
    }

    public WebElement Multiaxis() {
        return getElementByTitle("多y轴图");
    }

    public WebElement Heatmap() {
        return getElementByTitle("热力地图");
    }

    public WebElement Single() {
        return getElementByTitle("单值");
    }

    public WebElement Wordcloud() {
        return getElementByTitle("字符云图");
    }

    public WebElement Radar() {
        return getElementByTitle("雷达图");
    }

    public WebElement Funnel() {
        return getElementByTitle("漏斗图");
    }

    public WebElement Table() {
        return getElementByTitle("统计表");
    }

    //Objects to drag and drop -------------------------------------------------------------------
    public WebElement getDimensions() {
        return getElementById("dimensions");
    }

    public WebElement getValues() {
        return getElementById("values");
    }

    public WebElement getCompareBy() {
        return getElementById("byFields");
    }

    public WebElement getBubbles() {
        return getElementById("bubbleField");
    }

    public WebElement getTimestamp() {
        return getElementById("timestamp");
    }

    public WebElement getClientip() {
        return getElementById("apache.clientip");
    }

    public WebElement getGeoCity() {
        return getElementById("apache.geo.city");
    }

    public WebElement getGeoProvince() {
        return getElementById("apache.geo.province");
    }

    public WebElement getResplen() {
        return getElementById("apache.resp_len");
    }

    public WebElement getStatus() {
        return getElementById("apache.status");
    }

    public WebElement getMethod() {
        return getElementById("apache.method");
    }

    //-------------------------------------------------------------------------------------
    public WebElement getElementInDimensions() {
        return elementInDimensions;
    }

    public WebElement getElementInValues() {
        return elementInValues;
    }

    public WebElement getCompareButton() {
        return compareButton;
    }

    public WebElement getCompareField() {
        compareField.click();
        return super.getLastDropdownList();
    }



    //--------------------------------------------------------------------------------------

    public WebElement getCheckSPL() {
        return checkSPL;
    }

    public WebElement getSPL() {
        return SPL;
    }

    public WebElement getCloseSPL() {
        return closeSPL;
    }

    public WebElement getPanel() {
        return panel;
    }

    public WebElement getSpan() {
        return span;
    }

    public WebElement getMinSpan() {
        return minSpan;
    }

    public WebElement getBins() {
        return bins;
    }

    //--------------------------------------------------------------------------------

    private WebElement getElementById(String name){
        return webDriver.findElement(By.id(name));
    }

    private WebElement getElementByTitle(String name) {
        return webDriver.findElement(By.xpath("//div[@title='" + name+ "']"));
    }

}
