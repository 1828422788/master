package com.yottabyte.pages.report;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;


public class CreatePageWORD extends PageTemplate {

    public CreatePageWORD(WebDriver driver) {
        super(driver);
        driver.manage().window().setSize(new Dimension(1600,900));
    }

    @FindBy(className = "yotta-message-content")
    private WebElement successMessage;

    @FindBy(xpath = "//span[text()='完成']/ancestor::button")
    private WebElement finishButton;

    @FindBy(xpath = "//span[text()='确定']/ancestor::button")
    private WebElement EnsureButton;

    @FindBy(xpath = "//a[@aria-label='选择趋势图']/span")
    private WebElement addTrendWord;

    @FindBy(xpath = "//label[@name='operate_edit']")
    private WebElement editButton;

    @FindBy(xpath = "//a[@aria-label='文本中嵌入单值趋势图']")
    private WebElement singleTrendList;

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

    @FindBy(xpath = "//span[text()='上传']/following-sibling::input")
    private WebElement uploadImage;

    @FindBy(xpath = "(//div[@class='jodit_wysiwyg']//img)[last()]")
    private WebElement imageElement;

    @FindBy(xpath = "//a[@aria-label='字号']/ancestor::li")
    private WebElement textFontSize;

    @FindBy(xpath = "//a[@aria-label='粗体']/ancestor::li")
    private WebElement bold;

    @FindBy(xpath = "//div[@class='jodit_wysiwyg']//strong")
    private WebElement boldElement;

    @FindBy(xpath = "//a[@aria-label='斜体']/ancestor::li")
    private WebElement italics;

    @FindBy(xpath = "//div[@class='jodit_wysiwyg']//em")
    private WebElement italicsElement;

    @FindBy(xpath = "//a[@aria-label='下划线']/ancestor::li")
    private WebElement underline;

    @FindBy(xpath = "//div[@class='jodit_wysiwyg']//u")
    private WebElement underlineElement;

    @FindBy(xpath = "//a[@aria-label='页眉']/ancestor::li")
    private WebElement header;

    @FindBy(xpath = "//a[@aria-label='页脚']/ancestor::li")
    private WebElement footer;

    @FindBy(xpath = "//p[@name='pageheader']")
    private WebElement headerText;

    @FindBy(xpath = "//p[@name='pageheader']/*")
    private WebElement headerTextStyle;

    @FindBy(xpath = "//p[@name='pagefooter']")
    private WebElement footerText;

    @FindBy(xpath = "//p[@name='pagefooter']/*")
    private WebElement footerTextStyle;

    @FindBy(xpath = "(//a[@aria-label='对齐方式']/ancestor::li)[last()]")
    private WebElement alignment;

    @FindBy(xpath = "(//a[@aria-label='居中']/ancestor::li)[last()]")
    private WebElement centerAlignment;

    @FindBy(xpath = "(//a[@aria-label='右对齐']/ancestor::li)[last()]")
    private WebElement rightAlignment;

    @FindBy(xpath = "(//a[@aria-label='左对齐']/ancestor::li)[last()]")
    private WebElement leftAlignment;

    @FindBy(xpath = "(//a[@aria-label='对齐文本']/ancestor::li)[last()]")
    private WebElement justifyAlignment;

    @FindBy(xpath = "//a[@aria-label='分割线']/ancestor::li")
    private WebElement dividingLine;

    @FindBy(xpath = "//hr")
    private WebElement dividingLineElement;

    @FindBy(xpath = "//a[@aria-label='目录']/ancestor::li")
    private WebElement content;

    @FindBy(xpath = "//p[@name='wordmenu']")
    private WebElement contentMenu;

    @FindBy(xpath = "//a[@aria-label='表格']/ancestor::li")
    private WebElement addTable;

    @FindBy(xpath = "//div[@data-index='12']")
    private WebElement addTable3x2;

    @FindBy(xpath = "//div[@data-index='22']")
    private WebElement addTable3x3;

    @FindBy(xpath = "//div[@data-index='13']")
    private WebElement addTable4x2;

    @FindBy(xpath = "//div[@data-index='79']")
    private WebElement addTable8x10;

    @FindBy(xpath = "//input[@value = 'no_border_table']")
    private WebElement noBorders;

    @FindBy(xpath = "//div[@class='jodit_wysiwyg']//table")
    private WebElement tableElement;

    @FindBy(xpath = "//div[@class='jodit_wysiwyg']//table[@class = 'no_border_table']")
    private WebElement noBorderTableElement;

    @FindBy(xpath = "//div[@class='jodit_wysiwyg']//*[not(@name ='pageheader') and not(@name='pagefooter') and contains(text(), 'textclick')]")
    private WebElement textAreaLocator;

