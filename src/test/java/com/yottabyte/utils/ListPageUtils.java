package com.yottabyte.utils;

import com.yottabyte.hooks.LoginBeforeAllTests;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.List;
import java.util.Map;

public class ListPageUtils {
    Paging pagingInfo = new Paging();
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 获取名称所在行，有分页
     *
     * @param dataName 支持json格式指定名称所在列
     * @return
     */
    public WebElement getRow(String dataName) {
        WebElement tr;
        if (!JsonStringPaser.isJson(dataName)) {
            tr = this.getRowWithName(dataName);
        } else {
            Map<String, Object> map = JsonStringPaser.json2Stirng(dataName);
            String name = map.get("name").toString();
            int columnNum = Integer.parseInt(map.get("column").toString());
            tr = this.getRowWithColumnNum(name, columnNum);
        }
        return tr;
    }

    /**
     * 寻找name所在行
     *
     * @param name
     * @return 行元素
     */
    public WebElement getRowWithName(String name) {
        String url = webDriver.getCurrentUrl();
        WebElement table = pagingInfo.getTableList().get(0);
        if (url.contains("agent")) {
            return this.getRowWithoutPaging(name, table);
        } else {
            return this.getRow(name, table);
        }
    }

    /**
     * 根据名称及名称所在列获得该行
     *
     * @param name
     * @param columnNum
     * @return
     */
    public WebElement getRowWithColumnNum(String name, int columnNum) {
        WebElement table = pagingInfo.getTableList().get(0);
        return this.getRowWithColumnNum(name, columnNum, table);
    }

    /**
     * 根据名称、名称所在列、名称所在table获取该行
     *
     * @param name
     * @param columnNum
     * @param table
     * @return
     */
    public WebElement getRowWithColumnNum(String name, int columnNum, WebElement table) {
        int totalPage = pagingInfo.getTotalPage();
        WebElement nextPage = pagingInfo.getNextPage();
        for (int i = 0; i < totalPage; i++) {
            if (i != 0 && i <= totalPage - 1) {
                nextPage.click();
                WaitForElement.waitUntilLoadingDisappear();
            }
            List<WebElement> trList = table.findElements(By.tagName("tr"));
            for (WebElement tr : trList) {
                if (tr.findElements(By.tagName("td")).get(columnNum).getText().equals(name)) {
                    return tr;
                }
            }
        }
        return null;
    }

    /**
     * 无分页下获取名称所在行
     *
     * @param name
     * @param table
     * @return
     */
    public WebElement getRowWithoutPaging(String name, WebElement table) {
        List<WebElement> trList = table.findElements(By.xpath(".//tr"));
        for (WebElement tr : trList) {
            if (tr.getText().contains(name)) {
                return tr;
            }
        }
        return null;
    }

    private WebElement findNameWithoutPaging(String name) {
        WebElement table = pagingInfo.getTableList().get(0);
        return this.getRowWithoutPaging(name, table);
    }

    public WebElement getContainsTr(String dataName) {
        WebElement table = pagingInfo.getTableList().get(0);
        int totalPage = pagingInfo.getTotalPage();
        WebElement nextPage = pagingInfo.getNextPage();
        int i = 0;
        while (i < totalPage) {
            if (i != 0 && i <= totalPage - 1) {
                nextPage.click();
                WaitForElement.waitUntilLoadingDisappear();
            }
            List<WebElement> trList = table.findElements(By.tagName("tr"));
            for (WebElement tr : trList) {
                if (tr.findElements(By.tagName("td")).get(0).getText().contains(dataName)) {
                    return tr;
                }
            }
            i++;
        }
        return null;
    }

