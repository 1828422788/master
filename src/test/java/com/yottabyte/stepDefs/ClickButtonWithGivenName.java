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
     * @param dataName   字符串：第一列所要匹配的名称，json：{'column':'start 0','name':''}
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
     * @param propertyName 若为字符串：第一列所要匹配的名称，若为json：{'column':'start 0','name':''}
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
     * @param name       字符串：第一列所要匹配的名称，json：{'column':'start 0','name':''}
     * @param buttonName 按钮名称
     */
    @When("^the data name is \"([^\"]*)\" then i click the \"([^\"]*)\" button without paging$")
    public void clickButtonWithoutPaging(String name, String buttonName) {
        WebElement tr = listPageUtils.getTrWithoutPaging(name);
        this.click(buttonName, tr);
    }

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
        Map<String, Object> map = JsonStringPaser.json2Stirng(result);
        String className = "el-table_1_column_" + map.get("column");
        WebElement tr = listPageUtils.getTr(dataName);
        String actualText = tr.findElement(By.className(className)).getText();
        String expectText = map.get("name").toString();
        Assert.assertEquals(expectText, actualText);
    }

    /**
     * 从page页获取table
     *
     * @param dataName
     * @param result
     */
    @And("^I get the data \"([^\"]*)\" from page then I will see \"([^\"]*)\" button$")
    public void getDataFromPageAndCheck(String dataName, String result) {
        Map<String, Object> map = JsonStringPaser.json2Stirng(dataName);
        String name = map.get("name").toString();
        int column = Integer.parseInt(map.get("column").toString());

        WebElement table = GetElementFromPage.getWebElementWithName("Table");
        WebElement tr = listPageUtils.getRowWithoutPaging(name, column, table);

        Map<String, Object> resultMap = JsonStringPaser.json2Stirng(result);
        int resultColumn = Integer.parseInt(resultMap.get("column").toString());

        List<WebElement> tdList = tr.findElements(By.tagName("td"));
        String expectText = resultMap.get("name").toString();
        String actualText = tdList.get(resultColumn).getText();
        Assert.assertEquals(expectText, actualText);
    }

    /**
     * 点击对应行的按钮
     *
     * @param buttonName
     * @param tr
     */
    private void click(String buttonName, WebElement tr) {
        String xpath;
        if (pagingInfo.checkUrl()) {
            xpath = ".//span[contains(text(),'" + buttonName + "')]";
        } else {
            xpath = ".//a[contains(text(),'" + buttonName + "')]";
        }
        List<WebElement> button = tr.findElements(By.xpath(xpath));
        // 包含删除的按钮会有两个，因此需通过class属性去判断
//        if (button.get(0).getAttribute("class").equals("")) {
//            ((JavascriptExecutor) webDriver).executeScript("arguments[0].click()", button.get(0));
//        } else {
        ((JavascriptExecutor) webDriver).executeScript("arguments[0].click()", button.get(0));
//        }
    }

    @Given("^I close \"([^\"]*)\" without paging$")
    public void close(String dataName) {
        this.clickSwitch(dataName, "close");
    }

    @Given("^I open \"([^\"]*)\" without paging$")
    public void open(String dataName) {
        this.clickSwitch(dataName, "open");
    }

    /**
     * 切换状态 无分页
     *
     * @param dataName
     * @param action   open/close
     */
    private void clickSwitch(String dataName, String action) {
        String xpath = "//span[contains(text(),'" + dataName + "')]/preceding-sibling::label";
        WebElement tr = listPageUtils.findNameWithoutPaging(dataName);
        WebElement switchButton = tr.findElement(By.xpath(xpath + "/div[@class='el-switch__label el-switch__label--left']"));
        String status = switchButton.getAttribute("style");

        if ("open".equals(action) && status.contains("display") || "close".equals(action) && !status.contains("display"))
            tr.findElement(By.xpath(xpath)).click();
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
            xpath = ".//span[contains(text(),'" + name + "')]";
        } else {
            Map<String, Object> map = JsonStringPaser.json2Stirng(name);
            String text = map.get("name").toString();
            int columnNum = Integer.parseInt(map.get("column").toString());
            tr = listPageUtils.getRowWithColumnNum(text, columnNum);
            xpath = ".//span[contains(text(),'" + text + "')]";
        }
        tr.findElement(By.xpath(xpath)).click();
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

    @When("^the data name contains \"([^\"]*)\" then i click the \"([^\"]*)\" button$")
    public void clickButtonWithBlurName(String name, String buttonName) {
        WebElement tr = this.findLikelyName(name);
        this.click(buttonName, tr);
    }

    private WebElement findLikelyName(String name) {
        int totalPage = pagingInfo.getTotalPage();
        WebElement nextPage = pagingInfo.getNextPage();
        WebElement tableList = webDriver.findElement(By.className("el-table__body"));
        int i = 0;
        while (i < totalPage) {
            // 找到一行元素
            List<WebElement> trList = tableList.findElements(By.tagName("tr"));
            if (i != 0 && i <= totalPage - 1)
                nextPage.click();

            for (WebElement tr : trList) {
                if (tr.findElement(By.tagName("td")).getText().contains(name)) {
                    return tr;
                }
            }
            i++;
        }
        return null;
    }

    @Given("^I click the report detail which name is \"([^\"]*)\"$")
    public void clickReportDetail(String name) {
        String xpath = "//span[contains(text(),'" + name + "')][@class]";
        WebElement tr = listPageUtils.findName(name);
        tr.findElement(By.xpath(xpath)).click();
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
     * @param baseValue    {'column':'1','name':''}
     * @param compareValue {'column':'1','name':''}
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
     * 数据大屏列表页点击操作
     *
     * @param dataName
     * @param className
     */
    @When("^the galaxee name is \"([^\"]*)\" then I click the \"([^\"]*)\" button$")
    public void theGalaxeeNameIsThenIClickTheButton(String dataName, String className) {
        String xpath = "//div[@title='" + dataName + "']/preceding-sibling::div//*[@class='" + className + "']";
        WebElement button = webDriver.findElement(By.xpath(xpath));
        button.click();
    }

    /**
     * 关闭或开启禁用开关
     *
     * @param name
     * @param status open/close
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
     * @param name
     * @param status close/open
     */
    @Then("^I will see the element \"([^\"]*)\" is \"([^\"]*)\"$")
    public void verifySwitchStatus(String name, String status) {
        WebElement tr = listPageUtils.getTr(name);
        WebElement label = tr.findElement(By.xpath(".//button"));
        String labelAttribute = label.getAttribute("aria-checked");
        Assert.assertTrue(status.equals("close") && labelAttribute.contains("false") || status.equals("open") && labelAttribute.contains("true"));
    }
}
