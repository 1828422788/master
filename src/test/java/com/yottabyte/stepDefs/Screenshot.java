package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import com.yottabyte.utils.TakeScreenShot;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.apache.commons.io.FileUtils;
import org.openqa.selenium.*;
import org.openqa.selenium.Point;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.internal.WrapsDriver;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

/**
 * 截屏操作
 *
 * @author sunxj
 */
public class Screenshot {
    private TakeScreenShot screenShot = new TakeScreenShot();

    /**
     * 截屏
     */
    @Then("^take a screenshot$")
    public void takeScreenshot() {
        screenShot.screenShot();
    }

    /**
     * 截屏并以指定的名称或路径保存
     *
     * @param name 名称或路径
     */
    @And("^take a screenshot with name \"([^\"]*)\"$")
    public void takeScreenshot(String name) {
        screenShot.screenShot(name);
    }

    /**
     * 截取某一部分的内容并以指定名称或路径保存
     *
     * @param elementName 想要截图部分的元素名称
     * @param name        截图名称或路径
     * @throws IOException
     */
    @And("^take part of \"([^\"]*)\" with name \"([^\"]*)\"$")
    public void takePartScreenshot(String elementName, String name) throws IOException, InterruptedException {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        WebDriver webdriver = LoginBeforeAllTests.getWebDriver();
        WrapsDriver driver = (WrapsDriver) webdriver;

        Actions action = new Actions(webdriver);
        action.moveByOffset(0,0).build().perform();
        ((JavascriptExecutor) webdriver).executeScript("arguments[0].scrollIntoView(false);", element);
        Thread.sleep(2000);
        File screen = ((TakesScreenshot) driver.getWrappedDriver()).getScreenshotAs(OutputType.FILE);
        BufferedImage img = ImageIO.read(screen);

        // 获得元素的高度和宽度
        int width = element.getSize().getWidth();
        int height = element.getSize().getHeight();
        // 创建一个矩形使用上面的高度和宽度
        Rectangle rect = new Rectangle(width, height);
        // 得到元素的坐标
        Point p = element.getLocation();
        BufferedImage dest = img.getSubimage(p.getX(), p.getY(), rect.width, rect.height);
        // 存为png格式
        ImageIO.write(dest, "png", screen);

        String system = System.getProperty("os.name");
        String filePath = null;
        if (system.toLowerCase().contains("linux")) {
//          filePath = "/var/lib/jenkins/caseScreenshots/";
            filePath = "";
        } else if (system.contains("Mac")) {
//          filePath = "target/cucumber-html-reports/embeddings/actual_img/";
            filePath = System.getProperty("user.dir")+"/";
        } else if (system.contains("Windows")) {
            filePath = "";
        }

        FileUtils.copyFile(screen, new File(filePath + name + ".png"));
    }
}
