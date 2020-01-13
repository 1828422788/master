package com.yottabyte.stepDefs;

import com.yottabyte.config.ConfigManager;
import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.*;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.List;
import java.util.Map;

/**
 * 列表页中对表格的操作
 */
public class ClickButtonWithGivenName {

    private WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
    Paging pagingInfo = new Paging();
    ListPageUtils listPageUtils = new ListPageUtils();

    /**
     * 寻找对应的操作按钮并点击
     *
     * @param dataName   字符串：第一列所要匹配的名称，json：{'column':'start from 0','name':''}
     * @param buttonName 按钮名称
     */
    @When("^the data name is \"([^\"]*)\" then i click the \"([^\"]*)\" button$")
    public void clickButtonWithGivenName(String dataName, String buttonName) {
        WebElement tr = listPageUtils.getTr(dataName);
        this.click(buttonName, tr);
    }

    /**
     * 根据配置名称点击对应按钮
     *
     * @param propertyName 若为字符串：第一列所要匹配的名称，若为json：{'column':'start from 0','name':''}
     * @param buttonName   按钮名称
     */
    @Given("^the data properties is \"([^\"]*)\" then i click the \"([^\"]*)\" button$")
    public void clickButtonWithPropertyName(String propertyName, String buttonName) {
        ConfigManager config = new ConfigManager();
        if (!JsonStringPaser.isJson(propertyName)) {
            this.clickButtonWithGivenName(config.get(propertyName), buttonName);
        } else {
            Map<String, Object> map = JsonStringPaser.json2Stirng(propertyName);
            int columnNum = Integer.parseInt(map.get("column").toString());
            String name = map.get("name").toString();
            WebElement tr = listPageUtils.getRowWithColumnNum(config.get(name), columnNum);
            this.click(buttonName, tr);
        }
    }

    /**
     * 寻找对应的操作按钮并点击，无分页
     *
     * @param name       字符串：第一列所要匹配的名称，json：{'column':'start from 0','name':''}
     * @param buttonName 待点击的按钮名称
     */
    @When("^the data name is \"([^\"]*)\" then i click the \"([^\"]*)\" button without paging$")
    public void clickButtonWithoutPaging(String name, String buttonName) {
        WebElement tr = listPageUtils.getTrWithoutPaging(name);
        this.click(buttonName, tr);
    }

    /**
     * 在agent页中，点击正在运行的某一ip的功能按钮
     *
     * @param columnNum  agentIp所在列号（从0开始）
     * @param buttonName 待点击的按钮名称
     */
    @When("^the column is \"([^\"]*)\" then i click the \"([^\"]*)\" button in agent page$")
    public void clickButtonInAgentPage(String columnNum, String buttonName) {
        WebElement tr = listPageUtils.getTrWithoutPaging(this.getAgentIp(columnNum));
        this.click(buttonName, tr);
    }

    private String getAgentIp(String columnNum) {
        Agent agent = new Agent();
        String ip = agent.getIp();
        Assert.assertNotNull("无正在运行的agent！", ip);
        String json = "{'column':'" + columnNum + "','name':'" + ip + "'}";
        return json;
    }

    /**
     * 在给定的table中查找某一元素并点击相应按钮
     *
     * @param dataName   要匹配的名称
     * @param tableName  table元素名称
     * @param buttonName 按钮名称
     */
    @Given("^the data name \"([^\"]*)\" in table \"([^\"]*)\" then i click the \"([^\"]*)\" button$")
    public void clickButtonWithGivenName(String dataName, String tableName, String buttonName) {
        WebElement table = GetElementFromPage.getWebElementWithName(tableName);
        WebElement tr = listPageUtils.findName(dataName, table);
        this.click(buttonName, tr);
    }

    /**
     * 判断列表页行的操作选项都有哪些
     *
     * @param dataName 元素名称 字符串：第一列所要匹配的名称，json：{'column':'start 0','name':''}
     * @param result   {'column':'按钮所在列数，1开始','name':'操作按钮名称 空格分开'}
     */
    @And("^the data name is \"([^\"]*)\" then i will see \"([^\"]*)\" button$")
    public void checkButton(String dataName, String result) {
        WebElement tr = listPageUtils.getTr(dataName);
        Assert.assertTrue(tr.getText().contains(result));
    }

