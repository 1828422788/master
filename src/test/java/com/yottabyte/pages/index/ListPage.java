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

    public WebElement getStopIndex(){
        return StopIndex;
    }

    @FindBy(xpath = "//span[text()='停止入库']" )
    private WebElement StopIndex;

    public WebElement getStartIndex() {
        return StartIndex;
    }

    @FindBy(xpath = "//span[text()='启用入库']" )
    private WebElement StartIndex;

    @FindBy(xpath="//div/ul/li[2]/span[text()='删除']")
    private WebElement delete;

    public WebElement getDelete() { return delete;}

//    @FindBy(xpath = "//div[@class='el-message-box__message']")
    private WebElement Message;

    public WebElement getMemoMessage() {
        return MemoMessage;
    }

    @FindBy(xpath = "//p[@class='_1JjlGgMGUnJmBrqR_9PZl8']")
    private WebElement MemoMessage;

    @FindBy(xpath = "//div/div[text()='计划查看']")
    private WebElement ScheduleMessage;

    public WebElement getScheduleMessage() {
        return ScheduleMessage;
    }

    @FindBy(xpath = "//div/span[text()='查看']")
    private WebElement look;

    public WebElement getLook() {
        return look;
    }

    public WebElement getMessage() {
        return super.getMessage();
    }

    public WebElement getReturnList() {
        return super.getButton("返回列表");
    }
}
