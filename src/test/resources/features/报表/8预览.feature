@previewReport @report
Feature: 报表_8_预览

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible

  Scenario Outline: 新建报表-3个
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "Test_Preview_<type>"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "<type>" from the "ReportType"
    And I set the parameter "Hour" with value "00"
    And I set the parameter "Minute" with value "00"
    And I choose the "ekaterina.kiseleva@yottabyte.cn" from the "EmailInput"
    And I click the "NextButton" button
    Then I will see the "<page>" page
    When I choose the "报表测试" from the "ChartList"
    And I will see the "Preview" doesn't exist
    When I click the "Complete" button
    And I will see the element "ResultMessage" contains "新建成功"

  Examples:
    |  type   |  page                 |
    | PDF     | report.CreatePage     |
    | EXCEL   | report.CreatePage     |
    | WORD    | report.CreatePageWORD |


  Scenario Outline: 预览_运行测试
    When I set the parameter "TextFilter" with value "Test_Preview_<type>"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'Test_Preview_<type>'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Subject" with value "运行测试_报表名称：<%report_name%>，发送时间：<%report_time%>"
    And I click the "NextButton" button
    And I will see the "report.CreatePage<page>" page
    And I choose the "运行测试" from the "Preview"
    And I will see the element "SuccessMessage" contains "正在生成测试报表，请稍后查看接收邮箱"
    And I wait for "<sec>" millsecond
    And I wait for "SuccessMessage" will be invisible
    When I click the "Complete" button
    And I will see the element "ResultMessage" contains "更新成功"

    Examples:
      | type  | page | sec   |
      | PDF   |      | 20000 |
      | EXCEL |      | 20000 |
      | WORD  | WORD | 60000 |


  Scenario Outline: 验证生成成功
    When I set the parameter "TextFilter" with value "Test_Preview_<type>"
    And I wait for "20000" millsecond
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'Test_Preview_<type>'}" then i click the "Test_Preview_<type>" button
    Then I will see the element "LastGeneratedReport" contains "<text>"
    And I click the "DeleteReport" button
    And I will see the element "Message" contains "此操作将删除「 Test_Preview_<type>"
    And I will see the element "Message" contains "<text>」, 是否继续?"
    Then I click the "Ensure" button
    And I will see the success message "删除成功"
    And I wait for "SuccessMessage" will be invisible
    Then I wait for "NoData" will be visible

    Examples:
      | type  | text |
      | PDF   | .pdf |
      | EXCEL | .xlsx|
      | WORD  | .docx|

  Scenario Outline: preview_下载到本地预览
    When I set the parameter "TextFilter" with value "Test_Preview_<type>"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'Test_Preview_<type>'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I set the parameter "Subject" with value "下载到本地预览_报表名称：<%report_name%>，发送时间：<%report_time%>"
    And I click the "NextButton" button
    And I will see the "report.CreatePage<page>" page
    And I choose the "下载到本地预览" from the "Preview"
    And I will see the element "SuccessMessage" contains "正在生成测试报表，请稍后查看报表历史页"
    And I wait for "<sec>" millsecond
    And I wait for "SuccessMessage" will be invisible
    When I click the "Complete" button
    And I will see the element "ResultMessage" contains "更新成功"

    Examples:
      | type  | page | sec    |
      | PDF   |      | 20000  |
      | EXCEL |      | 20000  |
      | WORD  | WORD | 60000  |

  Scenario Outline: 验证生成成功
    When I set the parameter "TextFilter" with value "Test_Preview_<type>"
    And I wait for "20000" millsecond
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'Test_Preview_<type>'}" then i click the "Test_Preview_<type>" button
    Then I will see the element "LastGeneratedReport" contains "<text>"
    And I click the "DeleteReport" button
    And I will see the element "Message" contains "此操作将删除「 Test_Preview_<type>"
    And I will see the element "Message" contains "<text>」, 是否继续?"
    Then I click the "Ensure" button
    And I will see the success message "删除成功"
    And I wait for "SuccessMessage" will be invisible
    Then I wait for "NoData" will be visible

    Examples:
      | type  | text |
      | PDF   | .pdf |
      | EXCEL | .xlsx|
      | WORD  | .docx|

  Scenario Outline: delete_reports
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'Test_Preview_<type>'}" then i click the "删除" button in more menu
    Then I will see the message "此操作将删除 [Test_Preview_<type>], 是否继续？"
    When I click the "Ensure" button
    And I wait for element "Message" change text to "删除成功"
    And I click the "Ensure" button

  Examples:
    |  type   |
    | PDF     |
    | EXCEL   |
    | WORD    |