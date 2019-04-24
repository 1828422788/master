package com.yottabyte.pages.index;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ListPage extends PageTemplate {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "el-message-box__message")
    private WebElement message;

    @FindBy(className = "el-message__group")
    private WebElement successmessage;

    @FindBy(xpath = "//div[@class='yw-table-group__basic el-input']/input")
    private WebElement searchInput;

    @FindBy(className = "el-icon-search")
    private WebElement search;

    public WebElement getSearch() {
        return search;
    }

    public WebElement getSearchInput() {
        return searchInput;
    }

    public WebElement getAddButton() {
        return super.getButton("新建");
    }

    public WebElement getEnsureButton() {
        return super.getContainsTextButton("确定");
    }

    public WebElement getSuccessMessage() {
        return message;
    }

    public WebElement getIndexMatchRule() {
        return super.getButton("索引路由规则");
    }

    public WebElement getTopic() {
        return super.getButton("Topic 配置");
    }

    public WebElement getIndex() {
        return super.getButton("索引配置");
    }

    public WebElement getMessage() {
        return successmessage;
    }
}
