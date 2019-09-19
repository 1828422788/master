package com.yottabyte.pages.manager;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.By;
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

    @FindBy(id = "generate-cmd")
    private WebElement generateCmd;

    @FindBy(xpath = "//div[@id='cmd-params']//input")
    private WebElement cmdParams;

    @FindBy(id = "modify-generated-cmd")
    private WebElement generatedCmd;

    @FindBy(className = "cmd-status")
    private WebElement cmdStatus;

    @FindBy(className = "cmd-detail")
    private WebElement cmdDetail;

    @FindBy(xpath = "//span[text()='topic-name']/ancestor::label/following-sibling::input")
    private WebElement topicName;

    public WebElement getTopicName() {
        return topicName;
    }

    public WebElement getCreateTopic() {
        return this.getLi("创建topic");
    }

    public WebElement getCmdDetail() {
        return cmdDetail;
    }

    public WebElement getCmdStatus() {
        return cmdStatus;
    }

    public WebElement getCmdParams() {
        return cmdParams;
    }

    public WebElement getGeneratedCmd() {
        return generatedCmd;
    }

    public WebElement getGenerateCmd() {
        return generateCmd;
    }

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

    public WebElement getCommandTool() {
        return super.getButton("命令行工具");
    }

    public WebElement getMysqlTool() {
        return super.getButton("Mysql 工具");
    }

    private WebElement getLi(String name) {
        return webDriver.findElement(By.xpath("//li[text()='" + name + "']"));
    }
}
