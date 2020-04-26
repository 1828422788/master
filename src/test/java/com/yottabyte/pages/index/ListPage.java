package com.yottabyte.pages.index;

import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ListPage extends ListPageFactory {
    public ListPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getAddButton() {
        return super.getButton("新建");
    }

    public WebElement getEnsureButton() {
        return super.getContainsTextButton("确定");
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

    @FindBy(xpath = "//div[@class='el-message-box__message']")
    private WebElement Message;

    public WebElement getMemoMessage() {
        return MemoMessage;
    }

    @FindBy(xpath = "//p[@class='_1JjlGgMGUnJmBrqR_9PZl8']")
    private WebElement MemoMessage;

    public WebElement getMessage() {
        return Message;
    }
}
