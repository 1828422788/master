package com.yottabyte.pages.report;

import com.yottabyte.pages.EditorPage;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;


public class CreatePageWORD extends EditorPage {

    public CreatePageWORD(WebDriver driver) {
        super(driver);
        driver.manage().window().setSize(new Dimension(1600,900));
    }

    @FindBy(xpath = "//span[text()='完成']/ancestor::button")
    private WebElement finishButton;

    @FindBy(xpath = "//span[text()='确定']/ancestor::button")
    private WebElement EnsureButton;

    @FindBy(xpath = "//label[@name='operate_edit']")
    private WebElement editButton;

    @FindBy(xpath = "//div[@class='jodit_wysiwyg']//p[@class= 'editor_block_trend']")
    private WebElement trendElement;

    @FindBy(xpath = "(//*[contains(@name,'trend_name')])[last()]")
    private WebElement lastAddedTrend;

    @FindBy(xpath = "//div[@class='jodit_wysiwyg']//span[@class= 'editor_inline_trend']")
    private WebElement singleTrendElement;

    @FindBy(xpath = "//*[contains(@name,'trend_name')]")
    private WebElement trend_Name;

    @FindBy(xpath = "//*[contains(@name,'trend_description')]")
    private WebElement trend_Description;

    @FindBy(xpath = "//*[contains(@name,'trend_chart')]")
    private WebElement trend_Chart;

    @FindBy(xpath = "//*[contains(@name,'trend_timerange')]")
    private WebElement trend_Timerange;

    @FindBy(xpath = "//*[contains(@name,'trend_name')]/label[@name='operate_delete']")
    private WebElement deleteTrendName;

    @FindBy(xpath = "//*[contains(@name,'trend_description')]/label[@name='operate_delete']")
    private WebElement deleteTrendDescription;

    @FindBy(xpath = "//*[contains(@name,'trend_chart')]/label[@name='operate_delete']")
    private WebElement deleteTrendChart;

    @FindBy(xpath = "//*[contains(@name,'trend_timerange')]/label[@name='operate_delete']")
    private WebElement deleteTrendTimerange;

    @FindBy(xpath = "//button[@yotta-test='report-chart-button' and @disabled]")
    private WebElement disabledType;

    @FindBy(xpath = "//div[@class='jodit_wysiwyg']")
    private WebElement textArea;

    @FindBy(xpath = "//div[@class='jodit_wysiwyg']/span")
    private WebElement textAreaStyle;

    @FindBy(xpath = "//div[@class='jodit_wysiwyg']/p")
    private WebElement textAlignment;

    @FindBy(xpath = "//div[@class='jodit_wysiwyg']//strong")
    private WebElement textAreaBold;

    @FindBy(xpath = "//span[text()='上传']/ancestor::span//input")
    private WebElement uploadImage;

    @FindBy(xpath = "(//div[@class='jodit_wysiwyg']//img)[last()]")
    private WebElement imageElement;

    @FindBy(xpath = "//div[@class='jodit_wysiwyg']//strong")
    private WebElement boldElement;

    @FindBy(xpath = "//div[@class='jodit_wysiwyg']//em")
    private WebElement italicsElement;

    @FindBy(xpath = "//div[@class='jodit_wysiwyg']//u")
    private WebElement underlineElement;

    @FindBy(xpath = "//p[@name='pageheader']")
    private WebElement headerText;

    @FindBy(xpath = "//p[@name='pageheader']/*")
    private WebElement headerTextStyle;

    @FindBy(xpath = "//p[@name='pagefooter']")
    private WebElement footerText;

    @FindBy(xpath = "//p[@name='pagefooter']/*")
    private WebElement footerTextStyle;

    @FindBy(xpath = "//ul[contains(@class,'yotta-menu')]/li[1]")
    private WebElement leftAlignment;

    @FindBy(xpath = "//ul[contains(@class,'yotta-menu')]/li[2]")
    private WebElement centerAlignment;

    @FindBy(xpath = "//ul[contains(@class,'yotta-menu')]/li[3]")
    private WebElement rightAlignment;

