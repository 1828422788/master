package com.yottabyte.stepDefs;

import com.yottabyte.utils.GetElementFromPage;
import com.yottabyte.utils.ImageComparison;
import com.yottabyte.utils.JsonStringPaser;
import com.yottabyte.utils.TakeScreenShot;
import com.yottabyte.webDriver.SharedDriver;
import cucumber.api.Scenario;
import cucumber.api.java.cs.A;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.junit.Assert;
import org.openqa.selenium.WebElement;

import javax.imageio.ImageIO;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author sunxj
 */
public class CompareResult {
    private static String clientIp;
    private static String version;
    private static String count;
    private static String value;
    private List<String> list;

    public static String getClientIp() {
        return clientIp;
    }

    public static void setClientIp(String clientIp) {
        CompareResult.clientIp = clientIp;
    }

    public static String getVersion() {
        return version;
    }

    public static void setVersion(String version) {
        CompareResult.version = version;
    }

    public static String getCount() {
        return count;
    }

    public static void setCount(String count) {
        CompareResult.count = count;
    }

    public List getList() {
        return list;
    }

    public void setList(List<String> list) {
        this.list = list;
    }

    public static String getValue() {
        return value;
    }

    public static void setValue(String value) {
        CompareResult.value = value;
    }

    @And("^I save the result \"([^\"]*)\"$")
    public void saveTheResult(String result) {
        Map<String, Object> map = JsonStringPaser.json2Stirng(result);
        Class<CompareResult> compareResultClass = CompareResult.class;

        try {
            for (String key : map.keySet()) {
                String methodName = "set" + key;
                Method method = compareResultClass.getMethod(methodName, String.class);
                WebElement value = GetElementFromPage.getWebElementWithName(map.get(key).toString());
                method.invoke(compareResultClass.getDeclaredConstructor().newInstance(), value.getText());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Then("^I compare with \"([^\"]*)\"$")
    public void iCompareWith(String result) {
        Map<String, Object> map = JsonStringPaser.json2Stirng(result);
        Class<CompareResult> compareResultClass = CompareResult.class;

        try {
            for (String key : map.keySet()) {
                String methodName = "get" + key;
                Method method = compareResultClass.getMethod(methodName);
                String expect = (String) method.invoke(compareResultClass.getDeclaredConstructor().newInstance());
                WebElement element = GetElementFromPage.getWebElementWithName(map.get(key).toString());
                String actual = element.getText();
                Assert.assertEquals(expect, actual);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @And("^I set value with element \"([^\"]*)\"$")
    public void iSetValueWithElement(String elementName) {
        Object o = GetElementFromPage.getWebElementWithName(elementName);
        List<WebElement> elements = new ArrayList<>();
        if (o instanceof List) {
            elements = (List) o;
        } else {
            elements.add((WebElement) o);
        }
        List<String> list = new ArrayList<>();
        for (WebElement element : elements) {
            list.add(element.getText());
        }
        setList(list);
    }

    @And("^I compare with list \"([^\"]*)\"$")
    public void compareWithList(String elementName) {
        Object o = GetElementFromPage.getWebElementWithName(elementName);
        List<WebElement> elements = new ArrayList<>();
        if (o instanceof List) {
            elements = (List) o;
        } else {
            elements.add((WebElement) o);
        }
        if (elements.size() == 0) {
            Assert.assertTrue(false);
        }
        for (int i = 0; i < elements.size(); i++) {
            Assert.assertEquals("\n实际值： " + elements.get(i).getText().trim() + "\n期望值： " + list.get(i).trim(), list.get(i).trim(), elements.get(i).getText().trim());
        }
    }

    @And("^I use the method \"([^\"]*)\" with parameter \"([^\"]*)\"$")
    public void generateMethod(String methodName, String result) throws Exception {
        Class clazz = this.getClass();
        Method method = clazz.getMethod(methodName, String.class);
        method.invoke(clazz.getDeclaredConstructor().newInstance(), result);
    }

    /**
     * manager中比较查看topic列表命令
     *
     * @param result
     */
    public void compareCommand(String result) {
        String[] texts = this.compare(result);
        Assert.assertEquals("/opt/rizhiyi/tools/kafka/bin/kafka-topics.sh --list --zookeeper " + texts[0] + ":2181", texts[1]);
    }

    public void compareTopicCommand(String result) {
        String[] texts = this.compare(result);
        Assert.assertEquals("/opt/rizhiyi/tools/kafka/bin/kafka-topics.sh --alter --zookeeper " + texts[0] + ":2181 --partitions 10 --topic UI_auto_test", texts[1]);
    }

    public void compareLookupTopicCommand(String result) {
        String[] texts = this.compare(result);
        Assert.assertEquals("/opt/rizhiyi/tools/kafka/bin/kafka-console-consumer.sh --zookeeper " + texts[0] + ":2181 --max-messages 10 --topic UI_auto_test", texts[1]);
    }

    private String[] compare(String result) {
        String[] elementNames = result.split(",");
        WebElement baseElement = GetElementFromPage.getWebElementWithName(elementNames[0]);
        String baseText = baseElement.getAttribute("value");

        WebElement compareElement = GetElementFromPage.getWebElementWithName(elementNames[1]);
        String compareText = compareElement.getAttribute("value");

        return new String[]{baseText, compareText};
    }

    /**
     * 比较两个图片是否相似
     *
     * @param sourceImage 源文件路径名称
     * @param targetImage 目标文件路径名称
     */
    @And("^I compare source image \"([^\"]*)\" with target image \"([^\"]*)\"$")
    public void compareImage(String sourceImage, String targetImage) {
        String sourceFingerPrint = null;
        String targetFingerPrint = null;
        try {
            System.out.println(System.getProperty("user.dir"));
            System.out.println("sourceImage = [" + sourceImage + "], targetImage = [" + targetImage + "]");
            sourceFingerPrint = ImageComparison.toPhash(ImageIO.read(new File(sourceImage + ".png")));
            targetFingerPrint = ImageComparison.toPhash(ImageIO.read(new File(targetImage + ".png")));
        } catch (IOException e) {
            e.printStackTrace();
        }
        int difference = ImageComparison.hammingDistance(sourceFingerPrint, targetFingerPrint);
        if (difference > 5) {
            TakeScreenShot takeScreenShot = new TakeScreenShot();
            takeScreenShot.generateImage(targetImage);
            Assert.fail();
        }
    }
}
