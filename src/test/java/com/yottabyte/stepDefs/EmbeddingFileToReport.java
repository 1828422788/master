package com.yottabyte.stepDefs;

import com.jcraft.jsch.SftpException;
import com.yottabyte.config.ConfigManager;
import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.EmbeddingFile;
import com.yottabyte.utils.SFTPUtil;
import com.yottabyte.webDriver.SharedDriver;
import cucumber.api.Scenario;
import cucumber.api.java.en.Then;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import static java.nio.file.StandardCopyOption.REPLACE_EXISTING;

/**
 * @author sunxj
 */
public class EmbeddingFileToReport {
    private WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 绑定下载过的文本类型文件至报告中，会到target/download-files下去寻找文件
     *
     * @param fileName 文件名称
     */
    @Then("^I embedding text file \"([^\"]*)\" into report$")
    public void embeddingTextFile(String fileName) {
        InputStream in = EmbeddingFile.getInputStream(fileName);
        Scenario scenario = SharedDriver.getScenario();
        try {
            scenario.embed(EmbeddingFile.readContent(in), "text/plain");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Then("^I download file \"([^\"]*)\" to local$")
    public void downloadFileToLocal(String fileName) {
        FileOutputStream outputStream = null;
        try {
            File file = new File("downloadFile/" + fileName);
            file.createNewFile();
            ConfigManager config = new ConfigManager();
            SFTPUtil util = new SFTPUtil(config.get("ftp_user"), config.get("ftp_password"), config.get("selenium_server_host"), 22);
            util.login();
            byte[] bytes = util.download("target/download-files/", fileName);
            outputStream = new FileOutputStream(file);
            outputStream.write(bytes);
            outputStream.flush();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (outputStream != null)
                    outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @Then("^I download the latest report to local$")
    public void downloadReportToLocal() {
        String type = SharedDriver.WebDriverType;
        String targetReportFile = webDriver.findElement(By.xpath("(//tbody/tr/td)[1]")).getText();
        String curPath = System.getProperty("user.dir");
        String targDir = "/target/download-files/";
        String[] path = targetReportFile.split("_");
        String fileName = path[0];
        for(int i = 1; i<path.length-1; i++) {
            fileName = fileName.concat("_" + path[i]);
        }
        fileName = fileName.concat("." + targetReportFile.split("\\.")[1]);
        File directory = new File(targDir);
        if (!directory.exists()) {
            directory.mkdir();
        }
        if ("Remote".equalsIgnoreCase(type)) {
            ConfigManager config = new ConfigManager();
            SFTPUtil sftpUtil = new SFTPUtil(config.get("ftp_user"), config.get("ftp_password"), config.get("selenium_server_host"), 22);
            sftpUtil.login();
            try {
                sftpUtil.download(targDir, targetReportFile, targDir + fileName);
                sftpUtil.delete(targDir, targetReportFile);
            } catch (SftpException e) {
                e.printStackTrace();
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            }
        } else {
            Path yourFile = Paths.get(curPath + targDir +targetReportFile);
            try {
                Files.move(yourFile, yourFile.resolveSibling(curPath + targDir + fileName),REPLACE_EXISTING);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
