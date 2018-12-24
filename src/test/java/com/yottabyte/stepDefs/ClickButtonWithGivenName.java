package com.yottabyte.stepDefs;

import com.yottabyte.entity.Paging;
import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import com.yottabyte.utils.GetPaging;
import com.yottabyte.utils.JsonStringPaser;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.List;
import java.util.Map;

/**
 * 点击对应名称下的操作按钮
 * 找到名称相匹配的元素后不会继续查找
 */
public class ClickButtonWithGivenName {

    private WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 寻找对应的操作按钮并点击
     *
     * @param dataName   字符串：第一列所要匹配的名称，json：{'column':'start 0','name':''}
     * @param buttonName 按钮名称
     */
    @When("^the data name is \"([^\"]*)\" then i click the \"([^\"]*)\" button$")
    public void clickButtonWithGivenName(String dataName, String buttonName) {
        WebElement tr = this.getTr(dataName);
        this.click(buttonName, tr);
    }

    @Given("^the data name \"([^\"]*)\" in table \"([^\"]*)\" then i click the \"([^\"]*)\" button$")
    public void clickButtonWithGivenName(String dataName, String tableName, String buttonName) {
        WebElement table = GetElementFromPage.getWebElementWithName(tableName);
        WebElement tr = this.findName(dataName, table);
        this.click(buttonName, tr);
    }

    /**
     * 点击对应行的按钮
     *
     * @param buttonName
     * @param tr
     */
    private void click(String buttonName, WebElement tr) {
        String xpath = ".//span[contains(text(),'" + buttonName + "')]";
        List<WebElement> button = tr.findElements(By.xpath(xpath));
        // 包含删除的按钮会有两个，因此需通过class属性去判断
        if (button.get(0).getAttribute("class").equals("")) {
            button.get(0).click();
        } else {
            button.get(1).click();
        }
    }

    /**
     * 禁用
     *
     * @param dataName
     */
    @Then("^I disabled the data \"([^\"]*)\"$")
    public void disableData(String dataName) {
        String xpath = "//span[contains(text(),'" + dataName + "')]/preceding-sibling::label";
        WebElement tr = this.findName(dataName);
        // 找到禁用按钮并点击
        tr.findElement(By.xpath(xpath)).click();
    }


    /**
     * 寻找name所在行
     *
     * @param name
     * @return 行元素
     */
    public WebElement findName(String name) {
        List<WebElement> tableList = webDriver.findElements(By.className("el-table__body"));
        if (tableList.size() == 1) {
            // 表体
            WebElement table = tableList.get(0);
            return this.getRow(name, table);
        } else {
            return this.getSourcesGroupName(tableList, name);
        }
    }

    private WebElement findName(String name, WebElement table) {
        return this.getRowWithoutPaging(name, table);
    }

    /**
     * 获取名称所在行
     *
     * @param name
     * @param table
     * @return
     */
    private WebElement getRow(String name, WebElement table) {
        int i = 0;
        while (i < this.getTotalPage()) {
            // 找到一行元素
            List<WebElement> trList = table.findElements(By.tagName("tr"));
            if (i != 0 && i <= this.getTotalPage() - 1)
                this.getNextPage().click();

            for (WebElement tr : trList) {
                if (tr.findElement(By.tagName("td")).getText().equals(name)) {
                    return tr;
                }
            }
            i++;
        }
        return null;
    }

    public WebElement getRowWithColumnNum(String name, int columnNum) {
        WebElement table = webDriver.findElement(By.className("el-table__body"));

        int i = 0;
        while (i < this.getTotalPage()) {
            // 找到一行元素
            List<WebElement> trList = table.findElements(By.tagName("tr"));
            if (i != 0 && i <= this.getTotalPage() - 1)
                this.getNextPage().click();

            for (WebElement tr : trList) {
                if (tr.findElements(By.tagName("td")).get(columnNum).getText().equals(name)) {
                    return tr;
                }
            }
            i++;
        }
        return null;
    }

    private WebElement getRowWithoutPaging(String name, WebElement table) {
        // 找到一行元素
        List<WebElement> trList = table.findElements(By.tagName("tr"));

        for (WebElement tr : trList) {
            if (tr.findElement(By.tagName("td")).getText().equals(name)) {
                return tr;
            }
        }
        return null;
    }

    private int getTotalPage() {
        // 分页标签
        List<WebElement> paging = webDriver.findElements(By.className("number"));
        // 总页数
        int totalPage = Integer.parseInt(paging.get(paging.size() - 1).getText());
        return totalPage;
    }

    private WebElement getNextPage() {
        // 下一页按钮
        WebElement nextPage = webDriver.findElement(By.className("btn-next"));
        return nextPage;
    }

