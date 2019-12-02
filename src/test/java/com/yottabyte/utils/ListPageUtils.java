package com.yottabyte.utils;

import com.yottabyte.hooks.LoginBeforeAllTests;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.util.List;
import java.util.Map;

/**
 * @author sunxj
 */
public class ListPageUtils {
    Paging pagingInfo = new Paging();
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 寻找name所在行
     *
     * @param name
     * @return 行元素
     */
    public WebElement findName(String name) {
        String url = webDriver.getCurrentUrl();
        WebElement table = pagingInfo.getTableList().get(0);
        if (url.contains("agent")) {
            return this.getRowWithoutPaging(name, table);
        }
        return this.getRow(name, table);
    }

    public WebElement findNameWithoutPaging(String name) {
        WebElement table = pagingInfo.getTableList().get(0);
        return this.getRowWithoutPaging(name, table);
    }

    public WebElement findNameWithoutTotalNumber(String name) {
        return this.getRowWithoutTotalPage(name);
    }

    public WebElement findName(String name, WebElement table) {
        return this.getRowWithoutPaging(name, table);
    }

    public WebElement getTr(String dataName) {
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

    public WebElement getTinyTr(String dataName) {
        WebElement tr;
        if (!JsonStringPaser.isJson(dataName)) {
            tr = this.findNameWithoutTotalNumber(dataName);
        } else {
            Map<String, Object> map = JsonStringPaser.json2Stirng(dataName);
            String name = map.get("name").toString();
            tr = this.findNameWithoutTotalNumber(name);
        }
        return tr;
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

    public WebElement getRowWithColumnNum(String name, int columnNum) {
        WebElement table = pagingInfo.getTableList().get(0);
        return this.getRowWithColumnNum(name, columnNum, table);
    }

    public WebElement getRowWithColumnNum(String name, int columnNum, WebElement table) {
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
                if (tr.findElements(By.tagName("td")).get(columnNum).getText().equals(name)) {
                    return tr;
                }
            }
            i++;
        }
        return null;
    }

    public WebElement getRowWithoutPaging(String name, WebElement table) {
        // 找到一行元素
        List<WebElement> trList = table.findElements(By.xpath(".//tr"));

        for (WebElement tr : trList) {
            if (tr.getText().contains(name)) {
                return tr;
            }
        }
        return null;
    }

    public WebElement getRowWithoutTotalPage(String name) {
        String nextPageXpath;
        String trListXpath;
        if (pagingInfo.checkUrl()) {
            nextPageXpath = "//button[contains(@class,'btn-next')]";
            trListXpath = "//tr";
        } else {
            nextPageXpath = "//li[@class=' ant-pagination-next']";
//            trListXpath = "//div[@class='ant-modal-content']//tr";
            trListXpath = "//tr";
        }
        while (true) {
            List<WebElement> trList = webDriver.findElements(By.xpath(trListXpath));
            for (WebElement tr : trList) {
                if (tr.getText().contains(name)) {
                    return tr;
                }
            }
            WebElement nextPage = webDriver.findElement(By.xpath(nextPageXpath));
            if (nextPage.getAttribute("class").contains("disabled")) {
                break;
            } else {
                nextPage.click();
                WaitForElement.waitUntilLoadingDisappear();
            }
        }
        return null;
    }
}
