package com.yottabyte.config;

import java.io.*;

/**
 * @author sunxj
 */
public class GenerateReport {
    public static void main(String[] args) {
        File originFile = new File("/var/lib/jenkins/jobs/UI_TEST_PIPELINE/builds/" + args[0] + "/cucumber-html-reports/overview-features.html");
        try {
            BufferedWriter writer = new BufferedWriter(new FileWriter("/var/lib/jenkins/email-templates/test.html"));
            new GenerateReport().writeHead(writer);
            BufferedReader reader = new BufferedReader(new FileReader(originFile));
            String line;
            boolean flag = false;
            while ((line = reader.readLine()) != null) {
                if (line.contains("id=\"report\"")) {
                    flag = true;
                }

                if (line.contains("nav")) {
                    flag = false;
                }

                if (flag) {
                    writer.write(line + "\n");
                }
            }
            writer.write("<nav class=\"navbar navbar-default\" id=\"footer\">\n<div class=\"container-fluid\">\n<p class=\"navbar-text navbar-right\">\n<small>generate Cucumber HTML reports via: sun xiaojing</small>\n</p>\n</div>\n</nav>\n</body>\n</html>");
            writer.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void writeHead(BufferedWriter writer) throws IOException {
        writer.write("<!DOCTYPE html>\n<html>\n<head>\n<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" />\n");

        writer.write("<style>\n" +
                "        body {\n" +
                "            padding-top: 60px;\n" +
                "        }\n" +
                "\n" +
                "        h2 {\n" +
                "            font-size: 24px;\n" +
                "        }\n" +
                "\n" +
                "        a {\n" +
                "            color: #0097da;\n" +
                "        }\n" +
                "\n" +
                "        a:hover {\n" +
                "            color: #00587f;\n" +
                "        }\n" +
                "\n" +
                "        .html-content iframe {\n" +
                "            position: absolute;\n" +
                "            top: 0;\n" +
                "            left: 0;\n" +
                "            width: 100%;\n" +
                "            height: 100%;\n" +
                "            border:none;\n" +
                "        }\n" +
                "\n" +
                "        .passed {\n" +
                "            background-color: #92DD96;\n" +
                "        }\n" +
                "\n" +
                "        .failed {\n" +
                "            background-color: #F2928C;\n" +
                "        }\n" +
                "\n" +
                "        .skipped {\n" +
                "            background-color: #8AF;\n" +
                "        }\n" +
                "\n" +
                "        .pending {\n" +
                "            background-color: #F5F28F;\n" +
                "        }\n" +
                "\n" +
                "        .undefined {\n" +
                "            background-color: #F5B975;\n" +
                "        }\n" +
                "\n" +
                "        table.stats-table {\n" +
                "            background-color: white;\n" +
                "            color: black;\n" +
                "            margin-bottom: 20px;\n" +
                "            width: 100%;\n" +
                "        }\n" +
                "\n" +
                "        table.stats-table th, table.stats-table td {\n" +
                "            border: 1px solid gray;\n" +
                "            padding: 5px;\n" +
                "            text-align: center;\n" +
                "        }\n" +
                "\n" +
                "        table.stats-table tr.header {\n" +
                "            background-color: #66CCEE;\n" +
                "        }\n" +
                "\n" +
                "        table.stats-table tfoot {\n" +
                "            font-weight: bold;\n" +
                "        }\n" +
                "\n" +
                "        tfoot.total, td.total, th.total {\n" +
                "            background-color: lightgray;\n" +
                "        }\n" +
                "\n" +
                "        table.stats-table td.duration {\n" +
                "            text-align: right;\n" +
                "            white-space: nowrap;\n" +
                "        }\n" +
                "\n" +
                "        table.stats-table td.tagname {\n" +
                "            text-align: left;\n" +
                "        }\n" +
                "\n" +
                "        table.stats-table td.location, .location {\n" +
                "            font-family: monospace;\n" +
                "            text-align: left;\n" +
                "        }\n" +
                "\n" +
                "        table.step-arguments {\n" +
                "            margin-bottom: 5px;\n" +
                "            margin-left: 25px;\n" +
                "            margin-top: 3px;\n" +
                "        }\n" +
                "\n" +
                "        table.step-arguments th, table.step-arguments td {\n" +
                "            border: 1px solid gray;\n" +
                "            padding: 3px;\n" +
                "            text-align: left;\n" +
                "        }\n" +
                "\n" +
                "        table#tablesorter thead tr:not(.dont-sort) th {\n" +
                "            cursor: pointer;\n" +
                "        }\n" +
                "\n" +
                "        tr:hover {\n" +
                "            transition: background-color 0.3s;\n" +
                "        }\n" +
                "\n" +
                "        .collapsed .chevron:after {\n" +
                "            content: \"\\f054\";\n" +
                "        }\n" +
                "\n" +
                "        .carousel-indicators li {\n" +
                "            border: 1px solid black;\n" +
                "        }\n" +
                "\n" +
                "        .carousel-indicators .active {\n" +
                "            background-color: black;\n" +
                "        }\n" +
                "\n" +
                "        pre {\n" +
                "            margin: 10px;\n" +
                "        }\n</style>\n</head>\n<body>");
    }
}
