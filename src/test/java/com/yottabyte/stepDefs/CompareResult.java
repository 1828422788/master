package com.yottabyte.stepDefs;

import com.yottabyte.utils.EmbeddingFile;
import com.yottabyte.utils.GetElementFromPage;
import com.yottabyte.utils.ImageComparison;
import com.yottabyte.utils.JsonStringPaser;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.junit.Assert;
import org.openqa.selenium.WebElement;

import javax.imageio.ImageIO;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
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
     * 比较两个图片是否相似，如果不相似，会把sourceImage和targetImage绑定在测试报告中
     *
     * @param sourceImage 源文件路径名称
     * @param targetImage 目标文件路径名称
     */
    @And("^I compare source image \"([^\"]*)\" with target image \"([^\"]*)\"$")
    public void compareImage(String sourceImage, String targetImage) {
        try {
            String sourceFingerPrint = ImageComparison.toPhash(ImageIO.read(new File(sourceImage + ".png")));
            String targetFingerPrint = ImageComparison.toPhash(ImageIO.read(new File(targetImage + ".png")));
            int difference = ImageComparison.hammingDistance(sourceFingerPrint, targetFingerPrint);
            if (difference > 5) {
                EmbeddingFile.embedImage(targetImage + ".png");
                Assert.fail();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 比较两个文本文件是否相等，
     *
     * @param sourceDownloadFile 源文件路径名称
     * @param targetDownloadFile 目标文件路径名称
     */
    @And("^I compare source download file \"([^\"]*)\" with target download files \"([^\"]*)\"$")
    public void compareDownloadFile(String sourceDownloadFile, String targetDownloadFile) {
        String curPath = System.getProperty("user.dir");

        FileInputStream fis1 = null;
        FileInputStream fis2 = null;
        try {
            fis1 = new FileInputStream(curPath + "/" + sourceDownloadFile);
            fis2 = new FileInputStream(curPath + "/target/download-files/" + targetDownloadFile);

            int len1 = fis1.available();//返回总的字节数
            int len2 = fis2.available();

            if (len1 == len2) {//长度相同，则比较具体内容
                //建立两个字节缓冲区
                byte[] data1 = new byte[len1];
                byte[] data2 = new byte[len2];

                //分别将两个文件的内容读入缓冲区
                fis1.read(data1);
                fis2.read(data2);

                //依次比较文件中的每一个字节
                for (int i = 0; i < len1; i++) {
                    //只要有一个字节不同，两个文件就不一样
                    if (data1[i] != data2[i]) {
                        System.out.println("文件内容不一样");
                        Assert.fail();
                    }
                }
                System.out.println("两个文件完全相同");
//                return true;
            } else {
                //长度不一样，文件肯定不同
                Assert.fail();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {//关闭文件流，防止内存泄漏
            if (fis1 != null) {
                try {
                    fis1.close();
                } catch (IOException e) {
                    //忽略
                    e.printStackTrace();
                }
            }
            if (fis2 != null) {
                try {
                    fis2.close();
                } catch (IOException e) {
                    //忽略
                    e.printStackTrace();
                }
            }
        }
        Assert.fail();
    }


}
