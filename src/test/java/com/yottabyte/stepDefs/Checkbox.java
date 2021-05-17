package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.Agent;
import com.yottabyte.utils.JsonStringPaser;
import com.yottabyte.utils.ListPageUtils;
import com.yottabyte.utils.WaitForElement;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.List;
import java.util.Map;

/**
 * 对复选框的操作
 */
public class Checkbox {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
    ListPageUtils listPageUtils = new ListPageUtils();

    /**
     * 勾选或取消勾选名称前面的checkbox
     *
     * @param status   想要将复选框置为的状态，checked/unchecked
     * @param nameList 想要勾选/取消勾选的名称（支持传入list）
     */
    @And("^I \"([^\"]*)\" the label before \"([^\"]*)\"$")
    public void clickCheckLabel(String status, List<String> nameList) {
        for (String name : nameList) {
            String xpath = "//span[contains(text(),'" + name + "')]/preceding-sibling::label";
            WebElement label = webDriver.findElement(By.xpath(xpath));
            String attribute = label.getAttribute("class");
            if (attribute.contains("checked") && "unchecked".equals(status) || !attribute.contains("checked") && "checked".equals(status)) {
                label.click();
            }
        }
    }

    /**
     * 勾选某个名称后面的checkbox
     *
     * @param status   想要将复选框置为的状态，checked/unchecked
     * @param nameList 想要勾选/取消勾选的名称（支持传入list）
     */
    @And("^I \"([^\"]*)\" the label after \"([^\"]*)\"$")
    public void clickLabelAfterName(String status, List<String> nameList) {
        for (String name : nameList) {
            String xpath = "//label[text()='" + name + "']/following-sibling::div//label";
            WebElement label = webDriver.findElement(By.xpath(xpath));
            String attribute = label.getAttribute("class");
            if (attribute.contains("checked") && "unchecked".equals(status) || !attribute.contains("checked") && "checked".equals(status)) {
                label.click();
            }
        }
    }

    /**
     * 在列表页中勾选checkbox，支持批量勾选，可分页
     *
     * @param status   checked/unchecked
     * @param nameList 待操作的数据名称列表
     * @param num      名称所在列，从0开始
     */
    @And("^I \"([^\"]*)\" the checkbox in list which name is \"([^\"]*)\" in column \"([^\"]*)\"$")
    public void clickCheckBoxInList(String status, List<String> nameList, String num) {
        int columnNum = Integer.parseInt(num);
        List<WebElement> trList = webDriver.findElements(By.className("yotta-table-row"));
        while (true) {
            // 遍历列表页数据
            for (WebElement tr : trList) {
                List<WebElement> tdList = tr.findElements(By.tagName("td"));
                String tdText = tdList.get(columnNum).getText();
                // 遍历传递进来的名称列表，若匹配成功则点击前面的checkbox并从列表中移除该名称
                for (int i = 0; i < nameList.size(); i++) {
                    String name = nameList.get(i);
                    if (tdText.equals(name)) {
                        WebElement checkLabel = tr.findElement(By.xpath(".//label"));
                        String attribute = checkLabel.getAttribute("class");
                        if (attribute.contains("checked") && "unchecked".equals(status) || !attribute.contains("checked") && "checked".equals(status)) {
                            checkLabel.click();
                        }
                        nameList.remove(i);
                        break;
                    }
                }
                if (nameList.size() == 0) {
                    return;
                }
            }
            // 分页
            WebElement nextButton = webDriver.findElement(By.xpath("//span[contains(@class, 'yotta-icon-RightOutlined')]/parent::span"));
            String nextButtonAttr = nextButton.getAttribute("class");
            if (nextButtonAttr.contains("disabled")) {
                return;
            } else {
                nextButton.click();
                WaitForElement.waitUntilLoadingDisappear();
                trList = webDriver.findElements(By.className("yotta-table-row"));
            }
        }
    }


