package com.yottabyte.stepDefs;

import com.jcraft.jsch.SftpException;
import com.yottabyte.config.ConfigManager;
import com.yottabyte.hooks.LoginBeforeAllTests;
import com.yottabyte.utils.GetElementFromPage;
import com.yottabyte.utils.GetLogger;
import com.yottabyte.utils.SFTPUtil;
import com.yottabyte.webDriver.SharedDriver;
import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import java.io.*;
import java.net.InetAddress;
import java.net.UnknownHostException;

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
        WebElement uploadInput = webDriver.findElement(By.name("file"));
        if (fileNameWithPath.contains("target"))
            uploadFileWithDifferentPath(uploadInput, fileNameWithPath);
        else
            uploadFile(uploadInput, fileNameWithPath);
    }

    /**
     * 使用sftp将文件上传到打开selenium server的远端
     *
     * @param fileNameWithPath
     */
    private void uploadFileToSeleniumServer(String fileNameWithPath) {
        File tmpFile = new File(fileNameWithPath);
        String fileName = tmpFile.getName();
        String path = tmpFile.getPath().split("resources")[1].replace("\\", "/").split(fileName)[0];
        SFTPUtil sftpUtil = new SFTPUtil(config.get("ftp_user"), config.get("ftp_password"), config.get("selenium_server_host"), 22);
        sftpUtil.login();
        File file = new File(System.getProperty("user.dir") + fileNameWithPath);
        InputStream is = null;
        try {
            is = new FileInputStream(file.getCanonicalFile());
            sftpUtil.upload("/", path, fileName, is);
        } catch (FileNotFoundException | SftpException e) {
            e.printStackTrace();
            GetLogger.getLogger().error(e.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
        sftpUtil.logout();
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


    public static void main(String args[]) throws FileNotFoundException, SftpException {
        String fileNameWithPath = "./src/test/resources/testdata/alertPlugins/hengshuiyinhang_socket.py";
        File tmpFile = new File(fileNameWithPath);
        String fileName = tmpFile.getName();
        String path = tmpFile.getPath().split("resources")[1].replace("\\", "/").split(fileName)[0];
        System.out.println(path);
        System.out.println(fileName);
        System.out.println(tmpFile);
        new UploadFile().uploadFileToSeleniumServer(fileNameWithPath);
    }

    @And("^I upload a file \"([^\"]*)\" with name \"([^\"]*)\"$")
    public void uploadFileWithName(String inputName, String fileNameWithPath) {
        WebElement fileInput = GetElementFromPage.getWebElementWithName(inputName);
        uploadFile(fileInput, fileNameWithPath);
    }

    private void uploadFile(WebElement uploadInput, String fileNameWithPath) {
        String type = SharedDriver.WebDriverType;
        if (fileNameWithPath != null && fileNameWithPath.trim().length() != 0) {
            String s = File.separator;
            String courseFile = "";
            try {
                File directory = new File("");
                if ("Remote".equalsIgnoreCase(type)) {
                    courseFile = new ConfigManager().get("ftp_base_path");  // c:\\ftp
                    uploadFileToSeleniumServer(fileNameWithPath);
                    File tmpFile = new File(fileNameWithPath);
                    String fileName = tmpFile.getName();
                    String path = tmpFile.getPath().split("resources")[1].replace("\\", "/").split(fileName)[0];
                    courseFile = courseFile + "/" + path;
                    fileNameWithPath = fileName;
                } else {
                    courseFile = directory.getCanonicalPath();
                }
                fileNameWithPath = fileNameWithPath.replace("/", s).replace("\\", s);

                if (fileNameWithPath.startsWith(s) || fileNameWithPath.startsWith("." + s)) {
                    uploadInput.sendKeys(courseFile + fileNameWithPath);
                } else {
                    uploadInput.sendKeys(courseFile + s + fileNameWithPath);
                }
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
            String s = File.separator;
            String courseFile = "";
            try {
                File directory = new File("");
                if ("Remote".equalsIgnoreCase(type)) {
                    courseFile = new ConfigManager().get("ftp_base_path");  // c:\\ftp
                    uploadFileToSeleniumServer(fileNameWithPath);
                    File tmpFile = new File(fileNameWithPath);
                    String fileName = tmpFile.getName();
//                    String path = tmpFile.getPath().split("resources")[1].replace("\\", "/").split(fileName)[0];
                    courseFile = courseFile + "/" + tmpFile.getPath();
                    fileNameWithPath = fileName;
                } else {
                    courseFile = directory.getCanonicalPath();
                }
                fileNameWithPath = fileNameWithPath.replace("/", s).replace("\\", s);

                if (fileNameWithPath.startsWith(s) || fileNameWithPath.startsWith("." + s)) {
                    uploadInput.sendKeys(courseFile + fileNameWithPath);
                } else {
                    uploadInput.sendKeys(courseFile + s + fileNameWithPath);
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            System.out.println("skip this step !");
        }
    }

    @Given("^delete file \"([^\"]*)\"$")
    public void deleteFile(String relativePath) {
        try {
            InputStream is = new FileInputStream("/data/package-lock.json");
            System.out.println(is.read());
            System.out.println((byte) is.read());

            String fileName = getAbsolutePath(relativePath);
            String name = fileName.replaceAll("/", "\\\\");
            System.out.println("看这里！fileName:" + name);
            File file = new File(name);
            System.out.println(file.exists());
//            boolean flag = false;
//            if (file.exists()) {
//                System.out.println("文件存在！！！！！！！！！！");
//                flag = file.delete();
//            }
//            System.out.println(flag);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private String getAbsolutePath(String fileNameWithPath) throws IOException {
        String type = SharedDriver.WebDriverType;
        String courseFile;
        String s = File.separator;
        File directory = new File("");

        if ("Remote".equalsIgnoreCase(type)) {
            courseFile = new ConfigManager().get("ftp_base_path");  // c:\ftp
            File tmpFile = new File(fileNameWithPath);
            String fileName = tmpFile.getName();

            System.out.println("courseFile :" + courseFile);
            System.out.println("文件名称filename :" + fileName);
            System.out.println("文件路径tmpfilepath :" + tmpFile.getPath());

//            String path = tmpFile.getPath().split("resources")[1].replace("\\", "/").split(fileName)[0];
            courseFile = courseFile + tmpFile.getPath();
            fileNameWithPath = fileName;
            return courseFile;
        } else {
            courseFile = directory.getCanonicalPath();
            return courseFile + fileNameWithPath;
        }

//        fileNameWithPath = fileNameWithPath.replace("/", s).replace("\\", s);
//        System.out.println("!!!!!!!!!!!!!!!!!!!fileNameWithPath = [" + fileNameWithPath + "]");
//        if (fileNameWithPath.startsWith(s) || fileNameWithPath.startsWith("." + s)) {
//        return courseFile + fileNameWithPath;
//        } else {
//            return courseFile + s + fileNameWithPath;
//        }
    }
}