    /**
     * 以下情况仅针对日志来源表格进行特殊处理
     *
     * @param tableList
     * @param name
     * @return
     */
    private WebElement getSourcesGroupName(List<WebElement> tableList, String name) {
        WebElement nameTable = tableList.get(1);
        WebElement operatorTable = tableList.get(2);

        List<WebElement> nameList = nameTable.findElements(By.tagName("tr"));

        int i = 0;
        while (i < this.getTotalPage()) {
            // 找到一行元素
            if (i != 0 && i <= this.getTotalPage() - 1)
                this.getNextPage().click();

            for (int index = 0; index < nameList.size(); index++) {
                String sourceName = nameList.get(index).findElement(By.tagName("td")).getText();
                if (sourceName.equals(name)) {
                    return operatorTable.findElements(By.tagName("tr")).get(index);
                }
            }
            i++;
        }
        return null;
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
            tr = this.findName(name);
            xpath = "//span[contains(text(),'" + name + "')]";
        } else {
            Map<String, Object> map = JsonStringPaser.json2Stirng(name);
            String text = map.get("name").toString();
            int columnNum = Integer.parseInt(map.get("column").toString());
            tr = this.getRowWithColumnNum(text, columnNum);
            xpath = "//span[contains(text(),'" + text + "')]";
        }
        tr.findElement(By.xpath(xpath)).click();
    }

    /**
     * 日志展现中用到
     *
     * @param dataName
     * @param className
     */
    @Then("^the data name is \"([^\"]*)\" then i click the button which className is \"([^\"]*)\"$")
    public void clickButtonWithClassName(String dataName, String className) {
        WebElement element = webDriver.findElement(By.className("el-table__body"));
        List<WebElement> trList = element.findElements(By.tagName("tr"));
        String xpath = ".//i[@class='" + className + "']";

        for (WebElement tr : trList) {
            List<WebElement> tdList = tr.findElements(By.tagName("td"));
            if (tdList.get(2).getText().equals(dataName)) {
                tr.findElement(By.xpath(xpath)).click();
                return;
            }
        }
    }

    /**
     * 弹出框的多选操作
     *
     * @param name
     */
    @And("^I click the \"([^\"]*)\" checkbox$")
    public void clickCheckBox(String name) {
        String xpath = ".//ancestor::td/preceding-sibling::td//label";
        WebElement tr = this.getRowWithColumnNum(name, 1);
        // 找到禁用按钮并点击
        tr.findElement(By.xpath(xpath)).click();
    }

    @When("^the data name contains \"([^\"]*)\" then i click the \"([^\"]*)\" button$")
    public void clickButtonWithBlurName(String name, String buttonName) {
        WebElement tr = this.findLikelyName(name);
        this.click(buttonName, tr);
    }

    private WebElement findLikelyName(String name) {
        WebElement tableList = webDriver.findElement(By.className("el-table__body"));
        int i = 0;
        while (i < this.getTotalPage()) {
            // 找到一行元素
            List<WebElement> trList = tableList.findElements(By.tagName("tr"));
            if (i != 0 && i <= this.getTotalPage() - 1)
                this.getNextPage().click();

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
        WebElement tr = this.findName(name);
        tr.findElement(By.xpath(xpath)).click();
    }

    @Then("^I will see the element \"([^\"]*)\" is disabled$")
    public void disabledElement(String elementName) {
        String xpath = "//span[contains(text(),'" + elementName + "')]/preceding-sibling::label/div[@class='el-switch__label el-switch__label--left']";
        WebElement tr = this.findName(elementName);
        WebElement button = tr.findElement(By.xpath(xpath));
        CheckButtonAttribute.checkIsDisplay(button);
    }

    /**
     * 租户管理中点击对应的按钮
     *
     * @param dataName
     * @param labelName
     */
    @When("^the data name is \"([^\"]*)\" then i click the label \"([^\"]*)\"$")
    public void clickLabelWithGivenName(String dataName, String labelName) {
        WebElement tr = this.getTr(dataName);
        this.clickLabel(labelName, tr);
    }

    private void clickLabel(String labelName, WebElement tr) {
        String xpath = ".//label[contains(text(),'" + labelName + "')]";
        WebElement button = tr.findElement(By.xpath(xpath));
        button.click();
    }

    private WebElement getTr(String dataName) {
        WebElement tr;
        if (!JsonStringPaser.isJson(dataName)) {
            tr = this.findName(dataName);
        } else {
            Map<String, Object> map = JsonStringPaser.json2Stirng(dataName);
            String name = map.get("name").toString();
            int columnNum = Integer.parseInt(map.get("column").toString());
            tr = this.getRowWithColumnNum(name, columnNum);
        }
        return tr;
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
        Paging paging = GetPaging.getPagingInfo();

        for (int i = 0; i < paging.getTotalPage(); i++) {
            if (i != 0) {
                paging.getNextPage().click();
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
        Paging paging = GetPaging.getPagingInfo();
        for (int i = 0; i < paging.getTotalPage(); i++) {
            if (i != 0)
                paging.getNextPage().click();
            WebElement element = GetElementFromPage.getWebElementWithName(buttonName);
            element.click();
        }
    }


    /**
     * 勾选或取消勾选名称前面的checkbox
     *
     * @param status   checked or unchecked
     * @param nameList
     * @author sxj
     */
    @And("^I \"([^\"]*)\" the label before \"([^\"]*)\"$")
    public void clickCheckLabel(String status, List<String> nameList) {
        for (String name : nameList) {
            String xpath = "//div[contains(text(),'" + name + "')]/ancestor::td/preceding-sibling::td//label";
            WebElement label = webDriver.findElement(By.xpath(xpath));
            WebElement span = label.findElement(By.xpath(".//span"));
            String attribute = span.getAttribute("class");
            if (attribute.contains("checked") && "unchecked".equals(status) || !attribute.contains("checked") && "checked".equals(status)) {
                label.click();
            }
        }
    }

    /**
     * 勾选或取消勾选checkbox（名称可直接点击）
     *
     * @param status   checked or unchecked
     * @param nameList
     */
    @When("^I \"([^\"]*)\" the checkbox which name is \"([^\"]*)\"$")
    public void clickCheckboxWithGivenName(String status, List<String> nameList) {
        for (String name : nameList) {
            String xpath = "//span[@class='el-checkbox__label'][text()='" + name + "']";
            WebElement label = webDriver.findElement(By.xpath(xpath));
            WebElement span = label.findElement(By.xpath(".//preceding-sibling::span"));
            String attribute = span.getAttribute("class");
            if (attribute.contains("checked") && "unchecked".equals(status) || !attribute.contains("checked") && "checked".equals(status)) {
                label.findElement(By.xpath(".//ancestor::label")).click();
            }
        }
    }
}
