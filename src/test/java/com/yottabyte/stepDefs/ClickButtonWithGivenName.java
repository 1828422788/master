package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetLogger;
import cucumber.api.PendingException;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.List;

/**
 * 点击对应名称下的操作按钮
 * 找到名称相匹配的元素后不会继续查找
 */
public class ClickButtonWithGivenName {

    private WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 寻找对应的操作按钮并点击
     *
     * @param dataName   第一列所要匹配的名称
     * @param buttonName 按钮名称
     */
    @When("^the data name is \"([^\"]*)\" then i click the \"([^\"]*)\" button$")
    public void clickButtonWithGivenName(String dataName, String buttonName) {
        WebElement tr = this.findName(dataName);
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
    private WebElement findName(String name) {
        List<WebElement> tableList = webDriver.findElements(By.className("el-table__body"));
        if (tableList.size() == 1) {
            // 表体
            WebElement table = tableList.get(0);
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
        } else {
            return this.getSourcesGroupName(tableList, name);
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
     * @param name
     */
    @Given("^I click the detail which name is \"([^\"]*)\"$")
    public void clickName(String name) {
        String xpath = "//span[contains(text(),'" + name + "')]";
        WebElement tr = this.findName(name);
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
}