    @FindBy(xpath = "//a[@aria-label='颜色']/ancestor::li")
    private WebElement color;

    @FindBy(xpath = "//a[@title='#FF00FF']")
    private WebElement pink;

    @FindBy(xpath = "//div[@class='jodit_wysiwyg']/*[last()]")
    private WebElement newLine;

    @FindBy(xpath = "//a[@aria-label='格式块']/ancestor::li")
    private WebElement heading;

    @FindBy(xpath = "//a[@aria-label='格式块']/following-sibling::div//span[text() = '标题1']")
    private WebElement heading_1;

    @FindBy(xpath = "//a[@aria-label='格式块']/following-sibling::div//span[text() = '标题2']")
    private WebElement heading_2;

    @FindBy(xpath = "//a[@aria-label='格式块']/following-sibling::div//span[text() = '标题3']")
    private WebElement heading_3;

    @FindBy(xpath = "//a[@aria-label='格式块']/following-sibling::div//span[text() = '标题4']")
    private WebElement heading_4;

    @FindBy(xpath = "(//div[@class='jodit_wysiwyg']/h1) | (//div[@class='jodit_wysiwyg']/h2) | (//div[@class='jodit_wysiwyg']/h3) | (//div[@class='jodit_wysiwyg']/h4)")
    private WebElement headingElement;

    @FindBy(xpath = "//a[@aria-label='撤销']/ancestor::li")
    private WebElement undo;

    @FindBy(xpath = "//a[@aria-label='重做']/ancestor::li")
    private WebElement redo;

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

    @FindBy(xpath = " //a[@aria-label='预览']")
    private WebElement preview;

    @FindBy(xpath = "(//ul[contains(@class,'toolbar')])[2]")
    private WebElement dropdownList;

    public WebElement getPreview() {
        preview.click();
        return dropdownList;
    }

    public WebElement getChartList() {
        addTrendWord.click();
        return dropdownList;
    }

    public WebElement getSingleChartList() {
        singleTrendList.click();
        return dropdownList;
    }

    public WebElement getErrorMessage() {
        return errorMessage;
    }

    public WebElement getTrendNameField() {
        return getYottaInput("report-name-input");
    }

    public WebElement getSuccessMessage() {
        return successMessage;
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

    public WebElement getUploadImage(){
        WebElement button = webDriver.findElement(By.xpath("//a[@aria-label='图片']"));
        button.click();
        return uploadImage;
    }

    public WebElement getImageElement() {
        return imageElement;
    }

    public WebElement getTextFontSize48() {
        textFontSize.click();
        return webDriver.findElement(By.xpath("((//ul[@class='jodit_toolbar'])[last()])//span[text()='48']"));
    }

    public WebElement getBold() {
        return bold;
    }

    public WebElement getBoldElement() {
        return boldElement;
    }

    public WebElement getItalics() {
        return italics;
    }

    public WebElement getItalicsElement() {
        return italicsElement;
    }

    public WebElement getUnderline() {
        return underline;
    }

    public WebElement getUnderlineElement() {
        return underlineElement;
    }

    public WebElement getHeader() {
        return header;
    }

    public WebElement getFooter() {
        return footer;
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

    public WebElement getAlignment() {
        alignment.click();
        return alignment;
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

    public WebElement getDividingLine() {
        return dividingLine;
    }

    public WebElement getDividingLineElement() {
        return dividingLineElement;
    }

    public WebElement getContent() {
        return content;
    }

    public WebElement getContentMenu() {
        return contentMenu;
    }

    public WebElement getAddTable() {
        return addTable;
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

    public WebElement getColor() {
        return color;
    }

    public WebElement getNewLine() {
        newLine.click();
        return newLine;
    }

    public WebElement getHeading() {
        return heading;
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

    public WebElement getUndo() {
        return undo;
    }

    public WebElement getRedo() {
        return redo;
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

    public WebElement getLastPartition(){
//        int sourceX = cell22.getLocation().getX();
//        int loc_y = cell22.getLocation().getY();
//        int width = cell22.getSize().getWidth();
//        System.out.println(width);
//        System.out.println(sourceX);
//        System.out.println(loc_y);
//        int loc_x = sourceX + width;
//        ((JavascriptExecutor) webDriver).executeScript("document.elementFromPoint(" + loc_x + ", "+ loc_y +").click()");
//        WebDriverWait wait = new WebDriverWait(webDriver,10);
//        wait.until(ExpectedConditions.visibilityOfElementLocated(By.xpath("(//div[@class='jodit_table_resizer'])[last()]")));
        WebElement lastPartition = webDriver.findElement(By.xpath("(//div[@class='jodit_table_resizer'])[last()]"));
        return lastPartition;
    }
}
