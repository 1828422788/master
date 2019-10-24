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

    @FindBy(className = "ant-modal-content")
    private WebElement content;

    @FindBy(className = "ant-message-success")
    private WebElement successMessage;

    @FindBy(xpath = "//button[@role='switch']")
    private WebElement switchButton;

    @FindBy(xpath = "//span[text()='运行统计']/following-sibling::label//div[@class='el-switch__label el-switch__label--right']")
    private WebElement leftLabel;

    @FindBy(xpath = "//div[@class='el-dialog el-dialog--small']//tr")
    private List<WebElement> smallTr;

    @FindBy(xpath = "//div[text()='标签']/following-sibling::div//input")
    private WebElement tagInput;

    @FindBy(xpath = "//ul[@role='listbox']")
    private WebElement ul;

    public WebElement getTagInput() {
        return tagInput;
    }

    public WebElement getContent() {
        return content;
    }

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
        return super.getButton("确定");
    }

    public WebElement getGroup() {
        return ul;
    }

    public WebElement getTagGroup() {
        return super.getDropdownList("标签");
    }

    public WebElement getEnsureButton() {
        return super.getButton("确 定");
    }

    @Override
    public WebElement getSuccessMessage() {
        return successMessage;
    }

    public WebElement getMessage() {
        return super.getErrorMessage();
    }

    public WebElement getCreateButton() {
        return super.getButton("新 建");
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
