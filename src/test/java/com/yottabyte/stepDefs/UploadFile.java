package com.yottabyte.stepDefs;

import com.jcraft.jsch.SftpException;
import com.yottabyte.config.ConfigManager;
import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import com.yottabyte.utils.OsUtils;
import com.yottabyte.utils.SFTPUtil;
import com.yottabyte.webDriver.SharedDriver;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.io.*;
import java.net.InetAddress;
import java.net.UnknownHostException;

/**
 * 上传文件
 */
public class UploadFile {
    ConfigManager config = new ConfigManager();
    private WebDriver webDriver = LoginBeforeAllTests.getWebDriver();

    /**
     * 根据绝对路径以及文件名上传文件，指定了input元素为name=file,若控件更新可能需要修改此处
     * 如果浏览器是在远端打开，在执行上传文件操作之前，先将文件通过sftp上传到远端
     *
     * @param fileNameWithPath 包含绝对路径的文件名
     */
    @And("^I upload a file with name \"([^\"]*)\"$")
    public void iUploadAFileWithName(String fileNameWithPath) {
        WebElement uploadInput = webDriver.findElement(By.xpath("//input[@type='file']"));
        if (fileNameWithPath.contains("target")){
            uploadFileWithDifferentPath(uploadInput, fileNameWithPath);
        }else {
            uploadFile(uploadInput, fileNameWithPath);
        }
    }

    /**
     * 将文件上传到打开selenium server的远端,使用共享文件的方式
     *
     * @param fileNameWithPath
     */
    private void copyFileToSeleniumServer(String ip, String fileNameWithPath) {
        String targetDir = "/data/seleniumServerDir/"+ip;
        File tmpFile = new File(fileNameWithPath);
        String fileNameWithPathtmp=fileNameWithPath.substring(1);
        String fileName = tmpFile.getName();
        String path;
        path = tmpFile.getPath().split("resources")[1].replace("\\", "/").split(fileName)[0];
        File file = new File(targetDir+path);
        if (!file.exists() && !file.isDirectory()) {
            file.mkdirs();
            System.out.println("创建文件夹");
        } else {
            System.out.println("文件夹已存在");
        }
        String cmd="/bin/cp -rf " + fileNameWithPathtmp +" "+targetDir+path;
        OsUtils.executeShell(cmd);
    }

    /**
     * 通过ip来判断浏览器是否打开在远端
     *
     * @return
     */
    private Boolean seleniumServerRunAtRemote() {
        ConfigManager config = new ConfigManager();
        String selenium_server = config.get("selenium_server_host");
        String ip = "";
        try {
            InetAddress addr = InetAddress.getLocalHost();
            ip = addr.getHostAddress();
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
        if ("127.0.0.1".equalsIgnoreCase(selenium_server)) {
            return false;
        } else if (selenium_server.equalsIgnoreCase(ip)) {
            return false;
        } else {
            return true;
        }
    }

    @And("^I upload a file \"([^\"]*)\" with name \"([^\"]*)\"$")
    public void uploadFileWithName(String inputName, String fileNameWithPath) {
        WebElement fileInput = GetElementFromPage.getWebElementWithName(inputName);
        if (fileNameWithPath.contains("target")) {
            uploadFileWithDifferentPath(fileInput, fileNameWithPath);
        }else {
            uploadFile(fileInput, fileNameWithPath);
        }
    }

    private void uploadFile(WebElement uploadInput, String fileNameWithPath) {
        String type = SharedDriver.WebDriverType;
        JavascriptExecutor js = (JavascriptExecutor) webDriver;
        String userAgent = (String) js.executeScript("return navigator.userAgent");
        if (fileNameWithPath != null && fileNameWithPath.trim().length() != 0) {
            String s = File.separator;
            String courseFile = "";
            try {
                File directory = new File("");
                if ("Remote".equalsIgnoreCase(type) && !userAgent.contains("Mac OS X")) {
                    courseFile = new ConfigManager().get("ftp_base_path");  // c:\\ftp
                    copyFileToSeleniumServer(config.get("selenium_server_host"),fileNameWithPath);
                    File tmpFile = new File(fileNameWithPath);
                    String fileName = tmpFile.getName();
                    String path = tmpFile.getPath().split("resources")[1].replace("/", "\\").split(fileName)[0];
                    courseFile = courseFile + path;
                    System.out.println("路径：" + courseFile);
                    fileNameWithPath = fileName;
                } else {
                    courseFile = directory.getCanonicalPath();
                    System.out.println("路径：" + courseFile);
                }
                fileNameWithPath = fileNameWithPath.replace("/", s).replace("\\", s);
                this.upload(uploadInput, fileNameWithPath, courseFile);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("skip this step !");
        }
    }

    private void uploadFileWithDifferentPath(WebElement uploadInput, String fileNameWithPath) {
        String type = SharedDriver.WebDriverType;
        if (fileNameWithPath != null && fileNameWithPath.trim().length() != 0) {
            String courseFile;
            try {
                File directory = new File("");
                if ("Remote".equalsIgnoreCase(type)) {
                    courseFile = new ConfigManager().get("ftp_base_path");  // c:\\ftp
                } else {
                    courseFile = directory.getCanonicalPath();
                }
                this.upload(uploadInput, fileNameWithPath, courseFile);
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("skip this step !");
        }
    }

    private void upload(WebElement uploadInput, String fileNameWithPath, String courseFile) {
        String s = File.separator;
        fileNameWithPath = fileNameWithPath.replace("/", s).replace("\\", s);

        if (fileNameWithPath.startsWith(s) || fileNameWithPath.startsWith("." + s)) {
            try {
                uploadInput.sendKeys(courseFile + fileNameWithPath);
            } catch (Exception e) {
                return;
            }
        } else {
            System.out.println("courseFile!!!!! : " + courseFile + fileNameWithPath);
            try {

                uploadInput.sendKeys(courseFile + fileNameWithPath);
            } catch (Exception e) {
                return;
            }
        }
    }

    /**
     * 删除文件
     *
     * @param relativePath 远程去掉C：/ftp
     */
    @Given("^delete file \"([^\"]*)\"$")
    public void deleteFile(String relativePath) {
        String type = SharedDriver.WebDriverType;
        if ("Remote".equalsIgnoreCase(type)) {
            deleteRemoteFile(relativePath);
        } else {
            deleteLocalFile(relativePath);
        }
    }

    private void deleteRemoteFile(String relativePath) {
        int index = relativePath.lastIndexOf("/");
        String directory = relativePath.substring(0, index);
        String fileName = relativePath.substring(index + 1);

        SFTPUtil sftpUtil = new SFTPUtil(config.get("ftp_user"), config.get("ftp_password"), config.get("selenium_server_host"), 22);
        sftpUtil.login();

        try {
            if (sftpUtil.isDirExist(relativePath))
                sftpUtil.delete(directory, fileName);
        } catch (SftpException e) {
            e.printStackTrace();
        } finally {
            sftpUtil.logout();
        }
    }

    private void deleteLocalFile(String relativePath) {
        File directory = new File("");
        String courseFile = null;
        try {
            courseFile = directory.getCanonicalPath();
        } catch (IOException e) {
            e.printStackTrace();
        }
        String absolutePath = courseFile + relativePath;
        File file = new File(absolutePath);
        if (file.exists())
            file.delete();
    }
}