    /**
     * 点击对应行的按钮
     *
     * @param buttonName
     * @param tr
     */
    private void click(String buttonName, WebElement tr) {
        String xpath;
        if (pagingInfo.checkUrl() || webDriver.getCurrentUrl().contains("/app/list/")) {
            xpath = ".//span[contains(text(),'" + buttonName + "')]";
        } else if ("详情".equals(buttonName)) {
            xpath = ".//span[contains(text(),'" + buttonName + "')]";
        } else {
            xpath = ".//a[text()='" + buttonName + "']";
        }
        List<WebElement> button = tr.findElements(By.xpath(xpath));
        ((JavascriptExecutor) webDriver).executeScript("arguments[0].click()", button.get(0));
    }

    /**
     * 点击详情页
     *
     * @param name 若为json格式{'column':'start 0','name':''}
     */
    @Given("^I click the detail which name is \"([^\"]*)\"$")
    public void clickName(String name) {
        String xpath;
        WebElement tr;

        if (!JsonStringPaser.isJson(name)) {
            tr = listPageUtils.findName(name);
            if (pagingInfo.checkUrl()) {
                xpath = ".//span[contains(text(),'" + name + "')]";
            }
            else if (webDriver.getCurrentUrl().contains("/sources/input/agent/")) {
                xpath = ".//span[contains(text(),'" + name + "')]";
            }
            else {
                xpath = ".//a";
            }
        } else {
            Map<String, Object> map = JsonStringPaser.json2Stirng(name);
            String text = map.get("name").toString();
            int columnNum = Integer.parseInt(map.get("column").toString());
            tr = listPageUtils.getRowWithColumnNum(text, columnNum);
            if (pagingInfo.checkUrl()) {
                xpath = ".//span[contains(text(),'" + text + "')]";
            } else {
                xpath = ".//a";
            }
        }
        tr.findElement(By.xpath(xpath)).click();
    }

    /**
     * 在agent页中，点击某一ip的详情页
     *
     * @param columnNum 列名称（从0开始）
     */
    @Given("^I click the detail which column is \"([^\"]*)\" in agent page$")
    public void clickDetailNameInAgentPage(String columnNum) {
        String json = this.getAgentIp(columnNum);
        this.clickName(json);
    }


    /**
     * 读取配置文件获取名称并点击详情
     *
     * @param json
     */
    @And("^I click the detail with properties \"([^\"]*)\"$")
    public void iClickTheDetailWithProperties(String json) {
        String xpath;
        WebElement tr;
        ConfigManager config = new ConfigManager();
        // 非json格式
        if (!JsonStringPaser.isJson(json)) {
            String name = config.get(json);
            tr = listPageUtils.findName(name);
            xpath = ".//span[contains(text(),'" + name + "')]";
        } else {
            Map<String, Object> map = JsonStringPaser.json2Stirng(json);
            int columnNum = Integer.parseInt(map.get("column").toString());
            String text = map.get("name").toString();
            String name = config.get(text);
            tr = listPageUtils.getRowWithColumnNum(name, columnNum);
            xpath = ".//span[contains(text(),'" + name + "')]";
        }
        tr.findElement(By.xpath(xpath)).click();
    }

    /**
     * 日志展现中用到
     *
     * @param dataName
     * @param className
     */
    @Then("^make element \"([^\"]*)\" change to \"([^\"]*)\"$")
    public void clickButtonWithClassName(String dataName, String className) {
        WebElement element = webDriver.findElement(By.className("el-table__body"));
        List<WebElement> trList = element.findElements(By.tagName("tr"));
        String xpath = ".//i";

        for (WebElement tr : trList) {
            List<WebElement> tdList = tr.findElements(By.tagName("td"));
            if (tdList.get(2).getText().equals(dataName)) {
                WebElement star = tdList.get(1).findElement(By.xpath(xpath));
                if (!star.getAttribute("class").contains(className))
                    star.click();
                return;
            }
        }
    }