    public WebElement getTinyTr(String dataName) {
        String name;
        if (!JsonStringPaser.isJson(dataName)) {
            name = dataName;
        } else {
            Map<String, Object> map = JsonStringPaser.json2Stirng(dataName);
            name = map.get("name").toString();
        }
        String nextPageXpath = "//span[@class='yotta-icon yotta-icon-RightOutlined']";
        String trListXpath = "//div[@class='yotta-modal-body']//tr";
        return this.clickNextPage(trListXpath, nextPageXpath, name);
    }

    public WebElement getTrWithoutPaging(String dataName) {
        WebElement tr;
        if (!JsonStringPaser.isJson(dataName)) {
            tr = this.findNameWithoutPaging(dataName);
        } else {
            Map<String, Object> map = JsonStringPaser.json2Stirng(dataName);
            String name = map.get("name").toString();
            WebElement table = pagingInfo.getTableList().get(0);
            tr = this.getRowWithoutPaging(name, table);
        }
        return tr;
    }

    public WebElement getTrWithoutPagingInConfig(String dataName) {
        WebElement tr;
        if (!JsonStringPaser.isJson(dataName)) {
            tr = this.findNameWithoutPaging(dataName);
        } else {
            Map<String, Object> map = JsonStringPaser.json2Stirng(dataName);
            String name = map.get("name").toString();
            WebElement table = webDriver.findElement(By.xpath("//table[contains(@class, 'yotta-table')]"));
            tr = this.getRowWithoutPaging(name, table);
        }
        return tr;
    }

    public List<WebElement> getTrList() {
        WebElement table = pagingInfo.getTableList().get(0);
        List<WebElement> list = null;
        try {
            list = table.findElements(By.xpath(".//tr"));
        } catch (Exception e) {

        }
        return list;
    }

    /**
     * 获取名称所在行
     *
     * @param name
     * @param table
     * @return
     */
    public WebElement getRow(String name, WebElement table) {
        return this.getRowWithColumnNum(name, 0, table);
    }

    public WebElement getRowWithoutTotalPage(String name) {
        String nextPageXpath = "//li[@class=' ant-pagination-next']";
        String trListXpath = "//tr";
        return this.clickNextPage(trListXpath, nextPageXpath, name);
    }

    private WebElement clickNextPage(String trListXpath, String nextPageXpath, String name) {
        while (true) {
            List<WebElement> trList = webDriver.findElements(By.xpath(trListXpath));
            while (trList.size() == 1) {
                trList = webDriver.findElements(By.xpath(trListXpath));
            }
            for (WebElement tr : trList) {
                if (tr.getText().contains(name)) {
                    return tr;
                }
            }
            WebElement nextPage = webDriver.findElement(By.xpath(nextPageXpath));
            if (nextPage.getAttribute("class").contains("disabled")) {
                return null;
            } else {
                ClickEvent.clickUnderneathButton(nextPage);
                WaitForElement.waitUntilLoadingDisappear();
            }
        }
    }

    /**
     * 匹配包含name的tr并返回
     *
     * @param name  名称
     * @param table 若有多个table，需指定查找哪个table下的数据
     * @return tr
     */
    public WebElement getTableRow(String name, WebElement table) {

        List<WebElement> trList = this.getTableRowList(table);
        for (WebElement tr : trList) {
            if (tr.getText().contains(name)) {
                return tr;
            }
        }
        WebElement nextPage = webDriver.findElement(By.className(" ant-pagination-next"));
        String buttonAttribute = nextPage.getAttribute("aria-disabled");
        while (buttonAttribute.equals("false")) {
            nextPage.click();
            WaitForElement.waitUntilLoadingDisappear();
            trList = this.getTableRowList(table);
            for (WebElement tr : trList) {
                if (tr.getText().contains(name)) {
                    return tr;
                }
            }
        }
        return null;
    }

    private List<WebElement> getTableRowList(WebElement table) {
        List<WebElement> trList;
        if (table == null) {
            trList = webDriver.findElements(By.xpath("//tbody/tr"));
        } else {
            trList = table.findElements(By.xpath("./tbody/tr"));
        }
        return trList;
    }
}
