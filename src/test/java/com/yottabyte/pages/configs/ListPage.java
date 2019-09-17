package com.yottabyte.pages.configs;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindAll;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.FindBys;

import java.util.List;

/**
 * @author sunxj
 */
public class ListPage extends PageTemplate {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "el-message__group")
    private WebElement successMessage;

    @FindBy(xpath = "//button[@class='el-button el-button--default el-button--primary ']")
    private WebElement ensureButton;

    @FindBy(className = "el-switch")
    private WebElement switchButton;

    @FindBy(xpath = "//span[text()='运行统计']/following-sibling::label//div[@class='el-switch__label el-switch__label--right']")
    private WebElement leftLabel;

    @FindBy(xpath = "//div[@class='el-dialog el-dialog--small']//tr")
    private List<WebElement> smallTr;

    public List<WebElement> getSmallTr() {
        return smallTr;
    }

    public WebElement getLeftLabel() {
        return leftLabel;
    }

    public WebElement getSwitchButton() {
        return switchButton;
    }

    public WebElement getEnsure() {
        return super.getContainsTextButton("确定");
    }

    public WebElement getGroup() {
        return super.getDropdownList("分组");
    }

    public WebElement getEnsureButton() {
        return ensureButton;
    }

    @Override
    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getMessage() {
        return super.getErrorMessage();
    }

    public WebElement getCreateButton() {
        return super.getButton("新建");
    }

    public WebElement getDictionary() {
        return super.getButton("字典管理");
    }

    public WebElement getGroupList() {
        return super.getGroupDropdownList();
    }

    public WebElement getSearchInput() {
        return super.getSearchInput();
    }

    public WebElement getSearch() {
        return super.getSearchIcon();
    }
}