    /**
     * 租户管理中点击对应的按钮
     *
     * @param dataName
     * @param labelName
     */
    @When("^the data name is \"([^\"]*)\" then i click the label \"([^\"]*)\"$")
    public void clickLabelWithGivenName(String dataName, String labelName) {
        WebElement tr = listPageUtils.getTr(dataName);
        this.clickLabel(labelName, tr);
    }

    private void clickLabel(String labelName, WebElement tr) {
        String xpath = ".//label[contains(text(),'" + labelName + "')]";
        WebElement button = tr.findElement(By.xpath(xpath));
        button.click();
    }

    /**
     * 判断某一列为某一值时另一列的值是否符合预期
     *
     * @param baseValue    基准列 {'column':'start from 1','name':''}
     * @param compareValue 要比较的列 {'column':'start from 1','name':''}
     */
    @When("^the data name is \"([^\"]*)\" then the result is \"([^\"]*)\"$")
    public void verifyData(String baseValue, String compareValue) {
        Map<String, Object> baseValueMap = JsonStringPaser.json2Stirng(baseValue);
        Map<String, Object> compareValueMap = JsonStringPaser.json2Stirng(compareValue);

        for (int i = 0; i < pagingInfo.getTotalPage(); i++) {
            if (i != 0) {
                pagingInfo.getNextPage().click();
            }
            String xpath = "//td[@class='el-table_1_column_" + baseValueMap.get("column") + "']";
            List<WebElement> dataList = webDriver.findElements(By.xpath(xpath));

            for (WebElement element : dataList) {
                if (element.getText().equals(baseValueMap.get("name"))) {
                    String path = ".//following-sibling::td[@class='el-table_1_column_" + compareValueMap.get("column") + "']";
                    String actualText = element.findElement(By.xpath(path)).getText();
                    Assert.assertEquals(compareValueMap.get("name"), actualText);
                }
            }
        }
    }

    /**
     * 点击每一页的某个元素
     *
     * @param buttonName 元素名称
     */
    @And("^I click the \"([^\"]*)\" button in each page$")
    public void iClickTheButtonInEachPage(String buttonName) {
        for (int i = 0; i < pagingInfo.getTotalPage(); i++) {
            if (i != 0)
                pagingInfo.getNextPage().click();
            WebElement element = GetElementFromPage.getWebElementWithName(buttonName);
            element.click();
        }
    }

    /**
     * 关闭或开启禁用开关
     *
     * @param name   名称
     * @param status 状态 open/close
     */
    @When("^the data name is \"([^\"]*)\" then I \"([^\"]*)\" the switch$")
    public void operateSwitch(String name, String status) {
        WebElement tr = listPageUtils.getTr(name);
        WebElement label = tr.findElement(By.xpath(".//button"));
        String labelAttribute = label.getAttribute("aria-checked");
        if (status.equals("close") && labelAttribute.contains("true") || status.equals("open") && labelAttribute.contains("false")) {
            label.click();
        }
    }

    /**
     * 查看禁用/启用按钮是否为禁用/启用状态
     *
     * @param name   名称
     * @param status 状态 close/open
     */
    @Then("^I will see the element \"([^\"]*)\" is \"([^\"]*)\"$")
    public void verifySwitchStatus(String name, String status) {
        WebElement tr = listPageUtils.getTr(name);
        WebElement label = tr.findElement(By.xpath(".//button"));
        String labelAttribute = label.getAttribute("aria-checked");
        Assert.assertTrue(status.equals("close") && labelAttribute.contains("false") || status.equals("open") && labelAttribute.contains("true"));
    }

