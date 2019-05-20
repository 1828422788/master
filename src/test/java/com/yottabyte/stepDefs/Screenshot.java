package com.yottabyte.stepDefs;

import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import com.yottabyte.utils.TakeScreenShot;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Then;
import org.apache.commons.io.FileUtils;
import org.openqa.selenium.*;
import org.openqa.selenium.Point;
import org.openqa.selenium.internal.WrapsDriver;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

/**
 * @author sunxj
 */
public class Screenshot {
    private TakeScreenShot screenShot = new TakeScreenShot();

    @Then("^take a screenshot$")
    public void takeScreenshot() {
        screenShot.screenShot();
    }

    @And("^take a screenshot with name \"([^\"]*)\"$")
    public void takeScreenshot(String name) {
        screenShot.screenShot(name);
    }

    @And("^take part of \"([^\"]*)\" with name \"([^\"]*)\"$")
    public void takePartScreenshot(String elementName, String name) throws IOException {
        WebElement element = GetElementFromPage.getWebElementWithName(elementName);
        WebDriver webdriver = LoginBeforeAllTests.getWebDriver();
        WrapsDriver driver = (WrapsDriver) webdriver;

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
//            filePath = "/var/lib/jenkins/caseScreenshots/";
            filePath = "${workspace}/";
        } else if (system.contains("Mac")) {
            filePath = "target/cucumber-html-reports/embeddings/actual_img/";
        }

        FileUtils.copyFile(screen, new File(filePath + name + ".png"));
    }
}