    /**
     * 勾选或取消勾选checkbox（名称可直接点击）
     *
     * @param status   想要将复选框置为的状态，checked/unchecked
     * @param nameList 想要勾选/取消勾选的名称（支持传入list）
     */
    @When("^I \"([^\"]*)\" the checkbox which name is \"([^\"]*)\"$")
    public void clickCheckboxWithGivenName(String status, List<String> nameList) {
        for (String name : nameList) {
            String xpath = "(//span[contains(text(),'" + name + "')])[last()]";
            WebElement label = webDriver.findElement(By.xpath(xpath));
            WebElement span = label.findElement(By.xpath(".//ancestor::label"));
            String attribute = span.getAttribute("class");
            if (attribute.contains("checked") && "unchecked".equals(status) || !attribute.contains("checked") && "checked".equals(status)) {
                label.findElement(By.xpath(".//ancestor::label")).click();
            }
        }
    }

    /**
     * 勾选或取消勾选checkbox（名称可直接点击）
     *
     * @param status   想要将复选框置为的状态，checked/unchecked
     * @param nameList 想要勾选/取消勾选的名称（支持传入list）
     */
    @When("^I \"([^\"]*)\" the checkbox which name equal \"([^\"]*)\"$")
    public void clickCheckboxWithEqualGivenName(String status, List<String> nameList) {
        for (String name : nameList) {
            String xpath = "(//span[text()='" + name + "'])[last()]";
            WebElement label = webDriver.findElement(By.xpath(xpath));
            WebElement span = label.findElement(By.xpath(".//ancestor::label"));
            String attribute = span.getAttribute("class");
            if (attribute.contains("checked") && "unchecked".equals(status) || !attribute.contains("checked") && "checked".equals(status)) {
                label.findElement(By.xpath(".//ancestor::label")).click();
            }
        }
    }

    /**
     * 判断列表页下checkbox的状态
     *
     * @param name      想要判断的名称
     * @param attribute 状态（enabled/disabled）
     */
    @Then("^I will see the checkbox in list before \"([^\"]*)\" is \"([^\"]*)\"$")
    public void checkAttribute(String name, String attribute) {
        ListPageUtils listPageUtils = new ListPageUtils();
        WebElement tr = listPageUtils.getRow(name);
        WebElement label = tr.findElement(By.xpath(".//button"));
        Assert.assertTrue("enabled".equals(attribute) && label.isEnabled() || "disabled".equals(attribute) && !label.isEnabled());
    }



    /**
     * 判断字段提取列表页下checkbox的状态
     *
     * @param name      想要判断的名称
     * @param attribute 状态（enabled/disabled）
     */
    @Then("^I will see the checkbox in list before \"([^\"]*)\" is \"([^\"]*)\" in configs$")
    public void checkAttributeInConfigs(String name, String attribute) {
        ListPageUtils listPageUtils = new ListPageUtils();
        WebElement tr = listPageUtils.getRow(name);
        WebElement label = tr.findElement(By.xpath(".//input"));
        Assert.assertTrue("enabled".equals(attribute) && label.isEnabled() || "disabled".equals(attribute) && !label.isEnabled());
    }


    /**
     * 勾选或取消勾选名称前面的checkbox
     *
     * @param status   想要将复选框置为的状态，checked/unchecked
     * @param nameList 想要勾选/取消勾选的名称（支持传入list）
     *                 仅用于字典管理授权页的checkbox
     */
    @And("^I \"([^\"]*)\" the label before \"([^\"]*)\" in the agent$")
    public void clickCheckLabelAgent(String status, List<String> nameList) {
        for (String name : nameList) {
            String xpath = "//th[contains(text(),'" + name + "')]//ancestor::th//preceding-sibling::th";
            WebElement label = webDriver.findElement(By.xpath(xpath));
            WebElement span = label.findElement(By.xpath("(.//span)[1]"));
            String attribute = span.getAttribute("class");
            if (attribute.contains("checked") && "unchecked".equals(status) || !attribute.contains("checked") && "checked".equals(status)) {
                span.click();
            }
        }
    }


