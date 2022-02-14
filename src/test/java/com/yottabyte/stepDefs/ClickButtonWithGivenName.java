package com.yottabyte.stepDefs;

import com.yottabyte.config.ConfigManager;
import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.*;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.*;

import java.util.List;
import java.util.Map;

import static java.lang.Thread.sleep;

/**
 * 列表页中对表格的操作
 */
public class ClickButtonWithGivenName {

    private WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
    Paging pagingInfo = new Paging();
    ListPageUtils listPageUtils = new ListPageUtils();
    private DropdownUtils dropdownUtils = new DropdownUtils();

    /**
     * 寻找对应名称的操作按钮并点击
     *
     * @param dataName   字符串：第一列所要匹配的名称，json：{'column':'start from 0','name':''}
     * @param buttonName 按钮名称
     */
    @When("^the data name is \"([^\"]*)\" then i click the \"([^\"]*)\" button$")
    public void clickButtonWithGivenName(String dataName, String buttonName) {
        try {
            WebElement tr = listPageUtils.getRow(dataName);
            this.click(buttonName, tr);
        } catch (org.openqa.selenium.StaleElementReferenceException exception) {
            try {
                WebElement tr = listPageUtils.getRow(dataName);
                this.click(buttonName, tr);
            } catch (org.openqa.selenium.StaleElementReferenceException exception2) {
                WebElement tr = listPageUtils.getRow(dataName);
                this.click(buttonName, tr);
            }
        }

    }

