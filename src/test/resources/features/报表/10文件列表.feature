@reportFiles @checkFiles
Feature: 报表_文件列表
# need to wait till reports test_report_PDF, test_report_URL, test_report_EXCEL from 新建_基本设置 are generated

  Background:
    Given open the "report.ListPage" page for uri "/reports/"

  Scenario: check_table
    When the data name is "{'column':'1','name':'test_report_PDF'}" then i click the "test_report_PDF" button
    Then I will see the element "FirstColumnTitle" contains "文件名称"
    And I will see the element "SecondColumnTitle" contains "拥有者"
    And I will see the element "ThirdColumnTitle" contains "生成时间"
    And I will see the element "FourthColumnTitle" contains "操作"
    And the data name is "{'column':'1','name':'admin'}" then i click the "下载" button
    When the data name is "{'column':'1','name':'admin'}" then i click the "删除" button
    And I will see the element "Message" contains "此操作将删除「"
    And I will see the element "Message" contains ".pdf」, 是否继续?"
    Then I click the "Cancel" button
  
  
  Scenario Outline: check_type
    When the data name is "{'column':'1','name':'<name>'}" then i click the "<name>" button
    Then I will see the element "LastGeneratedReport" contains "<format>"

    Examples:
      |    name               |  format    |
      |  test_report_PDF      |  .pdf      |
      |  test_report_URL      |  .pdf      |
      |  test_report_EXCEL    |  .xls      |

  Scenario Outline: check_type_dropdown
    When the data name is "{'column':'1','name':'<name_1>'}" then i click the "<name_1>" button
    Then I will see the element "LastGeneratedReport" contains "<format_1>"
    And I wait for element "SelectedReport" change text to "<name_1>"
    When I choose the "<name_2>" from the "ListOfReports"
    And I wait for loading invisible
    Then I will see the element "LastGeneratedReport" contains "<format_2>"
    And I click the "ReturnList" button
    And I wait for "NewReportButton" will be visible

    Examples:
      |    name_1          |  format_1  | name_2            | format_2   |
      |  test_report_PDF   |  .pdf      | test_report_EXCEL | .xls       |

  Scenario: report_list_button
    When I click the "ReportListButton" button
    Then I wait for "SelectedReport" will be visible
    And I wait for element "SelectedReport" change text to "全部报表文件"
    And I wait for "LastGeneratedReport" will be visible

  Scenario Outline: search_input
    When I set the parameter "SearchInput" with value "<search_input>"
    And I wait for loading invisible
    Then I will see the element "FirstCreatedReport" contains "test_report_"

  Examples:
    |  search_input    |
    | test_report_     |

  Scenario: seacrh_tag
    When I choose the "AutoTest" from the "TagDropdown"
    And I wait for loading invisible
    Then I will see the data "{'column':'2','name':'admin'}" values "{'column':'6','name':'AutoTest'}"



