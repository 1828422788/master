@reportTextEditor @report
Feature:报表_富文本编辑_4_图片

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Describe" with value "AutoCreate"
    And I set the parameters "Hour" and "Minute" as "2" minutes later from now
    And I choose the "WORD" from the "ReportType"

  @reportSmoke
  Scenario: 添加图片
    When I set the parameter "Name" with value "Image"
    And I click the "NextButton" button
    And I will see the "report.CreatePageWORD" page

    When I upload a file "UploadImage" with name "/src/test/resources/testdata/image/smallRobbot.png"
    And I wait for "ImageElement" will be visible
    And I click the element "ImageElement" in word report
    And I wait for "DeleteElement" will be visible
    And I click the element "DeleteElement" in word report
    And I will see the "ImageElement" doesn't exist
    And I click the element "Undo" in word report
    And I will see the "ImageElement" is display
    And I choose the "报表测试" from the "ChartList"
    When I click the "Complete" button
    And I will see the element "ResultMessage" contains "新建成功"

  Scenario: image_20kb
    When I set the parameter "Name" with value "Image"
    And I click the "NextButton" button
    And I will see the "report.CreatePageWORD" page

    When I upload a file "UploadImage" with name "/src/test/resources/testdata/image/pikachu.jpeg"
    And I wait for "EnsureButton" will be visible
    Then I will see the message "内嵌图片最大支持20kb"

  Scenario: image_header_footer
    When I set the parameter "Name" with value "Image_HF"
    And I click the "NextButton" button
    And I will see the "report.CreatePageWORD" page

    And I click the element "Header" in word report
    And I set the parameter "HeaderText" with value "Text Header" in word report
    And I select all text in "HeaderText" element
    And I click the element "HeaderText" in word report

    When I upload a file "UploadImage" with name "/src/test/resources/testdata/image/smallRobbot.png"
    And I wait for "ImageElement" will be visible
    And I choose the "报表测试" from the "ChartList"

    And I click the element "Footer" in word report
    And I set the parameter "FooterText" with value "Text Footer" in word report
    And I select all text in "FooterText" element
    And I click the element "FooterText" in word report

    When I upload a file "UploadImage" with name "/src/test/resources/testdata/image/smallRobbot.png"
    And I wait for "ImageElement" will be visible

    When I click the "Complete" button
    And I will see the element "ResultMessage" contains "新建成功"

  Scenario: image_table
    When I set the parameter "Name" with value "Image_Table"
    And I click the "NextButton" button
    And I will see the "report.CreatePageWORD" page

    And I click the element "AddTable" in word report
    And I click the element "AddTable3x2" in word report
    And I wait for "TableElement" will be visible
    And I set the table cell in row "1" and column "1" with value "Cell 1 1" in word report
    And I select all text in row "1" and column "2" of the table in word report

    When I upload a file "UploadImage" with name "/src/test/resources/testdata/image/smallRobbot.png"
    And I wait for "ImageElement" will be visible

    And I select all text in row "1" and column "3" of the table in word report
    And I choose the "报表测试" from the "ChartList"
    When I click the "Complete" button
    And I will see the element "ResultMessage" contains "新建成功"