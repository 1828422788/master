package com.yottabyte.pages.timedTask;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

import java.util.List;

public class ListPage extends ListPageFactory {

    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(xpath = "//*[contains(text(),'编辑')]")
    private List<WebElement> edit;

    @FindBy(xpath = "//*[contains(text(),'复制')]")
    private List<WebElement> copy;

    @FindBy(xpath = "//*[contains(text(),'分组')]")
    private List<WebElement> changeGroup;

    @FindBy(xpath = "//*[contains(text(),'删除')]")
    private List<WebElement> delete;

    @FindBy(className = "number")
    private List<WebElement> number;

    @FindBy(className = "el-input__inner")
    private List<WebElement> groups;

    @FindBy(className = "el-select-dropdown__list")
    private List<WebElement> dropdownLists;

    @FindBy(className = "el-button--primary")
    private List<WebElement> ensureButton;

    @FindBy(xpath = "//span[text()='确定']/ancestor::button")
    private WebElement ensure;

    // 表体
    @FindBy(className = "el-table__body")
    private WebElement tableBody;

    @FindBy(className = "el-switch")
    private WebElement switchButton;

    @FindBy(className = "el-button--default")
    private List<WebElement> selectLists;

    @FindBy(className = "el-dropdown-menu__item")
    private List<WebElement> selectOptions;

    @FindBy(xpath = "//span[@class='link switch-margin switch-text']")
    private List<WebElement> names;

    @FindBy(className = "el-table__body-wrapper")
    private WebElement table;

    @FindBy(xpath = "//span[text()='定时任务']/following-sibling::span/div")
    private WebElement selectName;

    @FindBy(xpath = "//*[@placeholder='请选择时间范围']")
    private WebElement dateEditor;

    @FindBy(className = "date-picker")
    private WebElement datePicker;

    @FindBy(xpath = "//span[text()='全部资源']/preceding-sibling::i")
    private WebElement groupDropdown;

    @FindBy(xpath = "(//ul[@class='el-dropdown-menu yw-table-group__group-menu'])[last()]")
    private WebElement groupDropdownList;

    @FindBy(xpath = "//span[text()='定时任务']/ancestor::div/div/span/input | //span[text()='schedule']/ancestor::div/div/span/input")
    private WebElement searchInput;

    @FindBy(xpath= "//div[@class='ant-modal-content']")
    private WebElement tagPanel;

    @FindBy(xpath = "(//div[text()='标签'])[last()]/following-sibling::div[1]")
    private WebElement tagField;

    @FindBy(xpath = "//div[text()='创建补采任务']/ancestor::div[2]")
    private WebElement complementPanel;

    @FindBy(xpath = "//span[text()='时间范围']/following-sibling::span")
    private WebElement selectInterval;

    @FindBy(xpath = "//div[@class='ant-calendar-panel']//input[@placeholder = '开始日期']")
    private WebElement start;

    @FindBy(xpath = "//div[@class='ant-calendar-panel']//input[@placeholder = '结束日期']")
    private WebElement end;

    @FindBy(xpath = "//a[text()='确 定']")
    private WebElement OK;

    @FindBy(xpath = "//li[@class='ant-select-dropdown-menu-item'][1]")
    private WebElement li;

    @FindBy(xpath = "//span[text()='是否覆盖已存在定时任务结果']/preceding-sibling::label/span")
    private WebElement overwrite;

    @FindBy(xpath = "//div[@class='ant-message-notice']//span")
    private WebElement notice;

    public WebElement getStart() {
        return start;
    }

    public WebElement getEnd() {
        return end;
    }

    public WebElement getOK() {
        return OK;
    }

    public WebElement getSelectInterval() {
        return selectInterval;
    }

    public WebElement getOverwrite() {
        return overwrite;
    }

    public WebElement getNotice() {
        return notice;
    }

    public WebElement getSearchInput(){
        return searchInput;
    }

    public WebElement getGroupDropdown() {
        return groupDropdown;
    }

    public WebElement getGroupDropdownList() {
        return groupDropdownList;
    }

    public WebElement getSearchIcon() {
        return super.getSearchIcon();
    }

    public WebElement getSave() {
        return super.getContainsTextButton("保存");
    }

    public WebElement getDatePicker() {
        return datePicker;
    }

    public WebElement getDateEditor() {
        return dateEditor;
    }

    public WebElement getSelectName() {
        selectName.click();
        WaitForElement.waitForElementWithExpectedCondition(webDriver, ExpectedConditions.visibilityOf(li));
        return super.getLastDropdownList();
    }

    public WebElement getComplement() {
        return super.getButton("定时任务补采");
    }

    public WebElement getCreateComplement() {
        return super.getButton("创建补采任务");
    }

    public WebElement getTable() {
        return table;
    }

    public List<WebElement> getNames() {
        return names;
    }

    public WebElement getSwitchButton() {
        return switchButton;
    }

    public WebElement getTableBody() {
        return tableBody;
    }

    public WebElement getEnsureChangeGroup() {
        return ensureButton.get(0);
    }

    public WebElement getTagPanel() {
        return tagPanel;
    }

    public WebElement getTagField() {
        tagField.click();
        return this.getLastDropdownList();
    }

    public WebElement getComplementPanel() {
        return complementPanel;
    }

//    public WebElement getEnsureDelete() {
//        return ensureButton.get(1);
//    }
    public WebElement getEnsure() {
        return ensure;
    }
//    public WebElement getGroup() {
//        return super.getDropdownList("分组");
//    }


//    public WebElement getDisabledLi() {
//        return super.getDisabledLi();
//    }

//    public WebElement getMessage() {
//        return super.getErrorMessage();
//    }
}