    @FindBy(xpath = "//ul[contains(@class,'yotta-menu')]/li[4]")
    private WebElement justifyAlignment;

    @FindBy(xpath = "//hr")
    private WebElement dividingLineElement;

    @FindBy(xpath = "//p[@name='wordmenu']")
    private WebElement contentMenu;

    @FindBy(xpath = "//a[@row='2' and @col='3']")
    private WebElement addTable3x2;

    @FindBy(xpath = "//a[@row='3' and @col='3']")
    private WebElement addTable3x3;

    @FindBy(xpath = "//a[@row='2' and @col='4']")
    private WebElement addTable4x2;

    @FindBy(xpath = "//a[@row='10' and @col='8']")
    private WebElement addTable8x10;

    @FindBy(xpath = "//span[text()='无边框']")
    private WebElement noBorders;

    @FindBy(xpath = "//div[@class='jodit_wysiwyg']//table")
    private WebElement tableElement;

    @FindBy(xpath = "//div[@class='jodit_wysiwyg']//table[@class = 'no_border_table']")
    private WebElement noBorderTableElement;

    @FindBy(xpath = "//div[@class='jodit_wysiwyg']//*[not(@name ='pageheader') and not(@name='pagefooter') and contains(text(), 'textclick')]")
    private WebElement textAreaLocator;

    @FindBy(xpath = "//a[@data-color='#FF00FF']")
    private WebElement pink;

    @FindBy(xpath = "//div[@class='jodit_wysiwyg']/*[last()]")
    private WebElement newLine;

    @FindBy(xpath = "//*[text()='标题1' and name()='h1']/ancestor::li")
    private WebElement heading_1;

    @FindBy(xpath = "//*[text()='标题2' and name()='h2']/ancestor::li")
    private WebElement heading_2;

    @FindBy(xpath = "//*[text()='标题3' and name()='h3']/ancestor::li")
    private WebElement heading_3;

    @FindBy(xpath = "//*[text()='标题4' and name()='h4']/ancestor::li")
    private WebElement heading_4;

    @FindBy(xpath = "(//div[@class='jodit_wysiwyg']/h1) | (//div[@class='jodit_wysiwyg']/h2) | (//div[@class='jodit_wysiwyg']/h3) | (//div[@class='jodit_wysiwyg']/h4)")
    private WebElement headingElement;

    @FindBy(xpath = "//a[@role = 'button' and @aria-label='删除']")
    private WebElement deleteElement;

    @FindBy(xpath = "//span[text()='删除表格']/ancestor::a")
    private WebElement deleteTable;

    @FindBy(xpath = "//span[text()='删除行']/ancestor::a")
    private WebElement deleteRow;

    @FindBy(xpath = "//span[text()='删除列']/ancestor::a")
    private WebElement deleteColumn;

    @FindBy(xpath = "//span[text()='清除内容']/ancestor::a")
    private WebElement clearContent;

    @FindBy(xpath = "//tr[1]/td[1]")
    private WebElement cell11;

    @FindBy(xpath = "//tr[1]/td[2]")
    private WebElement cell12;

    @FindBy(xpath = "//tr[2]/td[1]")
    private WebElement cell21;

    @FindBy(xpath = "//tr[2]/td[2]")
    private WebElement cell22;

    @FindBy(xpath = "//a[@role = 'button' and @aria-label='添加行']")
    private WebElement addRow;

    @FindBy(xpath = "//span[text()='在之前插入行']/ancestor::a")
    private WebElement addRowAbove;

    @FindBy(xpath = "//span[text()='在之后插入行']/ancestor::a")
    private WebElement addRowBelow;

    @FindBy(xpath = "//a[@role = 'button' and @aria-label='添加列']")
    private WebElement addColumn;

    @FindBy(xpath = "//span[text()='在之前插入列']/ancestor::a")
    private WebElement addColumnBefore;

    @FindBy(xpath = "//span[text()='在之后插入列']/ancestor::a")
    private WebElement addColumnAfter;

