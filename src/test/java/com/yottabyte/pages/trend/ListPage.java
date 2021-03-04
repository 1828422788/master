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

    @FindBy(xpath = "//div[@class='ant-modal-body']//p")
    private WebElement message;

    @FindBy(xpath = "//span[text() = '创建']/ancestor::button")
    private WebElement createButton;

    @FindBy(xpath = "//div[text()='新建']")
    private WebElement create;

    @FindBy(xpath = "//li/span[text() = '新建']")
    private WebElement newTrendButton;

    @FindBy(xpath = "//li/span[text() = '选择数据集']")
    private WebElement newTrendFromDataset;

    @FindBy(xpath = "//span[text()='确定']/ancestor::button")
    private WebElement ensureButton;

    @FindBy(xpath = "//span[text()='取消']/ancestor::button")
    private WebElement cancel;

    @FindBy(xpath= "//div[@class='ant-modal-content']")
    private WebElement tagPanel;

    @FindBy(xpath = "(//div[text()='标签'])[last()]/following-sibling::div[1]")
    private WebElement tagField;

    @FindBy(xpath = "//span[text()='趋势图']/ancestor::div/div/span/input")
    private WebElement searchInput;

    @FindBy(xpath = "//span[@class = 'ant-spin-dot ant-spin-dot-spin']")
    private WebElement loading;

    @FindBy(xpath = "//p[text()='单个数据集']/preceding-sibling::div")
    private WebElement singleDataset;

    @FindBy(xpath = "//p[text()='多表关联']/preceding-sibling::div")
    private WebElement multiDataset;

    @FindBy(xpath = "//p[text()='追加合并']/preceding-sibling::div")
    private WebElement unionDataset;

    @FindBy(xpath = "//span[contains(text(),'添加资源标签')]")
    private WebElement multiTag;

    @FindBy(xpath = "//span[contains(text(),'删除')]")
    private WebElement multiDelete;

    @FindBy(xpath = "//p[text()='暂无数据']")
    private WebElement noData;

    @FindBy(xpath = "//thead//span[@class='ant-checkbox']")
    private WebElement selectAll;

    @FindBy(xpath = "//div[text()='请选择应用']/ancestor::div[2]")
    private WebElement appDropdown;

    @FindBy(xpath = "//div[text()='全部资源']/ancestor::div[2]")
    private WebElement tagDropdown;

    @FindBy(xpath = "(//tr)[last()]/td[4]")
    private WebElement tagOfTheLastItem;

    @FindBy(xpath = "(//tr)[last()]/td[3]")
    private WebElement appOfTheLastItem;

    @FindBy(xpath ="//span[text()='展示趋势图']")
    private WebElement viewTrend;

    public WebElement getViewTrend() {
        return viewTrend;
    }

    public WebElement getAppOfTheLastItem() {
        return appOfTheLastItem;
    }

    public WebElement getTagOfTheLastItem() {
        return tagOfTheLastItem;
    }

    public WebElement getTagDropdown() {
        tagDropdown.click();
        return this.getLastDropdownList();
    }

    public WebElement getAppDropdown() {
        appDropdown.click();
        return this.getLastDropdownList();
    }

    public WebElement getSelectAll() {
        return selectAll;
    }

    public WebElement getNoData() {
        return noData;
    }

    public WebElement getLoading() {
        return loading;
    }

    public WebElement getSearchInput(){
        return searchInput;
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

    public WebElement getEnsureButton(){
        return ensureButton;
    }

    public WebElement getCancel() {
        return cancel;
    }

    public WebElement getMessage() {
        return message;
    }

    public WebElement getTagPanel() {
        return tagPanel;
    }

    public WebElement getTagField() {
        tagField.click();
        return this.getLastDropdownList();
    }

    public WebElement getMultiButton() {
        return super.getButton("批量操作");
    }

    public WebElement getSelectAction() {
        return super.getButton("请选择");
    }

    public WebElement getFinish() {
        return super.getButton("完成");
    }

    public WebElement getMultiTag() {
        return multiTag;
    }

    public WebElement getMultiDelete() {
        return multiDelete;
    }
}
