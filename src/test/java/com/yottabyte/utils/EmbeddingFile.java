package com.yottabyte.utils;

import com.yottabyte.config.ConfigManager;
import com.yottabyte.webDriver.SharedDriver;
import cucumber.api.Scenario;

import java.io.*;
import java.util.List;

public class EmbeddingFile {

    /**
     * 将指定的文件注入到测试报告中 根据浏览器是否打开在远程区分文件的存放路径
     *
     * @param fileName 需要注入的文件名称
     */
    public static void embeddingPdfToscenario(String fileName) {
        Scenario scenario = SharedDriver.getScenario();
        PdfToImages fileConert = new PdfToImages();
        List<byte[]> list = fileConert.pdftoimages(getInputStream(fileName));
        for (byte[] b : list) {
            scenario.embed(b, "image/png");
        }
    }

    public static InputStream getInputStream(String fileName) {
        String flag = SharedDriver.WebDriverType;
        String sp = File.separator;
        ConfigManager config = new ConfigManager();
        InputStream in = null;
        try {
            if ("Remote".equalsIgnoreCase(flag)) {
                SFTPUtil sftpUtil = new SFTPUtil(config.get("ftp_user"), config.get("ftp_password"), config.get("selenium_server_host"), 22);
                sftpUtil.login();
                in = sftpUtil.readFile("./", "target/download-files/" + fileName);
            } else {
                String downloadFilepath = System.getProperty("user.dir") + sp + "target" + sp + "download-files";
                in = new FileInputStream(downloadFilepath + sp + fileName);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
        return in;
    }

    /**
     * 在测试报告中绑定图表
     *
     * @param imagePath 图片路径
     * @return
     * @throws IOException
     */
    public static byte[] embedImage(String imagePath) throws IOException {
        FileInputStream inputStream = new FileInputStream(imagePath);
        byte[] imageBytes = new byte[inputStream.available()];
        inputStream.read(imageBytes);
        Scenario scenario = SharedDriver.getScenario();
        scenario.embed(imageBytes, "image/png");
        inputStream.close();
        return imageBytes;
    }


    public static byte[] readContent(final InputStream in) throws IOException {
        ByteArrayOutputStream bout = new ByteArrayOutputStream();
        byte[] buf = new byte[1024];
        int c = 0;
        int b;
        while ((c < buf.length) && (b = in.read(buf, c, buf.length - c)) >= 0) {
            c += b;
            if (c == 1024) {
                bout.write(buf);
                buf = new byte[1024];
                c = 0;
            }
        }
        if (c != 0) {
            bout.write(buf, 0, c);
        }
        return bout.toByteArray();
    }
}