    @FindBy(xpath = "//a[@aria-label='垂直对齐']")
    private WebElement verticalAlignment;

    @FindBy(xpath = "//span[text()='顶部']/ancestor::a")
    private WebElement topVerticalAlign;

    @FindBy(xpath = "//span[text()='中间']/ancestor::a")
    private WebElement middleVerticalAlign;

    @FindBy(xpath = "//span[text()='底部']/ancestor::a")
    private WebElement bottomVerticalAlign;

    @FindBy(xpath = "//a[@aria-label='合并']")
    private WebElement merge;

    @FindBy(xpath = "//i[@class = 'jodit_resizer-bottomright']")
    private WebElement bottomRightCorner;

    @FindBy(xpath = "//span[@aria-label='CloseCircle']/ancestor::div[1]/following-sibling::div/p")
    private WebElement errorMessage;

    @FindBy(xpath = "(//ul[contains(@class,'toolbar')])[2]")
    private WebElement dropdownList;

    public WebElement getChartList() {
        getToolbarButton("选择趋势图").click();
        return dropdownUtils.getParentElementOfMenuList();
    }

    public WebElement getSingleChartList() {
        getToolbarButton("文本中嵌入单值趋势图").click();
        return dropdownUtils.getParentElementOfMenuList();
    }

    public WebElement getAddTable() {
        return getToolbarButton("表格");
    }

    public WebElement getContent() {
        return getToolbarButton("目录");
    }

    public WebElement getColor() {
        return getToolbarButton("颜色");
    }

    public WebElement getTextFontSize48() {
        getToolbarButton("字号").click();
        return webDriver.findElement(By.xpath("//li//*[text()='48']"));
    }

    public WebElement getHeading() {
        return getToolbarButton("格式块");
    }

    public WebElement getItalics() {
        return getToolbarButton("斜体");
    }

    public WebElement getBold() {
        return getToolbarButton("粗体");
    }

    public WebElement getUnderline() {
        return getToolbarButton("下划线");
    }

    public WebElement getAlignment() {
        return getToolbarButton("对齐方式");
    }

    public WebElement getUploadImage(){
        getToolbarButton("图片").click();
        return uploadImage;
    }

    public WebElement getHeader() {
        return getToolbarButton("页眉");
    }

    public WebElement getFooter() {
        return getToolbarButton("页脚");
    }

    public WebElement getDividingLine() {
        return getToolbarButton("分割线");
    }

    public WebElement getUndo() {
        return getToolbarButton("撤销");
    }

    public WebElement getRedo() {
        return getToolbarButton("重做");
    }

    public WebElement getPreview() {
        getToolbarButton("预览").click();
        return dropdownUtils.getParentElementOfMenuList();
    }

    private WebElement getToolbarButton(String text) {
        return webDriver.findElement(By.xpath("//div[text()='" + text + "']/ancestor::li"));
    }

    public WebElement getErrorMessage() {
        return errorMessage;
    }

    public WebElement getTrendNameField() {
        return getYottaInput("report-name-input");
    }

    public WebElement getFinishButton() {
        return finishButton;
    }

    public WebElement getEnsureButton() {
        return EnsureButton;
    }

    public WebElement getEditButton() {
        return editButton;
    }

    public WebElement getTrendElement() {
        return trendElement;
    }

    public WebElement getLastAddedTrend() {
        return lastAddedTrend;
    }

    public WebElement getSingleTrendElement() {
        return singleTrendElement;
    }

    public WebElement getTrend_Name() {
        return trend_Name;
    }

    public WebElement getTrend_Description() {
        return trend_Description;
    }

    public WebElement getTrend_Chart() {
        return trend_Chart;
    }

    public WebElement getTrend_Timerange() {
        return trend_Timerange;
    }

    public WebElement getDeleteTrendName() {
        return deleteTrendName;
    }

    public WebElement getDeleteTrendDescription() {
        return deleteTrendDescription;
    }

    public WebElement getDeleteTrendChart() {
        return deleteTrendChart;
    }

