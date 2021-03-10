package com.yottabyte.pages.trend;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ListPage extends ListPageFactory {
    public ListPage(WebDriver driver) {
        super(driver);
        driver.manage().window().fullscreen();
    }

    @FindBy(xpath = "//span[text() = '创建']/ancestor::button")
    private WebElement createButton;

    @FindBy(xpath = "//div[text()='新建']")
    private WebElement create;

    @FindBy(xpath = "//li/span[text() = '新建']")
    private WebElement newTrendButton;

    @FindBy(xpath = "//li/span[text() = '选择数据集']")
    private WebElement newTrendFromDataset;

    @FindBy(xpath = "(//span[text()='取消']/ancestor::button)[last()]")
    private WebElement cancel;

    @FindBy(xpath= "//span[contains(text(),'标签')]/ancestor::div[@class='yotta-modal']")
    private WebElement tagPanel;

    @FindBy(xpath = "(//label[contains(text(),'标签')])[last()]/ancestor::div/following-sibling::div[1]")
    private WebElement tagField;

    @FindBy(xpath = "//span[@class = 'ant-spin-dot ant-spin-dot-spin']")
    private WebElement loading;

    @FindBy(xpath = "//p[text()='单个数据集']/preceding-sibling::div")
    private WebElement singleDataset;

    @FindBy(xpath = "//p[text()='多表关联']/preceding-sibling::div")
    private WebElement multiDataset;

    @FindBy(xpath = "//p[text()='追加合并']/preceding-sibling::div")
    private WebElement unionDataset;

    @FindBy(xpath = "//*[contains(text(),'暂无数据')]")
    private WebElement noData;

    @FindBy(xpath = "(//tr)[last()]/td[4]")
    private WebElement tagOfTheLastItem;

    @FindBy(xpath = "(//tr)[last()]/td[3]")
    private WebElement appOfTheLastItem;

    @FindBy(xpath = "//span[text()='展示趋势图']")
    private WebElement viewTrend;

    @FindBy(xpath = "//span[text()='复制']")
    private WebElement copy;

    @FindBy(xpath = "//span[text()='标签']")
    private WebElement tag;

    @FindBy(xpath = "//span[text()='删除']")
    private WebElement delete;

    public WebElement getDelete() {
        return delete;
    }

    public WebElement getTag() {
        return tag;
    }

    public WebElement getCopy() {
        return copy;
    }

    public WebElement getViewTrend() {
        return viewTrend;
    }

    public WebElement getAppOfTheLastItem() {
        return appOfTheLastItem;
    }

    public WebElement getTagOfTheLastItem() {
        return tagOfTheLastItem;
    }

    public WebElement getNoData() {
        return noData;
    }

    public WebElement getLoading() {
        return loading;
    }

    public WebElement getCreate() {
        return create;
    }

    public WebElement getCreateButton() {
        return super.getButton("创建");
    }

    public WebElement getNewTrendButton(){
        createButton.click();
        return newTrendButton;
    }

    public WebElement getNewTrendFromDataset() {
        createButton.click();
        return newTrendFromDataset;
    }

    public WebElement getSingleDataset() {
        return singleDataset;
    }

    public WebElement getMultiDataset() {
        return multiDataset;
    }

    public WebElement getUnionDataset() {
        return unionDataset;
    }

    public WebElement getCancel() {
        return cancel;
    }

    public WebElement getTagPanel() {
        return tagPanel;
    }

    public WebElement getTagField() {
        tagField.click();
        return this.getLastDropdownList();
    }
}
