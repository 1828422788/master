package com.yottabyte.pages.manager;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

/**
 * @author sunxj
 */
public class ListPage extends PageTemplate {
    @FindBy(xpath = "//span[text()='工具']/following-sibling::b")
    private WebElement tools;
    @FindBy(id = "mysql-sql")
    private WebElement sqlInput;
    @FindBy(id = "js-detail")
    private WebElement detail;
    @FindBy(id = "run-cmd")
    private WebElement run;

    public ListPage(WebDriver driver) {
        super(driver);
    }

    public WebElement getRun() {
        return run;
    }

    public WebElement getDetail() {
        return detail;
    }

    public WebElement getSqlInput() {
        return sqlInput;
    }

    public WebElement getTools() {
        return tools;
    }

    public WebElement getKafkaTool() {
        return super.getButton("Kafka 工具");
    }

    public WebElement getMysqlTool() {
        return super.getButton("Mysql 工具");
    }
}
