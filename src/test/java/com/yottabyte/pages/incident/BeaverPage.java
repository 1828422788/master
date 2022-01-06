package com.yottabyte.pages.incident;

import com.yottabyte.pages.PageTemplate;
import com.yottabyte.utils.ClickEvent;
import com.yottabyte.utils.WaitForElement;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;

public class BeaverPage extends PageTemplate {

    public BeaverPage(WebDriver driver) {
        super(driver);
    }

    /**
     * 发送策略列表界面元素定位
     */

    @FindBy(xpath = "//span[contains(text(),'beaver')]/parent::/a/following-sibling::ul[@class='dropdown-menu']/li/span[contains(text(),'Index 管理')]/parent::a/parent::li")
    private WebElement indexManagerLi;

    public WebElement getIndexManagerLi() {
        return indexManagerLi;
    }

    @FindBy(xpath = "//input[@placeholder='Index 通配符搜索']")
    private WebElement beaverIndexListSearchInput;

    public WebElement getBeaverIndexListSearchInput() {
        return beaverIndexListSearchInput;
    }

    @FindBy(xpath = "//a[text()='删除']")
    private WebElement deleteBeaverIndexNameButton;

    public WebElement getDeleteBeaverIndexNameButton() {
        return deleteBeaverIndexNameButton;
    }

    @FindBy(xpath = "//span[text()='确定']/parent::button")
    private WebElement confirmDeleteBeaverIndexNameButton;

    public WebElement getConfirmDeleteBeaverIndexNameButton() {
        return confirmDeleteBeaverIndexNameButton;
    }

}