    @When("^the column is \"([^\"]*)\" then i \"([^\"]*)\" the agent label in agent page$")
    public void clickagentLabel(String columnNum, String status) {
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
        WebElement label = tr.findElement(By.xpath(".//label"));
        String attribute = label.getAttribute("class");
        if (attribute.contains("checked") && "unchecked".equals(status) || !attribute.contains("checked") && "checked".equals(status)) {
            label.click();
        }
    }


    private String getAgentIp(String columnNum) {
        Agent agent = new Agent();
        String ip = agent.getIp();
        Assert.assertNotNull("无正在运行的agent！", ip);
        String json = "{'column':'" + columnNum + "','name':'" + ip + "'}";
        return json;
    }


    /**
     * 勾选或取消勾选名称前面的checkbox
     *
     * @param status   想要将复选框置为的状态，checked/unchecked
     * @param nameList 想要勾选/取消勾选的名称（支持传入list）
     *                 仅用于字典管理授权页的checkbox
     */
    @And("^I \"([^\"]*)\" the label before \"([^\"]*)\" in the dictionary$")
    public void clickCheckLabeldic(String status, List<String> nameList) {
        for (String name : nameList) {
            String xpath = "//span[text()='" + name + "']/ancestor::td//label";
            WebElement label = webDriver.findElement(By.xpath(xpath));
            WebElement span = label.findElement(By.xpath(".//span"));
            String attribute = span.getAttribute("class");
            if (attribute.contains("checked") && "unchecked".equals(status) || !attribute.contains("checked") && "checked".equals(status)) {
                label.click();
            }
        }
    }

    /**
     * 字典授权页面判断checkbox的勾选状态
     *
     * @param status   判断状态，checked/unchecked
     * @param nameList 判断名称（支持传入list）
     */
    @And("^I check the label \"([^\"]*)\" status before \"([^\"]*)\" in the dictionary$")
    public void iCheckLabeldic(String status, List<String> nameList) {
        for (String name : nameList) {
            String xpath = "//span[text()='" + name + "']/ancestor::td//label";
            this.assertCheckboxStatus(status, xpath);
        }
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
        String preXpath = ".//span[contains(text(),'";
        String sufXpath = "')]/preceding-sibling::label";
        this.clickAuthButton(status, functions, name, preXpath, sufXpath);
    }

    /**
     * 授权页面组内读取权限的勾选
     *
     * @param status
     * @param functions
     * @param name
     */
    @When("^I \"([^\"]*)\" function \"([^\"]*)\" from the auth table in group which name is \"([^\"]*)\"$")
    public void clickAuthFunctionInGroup(String status, List<String> functions, String name) {
        String preXpath = "(.//span[contains(text(),'";
        String sufXpath = "')])[last()]/preceding-sibling::label";
        this.clickAuthButton(status, functions, name, preXpath, sufXpath);
    }

    private void clickAuthButton(String status, List<String> functions, String name, String preXpath, String sufXpath) {
        WebElement tr = listPageUtils.getRowWithoutTotalPage(name);
        for (String function : functions) {
            WebElement functionButton = tr.findElement(By.xpath(preXpath + function + sufXpath));
            String functionClass = functionButton.getAttribute("class");
            if (functionClass.contains("checked") && "unchecked".equals(status) || !functionClass.contains("checked") && "checked".equals(status)) {
                functionButton.click();
            }
        }
    }

    /**
     * 勾选权限授权页各资源权限的全选/取消全选
     *
     * @param status checked/unchecked
     * @param name
     */
    @And("^I \"([^\"]*)\" the checkbox which name is \"([^\"]*)\" in auth table$")
    public void checkboxInAuth(String status, String name) {
        WebElement tr = listPageUtils.getTableRow(name, null);
        WebElement button = tr.findElement(By.xpath(".//label"));
        String functionClass = button.getAttribute("class");
        if (functionClass.contains("checked") && "unchecked".equals(status) || !functionClass.contains("checked") && "checked".equals(status)) {
            button.click();
        }
    }

