package com.yottabyte.pages.agent;

import com.yottabyte.pages.ListPageFactory;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ListPage extends ListPageFactory {
    @FindBy(className = "_2FuqHHfRc-c7BJzf3RvYta")
    private WebElement agentGroup;

    public ListPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getAgentGroup() {
        return agentGroup;
    }

    public WebElement getComplete() {
        return super.getButton("完成");
    }
}
