@all @report @reportMulti
Feature: 报表_批量操作

  Background:
    Given open the "report.ListPage" page for uri "/reports/"
    And I wait for "Loading" will be invisible
    And I wait for "MultiButton" will be visible

  Scenario Outline: create_report
    And I click the "NewReportButton" button
    Then I will see the "report.CreatePage" page
    And I wait for element "SelectedUser" change text to username
    When I set the parameter "Name" with value "<name>"
    And I set the parameter "Describe" with value "AutoCreate"
    And I choose the "PDF" from the "ReportType"
    And I set the parameters "Hour" and "Minute" as "3" minutes later from now
    And I click the "NextButton" button under some element
    Then I wait for "ChartListButton" will be visible
    When I choose the "报表测试" from the "ChartList"
    And I click the "ChartListButton" button
    Then I will see the element "ChosenTrendLast" contains "报表测试"
    When I click the "FinishButton" button under some element
    And I wait for "EnsureButton" will be visible
    Then I will see the success message "保存成功"
    And I click the "EnsureButton" button
    And I wait for "10000" millsecond

  Examples:
    |   name               |
    |  test_multi_file_1   |
    |  test_multi_file_2   |
    |  test_multi_1        |
    |  test_multi_2        |
    |  test_multi_3        |

  Scenario: multi_tag
    And I click the "MultiButton" button
    And I "checked" the checkbox which name is "test_multi_1" in the list
    And I "checked" the checkbox which name is "test_multi_2" in the list
    And I "checked" the checkbox which name is "test_multi_3" in the list
    And I click the "SelectAction" button
    And I click the "MultiTag" button
    And I wait for "EnsureButton" will be visible
    And I choose the "auto_package" from the "TagField"
    And I click the "TagPanel" button
    And I click the "EnsureButton" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    And I wait for loading complete
    And I click the "Finish" button

  Scenario: verify_tag
    Then I will see the data "{'column':'1','name':'test_multi_1'}" values "{'column':'7','name':'auto_package'}"
    And I will see the data "{'column':'1','name':'test_multi_2'}" values "{'column':'7','name':'auto_package'}"
    And I will see the data "{'column':'1','name':'test_multi_3'}" values "{'column':'7','name':'auto_package'}"

  Scenario: switch_off
    And the data name is "{'column':'1','name':'test_multi_1'}" then I "close" the switch
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "禁用成功"
    And I wait for "SuccessMessage" will be invisible

    And the data name is "{'column':'1','name':'test_multi_2'}" then I "close" the switch
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "禁用成功"
    And I wait for "SuccessMessage" will be invisible

    And the data name is "{'column':'1','name':'test_multi_3'}" then I "close" the switch
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "禁用成功"
    
  Scenario: multi_switch
    And I click the "MultiButton" button
    And I "checked" the checkbox which name is "test_multi_1" in the list
    And I "checked" the checkbox which name is "test_multi_2" in the list
    And I "checked" the checkbox which name is "test_multi_3" in the list
    And I click the "SelectAction" button
    And I click the "MultiSwitch" button
    And I wait for "Ensure" will be visible
    And I will see the message "确定启用 3 个资源"
    When I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "更新成功"
    And I wait for loading complete
    And I click the "Finish" button

  Scenario: verify_switch
    When the data name is "{'column':'1','name':'test_multi_1'}" then I "close" the switch
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "禁用成功"
    And I wait for "SuccessMessage" will be invisible
    When the data name is "{'column':'1','name':'test_multi_2'}" then I "close" the switch
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "禁用成功"
    When the data name is "{'column':'1','name':'test_multi_3'}" then I "close" the switch
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "禁用成功"

  Scenario: multi_delete_files
    When I click the "ReportListButton" button
    And I wait for "SelectedReport" will be visible
    And I wait for element "SelectedReport" change text to "全部报表文件"
    And I wait for "5000" millsecond
    And I wait for "LastGeneratedReport" will be visible
    And I choose the "30 条/页" from the "Pagination" in config
    And I wait for "Loading" will be invisible
    And I click the "MultiButton" button
    And I "checked" the checkbox which name is "test_multi_file_1" in trend list page
    And I "checked" the checkbox which name is "test_multi_file_2" in trend list page
    And I click the "SelectAction" button
    And I click the "MultiDelete" button
    And I wait for "Ensure" will be visible
    Then I will see the message "您选中的 2 个资源将被删除，是否继续？"
    When I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"
    And I wait for loading complete
    And I click the "Finish" button

  Scenario Outline: verify_delete_files
    When I click the "ReportListButton" button
    Then I wait for "SelectedReport" will be visible
    And I wait for element "SelectedReport" change text to "全部报表文件"
    And I wait for "5000" millsecond
    And I wait for "LastGeneratedReport" will be visible
    And I choose the "<name>" from the "ListOfReports" in config
    And I wait for "2000" millsecond
    Then I wait for "NoData" will be visible

    Examples:
      |   name               |
      |  test_multi_file_1   |
      |  test_multi_file_2   |

  Scenario: multi_delete
    And I click the "MultiButton" button
    And I "checked" the checkbox which name is "test_multi_file_1" in the list
    And I "checked" the checkbox which name is "test_multi_file_2" in the list
    And I "checked" the checkbox which name is "test_multi_1" in the list
    And I "checked" the checkbox which name is "test_multi_2" in the list
    And I "checked" the checkbox which name is "test_multi_3" in the list
    And I click the "SelectAction" button
    And I click the "MultiDelete" button
    And I wait for "Ensure" will be visible
    Then I will see the message "您选中的 5 个资源将被删除，是否继续？"
    When I click the "Ensure" button
    And I wait for "SuccessMessage" will be visible
    Then I will see the success message "删除成功"
    And I wait for loading complete
    And I click the "Finish" button

  Scenario: verify_delete
    When I set the parameter "SearchInput" with value "test_multi_"
    And I wait for "2000" millsecond
    Then I wait for "NoData" will be visible
#    Then I will see the search result "{'column':'1','name':'test_multi_1','contains':'no'}"
#    Then I will see the search result "{'column':'1','name':'test_multi_2','contains':'no'}"
#    Then I will see the search result "{'column':'1','name':'test_multi_3','contains':'no'}"
#    Then I will see the search result "{'column':'1','name':'test_multi_file_1','contains':'no'}"
#    Then I will see the search result "{'column':'1','name':'test_multi_file_2','contains':'no'}"

  Scenario Outline: prompt
    And I click the "MultiButton" button
    And I click the "SelectAction" button
    And I click the "<button>" button
    And I wait for "Ensure" will be visible
    Then I will see the message "请至少选择一个资源进行操作"

    Examples:
      | button       |
      | MultiDelete  |
      | MultiTag     |
      | MultiSwitch  |