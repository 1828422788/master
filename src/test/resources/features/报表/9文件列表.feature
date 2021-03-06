@reportFiles @checkFiles @checkAllFiles @report
Feature: 报表_1b_文件列表
# need to wait till reports test_report_PDF, test_report_URL, test_report_EXCEL from 新建_基本设置 are generated

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for loading invisible

  @reportSmoke
  Scenario: 已生成报表
    When I set the parameter "TextFilter" with value "test_report_PDF"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'test_report_PDF'}" then i click the "test_report_PDF" button
    And I wait for loading invisible
    Then I will see the element "FirstColumnTitle" contains "文件名称"
    And I will see the element "SecondColumnTitle" contains "创建者"
    And I will see the element "ThirdColumnTitle" contains "生成时间"
    And I will see the element "FourthColumnTitle" contains "操作"
    And I click the "Download" button
    And I click the "DeleteReport" button
    And I wait for "Message" will be visible
    And I will see the element "Message" contains "此操作将删除「"
    And I will see the element "Message" contains ".pdf」, 是否继续?"
    Then I click the "Cancel" button

  @reportSmoke
  Scenario Outline: 检查已生成报表文件
    When I set the parameter "TextFilter" with value "<name>"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name>'}" then i click the "<name>" button
    Then I will see the element "LastGeneratedReport" contains "<format>"

    Examples:
      |    name               |  format    |
      |  test_report_PDF      |  .pdf      |
      |  test_report_URL      |  .pdf      |
      |  test_report_EXCEL    |  .xlsx     |

  @reportSmoke
  Scenario Outline: 已生成报表_选择报表
    When I set the parameter "TextFilter" with value "<name_1>"
    And I wait for loading invisible
    And the data name is "{'column':'1','name':'<name_1>'}" then i click the "<name_1>" button
    Then I will see the element "LastGeneratedReport" contains "<format_1>"
    And I wait for element "SelectedReport" change text to "<name_1>"
    When I choose the "<name_2>" from the "ListOfReports"
    And I wait for loading invisible
    Then I will see the element "LastGeneratedReport" contains "<format_2>"
    And I click the "ReturnList" button
    And I wait for "NewReportButton" will be visible

    Examples:
      |    name_1          |  format_1  | name_2            | format_2   |
      |  test_report_PDF   |  .pdf      | test_report_EXCEL | .xlsx      |

  Scenario: 已生成报表2
    When I click the "ReportListButton" button
    Then I wait for "SelectedReport" will be visible
    And I wait for element "SelectedReport" change text to "全部报表文件"
    And I wait for "5000" millsecond
    And I wait for "LastGeneratedReport" will be visible





