@previewReport
Feature: 报表预览

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario Outline: create_report_pdf_excel
    And I click the "NewReportButton" button under some element
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "Test_Preview_<type>"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "<type>" from the "ReportType"
    And I set the parameter "Hour" with value "00"
    And I set the parameter "Minute" with value "00"
    And I set the parameter "Subject" with value " 报表名称：<%report_name%>，发送时间：<%report_time%>"
    And I choose the "ekaterina.kiseleva@yottabyte.cn" from the "EmailInput"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "报表测试"
    And I will see the "Preview" doesn't exist
    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

  Examples:
    |  type   |
    | PDF     |
    | EXCEL   |

  Scenario Outline: create_report_word
    And I click the "NewReportButton" button under some element
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "Test_Preview_<type>"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "<type>" from the "ReportType"
    And I set the parameter "Hour" with value "00"
    And I set the parameter "Minute" with value "00"
    And I set the parameter "Subject" with value " 报表名称：<%report_name%>，发送时间：<%report_time%>"
    And I choose the "ekaterina.kiseleva@yottabyte.cn" from the "EmailInput"
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButtonWord" will be visible
    And I wait for "4000" millsecond
    And I set the parameter "ChartListInput" with value "报表测试"
    And I click the button with text "报表测试"
    And I wait for "2000" millsecond
    Then I will see the "report.CreatePageWORD" page
    And I will see the "Preview" doesn't exist
    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "新建成功"

  Examples:
    |  type    |
    | WORD     |

  Scenario Outline: preview_运行测试
    When I set the parameter "SearchInput" with value "Test_Preview_<type>"
    And I wait for "2000" millsecond
    And the data name is "{'column':'1','name':'Test_Preview_<type>'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I click the "NextButton" button under some element
    And I will see the "report.CreatePage<page>" page
    And I wait for "5000" millsecond
    And I choose the "运行测试" from the "Preview"
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "正在生成测试报表，请稍后查看接收邮箱"
    And I wait for "25000" millsecond
    And I wait for "SuccessMessage" will be invisible
#    And I wait for element "SuccessMessage" change text to "下载到本地预览成功，请查看并下载完报表历史也最新文件"
    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "更新成功"

    Examples:
      | type  | page |
      | PDF   |      |
      | EXCEL |      |
      | WORD  | WORD |


  Scenario Outline: check_type
    When I set the parameter "SearchInput" with value "Test_Preview_<type>"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'Test_Preview_<type>'}" then i click the "Test_Preview_<type>" button
    Then I will see the element "LastGeneratedReport" contains "<text>"
    And I click the "DeleteReport" button
    And I wait for "Message" will be visible
    And I will see the element "Message" contains "此操作将删除「 Test_Preview_<type>"
    And I will see the element "Message" contains "<text>」, 是否继续?"
    Then I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "删除成功"
    And I wait for "SuccessMessage" will be invisible
    Then I wait for "NoData" will be visible

    Examples:
      | type  | text |
      | PDF   | .pdf |
      | EXCEL | .xls |
      | WORD  | .docx|

  Scenario Outline: preview_下载到本地预览
    When I set the parameter "SearchInput" with value "Test_Preview_<type>"
    And I wait for "2000" millsecond
    And the data name is "{'column':'1','name':'Test_Preview_<type>'}" then i click the "编辑" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    And I click the "NextButton" button under some element
    And I will see the "report.CreatePage<page>" page
    And I wait for "5000" millsecond
    And I choose the "下载到本地预览" from the "Preview"
    And I wait for "SuccessMessage" will be visible
    And I will see the element "SuccessMessage" contains "正在生成测试报表，请稍后查看报表历史页"
    And I wait for "25000" millsecond
    And I wait for "SuccessMessage" will be invisible
#    And I wait for element "SuccessMessage" change text to "下载到本地预览成功，请查看并下载完报表历史也最新文件"
    When I click the "FinishButton" button under some element
    And I wait for "ResultMessage" will be visible
    And I will see the element "ResultMessage" contains "更新成功"

    Examples:
      | type  | page |
      | PDF   |      |
      | EXCEL |      |
      | WORD  | WORD |

  Scenario Outline: check_type_2
    When I set the parameter "SearchInput" with value "Test_Preview_<type>"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'Test_Preview_<type>'}" then i click the "Test_Preview_<type>" button
    Then I will see the element "LastGeneratedReport" contains "<text>"
    And I click the "DeleteReport" button
    And I wait for "Message" will be visible
    And I will see the element "Message" contains "此操作将删除「 Test_Preview_<type>"
    And I will see the element "Message" contains "<text>」, 是否继续?"
    Then I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    And I will see the success message "删除成功"
    And I wait for "SuccessMessage" will be invisible
    Then I wait for "NoData" will be visible

    Examples:
      | type  | text |
      | PDF   | .pdf |
      | EXCEL | .xls |
      | WORD  | .docx|

  Scenario Outline: delete_reports
    And I wait for "Loading" will be invisible
    And the data name is "{'column':'1','name':'Test_Preview_<type>'}" then i click the "删除" button in more menu
    Then I will see the message "此操作将删除 [Test_Preview_<type>], 是否继续？"
    When I click the "Ensure" button
    And I wait for "500" millsecond
    And I wait for "Message" will be visible
    Then I will see the message "删除成功"
    And I click the "Ensure" button

  Examples:
    |  type   |
    | PDF     |
    | EXCEL   |
    | WORD    |