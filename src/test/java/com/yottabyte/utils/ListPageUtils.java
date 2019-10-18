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
    List<WebElement> tableList = pagingInfo.tableList;

    /**
     * 寻找name所在行
     *
     * @param name
     * @return 行元素
     */
    public WebElement findName(String name) {
        String url = webDriver.getCurrentUrl();

        if (tableList.size() == 1 || url.contains("agent")) {
            // 表体
            WebElement table = tableList.get(0);
            if (url.contains("agent"))
                return this.getRowWithoutPaging(name, table);
            return this.getRow(name, table);
        } else {
            return this.getSourcesGroupName(tableList, name);
        }
    }

    public WebElement findNameWithoutPaging(String name) {
        WebElement table = tableList.get(0);
        return this.getRowWithoutPaging(name, table);
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

    public WebElement getTrWithoutPaging(String dataName) {
        WebElement tr;
        if (!JsonStringPaser.isJson(dataName)) {
            tr = this.findNameWithoutPaging(dataName);
        } else {
            Map<String, Object> map = JsonStringPaser.json2Stirng(dataName);
            String name = map.get("name").toString();
            int columnNum = Integer.parseInt(map.get("column").toString());
            WebElement table = tableList.get(0);
            tr = this.getRowWithoutPaging(name, columnNum, table);
        }
        return tr;
    }

    public List<WebElement> getTrList() {
        WebElement table = tableList.get(0);
        return table.findElements(By.xpath(".//tr"));
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
        WebElement table = tableList.get(0);
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
        return this.getRowWithoutPaging(name, 0, table);
    }

    public WebElement getRowWithoutPaging(String name, int column, WebElement table) {
        // 找到一行元素
        List<WebElement> trList = table.findElements(By.tagName("tr"));

        for (WebElement tr : trList) {
            if (tr.findElements(By.tagName("td")).get(column).getText().equals(name)) {
                return tr;
            }
        }
        return null;
    }

    /**
     * 以下情况仅针对日志来源表格进行特殊处理
     *
     * @param tableList
     * @param name
     * @return
     */
    public WebElement getSourcesGroupName(List<WebElement> tableList, String name) {
        WebElement nameTable;
        WebElement operatorTable;
        if (tableList.size() == 2) {
            nameTable = tableList.get(0);
            operatorTable = tableList.get(1);
        } else {
            nameTable = tableList.get(1);
            operatorTable = tableList.get(2);
        }
        List<WebElement> nameList = nameTable.findElements(By.tagName("tr"));
        int totalPage = pagingInfo.getTotalPage();
        WebElement nextPage = pagingInfo.getNextPage();

        int i = 0;
        while (i < totalPage) {
            // 找到一行元素
            if (i != 0 && i <= totalPage - 1)
                nextPage.click();

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
}
