package com.yottabyte.pages.timedTask;

import com.yottabyte.pages.ListPageFactory;
import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

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

    @FindBy(xpath = "//input[@class='el-input__inner'][@placeholder='请输入']")
    private WebElement searchInput;

    @FindBy(className = "el-table__body-wrapper")
    private WebElement table;

    @FindBy(xpath = "(//i[@class='el-input__icon el-icon-arrow-up'])[last()]")
    private WebElement selectName;

    @FindBy(xpath = "//*[@placeholder='请选择时间范围']")
    private WebElement dateEditor;

    @FindBy(className = "date-picker")
    private WebElement datePicker;

    @FindBy(xpath = "//span[text()='全部资源']/preceding-sibling::i")
    private WebElement groupDropdown;

    @FindBy(xpath = "(//ul[@class='el-dropdown-menu yw-table-group__group-menu'])[last()]")
    private WebElement groupDropdownList;

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
        return super.getLastDropdownList();
    }

    public WebElement getCreateComplement() {
        return super.getButton("创建补采任务");
    }

    public WebElement getTable() {
        return table;
    }

    public WebElement getSearchInput() {
        return searchInput;
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

    public WebElement getEnsureDelete() {
        return ensureButton.get(1);
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