    /**
     * 勾选或取消勾选名称前面的checkbox
     *
     * @param status   想要将复选框置为的状态，checked/unchecked
     * @param nameList 想要勾选/取消勾选的名称（支持传入list）
     *                 仅用于趋势图搜索页的checkbox
     */
    @When("^I \"([^\"]*)\" the checkbox which name is \"([^\"]*)\" in trend page$")
    public void clickCheckboxWithGivenNameInTrend(String status, List<String> nameList) {
        for (String name : nameList) {
            String xpath = "(//span[contains(text(),'" + name + "') and contains(@class,'checkbox')])[1]";
            WebElement label = webDriver.findElement(By.xpath(xpath));
            WebElement span = label.findElement(By.xpath(".//preceding-sibling::span"));
            String attribute = span.getAttribute("class");
            if (attribute.contains("checked") && "unchecked".equals(status) || !attribute.contains("checked") && "checked".equals(status)) {
                label.findElement(By.xpath(".//ancestor::label")).click();
            }
        }
    }

    /**
     * 勾选或取消勾选名称前面的checkbox
     *
     * @param status   想要将复选框置为的状态，checked/unchecked
     * @param nameList 想要勾选/取消勾选的名称（支持传入list）
     *                 仅用于列表页的checkbox(批量操作：报表，定时任务，仪表盘等)
     */
    @When("^I \"([^\"]*)\" the checkbox which name is \"([^\"]*)\" in the list$")
    public void clickCheckboxWithGivenNameInTheList(String status, List<String> nameList) {
        for (String name : nameList) {
            String xpath = "(//a[contains(text(),'" + name + "')])[1]";
            WebElement label = webDriver.findElement(By.xpath(xpath));
            WebElement span = label.findElement(By.xpath("./ancestor::td/preceding-sibling::td//span"));
            String attribute = span.getAttribute("class");
            if (attribute.contains("checked") && "unchecked".equals(status) || !attribute.contains("checked") && "checked".equals(status)) {
                span.click();
            }
        }
    }

    /**
     * 勾选或取消勾选名称前面的checkbox
     *
     * @param status   想要将复选框置为的状态，checked/unchecked
     * @param nameList 想要勾选/取消勾选的名称（支持传入list）
     *                 仅用于趋势图列表页的checkbox（批量操作：报表文件，趋势图等）
     */
    @When("^I \"([^\"]*)\" the checkbox which name is \"([^\"]*)\" in trend list page$")
    public void clickCheckboxWithGivenNameInTrendList(String status, List<String> nameList) {
        for (String name : nameList) {
            String xpath = "(//td[contains(text(),'" + name + "')])[1]";
            WebElement label = webDriver.findElement(By.xpath(xpath));
            WebElement span = label.findElement(By.xpath(".//preceding-sibling::td//span"));
            String attribute = span.getAttribute("class");
            if (attribute.contains("checked") && "unchecked".equals(status) || !attribute.contains("checked") && "checked".equals(status)) {
                span.click();
            }
        }
    }

    /**
     * 判断权限功能页面checkbox是否被勾选
     *
     * @param nameList
     * @param status
     */
    @Then("^I will see the checkbox in auth which name is \"([^\"]*)\" and status is \"([^\"]*)\"$")
    public void iWillSeeTheCheckboxInAuthWhichNameIsAndStatusIs(List<String> nameList, String status) {
        for (String name : nameList) {
            String xpath = "//div[text()='" + name + "']/ancestor::label";
            this.assertCheckboxStatus(status, xpath);
        }
    }

    private void assertCheckboxStatus(String status, String xpath) {
        WebElement label = webDriver.findElement(By.xpath(xpath));
        String attribute = label.getAttribute("class");
        Assert.assertTrue((attribute.contains("checked") && "checked".equals(status))
                || (!attribute.contains("checked") && "unchecked".equals(status)));
    }
}