    /**
     * 在更多操作中寻找对应名称的操作按钮并点击
     *
     * @param dataName   字符串：第一列所要匹配的名称，json：{'column':'start from 0','name':''}
     * @param buttonName 按钮名称
     */
    @When("^the data name is \"([^\"]*)\" then i click the \"([^\"]*)\" button in more menu$")
    public void clickButtonInMoreMenuWithGivenName(String dataName, String buttonName) {
        try {
            WebElement tr = listPageUtils.getRow(dataName);
            WebElement button = tr.findElement(By.xpath(".//button[@yotta-test='operation-more-button']"));
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].click()", button);
            WebElement lastMenuList = dropdownUtils.getMenuList();
            List<WebElement> elements = lastMenuList.findElements(By.tagName("span"));
            if (buttonName != null && buttonName.trim().length() != 0) {
                for (WebElement e : elements) {
                    ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", e);
                    if (buttonName.equals(e.getText())) {
                        e.click();
                        break;
                    }
                }
            }


        } catch (org.openqa.selenium.StaleElementReferenceException exception) {
            WebElement tr = listPageUtils.getRow(dataName);
            WebElement button = tr.findElement(By.xpath(".//button[@yotta-test='operation-more-button']"));
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].click()", button);
            WebElement lastMenuList = dropdownUtils.getMenuList();
            List<WebElement> elements = lastMenuList.findElements(By.tagName("span"));
            if (buttonName != null && buttonName.trim().length() != 0) {
                for (WebElement e : elements) {
                    ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", e);
                    if (buttonName.equals(e.getText())) {
                        e.click();
                        break;
                    }
                }
            }
        }
    }

    /**
     * 寻找包含对应名称的操作按钮并点击
     *
     * @param dataName   字符串：第一列所要匹配的名称，json：{'column':'start from 0','name':''}
     * @param buttonName 按钮名称
     */
    @When("^the data name contains \"([^\"]*)\" then i click the \"([^\"]*)\" button$")
    public void clickButtonWithName(String dataName, String buttonName) {
        WebElement tr = listPageUtils.getContainsTr(dataName);
        List<WebElement> button = tr.findElements(By.xpath(".//span[contains(text(),'" + buttonName + "')]"));
        ((JavascriptExecutor) webDriver).executeScript("arguments[0].click()", button.get(0));
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
     * 寻找对应的操作按钮并点击，无分页【字段提取列表操作中读取已存日志】
     *
     * @param name       字符串：第一列所要匹配的名称，json：{'column':'start from 0','name':''}
     * @param buttonName 待点击的按钮名称
     */
    @When("^the data name is \"([^\"]*)\" then i click the \"([^\"]*)\" button without paging in config$")
    public void clickButtonWithoutPagingInConfig(String name, String buttonName) {
        WebElement tr = listPageUtils.getTrWithoutPagingInConfig(name);
        WebElement button = tr.findElement(By.xpath("//span[text()='" + buttonName + "']"));
        button.click();
    }

    /**
     * 在agent页中，点击正在运行的某一ip的功能按钮
     *
     * @param columnNum  agentIp所在列号（从0开始）
     * @param buttonName 待点击的按钮名称
     */
    @When("^the column is \"([^\"]*)\" then i click the \"([^\"]*)\" button in agent page$")
    public void clickButtonInAgentPage(String columnNum, String buttonName) {
        String json = this.getAgentIp(columnNum);
        WebElement table = webDriver.findElement(By.xpath("(//tbody)"));
        Map<String, Object> map = JsonStringPaser.json2Stirng(json);
        int num = 0;
        for (WebElement tr : table.findElements(By.xpath("./tr"))) {
            num++;
            if (tr.getText().contains(map.get("name").toString())) {
                break;
            }
        }
        WebElement tr = webDriver.findElement(By.xpath("(//tbody/tr)[" + num + "]"));
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
        WebElement tr = listPageUtils.getRowWithoutPaging(dataName, table);
        this.click(buttonName, tr);
    }

    @Given("^the data name in beats table \"([^\"]*)\" then i click the \"([^\"]*)\" button$")
    public void clickBeatsButtonWithGivenName(String tableName, String buttonName) {
        Agent agent = new Agent();
        String ip = agent.getIp();
        String dataName = ip + ":" + "299";
        WebElement table = GetElementFromPage.getWebElementWithName(tableName);
        WebElement tr = listPageUtils.getRowWithoutPaging(dataName, table);
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
        WebElement tr = listPageUtils.getRow(dataName);
        Assert.assertTrue("实际值：" + tr.getText(), tr.getText().contains(result));
    }

    /**
     * 点击对应行的按钮
     *
     * @param buttonName
     * @param tr
     */
    private void click(String buttonName, WebElement tr) {
        String xpath;
        if (webDriver.getCurrentUrl().contains("/app/list/") || webDriver.getCurrentUrl().contains("/app/siem/assets/") || webDriver.getCurrentUrl().contains("/reports/template/") ||(webDriver.getCurrentUrl().contains("/reports/") && !("编辑".equals(buttonName)))) {
            // xpath = ".//span[contains(text(),'" + buttonName + "')][not(@class)]";
            xpath = ".//span[text()='" + buttonName + "']";
        } else if ("详情".equals(buttonName)) {
            xpath = ".//span[contains(text(),'" + buttonName + "')]";
        } else if (webDriver.getCurrentUrl().contains("/sources/input/agent/") ||webDriver.getCurrentUrl().contains("/agent/agentgroup/") || webDriver.getCurrentUrl().contains("/agent/groupcollect/")) {
            xpath = ".//a[text()='" + buttonName + "']";
        } else {
            xpath = ".//span[text()='" + buttonName + "']";
//            xpath = ".//a[text()='" + buttonName + "']";
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
            tr = listPageUtils.getRowWithName(name);
        } else {
            Map<String, Object> map = JsonStringPaser.json2Stirng(name);
            name = map.get("name").toString();
            int columnNum = Integer.parseInt(map.get("column").toString());
            tr = listPageUtils.getRowWithColumnNum(name, columnNum);
        }

        if (webDriver.getCurrentUrl().contains("/sources/input/agent/")) {
            xpath = "(.//span[contains(text(),'" + name + "')])[2]";
        } else if (webDriver.getCurrentUrl().contains("/dashboard/")) {
            xpath = ".//span[contains(text(),'" + name + "')]";
        } else if (webDriver.getCurrentUrl().contains("/topology/")) {
            xpath = ".//span[contains(text(),'" + name + "')]";
        } else if (webDriver.getCurrentUrl().contains("/knowledge/")) {
            xpath = ".//span[contains(text(),'" + name + "')]";
        } else {
            xpath = ".//span";
        }

//      tr.findElement(By.xpath(xpath)).click();
        WebElement element = tr.findElement(By.xpath(xpath));
        ClickEvent.clickUnderneathButton(element);
    }

    /**
     * 点击定时任务详情页
     *
     * @param name 若为json格式{'name':''}
     */
    @Given("^I click the which name is \"([^\"]*)\"$")
    public void clickTaskName(String name) {
        String xpath;
        xpath = ".//span[contains(text(),'" + name + "')]";
        WebElement e = webDriver.findElement(By.xpath(xpath));
        e.click();
    }

    /**
     * 点击已存搜索列表页
     *
     * @param name
     */
    @Given("^I click the which saved name is \"([^\"]*)\"$")
    public void clickSavedSearchName(String name) {
        String xpath;
        xpath = ".//span[contains(text(),'" + name + "')]/parent::a[@yotta-test='search-load_savedsearch-button']";
        WebElement e = webDriver.findElement(By.xpath(xpath));
        e.click();
    }

    /**
     * 点击已存搜索列表页
     *
     * @param name
     */
    @Given("^I click the which saved name is \"([^\"]*)\" on saved page$")
    public void clickSavedSearchNameOnSavedPage(String name) {
        String xpath;
        xpath = ".//span[contains(text(),'" + name + "')]/parent::a";
        WebElement e = webDriver.findElement(By.xpath(xpath));
        e.click();
    }

    /**
     * 点击已存搜索详情页
     *
     * @param name 若为json格式{'name':''}
     */
    @Then("^I click the detail which name is \"([^\"]*)\" in saved search$")
    public void iClickTheDetailWhichNameIsInSavedSearch(String name) {
        WebElement tr = listPageUtils.getTrWithoutPagingInConfig(name);
        WebElement star = tr.findElement(By.xpath("//td[@class='yotta-table-cell yotta-table-cell-ellipsis']//span[text()='" + name + "']"));
        star.click();
    }

    /**
     * 在agent页中，点击某一ip的详情页
     *
     * @param columnNum 列名称（从0开始）
     */
    @Given("^I click the detail which column is \"([^\"]*)\" in agent page$")
    public void clickDetailNameInAgentPage(String columnNum) {
        String json = this.getAgentIp(columnNum);
        WebElement table = webDriver.findElement(By.xpath("(//tbody)"));
        Map<String, Object> map = JsonStringPaser.json2Stirng(json);
        WebElement tr = listPageUtils.getRowWithoutPaging(map.get("name").toString(), table);
        int num = Integer.parseInt(columnNum) + 1;
        tr.findElement(By.xpath("(./td)[" + num + "]//span[contains(text(),'192')]")).click();
    }
    @Given("^I click the detail which name is \"([^\"]*)\" in agent page")
    public void clickNameInAgentPage(String dataname){
        WebElement tr=webDriver.findElement(By.xpath("//span[text()='192.168.1."+dataname+"']"));
       tr.click();

    }


    /**
     * siem资产管理页面寻找对应的操作按钮并点击
     *
     * @param dataName   字符串：第一列所要匹配的名称，json：{'column':'start from 0','name':''}
     * @param buttonName 按钮名称
     */
    @When("^the data name is \"([^\"]*)\" then i click the \"([^\"]*)\" button in siem page$")
    public void clickDetailNameInSiemPage(String dataName, String buttonName) {
        WebElement table = webDriver.findElement(By.xpath("//tbody"));
        Map<String, Object> map = JsonStringPaser.json2Stirng(dataName);
        String name = map.get("name").toString();
        int columnNum = Integer.parseInt(map.get("column").toString());
        WebElement tr = listPageUtils.getRowWithColumnNum(name, columnNum, table);
        this.click(buttonName, tr);
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
            tr = listPageUtils.getRowWithName(name);
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
        WebElement tr = listPageUtils.getRow(dataName);
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
        WebElement tr = listPageUtils.getRow(name);
        WebElement element = tr.findElement(By.xpath(".//input[@type='checkbox']"));
        String selected = element.isSelected() ? "open" : "close";
        if (!status.equals(selected)) {
            ClickEvent.clickUnderneathButton(element);
        }
    }

    /**
     * 点击对应行的“+/-”按钮
     *
     * @param name   名称
     * @param action 操作 expand(+)/close(-)
     */
    @When("^the data name is \"([^\"]*)\" then I \"([^\"]*)\" the item$")
    public void operateExpand(String name, String action) {
        WebElement tr = listPageUtils.getRow(name);
        WebElement element = tr.findElement(By.xpath(".//span[contains(@class,'expansion')]//span[@role='img']"));
        String current_label = element.getAttribute("aria-label");
        String status = current_label.equals("Add") ? "close" : "expand";
        if (!action.equals(status)) {
            ClickEvent.clickUnderneathButton(element);
        }
    }

    /**
     * 点击对应行的“+/-”按钮
     *
     * @param name   名称
     * @param action 操作 expand(+)/close(-)
     */
    @When("^the dataset is \"([^\"]*)\" then I \"([^\"]*)\" the item$")
    public void operateExpandDataset(String name, String action) {
        WebElement element = webDriver.findElement(By.xpath("//span[text()='" + name + "']//ancestor::div[contains(@class,'content')]//span[contains(@class,'expansion')]//span[@role='img']"));
        String current_label = element.getAttribute("aria-label");
        String status = current_label.equals("Add") ? "close" : "expand";
        if (!action.equals(status)) {
            ClickEvent.clickUnderneathButton(element);
        }
    }

// 3.6 版本
//    /**
//     * 关闭或开启禁用开关
//     *
//     * @param name   名称
//     * @param status 状态 open/close
//     */
//    @When("^the data name is \"([^\"]*)\" then I \"([^\"]*)\" the switch$")
//    public void operateYottaSwitch(String name, String status) {
//        WebElement tr = listPageUtils.getRow(name);
//        WebElement label = tr.findElement(By.xpath(".//button"));
//        String labelAttribute = label.getAttribute("aria-checked");
//        if (status.equals("close") && labelAttribute.contains("true") || status.equals("open") && labelAttribute.contains("false")) {
//            label.click();
//        }
//    }

    @Given("^the data name in agent beats table \"([^\"]*)\" then i click the \"([^\"]*)\" switch")
    public void BeatsoperateSwitch(String tableName, String status) {
        Agent agent = new Agent();
        String ip = agent.getIp();
        String dataName = ip + ":" + "299";
        WebElement table = GetElementFromPage.getWebElementWithName(tableName);
        WebElement tr = listPageUtils.getRowWithoutPaging(dataName, table);
        WebElement label = tr.findElement(By.xpath(".//button"));
        String labelAttribute = label.getAttribute("aria-checked");
        if (status.equals("close") && labelAttribute.contains("true") || status.equals("open") && labelAttribute.contains("false")) {
            label.click();
        }
    }


    /**
     * 关闭或开启禁用agent数据源开关
     *
     * @param dataName  要匹配的名称
     * @param tableName table元素名称
     * @param status    状态 open/close
     */
    @Given("^the data name \"([^\"]*)\" in agent table \"([^\"]*)\" then i click the \"([^\"]*)\" switch")
    public void operateAgentSwitch(String dataName, String tableName, String status) {
        WebElement table = GetElementFromPage.getWebElementWithName(tableName);
        WebElement tr = listPageUtils.getRowWithoutPaging(dataName, table);
        WebElement label = tr.findElement(By.xpath(".//label/span"));
        String selected = label.isSelected() ? "enable" : "disable";
        if (!selected.equals(status)) {
            ClickEvent.clickUnderneathButton(label);
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
        WebElement tr = listPageUtils.getRow(name);
        WebElement element = tr.findElement(By.xpath(".//input[@type='checkbox']"));
        String selected = element.isSelected() ? "open" : "close";
        Assert.assertTrue(status.equals(selected));
    }

    /**
     * 勾选/取消勾选弹出框中的全选按钮
     *
     * @param status 状态 check/uncheck
     * @param name   名称
     */
    @And("^I \"([^\"]*)\" the checkbox which name is \"([^\"]*)\" in tiny table$")
    public void checkboxInTinyTable(String status, String name) {
        WebElement tr = listPageUtils.getTinyTr("{'column':'0','name':'" + name + "'}");
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
        Assert.assertTrue(checkbox.getAttribute("class").contains("yotta-checkbox-disabled"));
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
        // WebElement tr = listPageUtils.getRowWithoutTotalPage(name);
        // WebElement star = tr.findElement(By.xpath(".//span"));
        WebElement tr = listPageUtils.getTrWithoutPagingInConfig(name);
        WebElement star = tr.findElement(By.xpath(".//span[@yotta-test='search-follow_field-icon']"));
        star.click();
    }

    @Then("^I click the star before \"([^\"]*)\" in saved search list$")
    public void iClickTheStarBeforeInSavedSearchList(String name) {
        WebElement tr = listPageUtils.getTrWithoutPagingInConfig(name);
        WebElement star = tr.findElement(By.xpath("//tbody/tr/td[1]/span"));
        star.click();
    }

    /**
     * 验证列表页的禁用按钮是否处于不可修改状态
     *
     * @param name 数据名称
     */
    @Then("^I will see the switch button before \"([^\"]*)\" is disabled$")
    public void checkSwitch(String name) {
        WebElement tr = listPageUtils.getRow(name);
        WebElement switchButton = tr.findElement(By.xpath(".//button"));
        Assert.assertFalse(!switchButton.isEnabled());
    }


    /**
     * 查看checkbox的状态
     *
     * @param status       checked/unchecked
     * @param name         基准名称
     */
    @Then("^I will see the checkbox with text \"([^\"]*)\" is \"([^\"]*)\"$")
    public void checkCheckboxDisabled(String name, String status) {
        WebElement checkBox = webDriver.findElement(By.xpath("//*[text()='" + name + "']//ancestor::label[1]"));
        String currentStatus = checkBox.getAttribute("class");
        Assert.assertTrue((currentStatus.contains("checked") && "checked".equals(status)) || (!currentStatus.contains("checked") && "unchecked".equals(status)));
    }

    /**
     * 在仪表盘中，根据图表标题及要点击按钮的class来点击元素
     *
     * @param chartTitle  图表标题
     * @param buttonClass 按钮classname
     */
    @When("^the chart title is \"([^\"]*)\" then I click the button which classname is \"([^\"]*)\" in dashboard$")
    public void clickButtonInDashboard(String chartTitle, String buttonClass) {
        String xpath = "//div[text()='" + chartTitle + "']/following-sibling::div//*[@class='" + buttonClass + "']";
        WebElement element = webDriver.findElement(By.xpath(xpath));
        ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView(false);", element);
        ((JavascriptExecutor) webDriver).executeScript("arguments[0].click()", element);
    }

    /**
     * 勾选弹出框中，特定功能前面的checkbox，比如勾选授权弹框中某一数据的读取权限
     *
     * @param status       check/uncheck
     * @param functionName 可为list，需要勾选按钮的名称
     * @param name         基准名称
     */
    @When("^I \"([^\"]*)\" the function \"([^\"]*)\" which name is \"([^\"]*)\" in tiny table$")
    public void iTheFunctionWhichNameIsInTinyTable(String status, List<String> functionName, String name) {
        WebElement tr = listPageUtils.getTinyTr("{'column':'0','name':'" + name + "'}");
        for (String function : functionName) {
            WebElement checkbox = tr.findElement(By.xpath(".//span[text()='" + function + "']/preceding-sibling::label"));
            String currentStatus = checkbox.getAttribute("class");
            if (currentStatus.contains("checked") && "uncheck".equals(status) || !currentStatus.contains("checked") && "check".equals(status)) {
                checkbox.click();
            }
        }
    }

    /**
     * 点击在搜索页中已存搜索弹窗对应数据的按钮
     *
     * @param function 按钮名称
     * @param name     数据名称
     */
    @And("^\"([^\"]*)\" the data \"([^\"]*)\" in tiny saved search$")
    public void operateDataInTinySavedSearch(String function, String name) {
        WebElement table = webDriver.findElement(By.xpath("(//table[@yotta-test='search-savedsearch-table']) | ((//table[contains(@class,'yotta-table')])[last()])"));
        WebElement tr = listPageUtils.getRowWithoutPaging(name, table);
        this.click(function, tr);
    }

    @When("^the data name is \"([^\"]*)\" then I click the \"([^\"]*)\" button in auth table$")
    public void theDataNameIsThenIClickTheButtonInAuthTable(String name, String buttonName) {
        WebElement tr = listPageUtils.getRowWithoutTotalPage(name);
        WebElement button = tr.findElement(By.xpath(".//span[text()='" + buttonName + "']"));
        button.click();
    }


    /**
     * 在更多操作中寻找对应名称的操作按钮并点击
     *
     * @param dataName   字符串：第一列所要匹配的名称，json：{'column':'start from 0','name':''}
     * @param buttonName 按钮名称
     */
    @When("^the incident data name is \"([^\"]*)\" then i click the \"([^\"]*)\" button in more menu$")
    public void clickButtonInMoreMenuWithGivenIncidentName(String dataName, String buttonName) {
        try {
            WebElement tr = listPageUtils.getRow(dataName);
            WebElement button = tr.findElement(By.xpath(".//button[@yotta-test='incident-more-button']"));
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].click()", button);
            WebElement lastMenuList = dropdownUtils.getIncidentMenuList();
            List<WebElement> elements = lastMenuList.findElements(By.tagName("span"));
            if (buttonName != null && buttonName.trim().length() != 0) {
                for (WebElement e : elements) {
                    ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", e);
                    if (buttonName.equals(e.getText())) {
                        e.click();
                        break;
                    }
                }
            }


        } catch (org.openqa.selenium.StaleElementReferenceException exception) {
            WebElement tr = listPageUtils.getRow(dataName);
            WebElement button = tr.findElement(By.xpath(".//button[@yotta-test='incident-more-button']"));
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].click()", button);
            WebElement lastMenuList = dropdownUtils.getIncidentMenuList();
            List<WebElement> elements = lastMenuList.findElements(By.tagName("span"));
            if (buttonName != null && buttonName.trim().length() != 0) {
                for (WebElement e : elements) {
                    ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", e);
                    if (buttonName.equals(e.getText())) {
                        e.click();
                        break;
                    }
                }
            }
        }
    }

    /**
     * 在更多操作中单击列表项
     *
     * @param buttonName  列表项
     */
    @When("^in incident page i click the \"([^\"]*)\" button in more menu$")
    public void clickButtonInMoreMenuOnIncidentPage(String buttonName) {
        try {
            WebElement button = webDriver.findElement(By.xpath(".//button[@yotta-test='incident-more-button']"));
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].click()", button);
            WebElement lastMenuList = dropdownUtils.getIncidentPageMoreMenuList();
            List<WebElement> elements = lastMenuList.findElements(By.tagName("span"));
            if (buttonName != null && buttonName.trim().length() != 0) {
                for (WebElement e : elements) {
                    ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", e);
                    if (buttonName.equals(e.getText())) {
                        e.click();
                        break;
                    }
                }
            }

        } catch (org.openqa.selenium.StaleElementReferenceException exception) {
            WebElement button = webDriver.findElement(By.xpath(".//button[@yotta-test='incident-more-button']"));
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].click()", button);
            WebElement lastMenuList = dropdownUtils.getIncidentPageMoreMenuList();
            List<WebElement> elements = lastMenuList.findElements(By.tagName("span"));
            if (buttonName != null && buttonName.trim().length() != 0) {
                for (WebElement e : elements) {
                    ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", e);
                    if (buttonName.equals(e.getText())) {
                        e.click();
                        break;
                    }
                }
            }

        }
    }

    /**
     * 在更多操作中寻找双层列表中的子列表项
     *
     * @param subDataName 子列表项
     * @param buttonName  父列表项
     */
    @When("^in incident page i click the \"([^\"]*)\" and \"([^\"]*)\" button in more menu$")
    public void clickButtonInMoreMenuOnIncidentPage(String buttonName, String subDataName) {
            try {
                WebElement button = webDriver.findElement(By.xpath(".//button[@yotta-test='incident-more-button']"));
                ((JavascriptExecutor) webDriver).executeScript("arguments[0].click()", button);
                WebElement lastMenuList = dropdownUtils.getIncidentPageMoreMenuList();
                List<WebElement> elements = lastMenuList.findElements(By.tagName("span"));
                if (buttonName != null && buttonName.trim().length() != 0) {
                    for (WebElement e : elements) {
                        ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", e);
                        if (buttonName.equals(e.getText())) {
                            e.click();
                            break;
                        }
                    }
                }

                WebElement lastSubMenuList = dropdownUtils.getIncidentPageMoreMenuSubList();
                List<WebElement> subElements = lastSubMenuList.findElements(By.tagName("span"));
                if (subDataName != null && subDataName.trim().length() != 0) {
                    for (WebElement subE : subElements) {
                        ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", subE);
                        if (subDataName.equals(subE.getText())) {
                            subE.click();
                            break;
                        }
                    }
                }

            } catch (org.openqa.selenium.StaleElementReferenceException exception) {
                WebElement button = webDriver.findElement(By.xpath(".//button[@yotta-test='incident-more-button']"));
                ((JavascriptExecutor) webDriver).executeScript("arguments[0].click()", button);
                WebElement lastMenuList = dropdownUtils.getIncidentPageMoreMenuList();
                List<WebElement> elements = lastMenuList.findElements(By.tagName("span"));
                if (buttonName != null && buttonName.trim().length() != 0) {
                    for (WebElement e : elements) {
                        ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", e);
                        if (buttonName.equals(e.getText())) {
                            e.click();
                            break;
                        }
                    }
                }

                WebElement lastSubMenuList = dropdownUtils.getIncidentPageMoreMenuSubList();
                List<WebElement> subElements = lastSubMenuList.findElements(By.tagName("span"));
                if (subDataName != null && subDataName.trim().length() != 0) {
                    for (WebElement subE : subElements) {
                        ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", subE);
                        if (subDataName.equals(subE.getText())) {
                            subE.click();
                            break;
                        }
                    }
                }

            }
    }

    /**
     * 在更多操作中寻找双层列表中的子列表项
     *
     * @param subDataName 子列表项
     * @param buttonName  父列表项
     */
    @When("^in incident page i click 10 times the \"([^\"]*)\" and \"([^\"]*)\" button in more menu$")
    public void clickButtonInMoreMenuWithGivenIncidentPage(String buttonName, String subDataName) {
        WebElement table = pagingInfo.getTableList().get(0);
        List<WebElement> trList = table.findElements(By.tagName("tr"));
        for (WebElement tr : trList)
        {
            try {
                sleep(2000);
                WebElement button = tr.findElement(By.xpath(".//button[@yotta-test='incident-more-button']"));
                ((JavascriptExecutor) webDriver).executeScript("arguments[0].click()", button);
                WebElement lastMenuList = dropdownUtils.getIncidentPageMoreMenuList();
                List<WebElement> elements = lastMenuList.findElements(By.tagName("span"));
                if (buttonName != null && buttonName.trim().length() != 0) {
                    for (WebElement e : elements) {
                        ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", e);
                        if (buttonName.equals(e.getText())) {
                            e.click();
                            break;
                        }
                    }
                }

                sleep(2000);
                WebElement lastSubMenuList = dropdownUtils.getIncidentPageMoreMenuSubList();
                List<WebElement> subElements = lastSubMenuList.findElements(By.tagName("span"));
                if (subDataName != null && subDataName.trim().length() != 0) {
                    for (WebElement subE : subElements) {
                        ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", subE);
                        if (subDataName.equals(subE.getText())) {
                            subE.click();
                            break;
                        }
                    }
                }

            } catch (StaleElementReferenceException | InterruptedException exception) {
                WebElement button = tr.findElement(By.xpath(".//button[@yotta-test='incident-more-button']"));
                ((JavascriptExecutor) webDriver).executeScript("arguments[0].click()", button);
                WebElement lastMenuList = dropdownUtils.getIncidentPageMoreMenuList();
                List<WebElement> elements = lastMenuList.findElements(By.tagName("span"));
                if (buttonName != null && buttonName.trim().length() != 0) {
                    for (WebElement e : elements) {
                        ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", e);
                        if (buttonName.equals(e.getText())) {
                            e.click();
                            break;
                        }
                    }
                }

                WebElement lastSubMenuList = dropdownUtils.getIncidentPageMoreMenuSubList();
                List<WebElement> subElements = lastSubMenuList.findElements(By.tagName("span"));
                if (subDataName != null && subDataName.trim().length() != 0) {
                    for (WebElement subE : subElements) {
                        ((JavascriptExecutor) webDriver).executeScript("arguments[0].scrollIntoView();", subE);
                        if (subDataName.equals(subE.getText())) {
                            subE.click();
                            break;
                        }
                    }
                }

            }
        }
    }

    /**
     * 隐藏元素
     *
     */
    @And("^I hide the time picker popover$")
    public void hideItemDisplaying() {
        String str_selector = "[class='yotta-popover css-1shj747 yotta-time-picker-popover']";
        List<WebElement> list5 = webDriver.findElements(By.cssSelector(str_selector));
        for(WebElement curElement:list5)
        {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='none';", curElement);
        }
    }

    /**
     * 隐藏元素
     *
     */
    @And("^I hide the select menu$")
    public void hideSelectMenuDisplaying() {
        String str_selector = "[class='yotta-select-menu css-ncm03v yotta-resource-tag-select-menu']";
        List<WebElement> list = webDriver.findElements(By.cssSelector(str_selector));
        for(WebElement curElement:list)
        {
            ((JavascriptExecutor) webDriver).executeScript("arguments[0].style.display='none';", curElement);
        }
    }

    /**
     * 查看禁用/启用按钮是否为禁用/启用状态
     *
     * @param name   名称
     * @param status 状态 close/open
     */
    @Then("^I will see the checkbox \"([^\"]*)\" is \"([^\"]*)\"$")
    public void verifyCheckboxStatus(String name, String status) {
        WebElement element = GetElementFromPage.getWebElementWithName(name);
        String selected = element.isSelected() ? "open" : "close";
        Assert.assertTrue(status.equals(selected));
    }

}