    /**
     * 勾选/取消勾选弹出框中的全选按钮
     *
     * @param status 状态 check/uncheck
     * @param name   名称
     */
    @And("^I \"([^\"]*)\" the checkbox which name is \"([^\"]*)\" in tiny table$")
    public void checkboxInTinyTable(String status, String name) {
        WebElement tr = listPageUtils.getTinyTr("{'column':'1','name':'" + name + "'}");
        WebElement checkbox = tr.findElement(By.xpath(".//label"));
        String currentStatus = checkbox.getAttribute("class");
        if (currentStatus.contains("checked") && "uncheck".equals(status) || !currentStatus.contains("checked") && "check".equals(status)) {
            checkbox.click();
        }
    }

    /**
     * 查看弹出框中的全选按钮是否为不可点击状态
     *
     * @param name 名称
     */
    @Then("^I will see the checkbox in tiny table before \"([^\"]*)\" is disabled$")
    public void assertDisabled(String name) {
        WebElement tr = listPageUtils.getTinyTr("{'column':'1','name':'" + name + "'}");
        WebElement checkbox = tr.findElement(By.xpath(".//label"));
        Assert.assertTrue(checkbox.getAttribute("class").contains("ant-checkbox-wrapper-disabled"));
    }

    /**
     * 授权页面勾选权限
     *
     * @param status    勾选checked/取消勾选unchecked
     * @param functions 想要勾选的权限名称
     * @param name      想要授权的数据名称
     */
    @When("^I \"([^\"]*)\" function \"([^\"]*)\" from the auth table which name is \"([^\"]*)\"$")
    public void clickAuthFunction(String status, List<String> functions, String name) {
        String url = webDriver.getCurrentUrl();
        String precedingXpath;
        if (url.contains("/account/roles/assign/")) {
            precedingXpath = "./preceding-sibling::span";
        } else {
            precedingXpath = "./preceding-sibling::label";
        }
        WebElement tr = listPageUtils.getRowWithoutTotalPage(name);
        for (String function : functions) {
            WebElement functionButton = tr.findElement(By.xpath(".//span[contains(text(),'" + function + "')]"));
            String functionClass = functionButton.findElement(By.xpath(precedingXpath)).getAttribute("class");
            if (functionClass.contains("checked") && "unchecked".equals(status) || !functionClass.contains("checked") && "checked".equals(status)) {
                functionButton.click();
            }
        }
    }

    /**
     * 点击列表页某条数据的某一按钮，无分页
     *
     * @param name       数据名称
     * @param buttonName 按钮名称
     */
    @When("^the data name is \"([^\"]*)\" then I click the \"([^\"]*)\" button without total page$")
    public void clickButtonWithoutTotalPage(String name, String buttonName) {
        WebElement tr = listPageUtils.getRowWithoutTotalPage(name);
        WebElement button = tr.findElement(By.xpath(".//span[text()='" + buttonName + "']/ancestor::button"));
        button.click();
    }

    /**
     * 已存搜索中标记为星标
     *
     * @param name 数据名称
     */
    @Then("^I click the star before \"([^\"]*)\" in saved search$")
    public void iClickTheStarBeforeInSavedSearch(String name) {
        WebElement tr = listPageUtils.getRowWithoutTotalPage(name);
        WebElement star = tr.findElement(By.xpath(".//i"));
        star.click();
    }

    /**
     * 验证列表页的禁用按钮是否处于不可修改状态
     *
     * @param name 数据名称
     */
    @Then("^I will see the switch button before \"([^\"]*)\" is disabled$")
    public void checkSwitch(String name) {
        WebElement tr = listPageUtils.getTr(name);
        WebElement switchButton = tr.findElement(By.xpath(".//button"));
        Assert.assertFalse(switchButton.isEnabled());
    }

    /**
     * 在仪表盘中，根据图表标题及要点击按钮的class来点击元素
     *
     * @param chartTitle  图表标题
     * @param buttonClass 按钮classname
     */
    @When("^the chart title is \"([^\"]*)\" then I click the button which classname is \"([^\"]*)\" in dashboard$")
    public void clickButtonInDashboard(String chartTitle, String buttonClass) {
        String xpath = "//span[contains(text(),'" + chartTitle + "')]/ancestor::span/following-sibling::div//*[@class='" + buttonClass + "']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        element.click();
    }
}
