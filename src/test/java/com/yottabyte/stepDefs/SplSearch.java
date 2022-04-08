package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import com.yottabyte.utils.JsonStringPaser;
import cucumber.api.PendingException;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.joda.time.Days;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import javax.lang.model.element.Element;
import java.io.*;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

/**
 * @author sunxj
 */
public class SplSearch {
    WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 验证搜索页列表字段值
     *
     * @param json {'字段名称'：'字段值'}
     */
    @Then("^I will see the spl search result \"([^割]*)\"$")
    public void iWillSeeTheSplSearchResult(String json) {
        Map<String, Object> map = JsonStringPaser.json2Stirng(json);
        for (String key : map.keySet()) {
            WebElement tr = webDriver.findElement(By.xpath("(//span[text()='" + key + ":']/following-sibling::span[@class='fields-values'])[last()]"));
            String actualValue = tr.getText();
            Assert.assertEquals(map.get(key), actualValue);
        }
    }


    @Then("^I will see the spl search result \"([^割]*)\" which is selected$")
    public void iWillSeeTheSplSearchResultWhichIsSelected(String json) {
        Map<String, Object> map = JsonStringPaser.json2Stirng(json);

        for (String key : map.keySet()) {
            WebElement tr = webDriver.findElement(By.xpath("//span[contains(text(),'事件操作')]/ancestor::div[1]/ancestor::div[1]//span[text()='" + key + "']/ancestor::pre[1]"));
            String actualValue = tr.getText();
            Assert.assertEquals(map.get(key), actualValue);
        }
    }

    /**
     * 验证搜索页列表下不包含某个字段
     *
     * @param list
     */
    @And("^I will see the spl search result data \"([^\"]*)\" doesn't exist$")
    public void ifDataExist(List<String> list) {
        for (String key : list) {
            WebElement element;
            try {
                element = webDriver.findElement(By.xpath("(//span[text()='" + key + "'])[last()]/following-sibling::span"));
            } catch (Exception e) {
                continue;
            }
            new CheckButtonAttribute().ifExist(element);
        }
    }


    @Then("^I will see the number of log is \"([^\"]*)\" when search \"([^割]*)\"$")
    public void checkLogNum(String logNum, String spl) {
        //class="_284Y6gRNbLs9PP8RvGX76B Fqdex4rec8vrc91HwX3oB"
        WebElement table = GetElementFromPage.getWebElementWithName("SearchTable");
        int totalLogNum = Integer.parseInt(logNum);
        List<WebElement> pages = webDriver.findElements(By.className("number"));
        pages.get(pages.size() - 1).click();
        int totalPage = Integer.parseInt(pages.get(pages.size() - 1).getText());
        int realTotalLogNum = 20 * (totalPage - 1) + table.findElements(By.tagName("tr")).size();
        if (realTotalLogNum != totalLogNum) {
            Assert.assertTrue(false);
        }
    }

    /**
     * 验证搜索页存在某个字段，不验证字段值
     *
     * @param fieldName
     */
    @Then("^I will see the field \"([^\"]*)\" exist$")
    public void iWillSeeTheFieldExist(List<String> fieldName) {
        for (String name : fieldName) {
            String xpath = "(//span[text()='" + name + "'])";
            WebElement webElement = webDriver.findElement(By.xpath(xpath));
            WaitElement waitElement = new WaitElement();
            waitElement.elementVisible(webElement);
        }
    }

    /**
     * 生成交易日csv文件
     *
     * @param num
     */
    @Then("^I create \"([^\"]*)\" days csv file from now$")
    public void createCsvFile(int num) {
        if (num > 0) {
            String[] headArr = new String[]{"ZRR", "JYR", "ND", "JD", "YF"};
            String filePath = "src/test/resources/testdata/app/trandatefiles";
            LocalDateTime localDateTime = LocalDateTime.now();
            DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
            String timeStamp = df.format(localDateTime) +".csv";//CSV文件名称
            String fileName = "trandate.csv";//CSV文件名称
            File csvFile = null;
            BufferedWriter csvWriter = null;
            try {
                csvFile = new File(filePath + File.separator + fileName);
                File parent = csvFile.getParentFile();
                if (parent != null && !parent.exists()) {
                    parent.mkdirs();
                }
                csvFile.createNewFile();

                // GB2312使正确读取分隔符","
                csvWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(csvFile), "GB2312"), 1024);

                // 写入文件头部标题行
                csvWriter.write(String.join(",", headArr));
                csvWriter.newLine();

                // 写入文件内容
                Calendar now = Calendar.getInstance();
                for (int i=0; i<num; i++) {
                    if (i %2 ==0) {
                        now.add(Calendar.DAY_OF_MONTH, -i);
                        String target = new SimpleDateFormat("yyyyMMdd").format(now.getTime());
//                        System.out.println(target);
//                        System.out.println("##############@@@@@@@@@@@");
                        String yearnum = target.substring(0,4);
                        String monthnum = target.substring(4,6);
                        String daynum = target.substring(6,8);
//                        System.out.println(String.format("%s,%s,%s,%s,%s", target, Integer.parseInt(target), yearnum, daynum, monthnum));
                        csvWriter.write(String.format("%s,%s,%s,%s,%s", target, Integer.parseInt(target), yearnum, daynum, monthnum));
                        csvWriter.newLine();
                        now.add(Calendar.DAY_OF_MONTH, i);
                    }
                }
                csvWriter.flush();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    csvWriter.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