    public WebElement getDeleteTrendTimerange() {
        return deleteTrendTimerange;
    }

    public WebElement getDisabledType() {
        return disabledType;
    }

    public WebElement getTextArea() {
        return textArea;
    }

    public WebElement getTextAreaStyle() {
        return textAreaStyle;
    }

    public WebElement getTextAlignment() {
        return textAlignment;
    }

    public WebElement getImageElement() {
        return imageElement;
    }

    public WebElement getBoldElement() {
        return boldElement;
    }

    public WebElement getItalicsElement() {
        return italicsElement;
    }

    public WebElement getUnderlineElement() {
        return underlineElement;
    }

    public WebElement getFooterText() {
        return footerText;
    }

    public WebElement getFooterTextStyle() {
        return footerTextStyle;
    }

    public WebElement getHeaderText() {
        return headerText;
    }

    public WebElement getHeaderTextStyle() {
        return footerTextStyle;
    }

    public WebElement getCenterAlignment() {
        return centerAlignment;
    }

    public WebElement getRightAlignment() {
        return rightAlignment;
    }

    public WebElement getLeftAlignment() {
        return leftAlignment;
    }

    public WebElement getJustifyAlignment() {
        return justifyAlignment;
    }

    public WebElement getDividingLineElement() {
        return dividingLineElement;
    }

    public WebElement getContentMenu() {
        return contentMenu;
    }

    public WebElement getAddTable3x2() {
        return addTable3x2;
    }

    public WebElement getAddTable3x3() {
        return addTable3x3;
    }

    public WebElement getAddTable4x2() {
        return addTable4x2;
    }

    public WebElement getAddTable8x10() {
        return addTable8x10;
    }

    public WebElement getNoBorders() {
        return noBorders;
    }

    public WebElement getTableElement() {
        return tableElement;
    }

    public WebElement getNoBorderTableElement() {
        return noBorderTableElement;
    }

    public WebElement getTextAreaLocator() {
        return textAreaLocator;
    }

    public WebElement getNewLine() {
        newLine.click();
        return newLine;
    }

    public WebElement getHeading_1() {
        return heading_1;
    }

    public WebElement getHeading_2() {
        return heading_2;
    }

    public WebElement getHeading_3() {
        return heading_3;
    }

    public WebElement getHeading_4() {
        return heading_4;
    }

    public WebElement getHeadingElement() {
        return headingElement;
    }

    public WebElement getPink() {
        return pink;
    }

    public WebElement getDeleteElement() {
        return deleteElement;
    }

    public WebElement getDeleteTable() {
        return deleteTable;
    }

    public WebElement getDeleteRow() {
        return deleteRow;
    }

    public WebElement getDeleteColumn() {
        return deleteColumn;
    }

    public WebElement getClearContent() {
        return clearContent;
    }

    public WebElement getCell11() {
        return cell11;
    }

    public WebElement getCell12() {
        return cell12;
    }

    public WebElement getCell21() {
        return cell21;
    }

    public WebElement getCell22() {
        return cell22;
    }

    public WebElement getAddRow() {
        return addRow;
    }

    public WebElement getAddRowAbove() {
        return addRowAbove;
    }

    public WebElement getAddRowBelow() {
        return addRowBelow;
    }

    public WebElement getAddColumn() {
        return addColumn;
    }

    public WebElement getAddColumnBefore() {
        return addColumnBefore;
    }

    public WebElement getAddColumnAfter() {
        return addColumnAfter;
    }

    public WebElement getVerticalAlignment() {
        verticalAlignment.click();
        return verticalAlignment;
    }

    public WebElement getTopVerticalAlign() {
        return topVerticalAlign;
    }

    public WebElement getMiddleVerticalAlign() {
        return middleVerticalAlign;
    }

    public WebElement getBottomVerticalAlign() {
        return bottomVerticalAlign;
    }

    public WebElement getMerge() {
        return merge;
    }

    public WebElement getBottomRightCorner() {
        return bottomRightCorner;
    }
}
