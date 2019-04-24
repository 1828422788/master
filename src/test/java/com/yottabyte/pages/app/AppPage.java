package com.yottabyte.pages.app;

import com.yottabyte.pages.PageTemplate;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

/**
 * @author sunxj
 */
public class AppPage extends PageTemplate {
    public AppPage(WebDriver driver) {
        super(driver);
    }

    @FindBy(className = "el-icon-arrow-right")
    private WebElement rightArrow;

    @FindBy(xpath = "(//*[@class='yw-subnav-item active'])[last()]")
    private WebElement title;

    @FindBy(className = "el-table__empty-text")
    private WebElement emptyText;

    @FindBy(className = "el-icon-arrow-down")
    private WebElement arrowDown;

    @FindBy(xpath = "//li[contains(text(),'default')]")
    private WebElement liText;

    public WebElement getLiText() {
        return liText;
    }

    public WebElement getArrowDown() {
        return arrowDown;
    }

    public WebElement getEmptyText() {
        return emptyText;
    }

    public WebElement getTitle() {
        return title;
    }

    public WebElement getAlert() {
        return this.getElementWithLinkName("监控");
    }

    public WebElement getReport() {
        return this.getElementWithLinkName("报表");
    }

    public WebElement getTopology() {
        return this.getElementWithLinkName("拓扑图");
    }

    public WebElement getSearch() {
        return this.getElementWithLinkName("搜索");
    }

    public WebElement getDashboard() {
        return this.getElementWithLinkName("仪表盘");
    }

    public WebElement getTimedTask() {
        return this.getElementWithLinkName("定时任务");
    }

    public WebElement getTrend() {
        return this.getElementWithLinkName("趋势图");
    }

    public WebElement getSearchMacro() {
        return this.getElementWithLinkName("搜索宏");
    }

    public WebElement getConfig() {
        return this.getElementWithLinkName("字段提取");
    }

    public WebElement getEvent() {
        return this.getElementWithLinkName("事件操作");
    }

    public WebElement getSource() {
        return this.getElementWithLinkName("日志来源");
    }

    public WebElement getAgent() {
        return this.getElementWithLinkName("Agent管理");
    }

    public WebElement getIndexsetting() {
        return this.getElementWithLinkName("路由配置");
    }

    public WebElement getIngestpriority() {
        return this.getElementWithLinkName("入库优先级");
    }

    public WebElement getUpload() {
        return this.getElementWithLinkName("本地上传");
    }

    public WebElement getBackup() {
        return this.getElementWithLinkName("备份策略");
    }

    public WebElement getDownload() {
        return this.getElementWithLinkName("下载管理");
    }

    public WebElement getOfflineTask() {
        return this.getElementWithLinkName("离线任务");
    }

    public WebElement getKnowledge() {
        return this.getElementWithLinkName("知识");
    }

    public WebElement getRole() {
        return this.getElementWithLinkName("角色权限");
    }

    public WebElement getResourceGroup() {
        return this.getElementWithLinkName("资源分组管理");
    }

    public WebElement getUserGroup() {
        return this.getElementWithLinkName("用户分组");
    }

    public WebElement getUser() {
        return this.getElementWithLinkName("用户管理");
    }

    public WebElement getLimit() {
        return this.getElementWithLinkName("使用限额");
    }

    public WebElement getRightArrow() {
        return rightArrow;
    }

    private WebElement getElementWithLinkName(String name) {
        String xpath = "(//a[text()='" + name + "'])[last()]";
        return webDriver.findElement(By.xpath(xpath));
    }
}
