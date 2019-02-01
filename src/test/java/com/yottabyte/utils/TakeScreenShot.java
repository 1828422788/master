package com.yottabyte.utils;


import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.webDriver.SharedDriver;
import cucumber.api.Scenario;
import org.apache.commons.io.FileUtils;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebDriverException;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

public class TakeScreenShot {
    String actualImageName = "";

    String sp = File.separator;
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd-hh-mm-ss");
    String dateString = formatter.format(new Date());

    public void screenShot() {
        String actualImgFilePath = System.getProperty("user.dir") + sp + "target" + sp +
                "cucumber-html-reports" + sp + "embeddings" + sp + "actual_img" + sp +
                "Actual-" + dateString + UUID.randomUUID() + ".png";
        this.generateImage(actualImgFilePath);
    }

    public void screenShot(String name) {
        String actualImgFilePath = "";
        String systemName = System.getProperty("os.name");
        if (systemName.toLowerCase().contains("linux")) {
            actualImgFilePath = "/var/lib/jenkins/CaseScreenshots/RZY-" + name + ".png";
        } else if (systemName.contains("Mac")) {
            actualImgFilePath = System.getProperty("user.dir") + sp + "target" + sp +
                    "cucumber-html-reports" + sp + "embeddings" + sp + "actual_img" + sp +
                    "RZY-" + name + ".png";
        }
        this.generateImage(actualImgFilePath);
    }

    private void generateImage(String actualImgFilePath) {
        File screenShotFile = new File(actualImgFilePath);
        Scenario scenario = SharedDriver.getScenario();
        WebDriver webDriver = LoginBeforeAllTests.getWebDriver();
        try {
            byte[] screenshot = ((TakesScreenshot) webDriver).getScreenshotAs(OutputType.BYTES);
            File file = ((TakesScreenshot) webDriver).getScreenshotAs(OutputType.FILE);
            FileUtils.copyFile(file, screenShotFile);
            actualImageName = screenShotFile.getAbsolutePath();
            System.out.println("take screenshot actual " + actualImageName);
            scenario.embed(screenshot, "image/png");
        } catch (WebDriverException somePlatformsDontSupportScreenshots) {
            System.err.println(somePlatformsDontSupportScreenshots.getMessage());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getActualImageName() {
        return actualImageName;
    }

    public void setActualImageName(String actualImageName) {
        this.actualImageName = actualImageName;
    }
}
